import 'package:hello_oschina/generated/json/base/json_convert_content.dart';
import 'package:hello_oschina/models/login_token_entity.dart';

LoginTokenEntity $LoginTokenEntityFromJson(Map<String, dynamic> json) {
  final LoginTokenEntity loginTokenEntity = LoginTokenEntity();
  final String? accessToken = jsonConvert.convert<String>(json['access_token']);
  if (accessToken != null) {
    loginTokenEntity.accessToken = accessToken;
  }
  final String? refreshToken = jsonConvert.convert<String>(
      json['refresh_token']);
  if (refreshToken != null) {
    loginTokenEntity.refreshToken = refreshToken;
  }
  final int? uid = jsonConvert.convert<int>(json['uid']);
  if (uid != null) {
    loginTokenEntity.uid = uid;
  }
  final String? tokenType = jsonConvert.convert<String>(json['token_type']);
  if (tokenType != null) {
    loginTokenEntity.tokenType = tokenType;
  }
  final int? expiresIn = jsonConvert.convert<int>(json['expires_in']);
  if (expiresIn != null) {
    loginTokenEntity.expiresIn = expiresIn;
  }
  return loginTokenEntity;
}

Map<String, dynamic> $LoginTokenEntityToJson(LoginTokenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['access_token'] = entity.accessToken;
  data['refresh_token'] = entity.refreshToken;
  data['uid'] = entity.uid;
  data['token_type'] = entity.tokenType;
  data['expires_in'] = entity.expiresIn;
  return data;
}

extension LoginTokenEntityExtension on LoginTokenEntity {
  LoginTokenEntity copyWith({
    String? accessToken,
    String? refreshToken,
    int? uid,
    String? tokenType,
    int? expiresIn,
  }) {
    return LoginTokenEntity()
      ..accessToken = accessToken ?? this.accessToken
      ..refreshToken = refreshToken ?? this.refreshToken
      ..uid = uid ?? this.uid
      ..tokenType = tokenType ?? this.tokenType
      ..expiresIn = expiresIn ?? this.expiresIn;
  }
}