import 'package:hello_oschina/generated/json/base/json_convert_content.dart';
import 'package:hello_oschina/models/summary_new_banner_entity.dart';

SummaryNewBannerEntity $SummaryNewBannerEntityFromJson(
    Map<String, dynamic> json) {
  final SummaryNewBannerEntity summaryNewBannerEntity = SummaryNewBannerEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    summaryNewBannerEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    summaryNewBannerEntity.message = message;
  }
  final SummaryNewBannerNotice? notice = jsonConvert.convert<
      SummaryNewBannerNotice>(json['notice']);
  if (notice != null) {
    summaryNewBannerEntity.notice = notice;
  }
  final SummaryNewBannerResult? result = jsonConvert.convert<
      SummaryNewBannerResult>(json['result']);
  if (result != null) {
    summaryNewBannerEntity.result = result;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    summaryNewBannerEntity.time = time;
  }
  return summaryNewBannerEntity;
}

Map<String, dynamic> $SummaryNewBannerEntityToJson(
    SummaryNewBannerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['notice'] = entity.notice?.toJson();
  data['result'] = entity.result?.toJson();
  data['time'] = entity.time;
  return data;
}

extension SummaryNewBannerEntityExtension on SummaryNewBannerEntity {
  SummaryNewBannerEntity copyWith({
    int? code,
    String? message,
    SummaryNewBannerNotice? notice,
    SummaryNewBannerResult? result,
    String? time,
  }) {
    return SummaryNewBannerEntity()
      ..code = code ?? this.code
      ..message = message ?? this.message
      ..notice = notice ?? this.notice
      ..result = result ?? this.result
      ..time = time ?? this.time;
  }
}

SummaryNewBannerNotice $SummaryNewBannerNoticeFromJson(
    Map<String, dynamic> json) {
  final SummaryNewBannerNotice summaryNewBannerNotice = SummaryNewBannerNotice();
  final int? like = jsonConvert.convert<int>(json['like']);
  if (like != null) {
    summaryNewBannerNotice.like = like;
  }
  final int? review = jsonConvert.convert<int>(json['review']);
  if (review != null) {
    summaryNewBannerNotice.review = review;
  }
  final int? softwareCount = jsonConvert.convert<int>(json['softwareCount']);
  if (softwareCount != null) {
    summaryNewBannerNotice.softwareCount = softwareCount;
  }
  final int? letter = jsonConvert.convert<int>(json['letter']);
  if (letter != null) {
    summaryNewBannerNotice.letter = letter;
  }
  final int? newsCount = jsonConvert.convert<int>(json['newsCount']);
  if (newsCount != null) {
    summaryNewBannerNotice.newsCount = newsCount;
  }
  final int? mention = jsonConvert.convert<int>(json['mention']);
  if (mention != null) {
    summaryNewBannerNotice.mention = mention;
  }
  final int? fans = jsonConvert.convert<int>(json['fans']);
  if (fans != null) {
    summaryNewBannerNotice.fans = fans;
  }
  return summaryNewBannerNotice;
}

Map<String, dynamic> $SummaryNewBannerNoticeToJson(
    SummaryNewBannerNotice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['like'] = entity.like;
  data['review'] = entity.review;
  data['softwareCount'] = entity.softwareCount;
  data['letter'] = entity.letter;
  data['newsCount'] = entity.newsCount;
  data['mention'] = entity.mention;
  data['fans'] = entity.fans;
  return data;
}

extension SummaryNewBannerNoticeExtension on SummaryNewBannerNotice {
  SummaryNewBannerNotice copyWith({
    int? like,
    int? review,
    int? softwareCount,
    int? letter,
    int? newsCount,
    int? mention,
    int? fans,
  }) {
    return SummaryNewBannerNotice()
      ..like = like ?? this.like
      ..review = review ?? this.review
      ..softwareCount = softwareCount ?? this.softwareCount
      ..letter = letter ?? this.letter
      ..newsCount = newsCount ?? this.newsCount
      ..mention = mention ?? this.mention
      ..fans = fans ?? this.fans;
  }
}

SummaryNewBannerResult $SummaryNewBannerResultFromJson(
    Map<String, dynamic> json) {
  final SummaryNewBannerResult summaryNewBannerResult = SummaryNewBannerResult();
  final List<SummaryNewBannerResultItems>? items = (json['items'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<SummaryNewBannerResultItems>(
          e) as SummaryNewBannerResultItems).toList();
  if (items != null) {
    summaryNewBannerResult.items = items;
  }
  final String? nextPageToken = jsonConvert.convert<String>(
      json['nextPageToken']);
  if (nextPageToken != null) {
    summaryNewBannerResult.nextPageToken = nextPageToken;
  }
  final String? prevPageToken = jsonConvert.convert<String>(
      json['prevPageToken']);
  if (prevPageToken != null) {
    summaryNewBannerResult.prevPageToken = prevPageToken;
  }
  final int? requestCount = jsonConvert.convert<int>(json['requestCount']);
  if (requestCount != null) {
    summaryNewBannerResult.requestCount = requestCount;
  }
  final int? responseCount = jsonConvert.convert<int>(json['responseCount']);
  if (responseCount != null) {
    summaryNewBannerResult.responseCount = responseCount;
  }
  final int? totalResults = jsonConvert.convert<int>(json['totalResults']);
  if (totalResults != null) {
    summaryNewBannerResult.totalResults = totalResults;
  }
  return summaryNewBannerResult;
}

Map<String, dynamic> $SummaryNewBannerResultToJson(
    SummaryNewBannerResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['items'] = entity.items?.map((v) => v.toJson()).toList();
  data['nextPageToken'] = entity.nextPageToken;
  data['prevPageToken'] = entity.prevPageToken;
  data['requestCount'] = entity.requestCount;
  data['responseCount'] = entity.responseCount;
  data['totalResults'] = entity.totalResults;
  return data;
}

extension SummaryNewBannerResultExtension on SummaryNewBannerResult {
  SummaryNewBannerResult copyWith({
    List<SummaryNewBannerResultItems>? items,
    String? nextPageToken,
    String? prevPageToken,
    int? requestCount,
    int? responseCount,
    int? totalResults,
  }) {
    return SummaryNewBannerResult()
      ..items = items ?? this.items
      ..nextPageToken = nextPageToken ?? this.nextPageToken
      ..prevPageToken = prevPageToken ?? this.prevPageToken
      ..requestCount = requestCount ?? this.requestCount
      ..responseCount = responseCount ?? this.responseCount
      ..totalResults = totalResults ?? this.totalResults;
  }
}

SummaryNewBannerResultItems $SummaryNewBannerResultItemsFromJson(
    Map<String, dynamic> json) {
  final SummaryNewBannerResultItems summaryNewBannerResultItems = SummaryNewBannerResultItems();
  final String? detail = jsonConvert.convert<String>(json['detail']);
  if (detail != null) {
    summaryNewBannerResultItems.detail = detail;
  }
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    summaryNewBannerResultItems.href = href;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    summaryNewBannerResultItems.id = id;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    summaryNewBannerResultItems.img = img;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    summaryNewBannerResultItems.name = name;
  }
  final String? pubDate = jsonConvert.convert<String>(json['pubDate']);
  if (pubDate != null) {
    summaryNewBannerResultItems.pubDate = pubDate;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    summaryNewBannerResultItems.type = type;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    summaryNewBannerResultItems.weight = weight;
  }
  return summaryNewBannerResultItems;
}

Map<String, dynamic> $SummaryNewBannerResultItemsToJson(
    SummaryNewBannerResultItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['detail'] = entity.detail;
  data['href'] = entity.href;
  data['id'] = entity.id;
  data['img'] = entity.img;
  data['name'] = entity.name;
  data['pubDate'] = entity.pubDate;
  data['type'] = entity.type;
  data['weight'] = entity.weight;
  return data;
}

extension SummaryNewBannerResultItemsExtension on SummaryNewBannerResultItems {
  SummaryNewBannerResultItems copyWith({
    String? detail,
    String? href,
    int? id,
    String? img,
    String? name,
    String? pubDate,
    int? type,
    int? weight,
  }) {
    return SummaryNewBannerResultItems()
      ..detail = detail ?? this.detail
      ..href = href ?? this.href
      ..id = id ?? this.id
      ..img = img ?? this.img
      ..name = name ?? this.name
      ..pubDate = pubDate ?? this.pubDate
      ..type = type ?? this.type
      ..weight = weight ?? this.weight;
  }
}