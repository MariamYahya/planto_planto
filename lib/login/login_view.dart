import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:planto_planto/dashboard/dashboard_view.dart';
import 'package:planto_planto/registration/registeration.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "login";

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundtest.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/login-logo-test.png",
                  ),
                  width: 140,
                  height: mediaQuery.height * 0.3,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Welcome Back!",
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "We’re so excited to see you again",
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: Color(0xFF093923),
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF093923),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: "E-mail",
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
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: "Password",
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
                                  isVisible = !isVisible;
                                  setState(() {});
                                },
                                child: isVisible
                                    ? Icon(Icons.visibility_outlined)
                                    : Icon(Icons.visibility_off_outlined),
                              ),
                              suffixIconColor: Colors.white,
                            ),
                            obscureText: isVisible ? true : false,
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
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forget your password?",
                              style: theme.textTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.underline,
                                color: Color(0xFF093923),
                              ),
                            ),
                          ),
                          SizedBox(height: 70),
                          MaterialButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await login();
                                  showSnackBar(context, "Success");
                                  Navigator.pushReplacementNamed(
                                      context, DashboardView.routeName);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    showSnackBar(context, "user not found");
                                  } else if (e.code == 'wrong-password') {
                                    showSnackBar(context, "wrong password");
                                  }
                                }
                                isLoading = false;
                                setState(() {});
                              }
                            },
                            child: Text(
                              "Login",
                              style: theme.textTheme.titleSmall,
                            ),
                            color: Color(0xFF093923),
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: theme.textTheme.displaySmall,
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegistrationView.routName);
                                },
                                child: Text(
                                  "Register",
                                  style: theme.textTheme.displaySmall!.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF093923),
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
              ],
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

  Future<void> login() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
