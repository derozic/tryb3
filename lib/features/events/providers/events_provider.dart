import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/events_repository.dart';
import '../models/event_model.dart';

class EventsNotifier extends StateNotifier<AsyncValue<List<EventModel>>> {
  final EventsRepository _repository;

  EventsNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadEvents();
  }

  Future<void> loadEvents({
    DateTime? startDate,
    DateTime? endDate,
    EventType? eventType,
    EventStatus? status,
    String? search,
  }) async {
    try {
      state = const AsyncValue.loading();
      final events = await _repository.getEvents(
        startDate: startDate,
        endDate: endDate,
        eventType: eventType,
        status: status,
        search: search,
      );
      state = AsyncValue.data(events);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> loadUpcomingEvents({int limit = 10}) async {
    try {
      final events = await _repository.getUpcomingEvents(limit: limit);
      state = AsyncValue.data(events);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> loadMyEvents({bool asOrganizer = false, bool asAttendee = false}) async {
    try {
      final events = await _repository.getMyEvents(
        asOrganizer: asOrganizer,
        asAttendee: asAttendee,
      );
      state = AsyncValue.data(events);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<EventModel?> createEvent(CreateEventRequest request) async {
    try {
      final event = await _repository.createEvent(request);
      
      // Add to current list
      state.whenData((currentEvents) {
        state = AsyncValue.data([event, ...currentEvents]);
      });
      
      return event;
    } catch (e) {
      rethrow;
    }
  }

  Future<EventModel?> joinEvent(String eventId, {AttendeeStatus status = AttendeeStatus.attending}) async {
    try {
      final updatedEvent = await _repository.joinEvent(eventId, status: status);
      
      // Update in current list
      state.whenData((currentEvents) {
        final updatedList = currentEvents.map((e) {
          return e.id == eventId ? updatedEvent : e;
        }).toList();
        state = AsyncValue.data(updatedList);
      });
      
      return updatedEvent;
    } catch (e) {
      rethrow;
    }
  }

  Future<EventModel?> leaveEvent(String eventId) async {
    try {
      final updatedEvent = await _repository.leaveEvent(eventId);
      
      // Update in current list
      state.whenData((currentEvents) {
        final updatedList = currentEvents.map((e) {
          return e.id == eventId ? updatedEvent : e;
        }).toList();
        state = AsyncValue.data(updatedList);
      });
      
      return updatedEvent;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteEvent(String eventId) async {
    try {
      await _repository.deleteEvent(eventId);
      
      // Remove from current list
      state.whenData((currentEvents) {
        final updatedList = currentEvents.where((e) => e.id != eventId).toList();
        state = AsyncValue.data(updatedList);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EventModel>> searchEvents(String query, {
    EventType? eventType,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  }) async {
    try {
      return await _repository.searchEvents(
        query,
        eventType: eventType,
        startDate: startDate,
        endDate: endDate,
        location: location,
      );
    } catch (e) {
      rethrow;
    }
  }

  void refresh() {
    loadEvents();
  }
}

class EventDetailNotifier extends StateNotifier<AsyncValue<EventModel?>> {
  final EventsRepository _repository;

  EventDetailNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> loadEvent(String eventId) async {
    try {
      state = const AsyncValue.loading();
      final event = await _repository.getEvent(eventId);
      state = AsyncValue.data(event);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void clearEvent() {
    state = const AsyncValue.data(null);
  }
}

class EventAttendeesNotifier extends StateNotifier<AsyncValue<List<EventAttendee>>> {
  final EventsRepository _repository;

  EventAttendeesNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> loadAttendees(String eventId, {AttendeeStatus? status}) async {
    try {
      state = const AsyncValue.loading();
      final attendees = await _repository.getEventAttendees(eventId, status: status);
      state = AsyncValue.data(attendees);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

class EventCommentsNotifier extends StateNotifier<AsyncValue<List<EventComment>>> {
  final EventsRepository _repository;

  EventCommentsNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> loadComments(String eventId) async {
    try {
      state = const AsyncValue.loading();
      final comments = await _repository.getEventComments(eventId);
      state = AsyncValue.data(comments);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<EventComment?> addComment(String eventId, String content, {String? parentCommentId}) async {
    try {
      final comment = await _repository.addEventComment(eventId, content, parentCommentId: parentCommentId);
      
      // Add to current list
      state.whenData((currentComments) {
        state = AsyncValue.data([comment, ...currentComments]);
      });
      
      return comment;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteComment(String eventId, String commentId) async {
    try {
      await _repository.deleteEventComment(eventId, commentId);
      
      // Remove from current list
      state.whenData((currentComments) {
        final updatedList = currentComments.where((c) => c.id != commentId).toList();
        state = AsyncValue.data(updatedList);
      });
    } catch (e) {
      rethrow;
    }
  }

  void refresh(String eventId) {
    loadComments(eventId);
  }
}

// Providers
final eventsProvider = StateNotifierProvider<EventsNotifier, AsyncValue<List<EventModel>>>(
  (ref) {
    final repository = ref.watch(eventsRepositoryProvider);
    return EventsNotifier(repository);
  },
);

final upcomingEventsProvider = StateNotifierProvider<EventsNotifier, AsyncValue<List<EventModel>>>(
  (ref) {
    final repository = ref.watch(eventsRepositoryProvider);
    final notifier = EventsNotifier(repository);
    notifier.loadUpcomingEvents();
    return notifier;
  },
);

final myEventsProvider = StateNotifierProvider<EventsNotifier, AsyncValue<List<EventModel>>>(
  (ref) {
    final repository = ref.watch(eventsRepositoryProvider);
    final notifier = EventsNotifier(repository);
    notifier.loadMyEvents(asOrganizer: true, asAttendee: true);
    return notifier;
  },
);

final eventDetailProvider = StateNotifierProvider.family<EventDetailNotifier, AsyncValue<EventModel?>, String>(
  (ref, eventId) {
    final repository = ref.watch(eventsRepositoryProvider);
    final notifier = EventDetailNotifier(repository);
    if (eventId.isNotEmpty) {
      notifier.loadEvent(eventId);
    }
    return notifier;
  },
);

final eventAttendeesProvider = StateNotifierProvider.family<EventAttendeesNotifier, AsyncValue<List<EventAttendee>>, String>(
  (ref, eventId) {
    final repository = ref.watch(eventsRepositoryProvider);
    final notifier = EventAttendeesNotifier(repository);
    if (eventId.isNotEmpty) {
      notifier.loadAttendees(eventId);
    }
    return notifier;
  },
);

final eventCommentsProvider = StateNotifierProvider.family<EventCommentsNotifier, AsyncValue<List<EventComment>>, String>(
  (ref, eventId) {
    final repository = ref.watch(eventsRepositoryProvider);
    final notifier = EventCommentsNotifier(repository);
    if (eventId.isNotEmpty) {
      notifier.loadComments(eventId);
    }
    return notifier;
  },
);

// Filter providers
final eventTypeFilterProvider = StateProvider<EventType?>((ref) => null);
final eventDateFilterProvider = StateProvider<DateTime?>((ref) => null);
final eventSearchProvider = StateProvider<String>((ref) => '');

// Selected event for management
final selectedEventProvider = StateProvider<EventModel?>((ref) => null);