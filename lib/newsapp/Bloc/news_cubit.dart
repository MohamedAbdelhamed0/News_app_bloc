import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_bloc/newsapp/network/Local/cache_helper.dart';
import '../network/Remote/Dio_helper.dart';
import '../presentation/pages/Business/BusinessScreen.dart';
import '../presentation/pages/science/scienceScreen.dart';
import '../presentation/pages/sports/sportsScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../presentation/pages/technology.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  //>>>>>>>>>>>>>>>>>>>>>>>>>>DARKMODE<<<<<<<<<<<<<<<<<<<<
  ThemeMode appmode = ThemeMode.dark;
  bool isdark = false;
  void chngemode({bool? Fromshared}) {
    if (Fromshared != null) {
      isdark = Fromshared;
      emit(changemod());
    } else {
      isdark = !isdark;
      CacheHelper.putBoolean(key: 'isdark', value: isdark).then((value) {
        print(isdark.toString());
        emit(changemod());
      });
    }
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>BottomNavigationBarItem<<<<<<<<<<<<<<<<<<<<<<<
  int currentindex = 0;
  List<String> appbartitle = [
    'Business',
    'Science',
    'Sports',
    'Technology',
  ];
  List<Widget> togellscreen = [
    const BusinessScreen(),
    const scienceScreen(),
    const sportsScreen(),
    const technologyScreen(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      label: 'Business',
      activeIcon: Icon(Icons.business_outlined),
      icon: Icon(Icons.business_sharp),
    ),
    const BottomNavigationBarItem(
      label: 'science',
      activeIcon: Icon(Icons.science_outlined),
      icon: Icon(Icons.science),
    ),
    const BottomNavigationBarItem(
      label: 'sports',
      activeIcon: Icon(Icons.sports_baseball),
      icon: Icon(Icons.sports),
    ),
    const BottomNavigationBarItem(
      label: 'technology',
      activeIcon: Icon(Icons.military_tech_outlined),
      icon: Icon(Icons.military_tech),
    ),
  ];
  void bottomnavbar(int index) {
    currentindex = index;
    emit(BottomNav());
  }

  //>>>>>>>>>>>>>>>>>>>>>>Get data from api<<<<<<<<<<<<<<<<<<<<<<<<<<<
  //https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=$apiKey

  List<dynamic> business = [];
  List<dynamic> Science = [];
  List<dynamic> Sports = [];
  List<dynamic> technology = [];
  List<dynamic> search = [];

  bool country = false;
  bool? currentcountry;
  String apiKey = '4455d9d6bd3d42e1b0299041e1ba5349';
  String? currenntcountry;
  //currenntcountry = country ? 'us' : 'ar',
  void changeCountry(context) {
    country = !country;
    Science.clear();
    business.clear();
    Sports.clear();
    technology.clear();
    if (country == false) {
      getdataEG(context);
      emit(getdataEGstate());
    } else {
      getdataEG(context);
      emit(getdatausstate());
    }
    print(country);
    emit(changecountry());
  }
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>EG

  void getegbusiness(context) {
    emit(NewsGetLoadingBusinessSuccessState());
    Dio_helper.getdata(url: 'v2/top-headlines', query: {
      'country': currenntcountry = country ? 'us' : 'eg',
      'category': 'business',
      'apiKey': '$apiKey'
    }).then((value) {
      //print(value!.data['articles'][0]['title']);
      business = value!.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(NewsGetBusinessErorrState(erorr.toString()));
    });
  }

  void getScience() {
    emit(NewsGetLoadingBusinessSuccessState());

    if (Science.length == 0) {
      Dio_helper.getdata(url: 'v2/top-headlines', query: {
        'country': currenntcountry = country ? 'us' : 'eg',
        'category': 'Science',
        'apiKey': '$apiKey'
      }).then((value) {
        //print(value!.data['articles'][0]['title']);
        Science = value!.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsGetSportsErorrState(erorr.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSports() {
    emit(NewsGetLoadingBusinessSuccessState());

    if (Sports.length == 0) {
      Dio_helper.getdata(url: 'v2/top-headlines', query: {
        'country': currenntcountry = country ? 'us' : 'eg',
        'category': 'Sports',
        'apiKey': '$apiKey'
      }).then((value) {
        //print(value!.data['articles'][0]['title']);
        Sports = value!.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsGetSportsErorrState(erorr.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void gettechnology(context) {
    emit(NewsGetLoadingBusinessSuccessState());

    if (technology.length == 0) {
      Dio_helper.getdata(url: 'v2/top-headlines', query: {
        'country': currenntcountry = country ? 'us' : 'eg',
        'category': 'technology',
        'apiKey': '$apiKey'
      }).then((value) {
        //print(value!.data['articles'][0]['title']);
        technology = value!.data['articles'];
        emit(NewsGettechnologySuccessState());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsGettechnologyErorrState(erorr.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>INSERT
  void getdataEG(context) {
    getegbusiness(context);
    gettechnology(context);
    getSports();
    getScience();
    emit(getdataEGstate());
  }

  void changecountrypls(context) {
    getdataEG(context);
    emit(getdataEGstate());
  }

  void getSerachedItem(String value) {
    emit(getSerachedItemstateloading());
    Dio_helper.getdata(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '$apiKey',
    }).then((value) {
      //print(value!.data['articles'][0]['title']);
      search = value!.data['articles'];
      emit(getSerachedItemstate());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(getSerachedItemsErorrrtate());
    });
  }
}
