// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      eventDate: DateTime.parse(json['eventDate'] as String),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      location: json['location'] as String?,
      imageUrl: json['imageUrl'] as String?,
      organizerId: json['organizerId'] as String,
      organizerName: json['organizerName'] as String,
      organizerAvatar: json['organizerAvatar'] as String?,
      attendeeIds: (json['attendeeIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      eventType: $enumDecode(_$EventTypeEnumMap, json['eventType']),
      status: $enumDecode(_$EventStatusEnumMap, json['status']),
      meetingLink: json['meetingLink'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      maxAttendees: (json['maxAttendees'] as num?)?.toInt(),
      isPublic: json['isPublic'] as bool? ?? true,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'eventDate': instance.eventDate.toIso8601String(),
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'organizerId': instance.organizerId,
      'organizerName': instance.organizerName,
      'organizerAvatar': instance.organizerAvatar,
      'attendeeIds': instance.attendeeIds,
      'eventType': _$EventTypeEnumMap[instance.eventType]!,
      'status': _$EventStatusEnumMap[instance.status]!,
      'meetingLink': instance.meetingLink,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'maxAttendees': instance.maxAttendees,
      'isPublic': instance.isPublic,
      'tags': instance.tags,
      'additionalData': instance.additionalData,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$EventTypeEnumMap = {
  EventType.meeting: 'meeting',
  EventType.workshop: 'workshop',
  EventType.social: 'social',
  EventType.conference: 'conference',
  EventType.party: 'party',
  EventType.webinar: 'webinar',
  EventType.networking: 'networking',
  EventType.sports: 'sports',
  EventType.cultural: 'cultural',
  EventType.educational: 'educational',
  EventType.business: 'business',
  EventType.other: 'other',
};

const _$EventStatusEnumMap = {
  EventStatus.draft: 'draft',
  EventStatus.published: 'published',
  EventStatus.cancelled: 'cancelled',
  EventStatus.completed: 'completed',
  EventStatus.postponed: 'postponed',
};

_$EventAttendeeImpl _$$EventAttendeeImplFromJson(Map<String, dynamic> json) =>
    _$EventAttendeeImpl(
      userId: json['userId'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      status: $enumDecode(_$AttendeeStatusEnumMap, json['status']),
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      joinedAt: json['joinedAt'] == null
          ? null
          : DateTime.parse(json['joinedAt'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$EventAttendeeImplToJson(_$EventAttendeeImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'status': _$AttendeeStatusEnumMap[instance.status]!,
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'joinedAt': instance.joinedAt?.toIso8601String(),
      'notes': instance.notes,
    };

const _$AttendeeStatusEnumMap = {
  AttendeeStatus.invited: 'invited',
  AttendeeStatus.attending: 'attending',
  AttendeeStatus.maybe: 'maybe',
  AttendeeStatus.notAttending: 'notAttending',
  AttendeeStatus.waitlist: 'waitlist',
};

_$EventCommentImpl _$$EventCommentImplFromJson(Map<String, dynamic> json) =>
    _$EventCommentImpl(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      userAvatar: json['userAvatar'] as String?,
      content: json['content'] as String,
      parentCommentId: json['parentCommentId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EventCommentImplToJson(_$EventCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'userId': instance.userId,
      'username': instance.username,
      'userAvatar': instance.userAvatar,
      'content': instance.content,
      'parentCommentId': instance.parentCommentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$CreateEventRequestImpl _$$CreateEventRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateEventRequestImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  eventDate: DateTime.parse(json['eventDate'] as String),
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  location: json['location'] as String?,
  imageUrl: json['imageUrl'] as String?,
  eventType: $enumDecode(_$EventTypeEnumMap, json['eventType']),
  meetingLink: json['meetingLink'] as String?,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  maxAttendees: (json['maxAttendees'] as num?)?.toInt(),
  isPublic: json['isPublic'] as bool? ?? true,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  invitedUserIds: (json['invitedUserIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$CreateEventRequestImplToJson(
  _$CreateEventRequestImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'eventDate': instance.eventDate.toIso8601String(),
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime.toIso8601String(),
  'location': instance.location,
  'imageUrl': instance.imageUrl,
  'eventType': _$EventTypeEnumMap[instance.eventType]!,
  'meetingLink': instance.meetingLink,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'maxAttendees': instance.maxAttendees,
  'isPublic': instance.isPublic,
  'tags': instance.tags,
  'invitedUserIds': instance.invitedUserIds,
};
