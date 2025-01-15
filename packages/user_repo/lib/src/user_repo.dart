import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:localstorage/localstorage.dart';
import 'package:user_repo/user_repo.dart';

class UserRepo {
  UserRepo(this.apiClient, this.localstorage);
  final ApiClient apiClient;
  final Localstorage localstorage;

  Future<String?> submitAbout(UserAboutRequest req) async {
    try {
      final res = await apiClient.postReq(
        UserPaths.postUserDetails,
        bodyJson: req.toJson(),
      );
      if (res is DataFailed) {
        Map<String, dynamic> errorResponse = jsonDecode(res.error?.error);

        // Extract the list of error messages from the 'error' field
        List<dynamic> errors = errorResponse['error'];

        // Map each error object to its 'error' message and join with commas
        String response = errors.map((e) => e['error'] as String).join(', ');

        return response;
      }

      if (res is DataSuccess) {
        // print("-----------");
        // print(res.data);
        // print("-----------");
        try {
          final rawdata = res.data?.data;

          final data = UserAboutResponse.fromJson(rawdata);

          final user = PrefsUser(
            id: data.user.id,
            name: data.user.name,
            imageUrl: data.user.userDetail.avatar,
          );
          final userJson = jsonEncode(user.toJson());
          localstorage.saveString(LocalKeys.userJson, userJson);
          return null;
        } catch (err) {
          print("in decode error $err");
        }
      }
    } catch (e) {
      // print("%%%%%%%%%%%%%");
      // print(e);
      // print("%%%%%%%%%%%%%");
      return 'An unexpected error occurred2';
    }
    return null;
  }

  Future<String?> submitUserServices(SubmitUserServicesRequest req) async {
    try {
      final res = await apiClient.postReq(
        UserPaths.postUserServices,
        bodyJson: req.toJson(),
      );
      if (res is DataFailed) {
        Map<String, dynamic> errorResponse = jsonDecode(res.error?.error);

        // Extract the list of error messages from the 'error' field
        List<dynamic> errors = errorResponse['error'];

        // Map each error object to its 'error' message and join with commas
        String response = errors.map((e) => e['error'] as String).join(', ');

        return response;
      }
    } catch (e) {
      return "Some error happened";
    }
    return null;
  }

  Future<UserProfileResponse?> fetchUserProfile() async {
    try {
      final res = await apiClient.getReq(UserPaths.getUserProfile);
      print('Here $res');
      if (res is DataFailed) {
        print('tHere');
        return null;
      } else {
        print('1');
        try {
          final profile = userProfileResponseFromJson(res.data?.data);
          return profile;
        } catch (e) {
          print('1asdf $e');
          return null;
        }
      }
    } catch (e) {
      print('1asdfasdf');
      return null;
    }
  }
}
