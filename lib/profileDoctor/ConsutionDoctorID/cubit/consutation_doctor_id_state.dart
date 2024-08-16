part of 'consutation_doctor_id_cubit.dart';

@immutable
sealed class ConsutationDoctorIdState {}

final class ConsutationDoctorIdInitial extends ConsutationDoctorIdState {}

final class ConsutationDoctorLoading extends ConsutationDoctorIdState {}

final class ConsutationDoctorSeccessfluy extends ConsutationDoctorIdState {}

final class ConsutationDoctorError extends ConsutationDoctorIdState {}
