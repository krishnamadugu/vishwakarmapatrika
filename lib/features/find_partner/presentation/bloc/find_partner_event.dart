part of 'find_partner_bloc.dart';

sealed class FindPartnerEvent {}

final class FindGroomPartnerEvent extends FindPartnerEvent {}

final class FindBridePartnerEvent extends FindPartnerEvent {}
