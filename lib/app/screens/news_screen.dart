import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/helpers/is_dark_theme_helper.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  String _currentSelectedCountry = 'us';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MyNews',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorPalettes.white,
                fontSize: 16,
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (String newCountry) {
                setState(() {
                  _currentSelectedCountry = newCountry;
                });
                Provider.of<NewsProvider>(context, listen: false)
                    .setCountry(newCountry);
              },
              itemBuilder: (BuildContext context) {
                return <String>['us', 'uk', 'ca', 'in'].map((String country) {
                  return PopupMenuItem<String>(
                    value: country,
                    child: Text('Country: $country'.toUpperCase()),
                  );
                }).toList();
              },
              iconSize: 40,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/navigation.png"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    _currentSelectedCountry.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalettes.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 28,
            ),
            Text(
              'Top Headlines',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.isDarkMode ? ColorPalettes.white : Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Consumer<NewsProvider>(
                builder: (context, newsProvider, child) {
                  if (newsProvider.isLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  } else if (newsProvider.newsList.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsProvider.newsList.length,
                      itemBuilder: (context, index) {
                        final article = newsProvider.newsList[index];
                        return article.title == '[Removed]'
                            ? const SizedBox.shrink()
                            : NewsCard(
                                newsTitle: article.title ?? '',
                                newsDescription: article.description ?? '',
                                imageURL: article.urlToImage ?? '',
                                publishedAt: article.publishedAt,
                              );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No news found'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
