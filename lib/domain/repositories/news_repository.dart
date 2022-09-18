

import 'package:dartz/dartz.dart';
import 'package:ghp_app/domain/entities/news_entity.dart';

import '../../utils/failures/failure.dart';

abstract class NewsRepository {
  void getNewsEntries();
}