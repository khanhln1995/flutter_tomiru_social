import 'dart:convert'; // For JSON encoding and decoding
import 'package:tomiru_social_flutter/api/api_checker.dart'; // Custom API checker
import 'package:file_picker/file_picker.dart'; // File picker for selecting files
import 'package:flutter/foundation.dart'; // For debugging purposes
import 'package:get/get_connect/http/src/request/request.dart'; // For HTTP requests
import 'package:http_parser/http_parser.dart'; // For handling HTTP multipart/form-data
import 'dart:io'; // For File operations
// import 'package:tomiru_social_flutter/features/address/domain/models/address_model.dart'; // Address model
import 'package:tomiru_social_flutter/util/app_constants.dart'; // App constants
import 'package:get/get.dart'; // GetX for state management
import 'package:image_picker/image_picker.dart'; // Image picker for selecting images
import 'package:shared_preferences/shared_preferences.dart'; // For storing data locally
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:path/path.dart'; // For manipulating file paths
import 'package:flutter/foundation.dart'
    as foundation; // Additional foundation for web compatibility

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;
  // final int timeoutInSeconds = 3;

  String? token;
  // late Map<String, String> _mainHeaders;
  Map<String, String>? _mainHeaders;
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.jwtToken);
    if (kDebugMode) {}
    updateHeader(
      token,
    );
  }

// Method to update headers
  Map<String, String> updateHeader(String? token, {bool setHeader = true}) {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      // Other headers can be added here, like language code or other app-specific data
    };

    // Only add the Authorization header if the token is not null

    if (token != null && token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }

    if (setHeader) {
      _mainHeaders = header;
    }

    return header;
  }

  // Method to perform a GET request
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      bool handleError = true,
      bool showToaster = false}) async {
    try {
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Call: $appBaseUrl');
      }
      http.Response response = await http
          .get(
            Uri.parse(appBaseUrl + uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError,
          showToaster: showToaster);
    } catch (e) {
      if (kDebugMode) {
        print('----------------${e.toString()}');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Method to perform a POST request
  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body + $uri');
        debugPrint('====> API Call:($headers)\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body');
        // debugPrint('====> API Call:($headers)\nHeader: $_mainHeaders');
      }
      http.Response response = await http
          .post(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      // print(response);
      // print("response");
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Method to perform a multipart POST request
  Future<Response> postMultipartData(String uri, Map<String, String> body,
      List<MultipartBody> multipartBody, List<MultipartDocument> otherFile,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      // debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      // debugPrint(
      //     '====> API Body: $body with ${multipartBody.length} and multipart ${otherFile.length}');
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? _mainHeaders ?? {});
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          if (foundation.kIsWeb) {
            Uint8List list = await multipart.file!.readAsBytes();
            http.MultipartFile part = http.MultipartFile(
              multipart.key,
              multipart.file!.readAsBytes().asStream(),
              list.length,
              filename: basename(multipart.file!.path),
              contentType: MediaType('image', 'jpg'),
            );
            request.files.add(part);
          } else {
            File file = File(multipart.file!.path.toString());
            request.files.add(http.MultipartFile(
              multipart.key,
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split('/').last,
            ));
          }
        }
      }

      if (otherFile.isNotEmpty) {
        for (MultipartDocument file in otherFile) {
          if (foundation.kIsWeb) {
            request.files.add(http.MultipartFile(file.key,
                file.file!.files.first.readStream!, file.file!.files.first.size,
                filename: basename(file.file!.files.first.name)));
          } else {
            File other = File(file.file!.files.single.path!);
            Uint8List list0 = await other.readAsBytes();
            var part = http.MultipartFile(
                file.key, other.readAsBytes().asStream(), list0.length,
                filename: basename(other.path));
            request.files.add(part);
          }
        }
      }

      request.fields.addAll(body);
      http.Response response =
          await http.Response.fromStream(await request.send());
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Method to perform a PUT request
  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        // debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        // debugPrint('====> API Body: $body');
      }
      http.Response response = await http
          .put(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Method to perform a DELETE request
  Future<Response> deleteData(String uri,
      {Map<String, String>? headers, bool handleError = true}) async {
    try {
      if (kDebugMode) {
        // debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http
          .delete(
            Uri.parse(appBaseUrl + uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri, handleError);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Method to handle the response from the server
  Response handleResponse(http.Response response, String uri, bool handleError,
      {bool showToaster = false}) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: errorResponse.errors![0].message);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.body['message']);
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = Response(statusCode: 0, statusText: noInternetMessage);
    }
    if (kDebugMode) {
      debugPrint(
          '====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
    }
    if (handleError) {
      if (response0.statusCode == 200 || response0.statusCode == 201) {
        return response0;
      } else {
        ApiChecker.checkApi(response0, showToaster: showToaster);
        return response0;
      }
    } else {
      return response0;
    }
  }
}

// Model for multipart file body
class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}

// Model for multipart document
class MultipartDocument {
  String key;
  FilePickerResult? file;
  MultipartDocument(this.key, this.file);
}

// Error response model
class ErrorResponse {
  List<Errors>? _errors;

  List<Errors>? get errors => _errors;

  ErrorResponse({List<Errors>? errors}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    if (json["errors"] != null) {
      _errors = [];
      json["errors"].forEach((v) {
        _errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_errors != null) {
      map["errors"] = _errors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

// Model for individual error
class Errors {
  String? _code;
  String? _message;

  String? get code => _code;
  String? get message => _message;

  Errors({String? code, String? message}) {
    _code = code;
    _message = message;
  }

  Errors.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }
}
