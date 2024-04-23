// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/onboarding/login/bloc/logincubit.dart';
import 'package:shop_app/modules/onboarding/login/bloc/loginstates.dart';


class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  var usernamecontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  bool issecure = true;
  IconData eyeicon = Icons.remove_red_eye;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => LoginCubit()),
      child: BlocConsumer<LoginCubit, LoginSatas>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  const Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 32),
                  Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                          controller: usernamecontroller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null) {
                              return " Email Address can't be empty";
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: issecure,
                          controller: passwordcontroller,
                          validator:  (value) {
                            if (value == null)  return " Password can't be empty please enter password";
                            
                          },
                          decoration: InputDecoration(
                            prefixIcon:const  Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(eyeicon),
                            ),
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: state is LoginLoadingState
                                ? Colors.white
                                : Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: state is LoginLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : MaterialButton(
                                  onPressed: () async {
                                    if(formKey.currentState!.validate()){
                                      LoginCubit.get(context).sendData(
                                        email: usernamecontroller.text,
                                        password: passwordcontroller.text);
                                    }
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                        ),
                      ]))
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
