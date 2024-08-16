part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSceccfully extends ChatState {}

final class ChatError extends ChatState {}

final class ChatShimmer extends ChatState {}

final class ChatGetLoading extends ChatState {}

final class ChatGetSceccfully extends ChatState {}

final class ChatGetError extends ChatState {}

final class ChatGetListLoading extends ChatState {}

final class ChatGetListSceccfully extends ChatState {}

final class ChatGetListError extends ChatState {}

final class ChatGetSceccfullyPUsher extends ChatState {}

final class ChatGetIsReadLoading extends ChatState {}

final class ChatGetIsReadSceccfully extends ChatState {}

final class ChatGetIsReadError extends ChatState {}

final class ChatGetIsReadLoadingD extends ChatState {}

final class ChatGetIsReadSceccfullyD extends ChatState {}

final class ChatGetIsReadErrorD extends ChatState {}
