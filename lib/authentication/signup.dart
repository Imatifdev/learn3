import 'dart:io';

import 'package:learn3/Navbar/Botton_Navbar.dart';
import 'package:learn3/Services/provider/auth.dart';
import 'package:learn3/Utils/media_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/authentication/login.dart';
import 'package:learn3/utils/const_values.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/custom_field.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

bool isPass = false;

class _SignupState extends State<Signup> {
  final TextEditingController email = TextEditingController();

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController address = TextEditingController();

  final TextEditingController phone = TextEditingController();
  final TextEditingController des = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _profileImage;
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final authService = Provider.of<AuthService>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const Text(
                  "Create an Account!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your account details below or ",
                      style: TextStyle(
                        decorationColor: AppConstants.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Signup()));
                      },
                      child: Text(
                        "log in",
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
                SizedBox(
                  height: height * 0.07,
                ),
                const Text(
                  "Full Name Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your First Name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.person,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Jack",
                  controller: fName,
                  action: TextInputAction.next,
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
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter confirm your password';
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
                  controller: confirmPassword,
                  action: TextInputAction.done,
                ),
                SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                    if (_formKey.currentState!.validate()) {
                      _signup(context, '');
                    }
                  },
                  child: MyButton(
                    width: width,
                    height: height * 0.07,
                    title: "Signup",
                  ),
                ),
                SizedBox(
                  height: width * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate() && confirmPassword == password) {
      form.save();
    }
  }

  void _signup(BuildContext context, String role) async {
    try {
      await Provider.of<AuthService>(context, listen: false).signUp(
        role,
        _profileImage,
        des.text,
        address.text,
        email.text,
        fName.text,
        lName.text,
        phone.text,
        password.text,
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signup successful')));

      Navigator.push(context, MaterialPageRoute(builder: (ctx) => BottomNav()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signup failed: ${e.toString()}'),
        ),
      );
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
