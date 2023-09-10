import 'package:hive/hive.dart';

import '../../model/ad_banner.dart';

class LocalAdBannerService {
  late Box<AdBanner> _adBanner;
  bool adBannerFilled = false;

  Future<void> init() async {
    _adBanner = await Hive.openBox<AdBanner>('AdBanner');
  }

  Future<void> assignAllAdBanners({required List<AdBanner> adBanners}) async {
    await _adBanner.clear();
    await _adBanner.addAll(adBanners);
  }

  List<AdBanner> getAdBanners() {
    var s = _adBanner.values.toList();
    if (s.isNotEmpty) {
      adBannerFilled = true;
    }
    return _adBanner.values.toList();
  }
}
