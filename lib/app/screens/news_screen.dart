import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
      appBar: AppBar(title: Text('News')),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (newsProvider.newsList.isNotEmpty) {
            return ListView.builder(
              itemCount: newsProvider.newsList.length,
              itemBuilder: (context, index) {
                final article = newsProvider.newsList[index];
                return ListTile(
                  title: Text(article.title ?? ''),
                  subtitle: Text(article.description ?? ''),
                );
              },
            );
          } else {
            return Center(child: Text('No news found'));
          }
        },
      ),
    );
  }
}
