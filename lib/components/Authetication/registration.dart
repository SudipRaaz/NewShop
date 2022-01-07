import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/model/data/registration_dao.dart';
import 'package:second_shopp/model/data/registration_data.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Provider.of<User?>(context, listen: false);
    final registrationDao =
        Provider.of<Registration_Dao>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Registration",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                      child: Container(color: Colors.black38),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        inputFile(
                            label: "Name", providedController: _nameController),
                        inputFile(
                            label: "Address",
                            providedController: _addressController),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ]),
                        inputFile(
                            label: "email",
                            providedController: _emailController),
                        inputFile(
                            label: "password",
                            obscureText: true,
                            providedController: _passwordController),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 30, left: 3),
                      child: MaterialButton(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          // minWidth: double.infinity,
                          height: 50,
                          onPressed: () async {
                            try {
                              await _auth.createUserWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text);

                              User? userToken = _auth.currentUser;
                              String? userID = userToken?.uid;
                              print("userToken = $userID");
                              _storeUsers(registrationDao, userID);
                              Navigator.pop(context);
                            } catch (e) {
                              print("Error: $e");
                            }
                          },
                          color: Colors.orange.shade400,
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text("Register",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ))),
                    )),
              ])),
        ],
      ),
    ));
  }

  void _storeUsers(Registration_Dao registrationDao, userID) {
    final register = Registration(
        name: _nameController.text,
        address: _addressController.text,
        phone: int.parse(_phoneController.text),
        email: _emailController.text,
        password: _passwordController.text);
    registrationDao.saveUser(register, userID);

    _nameController.clear();
    _addressController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
  }
}

Widget inputFile({label, obscureText = false, providedController}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            // color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        TextField(
          controller: providedController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ]);
}
