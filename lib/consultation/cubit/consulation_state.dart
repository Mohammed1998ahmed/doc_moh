part of 'consulation_cubit.dart';

@immutable
sealed class ConsulationState {}

final class ConsulationInitial extends ConsulationState {}

final class ConsulationLoading extends ConsulationState {}

final class ConsulationSesseccfluy extends ConsulationState {}

final class ConsulationError extends ConsulationState {}
