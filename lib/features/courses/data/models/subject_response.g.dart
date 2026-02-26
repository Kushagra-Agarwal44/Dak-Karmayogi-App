// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectResponseImpl _$$SubjectResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubjectResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => Subject.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$$SubjectResponseImplToJson(
  _$SubjectResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'status': instance.status,
};

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
