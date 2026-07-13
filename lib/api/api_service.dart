import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news_model.dart';

class ApiService {
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=79107a9e2db64247952fb28b8e8d3184
  static String baseUrl = "newsapi.org";
  static String endPoint = "/v2/everything";
  static Map<String, String> parameters = {
    'q': 'bitcoin',
    'apiKey': '79107a9e2db64247952fb28b8e8d3184',
  };
  static Future<NewsModel> getData() async {
    Uri url = Uri.https(baseUrl, endPoint, parameters);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsModel.fromJson(json);
  }
}
