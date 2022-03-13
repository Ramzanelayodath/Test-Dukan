

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_dukan/login/cubit/login_cubit.dart';
import 'package:machine_test_dukan/util/router_variables.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  ProgressDialog progressDialog = ProgressDialog();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginProcessing) {
          progressDialog.showProgressDialog(context);
        } else if (state is LoginSuccess) {
          progressDialog.dismissProgressDialog(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, home,arguments: state.userName);
        } else if (state is LoginFailed) {
          progressDialog.dismissProgressDialog(context);
          showSnackBar(state.error, context);
        }
      },
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [header(), inputFiled(context)],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Column(mainAxisSize: MainAxisSize.max, children: const [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Welcome',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 3,
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Back',
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }

  Widget inputFiled(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: ctrlEmail,
          decoration: const InputDecoration(
            hintText: 'Email Address',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: ctrlPassword,
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
          obscureText: true,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).doLogin(
                    ctrlEmail.text.toString(), ctrlPassword.text.toString());

              },
            )
          ],
        ),
          Padding(padding: const EdgeInsets.only(top: 20),
         child:InkWell(
           child:  const Text('Google Sign',style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 20),),
           onTap: (){
             BlocProvider.of<LoginCubit>(context).doGoogleSign();
           },
         ),)
      ],
    );
  }



  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}