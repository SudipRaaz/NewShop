import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //     elevation: 0,
        //     // ignore: deprecated_member_use
        //     brightness: Brightness.light,
        //     backgroundColor: Colors.white,
        //     leading: IconButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         // ignore: prefer_const_constructors
        //         icon: Icon(
        //           Icons.arrow_back_ios,
        //           size: 20,
        //           color: Colors.black,
        //         ))),
        body: SafeArea(
      child: ListView(
        children: [
          Container(
              // height: MediaQuery.of(context).size.height,
              // width: double.infinity,
              // color: Colors.cyanAccent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
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
                        inputFile(label: "Name"),
                        inputFile(label: "Address"),
                        inputFile(label: "Phone Number"),
                        inputFile(label: "email"),
                        inputFile(label: "password", obscureText: true),
                        // inputFile(label: "Credit Card Number")
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 30, left: 3),
                      /*decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            ))*/
                      child: MaterialButton(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          // minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            Navigator.pop(context);
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
}

Widget inputFile({label, obscureText = false}) {
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
