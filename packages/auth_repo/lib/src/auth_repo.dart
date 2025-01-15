import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:auth_repo/auth_repo.dart';
import 'package:localstorage/localstorage.dart';

class FieldError {
  String error;
  String field;

  FieldError({
    required this.error,
    required this.field,
  });
}

class AuthRepo {
  AuthRepo(this.apiClient, this.prefs);
  final Localstorage prefs;
  final ApiClient apiClient;

  bool checkIfSignedIn() {
    final token = prefs.getString(LocalKeys.assessToken);
    return token != null;
  }

  String getUserName() {
    final userJson = prefs.getString(LocalKeys.userJson);
    if (userJson != null) {
      final user = jsonDecode(userJson) as PrefsUser;
      return user.name;
    } else {
      return "Awaiting User";
    }
  }

  String getUserId() {
    final userJson = prefs.getString(LocalKeys.userJson);
    if (userJson != null) {
      final user = jsonDecode(userJson) as PrefsUser;
      return user.id;
    } else {
      return "Awaiting User";
    }
  }

  String? getUserAvatar() {
    final userJson = prefs.getString(LocalKeys.userJson);
    if (userJson != null) {
      final user = jsonDecode(userJson);
      return user.imageUrl;
    } else {
      return null;
    }
  }

  PrefsUser? getUser() {
    print("in get user");
    final userJson = prefs.getString(LocalKeys.userJson);
    print("userJson: $userJson");
    if (userJson != null) {
      final user = jsonDecode(userJson);
      final usr = PrefsUser(
        id: user['id'],
        name: user['name'],
        role: user['role'],
        imageUrl: user['imageUrl'],
      );
      print(usr.id);
      return usr;
    } else {
      print("in else user");
      return null;
    }
  }

  void logout() {
    prefs.deleteString(LocalKeys.assessToken);
    prefs.deleteString(LocalKeys.userJson);
  }

  Future<String?> register(RegisterRequest req) async {
    try {
      final res =
          await apiClient.postReq(AuthPaths.register, bodyJson: req.toJson());
      if (res is DataFailed) {
        // Decode the error response as a list of maps
        Map<String, dynamic> errorResponse = jsonDecode(res.error?.error);

        // Extract the list of error messages from the 'error' field
        List<dynamic> errors = errorResponse['error'];

        // Map each error object to its 'error' message and join with commas
        String response = errors.map((e) => e['error'] as String).join(', ');

        return response;
      }
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(AuthRequest req) async {
    try {
      print("hahahahaha");
      print(AuthPaths.login);
      print("hahahahaha");
      final res =
          await apiClient.postReq(AuthPaths.login, bodyJson: req.toJson());

      if (res is DataFailed) {
        try {
          // Directly access `res.error?.error` as a Map
          final errorMap = res.error?.error as Map<String, dynamic>;
          return errorMap['error'] ?? 'An error occurred';
        } catch (e) {
          return 'An unexpected error occurred';
        }
      }
      try {
        final data =
            AuthResponse.fromJson(res.data?.data as Map<String, dynamic>);

        prefs.saveString(LocalKeys.assessToken, data.accessToken);

        // final user = PrefsUser(
        //   id: data.user.id,
        //   name: data.user.name,
        // );
        // final userJson = jsonEncode(user.toJson());
        // prefs.saveString(LocalKeys.userJson, userJson);
      } catch (e) {
        return 'An unexpected error occurred';
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> me() async {
    try {
      final res = await apiClient.getReq(AuthPaths.me);

      try {
        final rawdata = res.data?.data;

        try {
          final data = UserDetailResponse.fromJson(rawdata);

          final user = PrefsUser(
            id: data.user.id,
            name: '${data.user.firstName} ${data.user.lastName}',
            role: data.user.role,
            imageUrl: data.user.userDetail?.avatar ?? null,
          );

          final userJson = jsonEncode(user.toJson());

          prefs.saveString(LocalKeys.userJson, userJson);

          return null;
        } catch (e) {
          print("error $e");
        }
      } catch (err) {
        return 'Error in me';
      }
    } catch (e) {
      return 'Error network';
    }
    return null;
  }
}
