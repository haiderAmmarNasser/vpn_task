import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:vpn_task/core/class/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:vpn_task/core/class/status_classes.dart';
import 'package:vpn_task/core/constances/app_keys.dart';
import 'package:vpn_task/core/services/services.dart';

class Crud {
  Future<Either<StatusClasses, String>> postData(String uri, Map body,
      Map<String, String> headers, bool tosaveToken) async {
    try {
      if (await CheckInternet() == true) {
        var Url = Uri.parse(uri);
        var respnce = await http.post(Url, body: body, headers: headers);
        print('status code');
        print(respnce.statusCode);
        var decodedResponce = json.decode(respnce.body);
        print("qqqq");
        print(respnce.statusCode);
        print("1");
        if (respnce.statusCode == 200 || respnce.statusCode == 201) {
          if (tosaveToken == true) {
            var token = decodedResponce['data']['access_token'];
            print('this is token from api');
            print(token);
            await MyServices().saveStringValue(AppKeys.storeTokenKey, token);
            await MyServices().setConstantToken();
          }
          print("2");
          print('succes');
          return Left(StatusClasses.success);
        } else {
          print("3");
          var message = decodedResponce['message'];
          return Right(message);
        }
      } else {
        print("4");
        return Left(StatusClasses.offlineError);
      }
    } on HttpException catch (e) {
      print("5");
      return Left(StatusClasses.serverError);
    } catch (e) {
      return Left(StatusClasses.serverError);
    }
  }

  Future<Either<StatusClasses, String>> getData(
      String uri, Map<String, String>? headers) async {
    print("get data");
    try {
      if (await CheckInternet() == true) {
        print("1");
        var responce = await http.get(Uri.parse(uri), headers: headers);
        print("2");
        var respnceBpdy = responce.body;
        print(responce.statusCode);
        print("3");
        if (responce.statusCode == 200 || responce == 201) {
          print("here");
          return Right(respnceBpdy);
        } else {
          print("4");
          return Left(StatusClasses.serverError);
        }
      } else {
        print("5");
        return Left(StatusClasses.offlineError);
      }
    } catch (e) {
      print("6");
      return Left(StatusClasses.anotherError);
    }
  }
    Future<Either<StatusClasses, String>> delete(String uri, Map body,
      Map<String, String> headers, bool tosaveToken) async {
    try {
      if (await CheckInternet() == true) {
        var Url = Uri.parse(uri);
        var respnce = await http.post(Url, body: body, headers: headers);
        print('status code');
        print(respnce.statusCode);
        print("aaaa");
        var decodedResponce = json.decode(respnce.body);
        print("qqqq");
        print(respnce.statusCode);
        print("1");
        if (respnce.statusCode == 200 || respnce.statusCode == 201) {
          if (tosaveToken == true) {
            var token = decodedResponce['data']['access_token'];
            print('this is token from api');
            print(token);
            await MyServices().saveStringValue(AppKeys.storeTokenKey, token);
            await MyServices().setConstantToken();
          }
          print("2");
          print('succes');
          return Left(StatusClasses.success);
        } else {
          print("3");
          var message = decodedResponce['message'];
          return Right(message);
        }
      } else {
        print("4");
        return Left(StatusClasses.offlineError);
      }
    } on HttpException catch (e) {
      print("5");
      return Left(StatusClasses.serverError);
    } catch (e) {
      return Left(StatusClasses.serverError);
    }
  }
}
