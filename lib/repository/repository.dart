

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:machine_test_dukan/firebase/firebase_service.dart';
import 'package:machine_test_dukan/network/network.dart';

class Repository{
  final Network network;
  FirebaseService firebaseService;
  Repository(this.network,this.firebaseService);

  Future<dynamic> doLogin(String email,String password){
     return network.doLogin(email, password);
  }

  Future<dynamic>doGmailLogin() async {
    try {
      await firebaseService.signInwithGoogle();
    } catch(e){
      if(e is FirebaseAuthException){
        return false;
      }
    }
    return true;
  }

}