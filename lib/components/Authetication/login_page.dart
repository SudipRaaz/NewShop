import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:second_shopp/components/Authetication/registration.dart';
import 'package:second_shopp/model/auth%20service/autheticationService.dart';
import 'package:second_shopp/page_layout.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    Provider.of<User?>(context, listen: false);

    return Scaffold(
        body: ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 30, top: 30),
            child: Text(
              "Sign in",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            // color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                            onChanged: (val) {
                              setState(() {
                                _email = val;
                              });
                            },
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              // hintText: 'Enter Product Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            )),
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            // color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                            onChanged: (val) {
                              setState(() {
                                _password = val;
                              });
                            },
                            obscureText: true,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            )),
                      ]),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: TextButton(
                    onPressed: () async {
                      try {
                        print("$_email  , $_password");
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_email.trim().length == 0) {
                          showSnackBar(
                              "Enter your Email", Duration(milliseconds: 1200));
                        }

                        await _auth.sendPasswordResetEmail(
                            email: _email.trim());
                        showSnackBar("Check Your Mail Box",
                            Duration(milliseconds: 1200));
                      } catch (e) {
                        print("reset password error : $e");
                      }
                    },
                    child: const Text("Forgot Password")),
              ),
            ],
          ),
          SizedBox(
            height: 160,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40), // 120
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 3),
                  child: MaterialButton(
                      minWidth: 150,
                      height: 50,
                      onPressed: () async {
                        try {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await context.read<AuthenticationService>().signIn(
                                email: _email.trim(),
                                password: _password.trim(),
                              );
                          User? userToken = _auth.currentUser;
                          String? userID = userToken?.uid;

                          if (userID != null) {
                            print("userToken = $userID");
                            showSnackBar("Please wait ... ",
                                Duration(milliseconds: 1200));
                          } else {
                            showSnackBar("Check the creditial and Try again",
                                Duration(milliseconds: 1200));
                          }
                          ;
                        } catch (e) {
                          print("Error during login : $e");
                        }
                      },
                      color: Color.fromARGB(255, 255, 196, 107),
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 17),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                      child: const Text(
                        "Registration",
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
            ],
          )
        ])
      ],
    ));
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
      backgroundColor: Colors.deepOrange.shade400,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Widget inputFile({label, obscureText = false}) {
  return Container(
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          // color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    ]),
  );
}
