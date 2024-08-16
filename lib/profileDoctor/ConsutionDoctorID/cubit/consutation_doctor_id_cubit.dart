import 'package:bloc/bloc.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/profileDoctor/model/detailsConsutationModel.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'consutation_doctor_id_state.dart';

class ConsutationDoctorIdCubit extends Cubit<ConsutationDoctorIdState> {
  ConsutationDoctorIdCubit() : super(ConsutationDoctorIdInitial());
  static ConsutationDoctorIdCubit getObject(context) =>
      BlocProvider.of(context);
  DetailsConsutaltionModel? getConsultationModel;
  void getConsultations() {
    emit(ConsutationDoctorLoading());
    DioHelper.getDataClub(
            endpoint:
                "getConsultationByDoctorID_D/${CachShpreafapp.getdata(key: "UserIDD")}",
            token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      // print(value.data.toString() + "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
      getConsultationModel = DetailsConsutaltionModel.fromJson(value.data);
      emit(ConsutationDoctorSeccessfluy());
    }).catchError((onError) {
      print(onError.toString() +
          "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
      emit(ConsutationDoctorError());
    });
  }
}
