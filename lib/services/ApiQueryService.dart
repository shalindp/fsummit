import 'package:dio/dio.dart';
import 'package:fsummit/services/ApiService.dart';
import 'package:get_it/get_it.dart';
import 'package:openapi/openapi.dart';
import 'package:signals/signals_flutter.dart';

typedef ApiQueryType<TData> = ({
  FlutterSignal<bool> isFetching,
  FlutterSignal<bool> isLoading,
  FlutterSignal<String?> errorMessage,
  FlutterSignal<TData?> data,
});
typedef ApiQueryInputMethod<TData, TRequestBody> = Future<Response<TData>> Function(TRequestBody body);

typedef ApiQueryReturnType<TData, TRequestBody> = ({
  FlutterSignal<bool> isFetching,
  FlutterSignal<bool> isLoading,
  FlutterSignal<String?> errorMessage,
  FlutterSignal<TData?> data,
  Future<TData?> Function(TRequestBody requestBody) fetchAsync,
});

class ApiQueryService {
  final _apiService = GetIt.I<ApiService>();

  final Map<String, dynamic> queryStore = {};

  Future<Response<AuthResponseResultResponse>> silentRefreshAsync(SilentRefreshRequestBody body) =>
      _apiService.userApi.userSilentRefreshPost(silentRefreshRequestBody: body);

  ApiQueryReturnType<TData, TRequestBody> useApiQuery<TData, TRequestBody>(String cacheKey, ApiQueryInputMethod<TData, TRequestBody> inputMethod) {
    var exitingInStore = queryStore[cacheKey];
    if (exitingInStore != null) {
      return exitingInStore as ApiQueryReturnType<TData, TRequestBody>;
    }

    var isFetching = signal(false);
    var isLoading = signal(false);
    var errorMessage = signal<String?>(null);
    var data = signal<TData?>(null);

    Future<TData?> fetchAsync(TRequestBody requestBody) async {
      try {
        if (exitingInStore == null) {
          isLoading.set(true);
        }
        isFetching.set(true);
        var result = (await inputMethod(requestBody)).data;
        data.set(result);
        return result;
      } on DioException catch (e) {
        if (e.response?.data != null) {
          errorMessage.set(e.response!.data);
        }
      } finally {
        isLoading.set(false);
        isFetching.set(false);
      }
      return null;
    }

    ApiQueryReturnType<TData, TRequestBody> returnData = (isFetching: isFetching, isLoading: isLoading, errorMessage: errorMessage, data: data, fetchAsync: fetchAsync);
    queryStore[cacheKey] = returnData;
    return returnData;
  }
}
