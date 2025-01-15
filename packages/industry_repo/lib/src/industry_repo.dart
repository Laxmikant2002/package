import 'package:api_client/api_client.dart';
import 'package:industry_repo/src/models/list_response.dart';

class IndustryRepo {
  IndustryRepo({
    required this.apiClient,
  });
  final ApiClient apiClient;

  Future<DataState<List<IndustryObject>>> getIndustryList() async {
    try {
      final res = await apiClient.getReq(IndustryPaths.listIndustry);

      if (res is DataSuccess) {
        // Parse the response body
        final responseData = res.data?.data; // `data` from `DataState`
        if (responseData != null) {
          final industryListResponse = IndustryListResponse.fromJson(
            responseData as Map<String, dynamic>,
          );
          return DataSuccess(industryListResponse.data);
        } else {
          return DataFailed(DataError(500, 'Invalid data format'));
        }
      } else if (res is DataFailed) {
        // Handle API error
        final errorMap = res.error?.error as Map<String, dynamic>?;
        final errorMessage = errorMap?['error'] ?? 'An error occurred';
        return DataFailed(DataError(res.error?.statusCode, errorMessage));
      } else {
        return DataFailed(DataError(500, 'Unexpected response type'));
      }
    } catch (e) {
      // Handle unexpected errors
      return DataFailed(DataError(null, e.toString()));
    }
  }
}
