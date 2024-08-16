import 'package:doctor/Home/main_screen.dart';
import 'package:doctor/Login/cubit/login_cubit.dart';
import 'package:doctor/component/Widght.dart';
import 'package:doctor/component/conset/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginW extends StatefulWidget {
  LoginW({Key? key}) : super(key: key);

  @override
  State<LoginW> createState() => _LoginWState();
}

class _LoginWState extends State<LoginW> {
  String? selectedCountryCode;
  // final String flag = '🇦🇪';
  // final String callingCode = '+971';
  // List<Map<String, String>> countries = [
  //   {'code': '+1', 'flag': '🇺🇸'},
  //   {'code': '+44', 'flag': '🇬🇧'},
  //   {'code': '+91', 'flag': '🇮🇳'},
  //   // قم بإضافة بيانات الدول الأخرى هنا
  // ];
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("mohammed1000000000000000000000000000000000000000000000");

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (State is LoginLoading) {
            LoginCubit.getObject(context).chingLoading(true);
          }
          if (state is LoginSusccfuly) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => MainScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.getObject(context);
          print("mohammed1000000000000000000000000000000000000000000000");
          return Scaffold(
            // backgroundColor: Colors.transparent,
            body: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ImageLogin(),
                        text(
                          title: "Sign In",
                          color: Color2,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: height * 0.006,
                        ),
                        text(
                          title: "Horse Auctions, Booking & Healthcare",
                          color: Color2,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: height * 0.008,
                        ),
                        Row(
                          children: [
                            text(
                              title: "You are welcome",
                              color: Color2,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            Spacer()
                          ],
                        ),
                        SizedBox(
                          height: height * 0.004,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.080,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color0,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                // تحقق من صيغة البريد الإلكتروني باستخدام تعبير منتظم
                                final emailRegex = RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                if (!emailRegex.hasMatch(value)) {
                                  return "Please enter a valid email address.";
                                }
                                return null;
                              },

                              keyboardType: TextInputType
                                  .emailAddress, // تغيير نوع لوحة المفاتيح إلى البريد الإلكتروني
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.email),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'Caveat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color5,
                                ),
                                hintText:
                                    "example@example.com", // تغيير نص التلميح لصيغة البريد الإلكتروني
                              ),
                            ),
                          ),
                        ),
                        // TextFieldWidght(
                        //   controller: emailController,
                        //   hintText: "Email",
                        //   messageForm: 'Please enter your email',
                        //   keyboardType: TextInputType.emailAddress,
                        //   context: context,
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.030,
                        ),
                        TextFieldWidght(
                            controller: passwordController,
                            messageForm: 'Please enter your password',
                            keyboardType: TextInputType.emailAddress,
                            obscureText: cubit.isloadObserivice,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.chingLoadingObserivice();
                                },
                                icon: cubit.isloadObserivice
                                    ? Icon(Icons.remove_red_eye_sharp)
                                    : Icon(Icons.password_outlined)),
                            hintText: "PassWord",
                            context: context),
                        // Forgotyourpassword(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.20,
                        ),
                        cubit.isload
                            ? SpinkitWave()
                            : ButtonStaic(
                                onTap: () {
                                  // يتم تنفيذ هذا الكود عند النقر على الزر
                                  if (_formKey.currentState!.validate()) {
                                    cubit.chingLoading(true);
                                    cubit.postLogin(
                                        Email: emailController.text,
                                        PassWord: passwordController.text,
                                        context: context);

                                    // إذا كانت جميع الحقول صحيحة
                                    // يمكنك تنفيذ الإجراء المطلوب هنا، مثل تسجيل الدخول
                                    print('Login successful');
                                  }

                                  print('تم النقر على الزر!');
                                },
                                title: "Sign In",
                                context: context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        // ButtonStaic(
                        //     onTap: () {
                        //       // يتم تنفيذ هذا الكود عند النقر على الزر
                        //       print('تم النقر على الزر!');
                        //     },
                        //     title: "Sign In as a guest",
                        //     colors: [Color0, Color0],
                        //     radius: 25.0,
                        //     widthContainer: MediaQuery.of(context).size.width * 0.55,
                        //     heightContainer: 50.0,
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Color0.withOpacity(0.5),
                        //         spreadRadius: 2.0,
                        //         blurRadius: 10.0,
                        //         offset: Offset(-1, 6),
                        //       ),
                        //     ],
                        //     beginGrident: Alignment.topLeft,
                        //     endGrident: Alignment.bottomRight,
                        //     colorText: Color3,
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w700),
                        // DonthaveAnAccount(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class DonthaveAnAccount extends StatelessWidget {
//   const DonthaveAnAccount({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         text(
//           title: "Don’t have an account?",
//           color: Color2,
//           fontSize: 14.0,
//           fontWeight: FontWeight.w400,
//         ),
//         TextButton(
//             onPressed: () {
//               Navigator.push<void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => Register(),
//                 ),
//               );
//             },
//             child: text(
//                 title: "register Now",
//                 color: Color0,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 16)),
//       ],
//     );
//   }
// }

// class Forgotyourpassword extends StatelessWidget {
//   const Forgotyourpassword({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TextButton(
//             onPressed: () {
//               Navigator.push<void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => ChangPassword(),
//                 ),
//               );
//             },
//             child: text(title: "Forgot your password?", color: Color2)),
//         Spacer()
//       ],
//     );
//   }
// }

class ImageLogin extends StatelessWidget {
  const ImageLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Image.asset(
          'assets/images/horse jumping-cuate.png',
        ),
      ),
    );
  }
}
