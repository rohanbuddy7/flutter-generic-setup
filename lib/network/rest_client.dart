
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../utils/common.dart';
import '../utils/nav_key.dart';

part 'rest_client.g.dart';

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    Common.showToast("No internet connection");
    return false; // No internet connection
  } else {
    return true; // Internet connection is available
  }
}

Future<HttpResponse<dynamic>?> checkDioError(
    Future<HttpResponse<dynamic>> apiCall) async {
  try {
    checkInternetConnectivity();
    final response = await apiCall;
    return response;
  } on DioError catch (e) {
    if (e.response?.data != null) {
      print('error: ${e.response?.data}');
    }

    if (e.response?.statusCode == 401) {
      //await getIt<SharedPref>().clearData();
      if (NavKey.navKey.currentContext != null) {
        /*Navigator.pushNamedAndRemoveUntil(
            NavKey.navKey.currentContext!, Routes.landing, (route) => false);*/
      }
      return null;
    }
  }
}

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*@POST(ApiEndPoints.HOME)
  Future<HttpResponse<dynamic>> getHome();
  Or
  Future<HttpResponse<dynamic>> getHome(@Body() Map<String, dynamic> json);*/

}

class NullQueryParamRemoverInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.removeWhere((key, value) => value == null);
    super.onRequest(options, handler);
  }
}
