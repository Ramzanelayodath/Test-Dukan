import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:machine_test_dukan/login/data/LoginResponse.dart';
import 'package:machine_test_dukan/repository/repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;
  LoginCubit(this.repository) : super(LoginInitial());

  void doLogin(String email,String password){
    email.isEmpty ?
    emit(LoginFailed("Enter Email")) :
    password.isEmpty ?
    emit(LoginFailed("Enter Password")) :
    repository.doLogin(email, password).then((value){
      emit(LoginProcessing());
      if(value is LoginResponse){
        if(value.code == 0) {
          emit(LoginSuccess(value.data!.name!));
        }else{
          emit(LoginFailed(value.message!));
        }
      }else{
        emit(LoginFailed("Try again"));
      }
    });


  }

  void doGoogleSign(){
    repository.doGmailLogin().then((value){
      if(value){
        User? user = FirebaseAuth.instance.currentUser;
        emit(LoginSuccess(user!.displayName!));
      }
    });
  }
}
