import 'package:flutter/foundation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutternews/app/models/news.dart';

import '../repository/news_repository.dart';

class NewsProvider with ChangeNotifier {
  String? _countryCode;
  List<Article> _newsList = [];
  bool _isLoading = false;
  final NewsRepository _newsRepository = NewsRepository();

  bool get isLoading => _isLoading;
  List<Article> get newsList => _newsList;

  // Fetch the current country code from Remote Config
  Future<void> fetchRemoteConfig() async {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setDefaults({'country_code': 'us'});
    await remoteConfig.fetchAndActivate();
    _countryCode = remoteConfig.getString('country_code');
    notifyListeners();
  }

  // Fetch news based on the current country code
  Future<void> fetchNews() async {
    if (_countryCode == null) {
      await fetchRemoteConfig();
    }

    _isLoading = true;
    notifyListeners();

    try {
      _newsList = await _newsRepository.fetchNews(_countryCode ?? 'us');
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error fetching news: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Set a new country code, update Firebase Remote Config, and fetch news
  Future<void> setCountry(String newCountry) async {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setDefaults({'country_code': newCountry});
    await remoteConfig.fetchAndActivate();

    _countryCode = newCountry;
    notifyListeners();
    await fetchNews();
  }
}
