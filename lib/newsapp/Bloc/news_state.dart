part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class BottomNav extends NewsState {}

class NewsGetLoadingBusinessSuccessState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsGetScienceSuccessState extends NewsState {}

class NewsGetnextScienceSuccessState extends NewsState {}

class NewsGetSportsSuccessState extends NewsState {}

class NewsGettechnologySuccessState extends NewsState {}

class NewsGetBusinessErorrState extends NewsState {
  final String error;
  NewsGetBusinessErorrState(this.error);
}

class NewsGettechnologyErorrState extends NewsState {
  final String error;

  NewsGettechnologyErorrState(this.error);
}

class NewsGetSportsErorrState extends NewsState {
  final String error;
  NewsGetSportsErorrState(this.error);
}

class NewsGetScienceErorrState extends NewsState {
  final String error;
  NewsGetScienceErorrState(this.error);
}

class changemod extends NewsState {}

class changecountry extends NewsState {}

class getdataEGstate extends NewsState {}

class getdatausstate extends NewsState {}

class getSerachedItemstateloading extends NewsState {}

class getSerachedItemstate extends NewsState {}

class getSerachedItemsErorrrtate extends NewsState {}
