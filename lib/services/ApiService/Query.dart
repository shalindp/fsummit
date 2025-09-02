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

class _QueryBase {
  final Map<String, dynamic> queryStore = {};

  ApiQueryReturnType<TData, TRequestBody> useApiQuery<TData, TRequestBody>(String cacheKey, ApiQueryInputMethod<TData, TRequestBody> inputMethod) {
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

      try {
        if (exitingInStore == null) {
          isLoadingSignal.set(true);
        }
        isFetchingSignal.set(true);
        var apiResponse = (await inputMethod(requestBody)).data;
        dataSignal.set(apiResponse);
        result.data = apiResponse;
        result.isSuccess = true;
      } on DioException catch (e) {
        if (e.response?.data != null) {
          errorMessageSignal.set(e.response!.data);
          result.errorMessage = e.response!.data;
        }
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
