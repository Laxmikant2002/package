import 'dart:ui';

import 'package:api_client/src/models/data_state.dart';
import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';

class ApiClient {
  ApiClient(this.localstorage, this.onLogout);
  final Localstorage localstorage;
  final VoidCallback onLogout;

  Future<String?> getToken() async {
    final token = localstorage.getString(LocalKeys.assessToken);
    return token;
  }

  final baseoptions = BaseOptions(
    validateStatus: (status) => status! < 400,
    headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
    },
    connectTimeout: const Duration(seconds: 5),
  );

  Future<DataState<Response<dynamic>?>> getReq(
    String path,
  ) async {
    String? token = await getToken();
    print("Token: $token");

    try {
      final dio = Dio(baseoptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      final response = await dio.get<dynamic>(path);
      // Handle 401 error

      return DataSuccess(response);
    } on DioException catch (e) {
      print("******** ${e.response?.statusCode}");
      if (e.response?.statusCode == 401) {
        //onLogout(); // Trigger the logout action
      }
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> postReq(
    String path, {
    Map<String, dynamic>? bodyJson,
  }) async {
    String? token = await getToken();

    try {
      final dio = Dio(baseoptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      final response = await dio.post<dynamic>(path, data: bodyJson);
      return DataSuccess(response);
    } on DioException catch (e) {
      print("******** ${e.response?.statusCode}");
      if (e.response?.statusCode == 401) {
        //onLogout(); // Trigger the logout action
      }

      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }
}
