// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
mixin _$EventModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  String get organizerName => throw _privateConstructorUsedError;
  String? get organizerAvatar => throw _privateConstructorUsedError;
  List<String> get attendeeIds => throw _privateConstructorUsedError;
  EventType get eventType => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  String? get meetingLink => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get maxAttendees => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EventModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
    EventModel value,
    $Res Function(EventModel) then,
  ) = _$EventModelCopyWithImpl<$Res, EventModel>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    DateTime eventDate,
    DateTime startTime,
    DateTime endTime,
    String? location,
    String? imageUrl,
    String organizerId,
    String organizerName,
    String? organizerAvatar,
    List<String> attendeeIds,
    EventType eventType,
    EventStatus status,
    String? meetingLink,
    String? address,
    double? latitude,
    double? longitude,
    int? maxAttendees,
    bool isPublic,
    List<String>? tags,
    Map<String, dynamic>? additionalData,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res, $Val extends EventModel>
    implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? eventDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? organizerAvatar = freezed,
    Object? attendeeIds = null,
    Object? eventType = null,
    Object? status = null,
    Object? meetingLink = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? maxAttendees = freezed,
    Object? isPublic = null,
    Object? tags = freezed,
    Object? additionalData = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            eventDate: null == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            organizerId: null == organizerId
                ? _value.organizerId
                : organizerId // ignore: cast_nullable_to_non_nullable
                      as String,
            organizerName: null == organizerName
                ? _value.organizerName
                : organizerName // ignore: cast_nullable_to_non_nullable
                      as String,
            organizerAvatar: freezed == organizerAvatar
                ? _value.organizerAvatar
                : organizerAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            attendeeIds: null == attendeeIds
                ? _value.attendeeIds
                : attendeeIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as EventType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as EventStatus,
            meetingLink: freezed == meetingLink
                ? _value.meetingLink
                : meetingLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxAttendees: freezed == maxAttendees
                ? _value.maxAttendees
                : maxAttendees // ignore: cast_nullable_to_non_nullable
                      as int?,
            isPublic: null == isPublic
                ? _value.isPublic
                : isPublic // ignore: cast_nullable_to_non_nullable
                      as bool,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            additionalData: freezed == additionalData
                ? _value.additionalData
                : additionalData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventModelImplCopyWith<$Res>
    implements $EventModelCopyWith<$Res> {
  factory _$$EventModelImplCopyWith(
    _$EventModelImpl value,
    $Res Function(_$EventModelImpl) then,
  ) = __$$EventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    DateTime eventDate,
    DateTime startTime,
    DateTime endTime,
    String? location,
    String? imageUrl,
    String organizerId,
    String organizerName,
    String? organizerAvatar,
    List<String> attendeeIds,
    EventType eventType,
    EventStatus status,
    String? meetingLink,
    String? address,
    double? latitude,
    double? longitude,
    int? maxAttendees,
    bool isPublic,
    List<String>? tags,
    Map<String, dynamic>? additionalData,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$EventModelImplCopyWithImpl<$Res>
    extends _$EventModelCopyWithImpl<$Res, _$EventModelImpl>
    implements _$$EventModelImplCopyWith<$Res> {
  __$$EventModelImplCopyWithImpl(
    _$EventModelImpl _value,
    $Res Function(_$EventModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? eventDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? organizerAvatar = freezed,
    Object? attendeeIds = null,
    Object? eventType = null,
    Object? status = null,
    Object? meetingLink = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? maxAttendees = freezed,
    Object? isPublic = null,
    Object? tags = freezed,
    Object? additionalData = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$EventModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        eventDate: null == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizerId: null == organizerId
            ? _value.organizerId
            : organizerId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizerName: null == organizerName
            ? _value.organizerName
            : organizerName // ignore: cast_nullable_to_non_nullable
                  as String,
        organizerAvatar: freezed == organizerAvatar
            ? _value.organizerAvatar
            : organizerAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        attendeeIds: null == attendeeIds
            ? _value._attendeeIds
            : attendeeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as EventType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as EventStatus,
        meetingLink: freezed == meetingLink
            ? _value.meetingLink
            : meetingLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxAttendees: freezed == maxAttendees
            ? _value.maxAttendees
            : maxAttendees // ignore: cast_nullable_to_non_nullable
                  as int?,
        isPublic: null == isPublic
            ? _value.isPublic
            : isPublic // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        additionalData: freezed == additionalData
            ? _value._additionalData
            : additionalData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventModelImpl implements _EventModel {
  const _$EventModelImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.startTime,
    required this.endTime,
    this.location,
    this.imageUrl,
    required this.organizerId,
    required this.organizerName,
    this.organizerAvatar,
    required final List<String> attendeeIds,
    required this.eventType,
    required this.status,
    this.meetingLink,
    this.address,
    this.latitude,
    this.longitude,
    this.maxAttendees,
    this.isPublic = true,
    final List<String>? tags,
    final Map<String, dynamic>? additionalData,
    required this.createdAt,
    required this.updatedAt,
  }) : _attendeeIds = attendeeIds,
       _tags = tags,
       _additionalData = additionalData;

  factory _$EventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime eventDate;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String? location;
  @override
  final String? imageUrl;
  @override
  final String organizerId;
  @override
  final String organizerName;
  @override
  final String? organizerAvatar;
  final List<String> _attendeeIds;
  @override
  List<String> get attendeeIds {
    if (_attendeeIds is EqualUnmodifiableListView) return _attendeeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendeeIds);
  }

  @override
  final EventType eventType;
  @override
  final EventStatus status;
  @override
  final String? meetingLink;
  @override
  final String? address;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? maxAttendees;
  @override
  @JsonKey()
  final bool isPublic;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, description: $description, eventDate: $eventDate, startTime: $startTime, endTime: $endTime, location: $location, imageUrl: $imageUrl, organizerId: $organizerId, organizerName: $organizerName, organizerAvatar: $organizerAvatar, attendeeIds: $attendeeIds, eventType: $eventType, status: $status, meetingLink: $meetingLink, address: $address, latitude: $latitude, longitude: $longitude, maxAttendees: $maxAttendees, isPublic: $isPublic, tags: $tags, additionalData: $additionalData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.organizerName, organizerName) ||
                other.organizerName == organizerName) &&
            (identical(other.organizerAvatar, organizerAvatar) ||
                other.organizerAvatar == organizerAvatar) &&
            const DeepCollectionEquality().equals(
              other._attendeeIds,
              _attendeeIds,
            ) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.meetingLink, meetingLink) ||
                other.meetingLink == meetingLink) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.maxAttendees, maxAttendees) ||
                other.maxAttendees == maxAttendees) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._additionalData,
              _additionalData,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    description,
    eventDate,
    startTime,
    endTime,
    location,
    imageUrl,
    organizerId,
    organizerName,
    organizerAvatar,
    const DeepCollectionEquality().hash(_attendeeIds),
    eventType,
    status,
    meetingLink,
    address,
    latitude,
    longitude,
    maxAttendees,
    isPublic,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_additionalData),
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      __$$EventModelImplCopyWithImpl<_$EventModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventModelImplToJson(this);
  }
}

abstract class _EventModel implements EventModel {
  const factory _EventModel({
    required final String id,
    required final String title,
    required final String description,
    required final DateTime eventDate,
    required final DateTime startTime,
    required final DateTime endTime,
    final String? location,
    final String? imageUrl,
    required final String organizerId,
    required final String organizerName,
    final String? organizerAvatar,
    required final List<String> attendeeIds,
    required final EventType eventType,
    required final EventStatus status,
    final String? meetingLink,
    final String? address,
    final double? latitude,
    final double? longitude,
    final int? maxAttendees,
    final bool isPublic,
    final List<String>? tags,
    final Map<String, dynamic>? additionalData,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$EventModelImpl;

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$EventModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get eventDate;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String? get location;
  @override
  String? get imageUrl;
  @override
  String get organizerId;
  @override
  String get organizerName;
  @override
  String? get organizerAvatar;
  @override
  List<String> get attendeeIds;
  @override
  EventType get eventType;
  @override
  EventStatus get status;
  @override
  String? get meetingLink;
  @override
  String? get address;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get maxAttendees;
  @override
  bool get isPublic;
  @override
  List<String>? get tags;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of EventModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventModelImplCopyWith<_$EventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventAttendee _$EventAttendeeFromJson(Map<String, dynamic> json) {
  return _EventAttendee.fromJson(json);
}

/// @nodoc
mixin _$EventAttendee {
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  AttendeeStatus get status => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  DateTime? get joinedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this EventAttendee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventAttendee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventAttendeeCopyWith<EventAttendee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventAttendeeCopyWith<$Res> {
  factory $EventAttendeeCopyWith(
    EventAttendee value,
    $Res Function(EventAttendee) then,
  ) = _$EventAttendeeCopyWithImpl<$Res, EventAttendee>;
  @useResult
  $Res call({
    String userId,
    String username,
    String? avatarUrl,
    AttendeeStatus status,
    DateTime? respondedAt,
    DateTime? joinedAt,
    String? notes,
  });
}

/// @nodoc
class _$EventAttendeeCopyWithImpl<$Res, $Val extends EventAttendee>
    implements $EventAttendeeCopyWith<$Res> {
  _$EventAttendeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventAttendee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? status = null,
    Object? respondedAt = freezed,
    Object? joinedAt = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AttendeeStatus,
            respondedAt: freezed == respondedAt
                ? _value.respondedAt
                : respondedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            joinedAt: freezed == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventAttendeeImplCopyWith<$Res>
    implements $EventAttendeeCopyWith<$Res> {
  factory _$$EventAttendeeImplCopyWith(
    _$EventAttendeeImpl value,
    $Res Function(_$EventAttendeeImpl) then,
  ) = __$$EventAttendeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String username,
    String? avatarUrl,
    AttendeeStatus status,
    DateTime? respondedAt,
    DateTime? joinedAt,
    String? notes,
  });
}

/// @nodoc
class __$$EventAttendeeImplCopyWithImpl<$Res>
    extends _$EventAttendeeCopyWithImpl<$Res, _$EventAttendeeImpl>
    implements _$$EventAttendeeImplCopyWith<$Res> {
  __$$EventAttendeeImplCopyWithImpl(
    _$EventAttendeeImpl _value,
    $Res Function(_$EventAttendeeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventAttendee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? status = null,
    Object? respondedAt = freezed,
    Object? joinedAt = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$EventAttendeeImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AttendeeStatus,
        respondedAt: freezed == respondedAt
            ? _value.respondedAt
            : respondedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        joinedAt: freezed == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventAttendeeImpl implements _EventAttendee {
  const _$EventAttendeeImpl({
    required this.userId,
    required this.username,
    this.avatarUrl,
    required this.status,
    this.respondedAt,
    this.joinedAt,
    this.notes,
  });

  factory _$EventAttendeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventAttendeeImplFromJson(json);

  @override
  final String userId;
  @override
  final String username;
  @override
  final String? avatarUrl;
  @override
  final AttendeeStatus status;
  @override
  final DateTime? respondedAt;
  @override
  final DateTime? joinedAt;
  @override
  final String? notes;

  @override
  String toString() {
    return 'EventAttendee(userId: $userId, username: $username, avatarUrl: $avatarUrl, status: $status, respondedAt: $respondedAt, joinedAt: $joinedAt, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventAttendeeImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    username,
    avatarUrl,
    status,
    respondedAt,
    joinedAt,
    notes,
  );

  /// Create a copy of EventAttendee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventAttendeeImplCopyWith<_$EventAttendeeImpl> get copyWith =>
      __$$EventAttendeeImplCopyWithImpl<_$EventAttendeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventAttendeeImplToJson(this);
  }
}

abstract class _EventAttendee implements EventAttendee {
  const factory _EventAttendee({
    required final String userId,
    required final String username,
    final String? avatarUrl,
    required final AttendeeStatus status,
    final DateTime? respondedAt,
    final DateTime? joinedAt,
    final String? notes,
  }) = _$EventAttendeeImpl;

  factory _EventAttendee.fromJson(Map<String, dynamic> json) =
      _$EventAttendeeImpl.fromJson;

  @override
  String get userId;
  @override
  String get username;
  @override
  String? get avatarUrl;
  @override
  AttendeeStatus get status;
  @override
  DateTime? get respondedAt;
  @override
  DateTime? get joinedAt;
  @override
  String? get notes;

  /// Create a copy of EventAttendee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventAttendeeImplCopyWith<_$EventAttendeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventComment _$EventCommentFromJson(Map<String, dynamic> json) {
  return _EventComment.fromJson(json);
}

/// @nodoc
mixin _$EventComment {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get userAvatar => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get parentCommentId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EventComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCommentCopyWith<EventComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCommentCopyWith<$Res> {
  factory $EventCommentCopyWith(
    EventComment value,
    $Res Function(EventComment) then,
  ) = _$EventCommentCopyWithImpl<$Res, EventComment>;
  @useResult
  $Res call({
    String id,
    String eventId,
    String userId,
    String username,
    String? userAvatar,
    String content,
    String? parentCommentId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$EventCommentCopyWithImpl<$Res, $Val extends EventComment>
    implements $EventCommentCopyWith<$Res> {
  _$EventCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? username = null,
    Object? userAvatar = freezed,
    Object? content = null,
    Object? parentCommentId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            userAvatar: freezed == userAvatar
                ? _value.userAvatar
                : userAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            parentCommentId: freezed == parentCommentId
                ? _value.parentCommentId
                : parentCommentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventCommentImplCopyWith<$Res>
    implements $EventCommentCopyWith<$Res> {
  factory _$$EventCommentImplCopyWith(
    _$EventCommentImpl value,
    $Res Function(_$EventCommentImpl) then,
  ) = __$$EventCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String eventId,
    String userId,
    String username,
    String? userAvatar,
    String content,
    String? parentCommentId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$EventCommentImplCopyWithImpl<$Res>
    extends _$EventCommentCopyWithImpl<$Res, _$EventCommentImpl>
    implements _$$EventCommentImplCopyWith<$Res> {
  __$$EventCommentImplCopyWithImpl(
    _$EventCommentImpl _value,
    $Res Function(_$EventCommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? username = null,
    Object? userAvatar = freezed,
    Object? content = null,
    Object? parentCommentId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$EventCommentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        userAvatar: freezed == userAvatar
            ? _value.userAvatar
            : userAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        parentCommentId: freezed == parentCommentId
            ? _value.parentCommentId
            : parentCommentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventCommentImpl implements _EventComment {
  const _$EventCommentImpl({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.username,
    this.userAvatar,
    required this.content,
    this.parentCommentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$EventCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCommentImplFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String? userAvatar;
  @override
  final String content;
  @override
  final String? parentCommentId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EventComment(id: $id, eventId: $eventId, userId: $userId, username: $username, userAvatar: $userAvatar, content: $content, parentCommentId: $parentCommentId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    eventId,
    userId,
    username,
    userAvatar,
    content,
    parentCommentId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCommentImplCopyWith<_$EventCommentImpl> get copyWith =>
      __$$EventCommentImplCopyWithImpl<_$EventCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCommentImplToJson(this);
  }
}

abstract class _EventComment implements EventComment {
  const factory _EventComment({
    required final String id,
    required final String eventId,
    required final String userId,
    required final String username,
    final String? userAvatar,
    required final String content,
    final String? parentCommentId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$EventCommentImpl;

  factory _EventComment.fromJson(Map<String, dynamic> json) =
      _$EventCommentImpl.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get userId;
  @override
  String get username;
  @override
  String? get userAvatar;
  @override
  String get content;
  @override
  String? get parentCommentId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of EventComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCommentImplCopyWith<_$EventCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateEventRequest _$CreateEventRequestFromJson(Map<String, dynamic> json) {
  return _CreateEventRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateEventRequest {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  EventType get eventType => throw _privateConstructorUsedError;
  String? get meetingLink => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get maxAttendees => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<String>? get invitedUserIds => throw _privateConstructorUsedError;

  /// Serializes this CreateEventRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateEventRequestCopyWith<CreateEventRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEventRequestCopyWith<$Res> {
  factory $CreateEventRequestCopyWith(
    CreateEventRequest value,
    $Res Function(CreateEventRequest) then,
  ) = _$CreateEventRequestCopyWithImpl<$Res, CreateEventRequest>;
  @useResult
  $Res call({
    String title,
    String description,
    DateTime eventDate,
    DateTime startTime,
    DateTime endTime,
    String? location,
    String? imageUrl,
    EventType eventType,
    String? meetingLink,
    String? address,
    double? latitude,
    double? longitude,
    int? maxAttendees,
    bool isPublic,
    List<String>? tags,
    List<String>? invitedUserIds,
  });
}

/// @nodoc
class _$CreateEventRequestCopyWithImpl<$Res, $Val extends CreateEventRequest>
    implements $CreateEventRequestCopyWith<$Res> {
  _$CreateEventRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? eventDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? eventType = null,
    Object? meetingLink = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? maxAttendees = freezed,
    Object? isPublic = null,
    Object? tags = freezed,
    Object? invitedUserIds = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            eventDate: null == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as EventType,
            meetingLink: freezed == meetingLink
                ? _value.meetingLink
                : meetingLink // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxAttendees: freezed == maxAttendees
                ? _value.maxAttendees
                : maxAttendees // ignore: cast_nullable_to_non_nullable
                      as int?,
            isPublic: null == isPublic
                ? _value.isPublic
                : isPublic // ignore: cast_nullable_to_non_nullable
                      as bool,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            invitedUserIds: freezed == invitedUserIds
                ? _value.invitedUserIds
                : invitedUserIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateEventRequestImplCopyWith<$Res>
    implements $CreateEventRequestCopyWith<$Res> {
  factory _$$CreateEventRequestImplCopyWith(
    _$CreateEventRequestImpl value,
    $Res Function(_$CreateEventRequestImpl) then,
  ) = __$$CreateEventRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    DateTime eventDate,
    DateTime startTime,
    DateTime endTime,
    String? location,
    String? imageUrl,
    EventType eventType,
    String? meetingLink,
    String? address,
    double? latitude,
    double? longitude,
    int? maxAttendees,
    bool isPublic,
    List<String>? tags,
    List<String>? invitedUserIds,
  });
}

/// @nodoc
class __$$CreateEventRequestImplCopyWithImpl<$Res>
    extends _$CreateEventRequestCopyWithImpl<$Res, _$CreateEventRequestImpl>
    implements _$$CreateEventRequestImplCopyWith<$Res> {
  __$$CreateEventRequestImplCopyWithImpl(
    _$CreateEventRequestImpl _value,
    $Res Function(_$CreateEventRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? eventDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? location = freezed,
    Object? imageUrl = freezed,
    Object? eventType = null,
    Object? meetingLink = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? maxAttendees = freezed,
    Object? isPublic = null,
    Object? tags = freezed,
    Object? invitedUserIds = freezed,
  }) {
    return _then(
      _$CreateEventRequestImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        eventDate: null == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as EventType,
        meetingLink: freezed == meetingLink
            ? _value.meetingLink
            : meetingLink // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxAttendees: freezed == maxAttendees
            ? _value.maxAttendees
            : maxAttendees // ignore: cast_nullable_to_non_nullable
                  as int?,
        isPublic: null == isPublic
            ? _value.isPublic
            : isPublic // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        invitedUserIds: freezed == invitedUserIds
            ? _value._invitedUserIds
            : invitedUserIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateEventRequestImpl implements _CreateEventRequest {
  const _$CreateEventRequestImpl({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.startTime,
    required this.endTime,
    this.location,
    this.imageUrl,
    required this.eventType,
    this.meetingLink,
    this.address,
    this.latitude,
    this.longitude,
    this.maxAttendees,
    this.isPublic = true,
    final List<String>? tags,
    final List<String>? invitedUserIds,
  }) : _tags = tags,
       _invitedUserIds = invitedUserIds;

  factory _$CreateEventRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateEventRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime eventDate;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String? location;
  @override
  final String? imageUrl;
  @override
  final EventType eventType;
  @override
  final String? meetingLink;
  @override
  final String? address;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? maxAttendees;
  @override
  @JsonKey()
  final bool isPublic;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _invitedUserIds;
  @override
  List<String>? get invitedUserIds {
    final value = _invitedUserIds;
    if (value == null) return null;
    if (_invitedUserIds is EqualUnmodifiableListView) return _invitedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateEventRequest(title: $title, description: $description, eventDate: $eventDate, startTime: $startTime, endTime: $endTime, location: $location, imageUrl: $imageUrl, eventType: $eventType, meetingLink: $meetingLink, address: $address, latitude: $latitude, longitude: $longitude, maxAttendees: $maxAttendees, isPublic: $isPublic, tags: $tags, invitedUserIds: $invitedUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.meetingLink, meetingLink) ||
                other.meetingLink == meetingLink) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.maxAttendees, maxAttendees) ||
                other.maxAttendees == maxAttendees) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._invitedUserIds,
              _invitedUserIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    eventDate,
    startTime,
    endTime,
    location,
    imageUrl,
    eventType,
    meetingLink,
    address,
    latitude,
    longitude,
    maxAttendees,
    isPublic,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_invitedUserIds),
  );

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventRequestImplCopyWith<_$CreateEventRequestImpl> get copyWith =>
      __$$CreateEventRequestImplCopyWithImpl<_$CreateEventRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateEventRequestImplToJson(this);
  }
}

abstract class _CreateEventRequest implements CreateEventRequest {
  const factory _CreateEventRequest({
    required final String title,
    required final String description,
    required final DateTime eventDate,
    required final DateTime startTime,
    required final DateTime endTime,
    final String? location,
    final String? imageUrl,
    required final EventType eventType,
    final String? meetingLink,
    final String? address,
    final double? latitude,
    final double? longitude,
    final int? maxAttendees,
    final bool isPublic,
    final List<String>? tags,
    final List<String>? invitedUserIds,
  }) = _$CreateEventRequestImpl;

  factory _CreateEventRequest.fromJson(Map<String, dynamic> json) =
      _$CreateEventRequestImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get eventDate;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String? get location;
  @override
  String? get imageUrl;
  @override
  EventType get eventType;
  @override
  String? get meetingLink;
  @override
  String? get address;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get maxAttendees;
  @override
  bool get isPublic;
  @override
  List<String>? get tags;
  @override
  List<String>? get invitedUserIds;

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateEventRequestImplCopyWith<_$CreateEventRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
