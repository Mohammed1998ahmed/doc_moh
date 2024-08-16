part of 'postreply_cubit.dart';

@immutable
sealed class PostreplyState {}

final class PostreplyInitial extends PostreplyState {}

final class PostreplyLoading extends PostreplyState {}

final class PostreplySesseccfluy extends PostreplyState {}

final class PostreplyError extends PostreplyState {}
