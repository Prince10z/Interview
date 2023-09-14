import 'package:ecommercefirebase/features/auth/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String validateEmail(String value) {
    if (value == "") {
      return "Fill the field";
    }
    if (!EmailValidator.validate(value)) {
      return "Invalid_Email";
    }
    return "Valid Email";
  }

  String validatePassword(String value) {
    if (value == "") {
      return "Fill the password Field";
    }
    if (value.length <= 7) {
      return "please enter atleast 8 character in password";
    }
    return "Valid Password";
  }

  bool? signupischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign up"),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 17,
                ),
                Image.asset(
                  "assets/icon/Splash.png",
                  width: 200,
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: "Enter your email or Phone number",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.amber[900],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.amber[900],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blueAccent)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                          value: signupischecked,
                          activeColor: Colors.amber[900],
                          onChanged: (res) {
                            setState(() {
                              signupischecked = res;
                            });
                          }),
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 8 / 9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Colors.amber[900]),
                        onPressed: () {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();
                          String isvalidemail = validateEmail(email);
                          String isvalidpassword = validatePassword(password);
                          if (isvalidemail == "Valid Email") {
                            if (isvalidpassword == "Valid Password") {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: ((context) => SignInPage())));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text("SignUp Successfull")));
                            } else if (isvalidpassword ==
                                "Fill the password Field") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Your password is Empty")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          "Your password is less then 8 characters")));
                            }
                          } else if (isvalidemail == "Fill the field") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Please enter the email")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Your email is not Valid")));
                          }
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(fontSize: 18),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have not any account? ",
                      style: TextStyle(fontSize: 17),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Sign in",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 17))),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
