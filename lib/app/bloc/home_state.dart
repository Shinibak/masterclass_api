import 'package:masterclass_api/app/models/anime_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<AnimeModel> listModel;

  SuccessHomeState(this.listModel);
}

class ErrorHomeState extends HomeState {}
