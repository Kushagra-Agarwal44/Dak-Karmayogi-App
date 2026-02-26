// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  empname: json['empname'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'empname': instance.empname,
      'email': instance.email,
      'role': instance.role,
    };
