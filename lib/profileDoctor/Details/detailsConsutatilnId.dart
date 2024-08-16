import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:doctor/profileDoctor/Details/Medical.dart';
import 'package:doctor/profileDoctor/Details/treatment.dart';
import 'package:doctor/profileDoctor/Details/vaccination.dart';
import 'package:doctor/profileDoctor/model/detailsConsutationModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsHospitel extends StatelessWidget {
  DetailsHospitel(
      {super.key, this.getConsultationModel, required this.indexID});
  final DetailsConsutaltionModel? getConsultationModel;
  final int indexID;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController responsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(getConsultationModel.consultation)
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color0,
        title: text(title: "Details", color: Color4),
        actions: [
          getConsultationModel!.consultation![indexID].replyContent == null
              ? TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // String userInput = ''; // حقل الإدخال الجديد للاستجابة

                        return AlertDialog(
                          title: Text(
                            'Respond to the consultation',
                            style: TextStyle(color: Colors.green),
                          ),
                          content: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * .990,
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    // حقل الإدخال الجديد للاستجابة
                                    TextFormField(
                                      controller: responsController,
                                      // onChanged: (value) {
                                      //   userInput = value;
                                      // },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a response';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // actions: [
                          //   TextButton(
                          //     onPressed: () {
                          //       if (formKey.currentState!.validate()) {
                          //         cubit.postReply(
                          //             Consulation_ID: indexID,
                          //             replyConsultation:
                          //                 responsController.text);
                          //         // أرسل userInput (الاستجابة) إلى API هنا
                          //         // يمكنك استخدام قيمة userInput لإرسالها إلى API باستخدام حزمة http أو حزمة أخرى
                          //         Navigator.of(context).pop();
                          //       }
                          //     },
                          //     child: Text('Send Response'),
                          //   ),
                          //   TextButton(
                          //     onPressed: () {
                          //       Navigator.of(context).pop();
                          //     },
                          //     child: Text('Close'),
                          //   ),
                          // ],
                        );
                      },
                    );
                  },
                  child: text(title: "You have been answered", color: Color3))
              : Container()
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBackground), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // يمنع التمرير العمودي

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // عدد الأعمدة في الشبكة
                    ),
                    itemCount: getConsultationModel!
                        .consultation![indexID].images!.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print(getConsultationModel!
                      //         .consultation![index].replyContent
                      //         .toString() +
                      //     "lllllllllllllllllllllllllllllll" +
                      //     getConsultationModel!.consultation![index].replySentAt
                      //         .toString());

                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.60,
                                  child: Column(
                                    //mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  ImagesPath +
                                                      getConsultationModel!
                                                          .consultation![
                                                              indexID]
                                                          .images![index],
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                                color: Color0,
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      ImagesPath +
                                          getConsultationModel!
                                              .consultation![indexID]
                                              .images![index],
                                    ),
                                    fit: BoxFit.cover)),
                            clipBehavior: Clip.antiAlias,

                            // child: Image.network(
                            //   ImagesPath +
                            //       cubit.clubProfileGetModel!.images![index],
                            //   fit: BoxFit.cover,
                            //   width: width * 0.3,
                            //   height: height * 0.1,
                            // ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(),
              Container(
                child: text(title: "Datails Health Care"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(ImagesPath +
                                  getConsultationModel!.consultation![indexID]
                                      .healthCare!.profileImage!),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: getConsultationModel!
                                  .consultation![indexID].healthCare!.name
                                  .toString(),
                              color: Color0),
                          text(
                              title: getConsultationModel!
                                  .consultation![indexID]
                                  .healthCare!
                                  .description
                                  .toString(),
                              color: Color4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                child: text(title: "Datails User "),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: NetworkImage(ImagesPath +
                                  getConsultationModel!.consultation![indexID]
                                      .profile!.profile!),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              title: getConsultationModel!
                                      .consultation![indexID].profile!.fName
                                      .toString() +
                                  " " +
                                  getConsultationModel!
                                      .consultation![indexID].profile!.lName
                                      .toString(),
                              color: Color0),
                          text(
                              title: getConsultationModel!
                                  .consultation![indexID].profile!.email
                                  .toString(),
                              color: Color4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: text(title: "name:", color: Color4)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: text(
                          title: getConsultationModel!
                              .consultation![indexID].name
                              .toString(),
                          color: Color0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: text(title: "color:", color: Color4)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: text(
                          title: getConsultationModel!
                              .consultation![indexID].color
                              .toString(),
                          color: Color0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: text(title: "gender:", color: Color4)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: text(
                          title: getConsultationModel!
                              .consultation![indexID].gender
                              .toString(),
                          color: Color0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: text(title: "age:", color: Color4)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: text(
                          title: getConsultationModel!
                              .consultation![indexID].age
                              .toString(),
                          color: Color0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: text(title: "content:", color: Color4)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: text(
                          title: getConsultationModel!
                              .consultation![indexID].content
                              .toString(),
                          color: Color0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: text(title: "symptoms:", color: Color4)),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: text(
                          title: getConsultationModel!
                              .consultation![indexID].symptoms
                              .toString(),
                          color: Color0),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                child: text(title: "Details", color: Color0),
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => VaccinationPage(
                            getConsultationModel: getConsultationModel,
                            indexID: indexID,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                            Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                          child: text(title: "vaccination", color: Color3)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => TreatmentPage(
                            getConsultationModel: getConsultationModel,
                            indexID: indexID,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                            Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                          child: text(title: "treatment", color: Color3)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => MedicalPage(
                            getConsultationModel: getConsultationModel,
                            indexID: indexID,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                            Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                            Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child:
                          Center(child: text(title: "Medical", color: Color3)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              )
              // Container(
              //   child: text(title: "vaccination", color: Color0),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.35,
              //   child: ListView.builder(
              //     itemBuilder: (BuildContext, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           width: MediaQuery.of(context).size.width,
              //           height: MediaQuery.of(context).size.height * 0.1,
              //           decoration: BoxDecoration(
              //               color: Color0,
              //               borderRadius: BorderRadius.circular(15.0)),
              //           child: Row(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   width: MediaQuery.of(context).size.width * 0.4,
              //                   height: MediaQuery.of(context).size.height,
              //                   decoration: BoxDecoration(
              //                       color: Colors.black,
              //                       borderRadius: BorderRadius.circular(15.0)),
              //                   child: Center(
              //                       child: text(
              //                           title: getConsultationModel!
              //                               .consultation![indexID]
              //                               .details!
              //                               .vaccination![index]
              //                               .details
              //                               .toString(),
              //                           color: Color3)),
              //                 ),
              //               ),
              //               Spacer(),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   width: MediaQuery.of(context).size.width * 0.4,
              //                   height: MediaQuery.of(context).size.height,
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(15.0)),
              //                   child: Center(
              //                       child: text(
              //                           title: getConsultationModel!
              //                               .consultation![indexID]
              //                               .details!
              //                               .vaccination![index]
              //                               .date
              //                               .toString(),
              //                           color: Color4)),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount:
              //         getConsultationModel!.consultation![indexID].details ==
              //                 null
              //             ? 0
              //             : getConsultationModel!.consultation![indexID]
              //                 .details!.vaccination!.length,
              //   ),
              // ),
              // Divider(),
              // Container(
              //   child: text(title: "treatment", color: Color0),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.35,
              //   child: ListView.builder(
              //     itemBuilder: (BuildContext, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           width: MediaQuery.of(context).size.width,
              //           height: MediaQuery.of(context).size.height * 0.1,
              //           decoration: BoxDecoration(
              //               color: Color0,
              //               borderRadius: BorderRadius.circular(15.0)),
              //           child: Row(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   width: MediaQuery.of(context).size.width * 0.4,
              //                   height: MediaQuery.of(context).size.height,
              //                   decoration: BoxDecoration(
              //                       color: Colors.black,
              //                       borderRadius: BorderRadius.circular(15.0)),
              //                   child: Center(
              //                       child: text(
              //                           title: getConsultationModel!
              //                               .consultation![indexID]
              //                               .details!
              //                               .treatment![index]
              //                               .details
              //                               .toString(),
              //                           color: Color3)),
              //                 ),
              //               ),
              //               Spacer(),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   width: MediaQuery.of(context).size.width * 0.4,
              //                   height: MediaQuery.of(context).size.height,
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(15.0)),
              //                   child: Center(
              //                       child: text(
              //                           title: getConsultationModel!
              //                               .consultation![indexID]
              //                               .details!
              //                               .treatment![index]
              //                               .date
              //                               .toString(),
              //                           color: Color4)),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount:
              //         getConsultationModel!.consultation![indexID].details ==
              //                 null
              //             ? 0
              //             : getConsultationModel!.consultation![indexID]
              //                 .details!.treatment!.length,
              //   ),
              // ),
              // Divider(),
              // Container(
              //   child: text(title: "medical", color: Color0),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.35,
              //   child: ListView.builder(
              //     itemBuilder: (BuildContext, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           width: MediaQuery.of(context).size.width,
              //           height: MediaQuery.of(context).size.height * 0.1,
              //           decoration: BoxDecoration(
              //               color: Color0,
              //               borderRadius: BorderRadius.circular(15.0)),
              //           child: Row(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   width: MediaQuery.of(context).size.width * 0.4,
              //                   height: MediaQuery.of(context).size.height,
              //                   decoration: BoxDecoration(
              //                       color: Colors.black,
              //                       borderRadius: BorderRadius.circular(15.0)),
              //                   child: Center(
              //                       child: text(
              //                           title: getConsultationModel!
              //                               .consultation![indexID]
              //                               .details!
              //                               .medical![index]
              //                               .details
              //                               .toString(),
              //                           color: Color3)),
              //                 ),
              //               ),
              //               Spacer(),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   width: MediaQuery.of(context).size.width * 0.4,
              //                   height: MediaQuery.of(context).size.height,
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(15.0)),
              //                   child: Center(
              //                       child: text(
              //                           title: getConsultationModel!
              //                               .consultation![indexID]
              //                               .details!
              //                               .medical![index]
              //                               .date
              //                               .toString(),
              //                           color: Color4)),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     itemCount:
              //         getConsultationModel!.consultation![indexID].details ==
              //                 null
              //             ? 0
              //             : getConsultationModel!
              //                 .consultation![indexID].details!.medical!.length,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
