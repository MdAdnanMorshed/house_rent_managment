


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:house_management/app/routes/app_pages.dart';

class Auth{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _cloudStore = FirebaseFirestore.instance;

  ///register
  Future<void>registerWithMailAndPassword(String userName,String email,String password)async{
    print('Auth.registerWithMailAndPassword $email');
    print('Auth.registerWithMailAndPassword $password');
    final result=await _auth.createUserWithEmailAndPassword(email: email, password: password);

    print('Auth.registerWithMailAndPassword ${   result.user}');
    print('Auth.registerWithMailAndPassword ${   result.user!.uid}');

    if(result.user==null){
      Get.snackbar('Alert', 'Register Error ');
      print('Auth.registerWithMailAndPassword Error' );
    }else{
      Get.snackbar('Alert', 'Successful!');
      print('Auth.registerWithMailAndPassword Successful');
    }

    _cloudStore.collection('Register').doc(result.user!.uid.toString()).set({
      "uId":result.user!.uid.toString(),
      "userName":userName,
      "userMail":result.user!.email.toString(),
      "registerBlockStatus":true,
    });

    /// cloud store  save

  }

  ///login
  Future<void>loginWithMailAndPassword(String email,String password)async{
   final response=await _auth.signInWithEmailAndPassword(email: email, password: password);

   if(response.user==null){
     print('Auth.loginWithMailAndPassword Login Error ');
     Get.snackbar('Alert', 'Login Error ');
    }else{
     print('Auth.loginWithMailAndPassword Login Error ');
     Get.toNamed(Routes.HOME);
   }

  }

  ///logout
  Future<void>logout()async{
  }



}
