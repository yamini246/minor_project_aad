import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email,_password,_name;

  checkAuthentification() async{
    _auth.authStateChanges().listen((user){

      if(user != null)
      {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState(){
    super.initState();
    this.checkAuthentification();
  }

  register() async{
    if(_formKey.currentState!.validate())
    {
      _formKey.currentState!.save();

      try{
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        if (user != null)
          {
            await _auth.currentUser!.updateDisplayName(_name);
          }
      }
      catch(e){
        showError('$e');
        print('caught error: $e');
      }
    }
  }

  showError(String message){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(message),

            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'Start');
          },
        ),
        backgroundColor: Colors.teal,
        title: Text('REGISTER'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                              validator: (input)
                              {
                                if(input!.isEmpty)
                                  return 'Enter Name!';
                              },
                              decoration: InputDecoration (
                                labelText: 'Display Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                              onSaved : (input) => _name = input!

                          ),
                        ),
                        Container(
                          child: TextFormField(

                              validator: (input)
                              {
                                if(input!.isEmpty)
                                  return 'Enter Email!';
                              },
                              decoration: InputDecoration (
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                              onSaved : (input) => _email = input!

                          ),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input)
                              {
                                if(input!.length<6)
                                  return 'Minimum length of the password should be 6!';
                              },
                              decoration: InputDecoration (
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock)
                              ),
                              obscureText: true,
                              onSaved : (input) => _password = input!
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 300,
                          child: RaisedButton(
                            onPressed: register,
                            child: Text('CREATE ACCOUNT',style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.teal,
                          ),
                        )
                      ],
                    ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
