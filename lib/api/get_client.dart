import 'package:finalyear/api/globals.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://127.0.0.1:8000/api/";

class BaseClient {
  var client = http.Client();
  Future<dynamic> services(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url,headers: headers);

    if (response.statusCode == 200) {
      return response;
    }
  }
}
