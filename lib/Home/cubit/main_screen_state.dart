part of 'main_screen_cubit.dart';

@immutable
sealed class MainScreenState {}

/////////////////////
final class MainScreenInitial extends MainScreenState {}

final class MainScreenLoadingSearch extends MainScreenState {}

final class MainScreenSececcfullySearch extends MainScreenState {}

final class MainScreenErrorSearch extends MainScreenState {}

//////////////
final class MainScreenChaingLoadingSearch extends MainScreenState {}

final class MainScreenChaingBoolean extends MainScreenState {}

final class MainScreenChaingIndex extends MainScreenState {}

final class MainScreenConfigPusheTrinner extends MainScreenState {}

final class MainScreenConfigPusheTrinnerEvent extends MainScreenState {}
