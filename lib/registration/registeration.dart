import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:planto_planto/login/login_view.dart';

class RegistrationView extends StatefulWidget {
  static const routName = "registration";

  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool passwordIsVisible = true;
  bool repeatIsVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF093923),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(
                "assets/images/registration-logo-test.png",
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    "Hi!",
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    "Register yourself with us",
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF093923),
                      hintText: "E-mail",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: theme.textTheme.bodySmall,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/email.png"),
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must provide your email";
                      }

                      var emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!emailValid.hasMatch(value)) {
                        return "Invalid email";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF093923),
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: theme.textTheme.bodySmall,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/password_icon.png"),
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          passwordIsVisible = !passwordIsVisible;
                          setState(() {});
                        },
                        child: passwordIsVisible
                            ? Icon(Icons.visibility_outlined)
                            : Icon(Icons.visibility_off_outlined),
                      ),
                      suffixIconColor: Colors.white,
                    ),
                    obscureText: passwordIsVisible ? true : false,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must provide your password";
                      }

                      var passValid = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (!passValid.hasMatch(value)) {
                        return "Invalid password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF093923),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: "Repeat your password",
                      hintStyle: theme.textTheme.bodySmall,
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/password_icon.png"),
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          repeatIsVisible = !repeatIsVisible;
                          setState(() {});
                        },
                        child: repeatIsVisible
                            ? Icon(Icons.visibility_outlined)
                            : Icon(Icons.visibility_off_outlined),
                      ),
                      suffixIconColor: Colors.white,
                    ),
                    obscureText: repeatIsVisible ? true : false,
                    controller: repeatPasswordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must repeat your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 70),
                  MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registration();
                          showSnackBar(context, "success");
                          Navigator.pushReplacementNamed(context, LoginView.routeName);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context, "weak password");
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, "email already exist");
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: theme.textTheme.titleSmall,
                    ),
                    color: Color(0xFF093923),
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Already have an account?",
                        style: theme.textTheme.displaySmall,
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginView.routeName);
                        },
                        child: Text(
                          "Login",
                          style: theme.textTheme.displaySmall!.copyWith(
                            color: Color(0xFF093923),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registration() async {
     UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
