import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _auth= FirebaseAuth.instance;

  ///register
  Future<void>registerWithMailAndPassword(String email,String password)async{
    final user=await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  ///login
  Future<void>loginWithMailAndPassword(String email,String password)async{
   final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
  }



}