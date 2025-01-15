import 'package:api_client/src/paths/base_paths.dart';

class AuthPaths extends BasePaths {
  static const login = "${BasePaths.baseUrl}/auth/login";
  static const register = "${BasePaths.baseUrl}/auth/register";
  static const me = "${BasePaths.baseUrl}/auth/me";
}
