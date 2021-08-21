import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /*navigateToAccount() {
    Navigator.pushReplacementNamed(context, "Account");
  }

  navigateToAddress() {
    Navigator.pushReplacementNamed(context, "Address");
  }*/

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;
  late Razorpay _razorpay;
  //_razorpay = Razorpay();

  checkAuthentification() async{
    _auth.authStateChanges().listen((user){
      if(user==null){
        Navigator.of(context).pushReplacementNamed("Start");
      }
    });
  }


  getUser() async{
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if(firebaseUser != null)
      {
        setState(() {
          this.user = firebaseUser!;
          this.isloggedin=true;
        });
      }
  }

  signOut() async{
    _auth.signOut();
  }


  @override
  void initState(){
    super.initState();
    _razorpay = Razorpay();
        this.checkAuthentification();
    this.getUser();
  }


  void openCheckout() {
    var options = {
      'key': 'rzp_test_AKdjk046P6jrtk',
      'amount': 28200,
      'name': 'Yami',
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('$e');
    }
  }

  void alertDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          child: Text("YES"),
          onPressed: signOut
        ),

        TextButton(
          child: Text("NO"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('HOME'),
          centerTitle: true,
          elevation: 0,
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Hello !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: const Text('Account'),
              onTap: () {
                Navigator.pushReplacementNamed(context, "Account");
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: const Text('Order History'),
              onTap:() {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        content: const Text('Order History was tapped.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                    ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: const Text('Refer a Friend'),
              onTap:() {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('Referring a Friend.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },            ),
            ListTile(
              leading: Icon(Icons.call),
              title: const Text('Help & Support'),

              onTap:() {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('Help & Support is provided.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap:() => alertDialog(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: !isloggedin? Center(
            child: CircularProgressIndicator(),
          ):

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: Container(
                    child:  Image(image: AssetImage("images/smile.jpg"))
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  child: Text("Welcome ${user.displayName} !",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(onPressed: (){
                    openCheckout();
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // background
                      onPrimary: Colors.white, // foreground
                    ),
                      child: Text("Go to razor_payment screen"),),
                ),
              )



            ],

          ),
        ),
      ));

  }
}
