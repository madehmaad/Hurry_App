import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/domain/model/response_model/login_model.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Auth/Sign_in/bloc/sign_in_bloc.dart';
import 'package:hurry_project/views/Auth/Sign_up/Sign_Up.dart';
import 'package:hurry_project/views/Home/HomePage.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:hurry_project/views/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_rich_text/super_rich_text.dart';

// ignore: must_be_immutable
class SinginScreen extends StatelessWidget {
  SinginScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
          colors: [
            Color.fromARGB(255, 7, 25, 19),
            Colors.black,
          ],
        ),
      ),
      child: BlocProvider(
        create: (context) => SignInBloc(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SuccessInLogin) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Success in login'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ));
                config
                    .get<SharedPreferences>()
                    .setString('username', userNameController.text);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
              if (state is ErrorInLogin || state is ExcptionInLogin) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('There is a problem'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              }
            },
            builder: (context, state) {
              // return (state is LoadingToLogin)?
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  SuperRichText(
                    text: 'r lli ill d e',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                    othersMarkers: [
                      MarkerText(
                        marker: 'll',
                        style: TextStyle(
                          color: MainColor().bottonColor,
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Welcome to RIIDE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: userNameController,
                    labelText: 'Enter email or username',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  MainTextField(
                    context: context,
                    controller: passwordController,
                    labelText: 'Enter your password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  MainContainer(
                    context: context,
                    containerText: 'Sing in',
                    onTap: () {
                      if (userNameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<SignInBloc>().add(Login(
                            user: LoginModel(
                                email: userNameController.text,
                                password: passwordController.text)));
                      }
                      if (userNameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 3),
                          content:
                              Text('you need to Enter your name and password'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingupScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  (state is LoadingToLogin)
                      ? CircularProgressIndicator(
                          color: MainColor().bottonColor,
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
