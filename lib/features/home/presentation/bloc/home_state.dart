part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final GetAllProfilesModel getAllProfilesModel;
  HomeSuccessState({required this.getAllProfilesModel});
}

final class HomeFailureState extends HomeState {
  final String errorMsg;
  HomeFailureState({required this.errorMsg});
}
