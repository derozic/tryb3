import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    required String description,
    required DateTime eventDate,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    String? imageUrl,
    required String organizerId,
    required String organizerName,
    String? organizerAvatar,
    required List<String> attendeeIds,
    required EventType eventType,
    required EventStatus status,
    String? meetingLink,
    String? address,
    double? latitude,
    double? longitude,
    int? maxAttendees,
    @Default(true) bool isPublic,
    List<String>? tags,
    Map<String, dynamic>? additionalData,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}

@freezed
class EventAttendee with _$EventAttendee {
  const factory EventAttendee({
    required String userId,
    required String username,
    String? avatarUrl,
    required AttendeeStatus status,
    DateTime? respondedAt,
    DateTime? joinedAt,
    String? notes,
  }) = _EventAttendee;

  factory EventAttendee.fromJson(Map<String, dynamic> json) =>
      _$EventAttendeeFromJson(json);
}

@freezed
class EventComment with _$EventComment {
  const factory EventComment({
    required String id,
    required String eventId,
    required String userId,
    required String username,
    String? userAvatar,
    required String content,
    String? parentCommentId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EventComment;

  factory EventComment.fromJson(Map<String, dynamic> json) =>
      _$EventCommentFromJson(json);
}

@freezed
class CreateEventRequest with _$CreateEventRequest {
  const factory CreateEventRequest({
    required String title,
    required String description,
    required DateTime eventDate,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    String? imageUrl,
    required EventType eventType,
    String? meetingLink,
    String? address,
    double? latitude,
    double? longitude,
    int? maxAttendees,
    @Default(true) bool isPublic,
    List<String>? tags,
    List<String>? invitedUserIds,
  }) = _CreateEventRequest;

  factory CreateEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEventRequestFromJson(json);
}

enum EventType {
  meeting,
  workshop,
  social,
  conference,
  party,
  webinar,
  networking,
  sports,
  cultural,
  educational,
  business,
  other,
}

enum EventStatus {
  draft,
  published,
  cancelled,
  completed,
  postponed,
}

enum AttendeeStatus {
  invited,
  attending,
  maybe,
  notAttending,
  waitlist,
}

extension EventTypeExtension on EventType {
  String get displayName {
    switch (this) {
      case EventType.meeting:
        return 'Meeting';
      case EventType.workshop:
        return 'Workshop';
      case EventType.social:
        return 'Social Event';
      case EventType.conference:
        return 'Conference';
      case EventType.party:
        return 'Party';
      case EventType.webinar:
        return 'Webinar';
      case EventType.networking:
        return 'Networking';
      case EventType.sports:
        return 'Sports';
      case EventType.cultural:
        return 'Cultural';
      case EventType.educational:
        return 'Educational';
      case EventType.business:
        return 'Business';
      case EventType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case EventType.meeting:
        return '🤝';
      case EventType.workshop:
        return '🛠️';
      case EventType.social:
        return '🎉';
      case EventType.conference:
        return '📊';
      case EventType.party:
        return '🎊';
      case EventType.webinar:
        return '💻';
      case EventType.networking:
        return '🌐';
      case EventType.sports:
        return '⚽';
      case EventType.cultural:
        return '🎭';
      case EventType.educational:
        return '📚';
      case EventType.business:
        return '💼';
      case EventType.other:
        return '📅';
    }
  }
}