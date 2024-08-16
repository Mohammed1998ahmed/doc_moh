import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/consultation/cubit/consulation_cubit.dart';
import 'package:doctor/consultation/details/details.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultationDoctor extends StatelessWidget {
  const ConsultationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConsulationCubit()..getConsultations(),
      child: BlocConsumer<ConsulationCubit, ConsulationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = ConsulationCubit.getObject(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Container(),
              title: text(title: "Consultation HealthCare", color: Color4),
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Color0,
                child: cubit.getConsultationModel == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color0),
                                child: Center(
                                    child: text(
                                        title: "${index + 1}", color: Color3)),
                              ), // أيقونة في الجزء الأيسر من العنصر
                              title: text(
                                  title: cubit.getConsultationModel!
                                      .consultation![index].name
                                      .toString(),
                                  color: Color4), // عنوان العنصر
                              subtitle: text(
                                  title: cubit.getConsultationModel!
                                      .consultation![index].sentAt
                                      .toString(),
                                  color: Colors.grey),
                              trailing: Icon(Icons
                                  .arrow_forward), // أيقونة في الجزء الأيمن من العنصر
                              onTap: () {
                                // DetailsHospitel
                                print(index.toString() +
                                    "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmID");
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        DetailsHospitel(
                                      getConsultationModel:
                                          cubit.getConsultationModel,
                                      indexID: index,
                                      Consutition_ID: cubit
                                          .getConsultationModel!
                                          .consultation![index]
                                          .id!,
                                    ),
                                  ),
                                ); // التعامل مع النقر على العنصر
                                print('تم النقر على العنصر ${index + 1}');
                              },
                            ),
                          );
                        },
                        itemCount: cubit.getConsultationModel == null
                            ? 0
                            : cubit.getConsultationModel!.consultation == null
                                ? 0
                                : cubit
                                    .getConsultationModel!.consultation!.length,
                      )),
          );
        },
      ),
    );
  }
}
