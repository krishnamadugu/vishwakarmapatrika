import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/other_user_profile_repo.dart';

part 'other_profile_event.dart';
part 'other_profile_state.dart';

class OtherProfileBloc extends Bloc<OtherProfileEvent, OtherProfileState> {
  final OtherUserProfileRepository otherUserProfileRepository;
  OtherProfileBloc({required this.otherUserProfileRepository})
      : super(OtherProfileInitialState()) {}
}
