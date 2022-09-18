import 'package:flutter/material.dart';
import 'package:ghp_app/presentation/blog/blog_page.dart';
import 'package:ghp_app/presentation/home/widgets/navigation_icon.dart';
import 'package:ghp_app/presentation/instruments/instrument_page.dart';
import 'package:ghp_app/presentation/news/news_page.dart';
import 'package:ghp_app/presentation/requests/request_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const NewsPage(),
    const RequestPage(),
    const BlogPage(),
    const InstrumentPage()
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          NavigationIcon(
              callback: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              title: "News",
              icon: Icons.newspaper_outlined),
          NavigationIcon(
              callback: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              title: "Anfragen",
              icon: Icons.arrow_circle_down_sharp),
          NavigationIcon(
              callback: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              title: "Blog",
              icon: Icons.text_snippet_outlined),
          NavigationIcon(
              callback: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              title: "Instrumente",
              icon: Icons.music_note_outlined),
        ]),
      ),
    );
  }
}
