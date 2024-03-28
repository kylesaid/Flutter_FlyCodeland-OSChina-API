import 'package:hello_oschina/generated/json/base/json_field.dart';
import 'package:hello_oschina/generated/json/login_token_entity.g.dart';
import 'dart:convert';
export 'package:hello_oschina/generated/json/login_token_entity.g.dart';

@JsonSerializable()
class LoginTokenEntity {
	@JSONField(name: "access_token")
	String? accessToken = '';
	@JSONField(name: "refresh_token")
	String? refreshToken = '';
	int? uid = 0;
	@JSONField(name: "token_type")
	String? tokenType = '';
	@JSONField(name: "expires_in")
	int? expiresIn = 0;

	LoginTokenEntity();

	factory LoginTokenEntity.fromJson(Map<String, dynamic> json) => $LoginTokenEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginTokenEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}