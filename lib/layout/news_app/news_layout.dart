import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_app/modules/search/search_screen.dart';
import 'package:testing_app/shared/components/components.dart';
import 'package:testing_app/shared/cubit/cubit.dart';
import 'cubit/NewsCubit.dart';
import 'cubit/NewsStates.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  //base url: https://newsapi.org/
  //method (url): v2/top-headlines
  //queries: country=us&category=business&apiKey=246dfd9723ca4a79a0bbed94b29e5af6

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
              cubit.darkMode();
            },
                  icon: Icon(Icons.brightness_4_outlined))],

          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottomNavigationBar(index);
              print("the index is $index");
            },
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
