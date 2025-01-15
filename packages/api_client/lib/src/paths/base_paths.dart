import 'package:flutter/services.dart';
export './auth_paths.dart';
export './base_paths.dart';
export './industry_paths.dart';

class BasePaths {
  static const mainUrl = appFlavor == 'development'
      ? "http://192.168.1.34:3006"
      : "https://backend.siteright360.com";
  static const baseUrl = "$mainUrl/api/v1";
}
