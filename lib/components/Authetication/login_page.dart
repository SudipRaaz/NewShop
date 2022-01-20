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
  // global form key
  final _formKey = GlobalKey<FormState>();
  // firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    Provider.of<User?>(context, listen: false);

    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          //background image for login page
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.fill)),
          ),
          Form(
            key: _formKey,
            child: ListView(
              // dismiss keyboard on screen drag
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SafeArea(
                  child: Column(children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                                  TextFormField(
                                      style: TextStyle(fontSize: 20),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("Please Enter Your Email");
                                        }
                                        // reg expression for email validation
                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Please Enter a valid email");
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          //set the email value on change
                                          _email = val;
                                        });
                                      },
                                      textAlign: TextAlign.start,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      decoration: InputDecoration(
                                        // hintText: 'Enter Product Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      )),
                                ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
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
                                TextFormField(
                                    style: const TextStyle(fontSize: 20),
                                    validator: (value) {
                                      // password validation for 6 digit
                                      RegExp regex = RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return ("Password is required for login");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter Valid Password(Min. 6 Character)");
                                      }
                                    },
                                    onChanged: (val) {
                                      setState(() {
                                        // add the password onchange
                                        _password = val;
                                      });
                                    },
                                    obscureText: true, // hide password
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    )),
                              ]),
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
                                  // on button press dismiss on screen keyboard
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  if (_email.trim().length == 0) {
                                    showSnackBar("Enter your Email",
                                        Duration(milliseconds: 1200));
                                  }
                                  // send reset password mail for entered email address
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
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.only(top: 180, left: 3),
                        child: MaterialButton(
                            minWidth: 150,
                            height: 50,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  // dismiss on screen keyboard
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  // wait for the user token for the entered email and password
                                  await context
                                      .read<AuthenticationService>()
                                      .signIn(
                                        email: _email.trim(),
                                        password: _password.trim(),
                                      );

                                  User? userToken = _auth.currentUser;
                                  String? userID = userToken?.uid;

                                  if (userID != null) {
                                    print("userToken = $userID");
                                    showSnackBar("Please wait ... ",
                                        Duration(milliseconds: 800));
                                  } else {
                                    showSnackBar(
                                        "Check the creditial and Try again",
                                        Duration(milliseconds: 800));
                                  }
                                  ;
                                } catch (e) {
                                  print("Error during login : $e");
                                }
                              }
                            },
                            color: const Color.fromARGB(255, 252, 181, 75),
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
                            // push registration page for the user registration
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
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  // snackbar for communication with user
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
      backgroundColor: Colors.deepOrange.shade400,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// label above the text fields
Widget inputFile({label, obscureText = false}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
      ]);
}
