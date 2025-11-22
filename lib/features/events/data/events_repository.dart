import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/api_service.dart';
import '../models/event_model.dart';

class EventsRepository {
  final ApiService _apiService;

  EventsRepository(this._apiService);

  Future<List<EventModel>> getEvents({
    int page = 1,
    int pageSize = 20,
    DateTime? startDate,
    DateTime? endDate,
    EventType? eventType,
    EventStatus? status,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (eventType != null) 'event_type': eventType.name,
        if (status != null) 'status': status.name,
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final response = await _apiService.get('/events/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch events: $e');
    }
  }

  Future<List<EventModel>> getMyEvents({
    int page = 1,
    int pageSize = 20,
    bool asOrganizer = false,
    bool asAttendee = false,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (asOrganizer) 'as_organizer': true,
        if (asAttendee) 'as_attendee': true,
      };

      final response = await _apiService.get('/events/my/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch my events: $e');
    }
  }

  Future<List<EventModel>> getUpcomingEvents({int limit = 10}) async {
    try {
      final now = DateTime.now();
      final response = await _apiService.get('/events/', queryParameters: {
        'start_date': now.toIso8601String(),
        'status': EventStatus.published.name,
        'page_size': limit,
        'ordering': 'event_date',
      });
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch upcoming events: $e');
    }
  }

  Future<EventModel> getEvent(String eventId) async {
    try {
      final response = await _apiService.get('/events/$eventId/');
      return EventModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch event: $e');
    }
  }

  Future<EventModel> createEvent(CreateEventRequest request) async {
    try {
      final response = await _apiService.post('/events/', data: request.toJson());
      return EventModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create event: $e');
    }
  }

  Future<EventModel> updateEvent(String eventId, CreateEventRequest request) async {
    try {
      final response = await _apiService.patch('/events/$eventId/', data: request.toJson());
      return EventModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update event: $e');
    }
  }

  Future<void> deleteEvent(String eventId) async {
    try {
      await _apiService.delete('/events/$eventId/');
    } catch (e) {
      throw Exception('Failed to delete event: $e');
    }
  }

  Future<EventModel> joinEvent(String eventId, {AttendeeStatus status = AttendeeStatus.attending}) async {
    try {
      final response = await _apiService.post('/events/$eventId/join/', data: {
        'status': status.name,
      });
      return EventModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to join event: $e');
    }
  }

  Future<EventModel> leaveEvent(String eventId) async {
    try {
      final response = await _apiService.post('/events/$eventId/leave/');
      return EventModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to leave event: $e');
    }
  }

  Future<EventModel> updateAttendanceStatus(String eventId, AttendeeStatus status) async {
    try {
      final response = await _apiService.patch('/events/$eventId/attendance/', data: {
        'status': status.name,
      });
      return EventModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update attendance: $e');
    }
  }

  Future<List<EventAttendee>> getEventAttendees(String eventId, {
    AttendeeStatus? status,
    int page = 1,
    int pageSize = 50,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
        if (status != null) 'status': status.name,
      };

      final response = await _apiService.get('/events/$eventId/attendees/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => EventAttendee.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch event attendees: $e');
    }
  }

  Future<List<EventComment>> getEventComments(String eventId, {
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'page_size': pageSize,
      };

      final response = await _apiService.get('/events/$eventId/comments/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => EventComment.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch event comments: $e');
    }
  }

  Future<EventComment> addEventComment(String eventId, String content, {String? parentCommentId}) async {
    try {
      final data = {
        'content': content,
        if (parentCommentId != null) 'parent_comment_id': parentCommentId,
      };

      final response = await _apiService.post('/events/$eventId/comments/', data: data);
      return EventComment.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  Future<void> deleteEventComment(String eventId, String commentId) async {
    try {
      await _apiService.delete('/events/$eventId/comments/$commentId/');
    } catch (e) {
      throw Exception('Failed to delete comment: $e');
    }
  }

  Future<void> inviteUsersToEvent(String eventId, List<String> userIds) async {
    try {
      await _apiService.post('/events/$eventId/invite/', data: {
        'user_ids': userIds,
      });
    } catch (e) {
      throw Exception('Failed to invite users: $e');
    }
  }

  Future<Map<String, dynamic>> getEventAnalytics(String eventId) async {
    try {
      final response = await _apiService.get('/events/$eventId/analytics/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch event analytics: $e');
    }
  }

  Future<List<EventModel>> searchEvents(String query, {
    EventType? eventType,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'q': query,
        'page': page,
        'page_size': pageSize,
        if (eventType != null) 'event_type': eventType.name,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (location != null) 'location': location,
      };

      final response = await _apiService.get('/events/search/', queryParameters: queryParams);
      
      final List<dynamic> results = response.data['results'] ?? response.data;
      return results.map((json) => EventModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search events: $e');
    }
  }
}

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return EventsRepository(apiService);
});