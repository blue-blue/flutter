part of 'main_bloc.dart';

class MainState extends Equatable {
  final Locale locale;

  @override
  List<Object> get props => [locale, count];

  final int count;

  const MainState({this.locale, this.count});

  factory MainState.idle() {
    return const MainState(
      locale: Locale("en"),
      count: 0,
    );
  }

  MainState local({Locale locale}) {
    return MainState(
      locale: locale,
      count: count,
    );
  }

  MainState copy({int count}) {
    return MainState(
      locale: locale,
      count: count,
    );
  }
}
