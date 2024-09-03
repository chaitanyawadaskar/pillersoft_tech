import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import '../../utilities/constant/constant.dart';
import '../local_database/shared_pref.dart';
import 'custom_exception.dart';

class ApiProvider {
  Future<dynamic> get({String? url, Map<String, dynamic>? map}) async {
    var token = await getUserToken();
    var mapHeader = <String, String>{};
    mapHeader['Authorization'] = 'Bearer $token';
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url!, map)
          : Uri.http(baseUrl, pathExtender + url!, map);

      final response = await http.get(uri, headers: mapHeader).timeout(
            const Duration(seconds: 15),
          );
      log('url: $uri,\npayload: $map,\nstatus-code :${response.statusCode},\nresponse: ${response.body.toString()}');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw GeneralError('Taking too much time to complete the request');
    }
    return responseJson;
  }

  Future<dynamic> post({
    String? url,
    Map<String, dynamic>? map,
  }) async {
    var token = await getUserToken();
    var mapHeader = <String, String>{};
    if (token.isNotEmpty) {
      mapHeader['Authorization'] = 'Bearer $token';
    }
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url!)
          : Uri.http(baseUrl, pathExtender + url!);
      print(uri);
      final response = await http
          .post(uri,
              // headers: mapHeader,
              body: map)
          .timeout(
            const Duration(seconds: 15),
          );

      log('url: $uri,\npayload: $map,\nstatus-code :${response.statusCode},\nresponse: ${response.body.toString()}');

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw GeneralError('Taking too much time to complete the request');
    }
    return responseJson;
  }

  Future<dynamic> put({
    String? url,
    Map<String, dynamic>? map,
  }) async {
    var token = await getUserToken();
    var mapHeader = <String, String>{};
    if (token.isNotEmpty) {
      mapHeader['Authorization'] = 'Bearer $token';
    }
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url!)
          : Uri.http(baseUrl, pathExtender + url!);

      final response =
          await http.put(uri, headers: mapHeader, body: map).timeout(
                const Duration(seconds: 15),
              );

      log('url: $uri,\npayload: $map,\nstatus-code:${response.statusCode},\nresponse: ${response.body.toString()}');

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete({String url = '', Map<String, dynamic>? map}) async {
    var token = await getUserToken();

    var mapHeader = <String, String>{};
    mapHeader['Accept'] = "application/json";
    mapHeader['Authorization'] = 'Bearer $token';

    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url)
          : Uri.http(baseUrl, pathExtender + url);

      final response = await http.delete(uri, body: map, headers: mapHeader);
      log('url: $uri,\ndata: $map,\nstatus-code:${response.statusCode},\nresponse: ${response.body.toString()}');

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> putFormData({
    String url = '',
    fileKey,
    Map<String, String>? map,
    File? file,
  }) async {
    var token = await getUserToken();

    var mapHeader = <String, String>{};
    mapHeader['Authorization'] = 'Bearer $token';
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url)
          : Uri.http(baseUrl, pathExtender + url);
      var request = http.MultipartRequest("PUT", uri);
      request.headers.addAll(mapHeader);
      request.fields.addAll(map!);

      if (file != null) {
        request.files.add(http.MultipartFile.fromBytes(
            fileKey, await file.readAsBytes(),
            filename: file.path));
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = _response(res);
      log('url: $uri,\ndata: $map,\Image :$file, \nstatus-code :${response.statusCode},\nresponse: ${res.body.toString()}');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postFormData({
    String url = '',
    imageKey,
    Map<String, String>? map,
    File? image,
  }) async {
    var token = await getUserToken();

    var mapHeader = <String, String>{};
    mapHeader['Authorization'] = 'Bearer $token';
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url)
          : Uri.http(baseUrl, pathExtender + url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(mapHeader);
      request.fields.addAll(map!);

      if (image != null) {
        request.files.add(http.MultipartFile.fromBytes(
            imageKey, await image.readAsBytes(),
            filename: image.path));
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = _response(res);
      log('url: $uri,\npayload: $map,\Image :$image, \nstatus-code :${response.statusCode},\nresponse: ${res.body.toString()}');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postDoubleFormData(
      {String url = '',
      imageKey,
      listImageKey,
      Map<String, String>? map,
      File? image,
      List<File>? imageList}) async {
    var token = await getUserToken();

    var mapHeader = <String, String>{};
    mapHeader['Authorization'] = 'Bearer $token';
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url)
          : Uri.http(baseUrl, pathExtender + url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(mapHeader);
      request.fields.addAll(map!);

      if (image != null) {
        request.files.add(http.MultipartFile.fromBytes(
            imageKey, await image.readAsBytes(),
            filename: image.path));
      }
      if (imageList != null && imageList.isNotEmpty) {
        for (var photo in imageList) {
          var stream = http.ByteStream(photo.openRead());
          var length = await photo.length();
          var multipartFile = http.MultipartFile(
            listImageKey,
            stream,
            length,
            filename: photo.path,
          );
          request.files.add(multipartFile);
        }
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = _response(res);
      log('url: $uri,\ndata: $map,\nImageList :$imageList, \nstatus-code :${response.statusCode},\nresponse: ${res.body.toString()}');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postTripleFormData(
      {String url = '',
      imageKey,
      imageKey2,
      listImageKey,
      Map<String, String>? map,
      File? image,
      File? image2,
      List<File>? imageList}) async {
    var token = await getUserToken();

    var mapHeader = <String, String>{};
    mapHeader['Authorization'] = 'Bearer $token';
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, pathExtender + url)
          : Uri.http(baseUrl, pathExtender + url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(mapHeader);
      request.fields.addAll(map!);

      if (image != null) {
        request.files.add(http.MultipartFile.fromBytes(
            imageKey, await image.readAsBytes(),
            filename: image.path));
      }
      if (image2 != null) {
        request.files.add(http.MultipartFile.fromBytes(
            imageKey2, await image2.readAsBytes(),
            filename: image2.path));
      }
      if (imageList != null && imageList.isNotEmpty) {
        for (var photo in imageList) {
          var stream = http.ByteStream(photo.openRead());
          var length = await photo.length();
          var multipartFile = http.MultipartFile(
            '$listImageKey[${imageList.indexOf(photo)}]',
            stream,
            length,
            filename: photo.path,
          );
          request.files.add(multipartFile);
        }
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      log('key1: $imageKey,\nkey2: $imageKey2,\nkey3: $listImageKey,');
      log('url: $uri,\ndata: $map,\nImageList :$imageList,\nImageSeller :$image,\nImagePurchaser :$image2, \nstatus-code :${response.statusCode},\nresponse: ${res.body.toString()}');
      responseJson = _response(res);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postFormData2(
      {String? url, Map<String, String>? map, String? key, File? file}) async {
    var mapHeader = <String, String>{};
    var token = await getUserToken();
    mapHeader['Authorization'] = 'Bearer $token';
    mapHeader['Accept'] = "application/json";
    var responseJson;
    try {
      var uri =
          isProduction ? Uri.https(baseUrl, url!) : Uri.http(baseUrl, url!);
      var request = http.MultipartRequest("Put", uri);
      request.headers.addAll(mapHeader);
      request.fields.addAll(map!);

      if (file != null) {
        request.files.add(http.MultipartFile.fromBytes(
            key!, await file.readAsBytes(),
            filename: file.path));
      }

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      responseJson = json.decode(res.body);
      print("response: $uri $url - $map ${res.body}");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

//multiple map uploading
  Future<dynamic> postForm(
      String url, Map<String, String> map, Map<String, File> files) async {
    var mapHeader = <String, String>{};
    mapHeader['Accept'] = "application/json";
    // mapHeader['Authorization'] = await getToken();
    var responseJson;
    try {
      var uri = isProduction
          ? Uri.https(baseUrl, url, map)
          : Uri.http(baseUrl, url, map);
      print("request: $uri $url - $mapHeader");
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(mapHeader);
      request.fields.addAll(map);
      await Future.forEach(files.keys, (item) async {
        List<int> data = await files[item]!.readAsBytes();
        request.files.add(http.MultipartFile.fromBytes(item.toString(), data,
            filename: files[item]!.path.split("/").last));
      });

      var response = await request.send();

      print(response.statusCode);
      final res = await http.Response.fromStream(response);
      print(res.body);
      responseJson = json.decode(res.body);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      case 302:
        throw InvalidInputException(response.body.toString());
      case 404:
        throw InvalidInputException(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 202:
        throw BadRequestException(response.body.toString());
      case 503:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
