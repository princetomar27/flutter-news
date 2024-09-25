import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutternews/app/models/news.dart';
import 'package:flutternews/constants/config.dart';

class NewsRepository {
  Future<List<Article>> fetchNews(String countryCode) async {
    String apiKey = AppConfig.newsAPI;
    String url =
        'https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> articlesJson = data['articles'];

        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch news');
      }
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    }
  }
}
