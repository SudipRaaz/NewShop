import 'package:flutter/material.dart';
import 'package:second_shopp/components/Authetication/registration.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
      child: Container(
        /*child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Registration",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  child: MaterialButton(
                    height: 60
                  ),
              ),
            ),
            )*/
        // color: Colors.blueGrey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign in",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: <Widget>[
                    inputFile(label: "Email"),
                    const SizedBox(
                      height: 10,
                    ),
                    inputFile(label: "Password", obscureText: true)
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: TextButton(
                        onPressed: () {}, child: Text("Forget Password")),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()));
                    },
                    child: Text(
                      "Registration",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 110),
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 3),
                  child: FlatButton(
                      minWidth: double.infinity,
                      height: 30,
                      onPressed: () {},
                      color: Colors.white70,
                      child: Text("Signup with Google",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.blue,
                          ))),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 3),
                  child: MaterialButton(
                      minWidth: 150,
                      height: 50,
                      onPressed: () {},
                      color: Colors.orange.shade400,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ))),
                ),
              )
            ]),
      ),
    ));
  }
}

Widget inputFile({label, obscureText = false}) {
  // ignore: prefer_const_literals_to_create_immutables
  return Container(
    // width: 15,
    // color: Colors.brown,
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          // color: Colors.black87,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    ]),
  );
}
