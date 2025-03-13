import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_cleanarch/core/remote/api_constants.dart';
import 'package:news_cleanarch/model/ArticaleResponse/ArticalesResponse.dart';
import 'package:news_cleanarch/model/sourcesResponse/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse?> getSources(String category) async {
    Uri uri = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': category});
    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticalesResponse> getArticles(String source) async {
    Uri url = Uri.https(
        baseUrl, '/v2/everything', {'apiKey': apiKey, 'sources': source});
    var response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    ArticalesResponse articalesResponse = ArticalesResponse.fromJson(json);
    return articalesResponse;
  }
}
