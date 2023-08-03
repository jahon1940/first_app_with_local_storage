import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_2907/core/widgets/global_textfield.dart';
import 'package:ui_2907/core/widgets/gradient_background.dart';
import '../../core/widgets/global_button.dart';
import '../../core/widgets/social_icon.dart';
import '../../data/models/local_database/storage_repository.dart';
import '../../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLog = false;
  bool isLogIn = false;
  Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLogIn = pref.getBool("isLoggedIn") ?? false;
    return pref.getBool("isLoggedIn") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            GradientBackgroundWidget(),
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Column(children: [
                Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sign in and continue managing you finances',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                TextFielCard.CardTheme(
                  hintTextName: 'Email Address',
                  TextFielCardValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email Address error";
                    }
                  },
                  TextFielCardController: emailController,
                  TextFielCardKeyboardType: TextInputType.emailAddress,
                  TextFielCardOnChanged: (value) {
                    if (value == StorageRepository.email) {
                      setState(() {
                        isLog = true;
                      });
                    } else {
                      setState(() {
                        isLog = false;
                      });
                    }
                  },
                ),
                TextFielCard.CardTheme(
                  hintTextName: 'Password',
                  TextFielCardValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password error";
                    }
                  },
                  TextFielCardController: passwordController,
                  TextFielCardKeyboardType: TextInputType.number,
                  TextFielCardOnChanged: (value) {
                    if (value == StorageRepository.password) {
                      setState(() {
                        isLog = true;
                      });
                    } else {
                      setState(() {
                        isLog = false;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GlobalButton(
                    buttonName: 'LOG IN',
                    onTap: () async {
                      final isLogIn = await isLoggedIn();
                      String? mail = await getEmail(context);
                      int? password = await getPassword(context);

                      if (formKey.currentState!.validate() &&
                          mail == emailController.text &&
                          password == int.parse(passwordController.text)) {
                        Navigator.pushReplacementNamed(context, RouteName.main);
                      } else {
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text('Check (Email or Password)'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Ok');
                                      },
                                      child: Text('Ok'),
                                    )
                                  ],
                                ));
                      }
                      if (isLogIn == false) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text(
                                      'You do not Register! Please tap to Register'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Ok');
                                      },
                                      child: Text('Ok'),
                                    )
                                  ],
                                ));
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                SocialSvgWdget(),
                SizedBox(
                  height: 50,
                ),
                RichText(
                    text: TextSpan(text: "Don't have an account?,", children: [
                  TextSpan(
                    text: ' Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final logged = await isLoggedIn();
                        logged
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text('You already Register!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'Cancel');
                                          },
                                          child: Text('Cancel'),
                                        )
                                      ],
                                    ))
                            : Navigator.pushReplacementNamed(
                                context, RouteName.register);
                      },
                  ),
                ]))
              ]),
            ))
          ],
        ),
      ),
    );
  }

  Future<String?> getEmail(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? mail = pref.getString(
      StorageRepository.email,
    );
    return mail;
  }

  Future<int?> getPassword(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? password = pref.getInt(
      StorageRepository.password,
    );
    return password;
  }
}
