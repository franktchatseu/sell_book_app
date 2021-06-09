
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:seel_book_app/src/logic_app/utils/route.dart';


class PayemntApi {

  PayemntApi() {
  }


  //login endPoint
  Future<dynamic> buy(String phone, String amount) async {
    var data = {
      'phone': phone,
      'amount': amount,
    };
    var dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    return await dio.post(receivedPayementUrl,
        data: data,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status <= 500;
            }));
  }

}