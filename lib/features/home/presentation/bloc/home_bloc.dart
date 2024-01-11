import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/home/data/repos/home_repo.dart';
import 'package:vishwakarmapatrika/features/home/model/get_all_profiles_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitialState()) {
    on<HomeGetAllProfilesEvent>(_getAllProfiles);
  }

  void _getAllProfiles(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      final allProfilesData = await homeRepository.getAllProfilesData();
      emit(HomeSuccessState(getAllProfilesModel: allProfilesData));
    } catch (e) {
      emit(HomeFailureState(errorMsg: e.toString()));
    }
  }
}
