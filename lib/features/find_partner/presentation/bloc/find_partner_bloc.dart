import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vishwakarmapatrika/core/constants/app_strings.dart';
import '../../data/repo/find_partner_repo.dart';
import '../../model/get_all_partners_model.dart';

part 'find_partner_event.dart';
part 'find_partner_state.dart';

class FindPartnerBloc extends Bloc<FindPartnerEvent, FindPartnerState> {
  final FindPartnerRepository findPartnerRepository;
  FindPartnerBloc({required this.findPartnerRepository})
      : super(FindPartnerInitialState()) {
    on<FindBridePartnerEvent>(_getRequestedGenderProfiles);
    on<FindGroomPartnerEvent>(_getRequestedGenderProfiles);
  }
  void _getRequestedGenderProfiles(
      FindPartnerEvent event, Emitter<FindPartnerState> emit) async {
    try {
      emit(FindPartnerLoadingState());
      final allProfilesData =
          await findPartnerRepository.getRequiredGenderProfilesData(
              searchingFor: event is FindBridePartnerEvent
                  ? AppStrings.txtBride
                  : AppStrings.txtGroom);
      emit(FindPartnerSuccessState(getAllPartnerDetailsModel: allProfilesData));
    } catch (e) {
      emit(FindPartnerFailureState(errorMsg: e.toString()));
    }
  }
}
