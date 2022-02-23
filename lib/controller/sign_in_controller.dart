

  import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_app/screens/home_screen.dart';
  import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/screens/login_screen.dart';

class SignInController extends GetxController{

  static SignInController instance =Get.find();
  static GoogleSignIn googleSignIn =GoogleSignIn(scopes: ["email"]);
   GoogleSignInAccount ? user= googleSignIn.currentUser;
   bool isSignedIn =false;

   //shared preference to store login status


  // late Rx<GoogleSignInAccount?> _user;
  //
  // FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() async{
    //_user=Rx<GoogleSignInAccount?>(user);
    await userCheckLogin();
    //user would be notified
    super.onReady();
  }
    userCheckLogin(){
      Future.delayed(Duration(milliseconds: 0))
          .then((value) =>  sharedPrefGetVal())
          .then((value){
        if(isSignedIn==false){
          print("================== this works2");
          return;
        }
        if(isSignedIn==true){
          print("================== this works3");
          Get.to(()=>HomeScreen());
        }
        else {
          print("================== this works4");
          return;
        }
      });
      print("================== this works worksblabla$isSignedIn");


  }

  Future login()async{
    isSignedIn=true;
    final user= await googleSignIn.signIn();
    if(user==null){
      isSignedIn=false;
      return;
    }else{
      Get.to(()=>HomeScreen());
    }
      sharedPrefSetVal();
    print("set values in prefernce");
      final googleAuth = await user.authentication;
      final credetntial = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credetntial);
      update();

  }


  logout()async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    isSignedIn=false;
    sharedPrefSetVal();
    Get.offAll(()=>LoginScreen());

  }

  sharedPrefSetVal()async{
    final pref =await SharedPreferences.getInstance();
    print("=============set pref values::$isSignedIn");
    await pref.setBool("isSignedIn", isSignedIn);
  }

  sharedPrefGetVal()async{
    final pref =await SharedPreferences.getInstance();
    isSignedIn = pref.getBool("isSignedIn")!;
    print("=============get pref values::$isSignedIn");

  }

  // _initialScreen(User? user){
  //   if(user==null){
  //     Get.offAll(()=>LoginScreen());
  //   }
  //   else{
  //     Get.offAll(()=>HomeScreen());
  //   }
  // }
}