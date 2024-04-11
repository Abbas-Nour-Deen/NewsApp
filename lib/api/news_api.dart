import 'package:get/get.dart';

class NewsApi extends GetConnect implements GetxService {
  final String appBasUrl;
  late Map<String, String> _mainHeaders;

  NewsApi({required this.appBasUrl}) {
    baseUrl = appBasUrl;
    timeout = const Duration(seconds: 30);
    maxAuthRetries = 50;
    _mainHeaders = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> fetchlatestNews({required String endpoint}) async {
    try {
      Response response = await get(endpoint, headers: _mainHeaders);
      return response;
    } catch (e) {
      print("error getting news ${e.toString()}");
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
