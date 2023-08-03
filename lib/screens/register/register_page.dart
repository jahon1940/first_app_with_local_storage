import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_2907/core/widgets/global_textfield.dart';
import 'package:ui_2907/core/widgets/gradient_background.dart';
import '../../core/widgets/global_button.dart';
import '../../core/widgets/social_icon.dart';
import '../../data/models/local_database/storage_repository.dart';
import '../../routes/app_routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                  'Register',
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
                  'Register and start managine your finances',
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
                    hintTextName: 'Full Name',
                    TextFielCardValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter valid name";
                      }
                    },
                    TextFielCardController: nameController,
                    TextFielCardKeyboardType: TextInputType.name,
                    TextFielCardOnChanged: (s) {}),
                TextFielCard.CardTheme(
                    hintTextName: 'Email Address',
                    TextFielCardValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter valid Email Address";
                      }
                    },
                    TextFielCardController: emailController,
                    TextFielCardKeyboardType: TextInputType.emailAddress,
                    TextFielCardOnChanged: (s) {}),
                TextFielCard.CardTheme(
                    hintTextName: 'Password',
                    TextFielCardValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter valid Password";
                      }
                    },
                    TextFielCardController: passwordController,
                    TextFielCardKeyboardType: TextInputType.number,
                    TextFielCardOnChanged: (s) {}),
                SizedBox(
                  height: 20,
                ),
                GlobalButton(
                    buttonName: 'REGISTER',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        saveLogin(context);
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    }),
                SizedBox(
                  height: 70,
                ),
                SocialSvgWdget(),
                SizedBox(
                  height: 50,
                ),
                RichText(
                    text:
                        TextSpan(text: 'Already have an account?,', children: [
                  TextSpan(
                    text: ' Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, RouteName.login);
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

  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(StorageRepository.name, nameController.text);
    pref.setString(StorageRepository.email, emailController.text);
    pref.setInt(StorageRepository.password, int.parse(passwordController.text));
    pref.setBool("isLoggedIn", true);

    Navigator.pushNamedAndRemoveUntil(
        context, RouteName.login, (route) => false);
  }
}
