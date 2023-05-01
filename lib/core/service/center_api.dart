import 'package:flutter_marvel_app/core/service/security.dart';
import 'package:flutter_marvel_app/core/service/server_response.dart';
import 'package:flutter_marvel_app/core/utils/app_utils.dart';
import 'package:flutter_marvel_app/core/utils/constants.dart';
import 'package:http/http.dart' as http;

class CenterApi {
  final Security security;
  const CenterApi(this.security);

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
      };

  Future<ServerResponse> get({required String urlSpecific}) async {
    try {
      final hashTimestamp = await security.hashTimestamp();
      final publicKey = await security.publicKey;
      final apiKey = 'apikey=$publicKey';
      final hash = "hash=${hashTimestamp['hash']}";
      final ts = "ts=${hashTimestamp['timestamp']}";

      urlSpecific = '$urlSpecific?$apiKey&$hash&$ts';
      final response =
          await http.get(Uri.parse(urlSpecific), headers: _headers);

      final dataDecode = response.body != ''
          ? AppUtils.instance.getDataDecode(response.body)
          : [];

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ServerResponse(
          isSuccess: true,
          message: "GET Exitoso",
          result: dataDecode,
          statusCode: response.statusCode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
        statusCode: -99,
      );
    }
  }

  String formatError(dynamic error) {
    if (error is Map) {
      if (error.containsKey('message')) return error['message'].toString();
      return 'Error';
    }
    return AppConstant.error;
  }
}
