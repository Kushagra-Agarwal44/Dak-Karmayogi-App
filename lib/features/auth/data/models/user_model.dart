import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String empname,
    required String email, // since login is via userId
    required String role,
    required String username,
    @JsonKey(name: "login_mode") required String loginMode,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(
      id: id,
      name: empname,
      email: email,
      role: role,
      username: username,
      loginMode: loginMode,
    );
  }
}
