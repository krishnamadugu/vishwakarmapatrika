part of 'other_profile_bloc.dart';

sealed class OtherProfileEvent {}

final class OtherProfileGetDataEvent extends OtherProfileEvent {
  String loggedUserId;
  String otherUserId;

  OtherProfileGetDataEvent({
    required this.loggedUserId,
    required this.otherUserId,
  });
}
