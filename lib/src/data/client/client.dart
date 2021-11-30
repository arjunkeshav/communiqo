import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';


class ApiClient {
  ApiClient() {
    initClient();
  }

   late Dio dio;

   late BaseOptions _baseOptions;

  String username= 'admin@finekube.com';
  // live
  String password = 'SA537KEDx3o2M4544O6Xh78wkgxOSH9a';
  // dev
  String passwordDev = 'w4M2099455l9k9Vy6l4PA136Y62l05lX';

  /// client production
  initClient() async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('$username:$password'));
    _baseOptions = new BaseOptions(
        // baseUrl: UrlsMyg.baseUrlMyg,
        connectTimeout: 30000,
        receiveTimeout: 1000000,
        followRedirects: true,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          "authorization": basicAuth
        },
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true);

    dio = Dio(_baseOptions);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (reqOptions,handler) {
        return handler.next(reqOptions);
      },
      onError: (DioError dioError,handler) {
        return handler.next(dioError);
      },
    ));
  }




  // /// All categories
  // Future<Response> getProductList() {
  //   String username = 'admin@finekube.com';
  //   String password = 'w4M2099455l9k9Vy6l4PA136Y62l05lX';
  //   String basicAuth =
  //       'Basic ' + base64Encode(utf8.encode('$username:$password'));
  //      dio.options.headers
  //      .addAll({"authorization": basicAuth});
  //
  //   return dio.get(Urls.PRODUCT_LIST);
  // }







}