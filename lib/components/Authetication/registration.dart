import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/data/registration_dao.dart';
import 'package:second_shopp/data/registration_data.dart';

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
                        inputFile(
                            label: "Phone Number",
                            providedController: _phoneController),
                        inputFile(
                            label: "email",
                            providedController: _emailController),
                        inputFile(
                            label: "password",
                            obscureText: true,
                            providedController: _passwordController),
                        // inputFile(label: "Credit Card Number")
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
                          onPressed: () {
                            _storeUsers(registrationDao);
                            // Navigator.pop(context);
                          },
                          color: Colors.orange.shade400,
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text("Register",
                              style: TextStyle(
                                // fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.white,
                              ))),
                    )),
              ])),
        ],
      ),
    ));
  }

  void _storeUsers(Registration_Dao registrationDao) {
    final register = Registration(
        name: _nameController.text,
        address: _addressController.text,
        phone: int.parse(_phoneController.text),
        email: _emailController.text,
        password: _passwordController.text);
    registrationDao.saveUser(register);

    _nameController.clear();
    _addressController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {});
  }
}

Widget inputFile({label, obscureText = false, providedController}) {
  // ignore: prefer_const_literals_to_create_immutables
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            // color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 3,
        ),
        TextField(
          controller: providedController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ]);
}
