import 'dart:io';

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
                // DottedAvatarPicker(
                //   onImagePicked: (pickedImage) {
                //     setState(() {
                //       _profileImage = pickedImage;
                //     });
                //   },
                // ).centered(),
                SizedBox(
                  height: height * 0.05,
                ),
                const Text(
                  "Create Your Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ).centered(),
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
                SizedBox(
                  height: height * 0.01,
                ),
                CheckboxListTile(
                  checkColor: AppConstants.white,
                  title: Text('I accept the terms and conditions'),
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Registered Already?",
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
                            MaterialPageRoute(builder: (ctx) => Login()));
                      },
                      child: Text(
                        "Login",
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
                  const Text("OR signin with Google"),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: 36,
                        )),
                  ),
                ]),
                SizedBox(
                  height: 50,
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
      Navigator.pop(context);
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
