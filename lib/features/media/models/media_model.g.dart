// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaModelImpl _$$MediaModelImplFromJson(Map<String, dynamic> json) =>
    _$MediaModelImpl(
      id: json['id'] as String,
      filename: json['filename'] as String,
      originalFilename: json['originalFilename'] as String,
      mimeType: json['mimeType'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      description: json['description'] as String?,
      altText: json['altText'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MediaModelImplToJson(_$MediaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'originalFilename': instance.originalFilename,
      'mimeType': instance.mimeType,
      'fileSize': instance.fileSize,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'width': instance.width,
      'height': instance.height,
      'description': instance.description,
      'altText': instance.altText,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$MediaUploadRequestImpl _$$MediaUploadRequestImplFromJson(
  Map<String, dynamic> json,
) => _$MediaUploadRequestImpl(
  filename: json['filename'] as String,
  mimeType: json['mimeType'] as String,
  bytes: (json['bytes'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  description: json['description'] as String?,
  altText: json['altText'] as String?,
);

Map<String, dynamic> _$$MediaUploadRequestImplToJson(
  _$MediaUploadRequestImpl instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'mimeType': instance.mimeType,
  'bytes': instance.bytes,
  'description': instance.description,
  'altText': instance.altText,
};
