import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghp_app/application/news/news_bloc.dart';
import '../../../injection.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: themeData.colorScheme.secondary))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Michael",
                    style: themeData.textTheme.bodyText2!
                        .copyWith(color: themeData.colorScheme.secondary),
                  ),
                  Text(
                    "Testeintrag",
                    style: themeData.textTheme.headline2!
                        .copyWith(color: themeData.colorScheme.secondary),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "01.01.2022",
                    style: themeData.textTheme.bodyText2!
                        .copyWith(color: themeData.colorScheme.secondary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
