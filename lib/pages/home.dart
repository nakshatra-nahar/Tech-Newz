import 'package:flutter/material.dart';
import 'package:technewz/backend/function.dart';
import 'package:technewz/components/appBar.dart';
import 'package:technewz/components/newsBox.dart';
import 'package:technewz/components/searchBar.dart';
import 'package:technewz/utils/colors.dart';
import '../utils/constant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Container(
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return newsBox(
                            imageurl:
                                snapshot.data![index]['urlToImage'] != null
                                    ? snapshot.data![index]['urlToImage']
                                    : Constants.imageurl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'].toString(),
                            url: Uri.parse(snapshot.data![index]['url']));
                      },
                    );
                  } else {}
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
