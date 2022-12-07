import 'package:masterclass_api/app/models/anime_model.dart';

abstract class HomeState {
  const HomeState();
}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<AnimeModel> listModel;

  SuccessHomeState(this.listModel);
}

class ErrorHomeState extends HomeState {
  final String message;
  const ErrorHomeState(this.message);
}
