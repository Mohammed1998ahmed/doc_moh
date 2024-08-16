import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/consultation/consultation.dart';
import 'package:doctor/consultation/model/RedyConsulation.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'postreply_state.dart';

class PostreplyCubit extends Cubit<PostreplyState> {
  PostreplyCubit() : super(PostreplyInitial());
  static PostreplyCubit getObject(context) => BlocProvider.of(context);
  RedyConsulationModel? redyConsulationModel;
  void postReply(
      {required int Consulation_ID,
      required String replyConsultation,
      required BuildContext context}) {
    print(replyConsultation + "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
    print(Consulation_ID.toString() + "SSSSSSSSSSSSSSSSSSSSSSSSSSSS");

    emit(PostreplyLoading());
    FormData formData = FormData.fromMap({'reply_content': replyConsultation});
    DioHelper.postData("replyConsultation_D/${Consulation_ID}",
            data: formData, token: CachShpreafapp.getdata(key: "tokenProfile"))
        .then((value) {
      redyConsulationModel = RedyConsulationModel.fromJson(value.data);
      print(redyConsulationModel!.message.toString() +
          "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
      if (redyConsulationModel!.status == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ConsultationDoctor(),
          ),
        );
      }
      emit(PostreplySesseccfluy());
    }).catchError((onError) {
      emit(PostreplyError());
    });
  }
}
