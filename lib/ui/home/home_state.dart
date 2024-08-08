abstract class HomeState {}

class InitialState extends HomeState {}

class LoadingHome extends HomeState {}

class ErrorHome extends HomeState {}

class SuccessHome extends HomeState {
  final String homeResponse;

  SuccessHome(this.homeResponse);
}
