import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghp_app/application/news/news_bloc.dart';
import 'package:ghp_app/presentation/news/widgets/news_item.dart';

import '../../injection.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsBloc = sl<NewsBloc>()..add(NewsInitialEvent());
    return BlocProvider(
      create: (context) => newsBloc,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: ListView(
            children: const [
              NewsItem(),
              NewsItem(),
              NewsItem(),
            ],
          ),
        ),
      ),
    );
  }
}
