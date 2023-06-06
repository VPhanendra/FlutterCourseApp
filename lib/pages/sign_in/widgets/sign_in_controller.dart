import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fultter_courseapp/common/values/constant.dart';
import 'package:fultter_courseapp/common/widgets/flutter_toast.dart';
import 'package:fultter_courseapp/global.dart';
import 'package:fultter_courseapp/pages/sign_in/bloc/sign_in_bolcs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
  try{
    if(type=="email"){
      final state = context.read<SignInBloc>().state;
      String emailAddress =state.email;
      String password =state.password;
      if(emailAddress.isEmpty){
        //
       toastInfo(msg: "you need fill email address");
      }
      if(password.isEmpty){
        //
        toastInfo(msg: "you need fill password");
      }
      try{
        final credential =await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailAddress, password: password);
        if(credential.user==null){
          //
          toastInfo(msg: "you dose not exist");
        }
        if(!credential.user!.emailVerified){
          //
          toastInfo(msg: "you need to verify your email account");
        }
        var user = credential.user;
        if(user!=null){
          //we got verified user from firebase
          print("user exist");
         Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
          //Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
        }else{
          //we have error getting user from firebase
          toastInfo(msg: "Current you are not a user of this app");
        }
      }on FirebaseAuthException catch(e){
        if(e.code == 'user-not-found'){
          print('No user found for that email.');
          toastInfo(msg: "No user found for that email.");
        }else if(e.code =='wrong-password'){
          print('Wrong password provided for that user.');
          toastInfo(msg: "Wrong password provided for that user.");
        }else if(e.code =='invalid-email'){
          print("your email format is wrong");
          toastInfo(msg: "your email format is wrong");
      }
      }
    }
  }catch(e){
    print(e.toString());
  }
  }
}
