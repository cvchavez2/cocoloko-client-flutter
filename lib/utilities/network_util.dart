import 'package:cocoloko/models/beverage.dart';
import 'package:cocoloko/utilities/response_parser.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  Future<List<Beverage>> get() async {
    var response = await http.get("http://10.0.2.2:8080/api/Beverage/");
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      print("server connection failed. status code: " + statusCode.toString());
      return null;
    }
    return responseParser.parseBeverageList(response.body);
  }

  Future<Beverage> getById(int id) async {
    var response = await http.get("http://10.0.2.2:8080/api/Beverage/${id}");
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      print("server connection failed. status code: " + statusCode.toString());
      return null;
    }
    return responseParser.parseBeverageResponse(response.body);
  }
}
