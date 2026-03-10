
import 'package:dak_karmayogi_app/features/auth/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';




 @freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required bool success,
    required String message,
    required LoginData data,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json)
      => _$LoginResponseModelFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: "access_token") required String accessToken,
    // FIX: Made nullable because the refresh API doesn't return it
    @JsonKey(name: "refresh_token") required String? refreshToken,
    required UserModel user,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json)
      => _$LoginDataFromJson(json);
}