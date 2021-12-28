abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavigationState extends NewsStates{}

class NewsBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  NewsGetBusinessErrorState(String error);
}

class NewsSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  NewsGetSportsErrorState(String error);
}

class NewsScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  NewsGetScienceErrorState(String error);
}

class NewsDarkModeState extends NewsStates{}

class NewsGetDarkModeState extends NewsStates{}

class NewsSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  NewsGetSearchErrorState(String error);
}