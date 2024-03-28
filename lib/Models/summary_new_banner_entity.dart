import 'package:hello_oschina/generated/json/base/json_field.dart';
import 'package:hello_oschina/generated/json/summary_new_banner_entity.g.dart';
import 'dart:convert';
export 'package:hello_oschina/generated/json/summary_new_banner_entity.g.dart';

@JsonSerializable()
class SummaryNewBannerEntity {
	int? code = 0;
	String? message = '';
	SummaryNewBannerNotice? notice;
	SummaryNewBannerResult? result;
	String? time = '';

	SummaryNewBannerEntity();

	factory SummaryNewBannerEntity.fromJson(Map<String, dynamic> json) => $SummaryNewBannerEntityFromJson(json);

	Map<String, dynamic> toJson() => $SummaryNewBannerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SummaryNewBannerNotice {
	int? like = 0;
	int? review = 0;
	int? softwareCount = 0;
	int? letter = 0;
	int? newsCount = 0;
	int? mention = 0;
	int? fans = 0;

	SummaryNewBannerNotice();

	factory SummaryNewBannerNotice.fromJson(Map<String, dynamic> json) => $SummaryNewBannerNoticeFromJson(json);

	Map<String, dynamic> toJson() => $SummaryNewBannerNoticeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SummaryNewBannerResult {
	List<SummaryNewBannerResultItems>? items = [];
	String? nextPageToken = '';
	String? prevPageToken = '';
	int? requestCount = 0;
	int? responseCount = 0;
	int? totalResults = 0;

	SummaryNewBannerResult();

	factory SummaryNewBannerResult.fromJson(Map<String, dynamic> json) => $SummaryNewBannerResultFromJson(json);

	Map<String, dynamic> toJson() => $SummaryNewBannerResultToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SummaryNewBannerResultItems {
	String? detail = '';
	String? href = '';
	int? id = 0;
	String? img = '';
	String? name = '';
	String? pubDate = '';
	int? type = 0;
	int? weight = 0;

	SummaryNewBannerResultItems();

	factory SummaryNewBannerResultItems.fromJson(Map<String, dynamic> json) => $SummaryNewBannerResultItemsFromJson(json);

	Map<String, dynamic> toJson() => $SummaryNewBannerResultItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}