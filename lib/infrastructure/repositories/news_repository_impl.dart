
import 'package:dartz/dartz.dart';
import 'package:ghp_app/domain/entities/news_entity.dart';
import 'package:ghp_app/domain/repositories/news_repository.dart';
import 'package:ghp_app/infrastructure/datasources/news_datasource.dart';

import '../../utils/failures/failure.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDatasource newsDatasource;

  @override
  void getNewsEntries() {
    newsDatasource.getNewsDataFromApi();
  }

  const NewsRepositoryImpl({
    required this.newsDatasource,
  });
}