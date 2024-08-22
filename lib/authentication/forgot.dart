
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/Services/provider/auth.dart';
import 'package:learn3/authentication/login.dart';
import 'package:learn3/widgets/custom_field.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

bool isPass = false;

class _ForgotState extends State<Forgot> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF4F5F9),
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
                  height: height * 0.2,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Enter your register email in order to reset the Password ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    print("object");
                    if (_formKey.currentState!.validate()) {
                      _resetPassword(context);
                    }
                  },
                  child: MyButton(
                    width: width,
                    height: height * 0.07,
                    title: "Forgot",
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
    if (form!.validate()) {
      form.save();
    }
  }

  void _resetPassword(BuildContext context) async {
    try {
      // Send password reset email
      await Provider.of<AuthService>(context, listen: false)
          .resetPassword(email.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Password reset email sent')));
      Navigator.pop(context);
    } catch (e) {
      // Print out the error code
      print('Error code: ${(e as FirebaseAuthException).code}');
      // Check if the error is due to non-existing email
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The provided email is not registered')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('Failed to send password reset email: ${e.toString()}')));
      }
    }
  }
}
