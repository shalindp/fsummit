part of 'ApiService.dart';

typedef ApiQueryInputMethod<TData, TRequestBody> = Future<Response<TData>> Function(TRequestBody body);

typedef ApiQueryReturnType<TData, TRequestBody> = ({
  FlutterSignal<bool> isFetchingSignal,
  FlutterSignal<bool> isLoadingSignal,
  FlutterSignal<String?> errorMessageSignal,
  FlutterSignal<TData?> dataSignal,
  Future<QueryResult<TData>> Function(TRequestBody requestBody) fetchAsync,
});

class QueryResult<TData> {
  bool isSuccess = false;
  String? errorMessage;
  TData? data;
}

class ApiQuery {
  final ApiService _apiService;

  final Map<String, dynamic> queryStore = {};

  ApiQuery(this._apiService);

  ApiQueryReturnType<TData, TRequestBody> useApiQuery<TData, TRequestBody>(
    String cacheKey,
    ApiQueryInputMethod<TData, TRequestBody> inputMethod, {
    bool isAnonymous = false,
  }) {
    var exitingInStore = queryStore[cacheKey];
    if (exitingInStore != null) {
      return exitingInStore as ApiQueryReturnType<TData, TRequestBody>;
    }

    var isFetchingSignal = signal(false);
    var isLoadingSignal = signal(false);
    var errorMessageSignal = signal<String?>(null);
    var dataSignal = signal<TData?>(null);

    Future<QueryResult<TData>> fetchAsync(TRequestBody requestBody) async {
      var result = QueryResult<TData>();

      print("useQuery ${cacheKey}");
      try {
        if (exitingInStore == null) {
          isLoadingSignal.set(true);
        }
        isFetchingSignal.set(true);

        if (!isAnonymous && JwtDecoder.isExpired(_apiService._authState!.token)) {
          var body = SilentRefreshRequestBody((c) {
            c.refreshToken = _apiService._authState!.refreshToken;
          });

          await _apiService.userApi.userSilentRefreshPost(silentRefreshRequestBody: body, headers: _apiService.headers);
        }

        var apiResponse = (await inputMethod(requestBody)).data;
        dataSignal.set(apiResponse);
        result.data = apiResponse;
        result.isSuccess = true;
      } on DioException catch (e) {
        if (e.response?.data != null) {
          errorMessageSignal.set(e.response!.data);
          result.errorMessage = e.response!.data;
        }
      } catch (e) {
        print(e);
      } finally {
        isLoadingSignal.set(false);
        isFetchingSignal.set(false);
      }
      return result;
    }

    ApiQueryReturnType<TData, TRequestBody> returnData = (
      isFetchingSignal: isFetchingSignal,
      isLoadingSignal: isLoadingSignal,
      errorMessageSignal: errorMessageSignal,
      dataSignal: dataSignal,
      fetchAsync: fetchAsync,
    );

    queryStore[cacheKey] = returnData;
    return returnData;
  }
}
