import 'dart:io';

import 'package:doctor/BlocServic/Bloc.dart';
import 'package:doctor/Login/cubit/login_cubit.dart';
import 'package:doctor/NetWork/dioHelper.dart';
import 'package:doctor/SplashScreen/SplashScreen.dart';
import 'package:doctor/firebase_options.dart';
import 'package:doctor/firebaseconfigeerr.dart';
import 'package:doctor/sharePreferinces/shardprefericences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachShpreafapp.init();
  // CachShpreafapp.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  PusherChannelsFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseApp().initFirebaseNotifications();

  // There was an error starting the campaign: target_time for running campaigns should be at least 10seconds into the future.
  HttpOverrides.global = MyHttpOverrides();
  // ServerApi.init();
  // ServerApi.initWeather();
  // Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // configurePusher();
    return MultiBlocProvider(
      providers: [
        // if (CachShpreafapp.getdata(key: "tokenProfile") != null)
        //   BlocProvider<AuctionCalenderCubit>(
        //     create: (BuildContext context) =>
        //         AuctionCalenderCubit()..configurePusher1(),
        //   ),
        // if (CachShpreafapp.getdata(key: "tokenProfile") != null)
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, states) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: CachShpreaf.getdata(key: "Token") != null
            //     ? CachShpreaf.getdata(key: "lang").toString() == "en"
            //         ? Directionality(
            //             textDirection: TextDirection.ltr, child: Home_Page())
            //         : Directionality(
            //             textDirection: TextDirection.rtl, child: Home_Page())
            //     : Test1(),
            home:
                // VeterinaryConsultationScreen(),
                //  CachShpreafapp.getdata(key: "tokenProfile") != null
                //     ? MainScreen()
                SplashScreen(),
            // VideoPickerScreen(),
          );
        },
      ),

      // create: (context) => LoginCubit(),
      // child: MaterialApp(
      //   title: 'Flutter Demo',
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //   ),
      //   home:
      //       //  CachShpreafapp.getdata(key: "tokenProfile") != null
      //       //     ? MainScreen()
      //       SplashScreen(),
      // ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
