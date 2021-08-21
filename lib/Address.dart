import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'Account');
          },
        ),
        backgroundColor: Colors.teal,
        title: Text('Add Address'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                                decoration: InputDecoration (
                                labelText: 'Full Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              decoration: InputDecoration (
                                labelText: 'House no. / Building Name',
                                prefixIcon: Icon(Icons.house),
                              ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              decoration: InputDecoration (
                                  labelText: 'Locality',
                                  prefixIcon: Icon(Icons.add_road)
                              ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration (
                                labelText: 'City',
                                prefixIcon: Icon(Icons.location_city)
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration (
                                labelText: 'Pin code',
                                prefixIcon: Icon(Icons.lock)
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 300,
                          child: RaisedButton(
                            onPressed: (){
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: const Text('Address was added.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text('Add Address',style: TextStyle(
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
