import 'package:bloc/bloc.dart';
import 'package:masterclass_api/app/bloc/home_events.dart';
import 'package:masterclass_api/app/bloc/home_state.dart';

import '../repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final IHomeRepository homeRepository;

  HomeBloc(super.initialState, {required this.homeRepository}) {
    on<GetDataHomeEvents>(_mapGetDataHomeEvent);
  }

  void _mapGetDataHomeEvent(GetDataHomeEvents event, Emitter emitter) async {
    
    emitter(LoadingHomeState);

    try{
    var response = await homeRepository.getAnimes();
    emitter(SuccessHomeState(response));

    }catch(e){
      emitter(ErrorHomeState);  
    }
  }
}
