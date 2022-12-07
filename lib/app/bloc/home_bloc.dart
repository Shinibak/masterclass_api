import 'package:bloc/bloc.dart';
import 'package:masterclass_api/app/bloc/home_events.dart';
import 'package:masterclass_api/app/bloc/home_state.dart';

import '../repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final IHomeRepository _homeRepository;

  HomeBloc({required IHomeRepository repository})
      : _homeRepository = repository,
        super(InitialHomeState()) {
    on<GetDataHomeEvents>(_mapGetDataHomeEvent);
  }

  void _mapGetDataHomeEvent(
      GetDataHomeEvents event, Emitter<HomeState> emitter) async {
    emitter(LoadingHomeState());

    try {
      var response = await _homeRepository.getAnimes();
      emitter(SuccessHomeState(response));
    } catch (e) {
      emitter(ErrorHomeState(e.toString()));
    }
  }
}
