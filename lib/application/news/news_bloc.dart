import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      print("FooBar1");
      emit(NewsLoadingState());
      print("FooBar");
      newsRepository.getNewsEntries();
      // emit(NewsLoadedState()); or ErrorState
    });
  }
}
