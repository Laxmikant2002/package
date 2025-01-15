import 'package:api_client/api_client.dart';

class UserPaths extends BasePaths {
  static const postUserDetails = "${BasePaths.baseUrl}/users/user-detail";
  static const postUserServices = "${BasePaths.baseUrl}/users/services";
  static const getUserProfile = "${BasePaths.baseUrl}/users/profile";
}
