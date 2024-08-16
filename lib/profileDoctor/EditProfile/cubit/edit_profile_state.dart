part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoadingPost extends EditProfileState {}

final class EditProfileSueccufilyPost extends EditProfileState {}

final class EditProfileErrorPost extends EditProfileState {}

final class EditProfileLoadingGet extends EditProfileState {}

final class EditProfileSueccufulyGet extends EditProfileState {}

final class EditProfileErrorGet extends EditProfileState {}
