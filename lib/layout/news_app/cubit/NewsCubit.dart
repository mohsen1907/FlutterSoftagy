import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/layout/news_app/cubit/NewsStates.dart';
import 'package:testing_app/modules/business/business_screen.dart';
import 'package:testing_app/modules/science/science_screen.dart';
import 'package:testing_app/modules/settings_screen/settings_screen.dart';
import 'package:testing_app/modules/sports/sports_screen.dart';
import 'package:testing_app/shared/cubit/cubit.dart';
import 'package:testing_app/shared/network/local/cache_helper.dart';
import 'package:testing_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_sharp),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  void changeBottomNavigationBar(int index) {
    currentIndex = index;
    switch(index){
      case 0: getBusiness();
      break;
      case 1: getSports();
      break;
      case 2: getScience();
    }
    emit(NewsBottomNavigationState());
  }
  //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=246dfd9723ca4a79a0bbed94b29e5af6#

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());
    if(business.length==0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        "country": "us",
        "category": "business",
        "apiKey": "246dfd9723ca4a79a0bbed94b29e5af6",
      }).then((value) {
        // print(value.data.toString());
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((onError) {
        print(onError);
        emit(NewsGetBusinessErrorState(onError.toString()));
      });
    }
  }

  List sports = [];
  void getSports() {
    emit(NewsSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "246dfd9723ca4a79a0bbed94b29e5af6",
      }).then((value) {
        print(value.data.toString());
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        print(onError);
        emit(NewsGetSportsErrorState(onError.toString()));
      });
    }else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        "country": "us",
        "category": "science",
        "apiKey": "246dfd9723ca4a79a0bbed94b29e5af6",
      }).then((value) {
        print(value.data.toString());
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((onError) {
        print(onError);
        emit(NewsGetScienceErrorState(onError.toString()));
      });
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything', query: {
      "q": "$value",
      "apiKey": "246dfd9723ca4a79a0bbed94b29e5af6",
    }).then((value) {
      print(value.data.toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(NewsGetSearchErrorState(onError.toString()));
    });

  }


  bool isDark = false;

  Future darkMode({bool? fromShared}) async {
    isDark = !isDark;
    CacheHelper.putBoolean(key: "isDark", value: isDark)
        .then((value) => {emit(NewsDarkModeState())});
  }
  Future getDarkMode() async{
  isDark = CacheHelper.getBoolean(key: "isDark") ?? false;
  emit(NewsGetDarkModeState());
  }
}
