import 'package:flutter/material.dart';
import 'package:learn3/Navbar/Botton_Navbar.dart';
import 'package:learn3/Services/provider/auth.dart';
import 'package:learn3/authentication/login.dart';
import 'package:learn3/authentication/signup.dart';
import 'package:learn3/utils/const_values.dart';
import 'package:learn3/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                Text(
                  "Sign Up Later",
                  style:
                      TextStyle(color: AppConstants.primaryColor, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff2C5680)),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () async {
                  try {
                    await authService.signInWithGoogle();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => BottomNav(),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your account is authorized")),
                    );
                    // Navigate to the home page or display a success message
                  } catch (e) {
                    // Show the error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Google",
                          style: AppConstants.bodyText(
                            fontSize: 16,
                            color: AppConstants.primaryColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/google.png')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff2C5680)),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("This Feature is not available for now")),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Facebook",
                          style: AppConstants.bodyText(
                            fontSize: 16,
                            color: AppConstants.primaryColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/facebook.png')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              borderRadius: 8,
              color: Colors.grey.shade100,
              height: 50,
              textColor: Color(0xff2C5680),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Login(),
                  ),
                );
              },
              text: "Signin with Email",
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              borderRadius: 8,
              color: Colors.grey.shade100,
              height: 50,
              textColor: Color(0xff2C5680),
              onPressed: () {},
              text: "Connect Your Wallet ",
            ),
            SizedBox(
              height: 30,
            ),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Text("OR"),
              Expanded(child: Divider()),
            ]),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              borderRadius: 8,
              color: const Color(0xff2C5680),
              height: 50,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Signup(),
                  ),
                );
              },
              text: "New to Learn3? Create Account",
            ),
          ],
        ),
      ),
    );
  }
}
