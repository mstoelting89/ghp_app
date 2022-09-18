part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {}

class NewsLoadedState extends NewsState {}
