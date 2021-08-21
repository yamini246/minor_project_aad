import 'package:flutter/material.dart';


class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin() {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() {
     Navigator.pushReplacementNamed(context, "Register");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 170.0, 30.0, 0.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90.0,
                      ),
                      SizedBox(
                        width: 300,
                        child: RaisedButton(
                          onPressed: navigateToLogin,
                          child: Text('LOGIN',style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        width: 300,
                        child: RaisedButton(
                          onPressed: navigateToRegister,
                          child: Text('REGISTER',style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),



          ),
      ),
    );
  }
}
