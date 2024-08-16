import 'package:bloc/bloc.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/consultation/model/consulationModel.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'consulation_state.dart';

class ConsulationCubit extends Cubit<ConsulationState> {
  ConsulationCubit() : super(ConsulationInitial());
  static ConsulationCubit getObject(context) => BlocProvider.of(context);
  GetConsultationModel? getConsultationModel;
  void getConsultations() {
    emit(ConsulationLoading());
    DioHelper.getDataClub(
            endpoint: "allUnansweredConsultation_D",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      print(value.data.toString() + "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      getConsultationModel = GetConsultationModel.fromJson(value.data);
      emit(ConsulationSesseccfluy());
    }).catchError((onError) {
      print(onError.toString() +
          "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
      emit(ConsulationError());
    });
  }
}
