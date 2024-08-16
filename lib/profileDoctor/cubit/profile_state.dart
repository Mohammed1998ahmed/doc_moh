part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingProfile extends ProfileState {}

final class ProfileSuecussfulyProfile extends ProfileState {}

final class ProfileErorrProfile extends ProfileState {}

final class ProfileLogoutLoading extends ProfileState {}

final class ProfileLogoutSceccfuly extends ProfileState {}

final class ProfileLogoutError extends ProfileState {}
