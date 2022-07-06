part of 'main_bloc.dart';

class MainEvent {
  MainEvent();
}

class AppOpen extends MainEvent {}

class SetLanguage extends MainEvent {
  final Locale locale;
  SetLanguage({this.locale});
}

class CoinEvent extends MainEvent {}

class TestEvent extends MainEvent {
  final int time;

  TestEvent(this.time);
}
