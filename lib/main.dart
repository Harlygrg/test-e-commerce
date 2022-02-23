import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_app/controller/sign_in_controller.dart';
import 'package:test_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
            builder: ()=>GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              builder: (context,widget){
              ScreenUtil.setContext(context);
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: widget!);
              },
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),
              home:LoginScreen()
            ),
      designSize: const Size(375, 812),
    );
  }
}


