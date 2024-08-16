import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'http://student.valuxapps.com/api/',
        baseUrl: 'http://auction.techno-systems.online/api/',

        receiveDataWhenStatusError: true,
        // قم بتعيين القاعدة الأساسية لآدراج رابط ال API الخاص بك هنا
        headers: {
          // يمكنك إضافة العناوين الرئيسية للطلبات هنا (إن وجدت)
          'Accept': 'application/json',
          // "lang": "ar"
          // 'Authorization': 'Bearer your_token_here',
        },
      ),
    );
  }

  static Future<Response> getDataClub(
      {required String endpoint, required String token}) async {
    try {
      final response = await dio!.get(
        endpoint,
        options: Options(
          headers: {
            'Authorization': "Bearer ${token}",
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> getData(String endpoint) async {
    try {
      final response = await dio!.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> getDataProfile(String endpoint, String token) async {
    try {
      final response = await dio!.get(
        endpoint,
        options: Options(
          headers: {
            'Authorization': "Bearer ${token}",
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> postData(String endpoint,
      {required dynamic data, String? token}) async {
    try {
      final response = await dio!.post(
        endpoint,
        data: data,
        queryParameters: {'Authorization': token},
        options: Options(
          headers: {
            'Authorization': "Bearer ${token}",
          },
        ),
      );
      // print(token.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      return response;
    } catch (e) {
      print(e.toString() +
          "÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷");
      // print(token.toString() +
      //     "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      rethrow;
    }
  }

  // static Future<Response> postData(String endpoint, dynamic data) async {
  //   return await dio!.post(endpoint, data: data);
  // }

  static Future<Response> putData(
      String endpoint, dynamic data, String token) async {
    try {
      final response = await dio!.put(
        endpoint,
        data: data,
        options: Options(
          headers: {
            'Authorization': '$token',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> deleteData(
      {required String endpoint, String? token}) async {
    try {
      final response = await dio!.delete(
        endpoint,
        queryParameters: {'Authorization': token},
        options: Options(
          headers: {
            'Authorization': "Bearer ${token}",
          },
        ),
      );
      print(token.toString() +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      return response;
    } catch (e) {
      print(e.toString());
      print(token.toString() +
          "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      rethrow;
    }
  }
}
