import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

@HiveType(typeId: 1)
class AdBanner {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;

  AdBanner({
    required this.id,
    required this.image,
  });

  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
        id: data['id'],
        image: data['attributes']['image']['data']['attributes']['url'],
      );
}

List<AdBanner> adBannersListFromJson(String val) =>
    List<AdBanner>.from(jsonDecode(val)['data']
        .map((banner) => AdBanner.fromJson(banner)),
    );
