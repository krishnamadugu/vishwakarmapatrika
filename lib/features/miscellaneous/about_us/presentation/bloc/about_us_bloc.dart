import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/data/repo/about_us_repo.dart';
import 'package:vishwakarmapatrika/features/miscellaneous/about_us/presentation/bloc/about_us_state.dart';
part 'about_us_event.dart';

class AboutBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final AboutUsRepository aboutUsRepository;
  AboutBloc({required this.aboutUsRepository}) : super(AboutUsInitialState()) {
    on<AboutUsCallApiEvent>(_getAboutDataDetails);
  }

  void _getAboutDataDetails(
      AboutUsEvent event, Emitter<AboutUsState> emit) async {
    try {
      emit(AboutUsLoadingState());
      final aboutUsData = await aboutUsRepository.getAboutUsDetails();
      final ourTeamsData = await aboutUsRepository.getOurTeamsDetails();
      emit(AboutUsSuccessState(
          getAboutUsDetails: aboutUsData, getOurTeamDetails: ourTeamsData));
    } catch (e) {
      emit(AboutUsFailureState(errorMsg: e.toString()));
    }
  }
}
