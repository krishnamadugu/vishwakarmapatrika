import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/other_user_profile_repo.dart';
import '../../model/other_user_profile_model.dart';
part 'other_profile_event.dart';
part 'other_profile_state.dart';

class OtherProfileBloc extends Bloc<OtherProfileEvent, OtherProfileState> {
  final OtherUserProfileRepository otherUserProfileRepository;
  OtherProfileBloc({required this.otherUserProfileRepository})
      : super(OtherProfileInitialState()) {
    on<OtherProfileGetDataEvent>(_getOtherUserProfileData);
  }

  void _getOtherUserProfileData(
      OtherProfileGetDataEvent event, Emitter<OtherProfileState> emit) async {
    try {
      emit(OtherProfileLoadingState());
      final allProfilesData =
          await otherUserProfileRepository.getOtherUserProfileData(
        loggedUserId: event.loggedUserId,
        id: event.otherUserId,
      );
      emit(OtherProfileSuccessState(getOtherUserProfileData: allProfilesData));
    } catch (e) {
      emit(OtherProfileFailureState(errorMsg: e.toString()));
    }
  }
}
