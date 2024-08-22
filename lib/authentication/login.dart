import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/Navbar/Botton_Navbar.dart';
import 'package:learn3/Services/provider/auth.dart';
import 'package:learn3/authentication/forgot.dart';
import 'package:learn3/authentication/signup.dart';
import 'package:learn3/main.dart';
import 'package:learn3/utils/const_values.dart';
import 'package:learn3/utils/media_urls.dart';
import 'package:learn3/widgets/custom_field.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

bool isPass = false;

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.10,
                ),
                SizedBox(
                  height: height * 0.15,
                  width: width,
                  child: Image.asset(Media.logo),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const Text(
                  "Welcome Back to Bark Board",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ).centered(),
                SizedBox(
                  height: height * 0.07,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.mail,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "example@mail.com",
                  controller: email,
                  action: TextInputAction.next,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  lines: 1,
                  obscureText: isPass,
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPass = !isPass;
                      });
                    },
                    icon: Icon(
                      isPass
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_fill,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "*******",
                  controller: password,
                  action: TextInputAction.done,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Forgot()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            decorationColor: AppConstants.primaryColor,
                            decoration: TextDecoration.underline,
                            color: AppConstants.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                    if (_formKey.currentState!.validate()) {
                      _login(context);
                    }
                  },
                  child: MyButton(
                    width: width,
                    height: height * 0.07,
                    title: "Login",
                  ),
                ),
                SizedBox(
                  height: width * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not Registered?",
                      style: TextStyle(
                        decorationColor: AppConstants.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Signup()));
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                            decorationColor: AppConstants.primaryColor,
                            decoration: TextDecoration.underline,
                            color: AppConstants.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey.shade300,
                        height: 36,
                      ),
                    ),
                  ),
                  const Text("OR sign in with Google"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: 36,
                        )),
                  ),
                ]),
                Container(
                  width: width,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  child: InkWell(
                    onTap: () async {
                      try {
                        await authService.signInWithGoogle();
                        // Navigate to the home page or display a success message
                      } catch (e) {
                        // Show the error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("SignIn with",
                              style: AppConstants.bodyText(
                                fontSize: 18,
                                color: AppConstants.primaryColor,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
    }
  }

  void _login(BuildContext context) async {
    try {
      await Provider.of<AuthService>(context, listen: false).signIn(
        email.text,
        password.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')));
    }
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.width,
    required this.height,
    required this.title,
  });

  final double width;
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppConstants.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(title,
                style: AppConstants.bodyText(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }
}
