import 'package:ecommercefirebase/features/auth/Signup_screen.dart';
import 'package:ecommercefirebase/features/dashboard/dashboard.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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

  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Sign in",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icon/Splash.png"), opacity: 0.07),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 15, right: 15, bottom: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                              color: Colors.amber[900],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "Sign in to Continue",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: "Enter your email or Phone number",
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.amber[900],
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.blueAccent)),
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
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.amber[900],
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.blueAccent)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 99 / 100,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                    value: ischecked,
                                    activeColor: Colors.amber[900],
                                    onChanged: (val) {
                                      setState(() {
                                        ischecked = val;
                                      });
                                    }),
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Text(
                            "Forget password?",
                            style: TextStyle(
                                color: Colors.amber[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 8 / 9,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.all(10),
                                backgroundColor: Colors.amber[900]),
                            onPressed: () {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              String isvalidemail = validateEmail(email);
                              String isvalidpassword =
                                  validatePassword(password);
                              if (isvalidemail == "Valid Email") {
                                if (isvalidpassword == "Valid Password") {
                                  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: ((context) =>
                                              const HomeScreen())));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text("LogIn Successfull")));
                                } else if (isvalidpassword ==
                                    "Fill the password Field") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          content:
                                              Text("Your password is Empty")));
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
                                        content:
                                            Text("Please enter the email")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content:
                                            Text("Your email is not Valid")));
                              }
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(fontSize: 18),
                            ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1 / 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have not an account? ",
                          style: TextStyle(fontSize: 17),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                            },
                            child: const Text("SignUp",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17))),
                      ],
                    )
                  ],
                ),
              )),
        )),
      ),
    );
  }
}
