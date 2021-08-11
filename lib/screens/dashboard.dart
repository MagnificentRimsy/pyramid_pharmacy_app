import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pyramid_pharmacy/screens/drawer.dart';
import 'package:pyramid_pharmacy/screens/results_page.dart';
import 'package:pyramid_pharmacy/screens/send_prescription.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Money Management',
//       theme: ThemeData(primarySwatch: Colors.purple),
//       home: DashboardPage(),
//     );
//   }
// }

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  String name;

  
  @override
  void initState() {
    super.initState();
    _isLoggedIn();
  }

   SharedPreferences _prefs;
    Widget _userIcon = Image.asset(
    'assets/images/user2.png',
    fit: BoxFit.contain,
    height: 80,
    width: 100,
  );
   
 
    _isLoggedIn() async {
    _prefs = await SharedPreferences.getInstance();
    int userId = _prefs.getInt('userId');
    String userName = _prefs.getString('name');
   

    setState(() {
      name = userName;
    });
  
  }
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFF071041);

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor, border: Border.all(color: primaryColor)),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DrawerScreen(),
                                type: PageTransitionType.fade));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 350.0,
                    decoration: BoxDecoration(color: primaryColor),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                           "$name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'You\'re welcome Back!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          )
                        ],
                      ),
                      Material(
                        elevation: 1.0,
                        borderRadius: BorderRadius.circular(100.0),
                        color: Color(0xFF93c800),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/send-presecription');
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          child: Text(
                            'Submit Prescription',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 370.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.purple.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.alarm),
                                      color: Colors.purple,
                                      iconSize: 30.0,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Book Appointment',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),

                              // Column(
                              //   children: <Widget>[
                              //     Material(
                              //       borderRadius: BorderRadius.circular(100.0),
                              //       color: Colors.blue.withOpacity(0.1),
                              //       child: IconButton(
                              //         padding: EdgeInsets.all(15.0),
                              //         icon: Icon(Icons.credit_card),
                              //         color: Colors.blue,
                              //         iconSize: 30.0,
                              //         onPressed: () {},
                              //       ),
                              //     ),
                              //     SizedBox(height: 8.0),
                              //     Text('Pay',
                              //         style: TextStyle(
                              //             color: Colors.black54,
                              //             fontWeight: FontWeight.bold))
                              //   ],
                              // ),

                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.orange.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.receipt),
                                      color: Colors.orange,
                                      iconSize: 30.0,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('View Prescriptions',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.pink.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.favorite),
                                        color: Colors.pink,
                                        iconSize: 30.0,
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('BMI Calculator',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/bmi-input');
                                },
                              ),

                              // GestureDetector(
                              //   child: Column(
                              //     children: <Widget>[
                              //       Material(
                              //         borderRadius:
                              //             BorderRadius.circular(100.0),
                              //         color:
                              //             Colors.purpleAccent.withOpacity(0.1),
                              //         child: IconButton(
                              //           padding: EdgeInsets.all(15.0),
                              //           icon: Icon(Icons.favorite),
                              //           color: Colors.purpleAccent,
                              //           iconSize: 30.0,
                              //           onPressed: () {},
                              //         ),
                              //       ),
                              //       SizedBox(height: 8.0),
                              //       Text('Charity',
                              //           style: TextStyle(
                              //               color: Colors.black54,
                              //               fontWeight: FontWeight.bold))
                              //     ],
                              //   ),
                              //   onTap: () {
                              //     Navigator.pushNamed(
                              //       context,
                              //       '/bmi-input',
                              //     );
                              //   },
                              // ),

                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.deepPurple.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.alarm),
                                      color: Colors.deepPurple,
                                      iconSize: 30.0,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Medicine Reminder',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Divider(),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'You can check your blood sugar level now.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 40.0),
                              Material(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Colors.blueAccent.withOpacity(0.1),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  color: Colors.blueAccent,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/bmi-input');
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Text(
                'Recent BMI Measurements',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.0, bottom: 25.0),
              child: Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    UpcomingCard(
                      title: 'High BMI',
                      value: 280.0,
                      color: Colors.purple,
                    ),
                    UpcomingCard(
                      title: 'Low BMI',
                      value: 260.0,
                      color: Colors.blue,
                    ),
                    UpcomingCard(
                      title: 'High BMI',
                      value: 210.0,
                      color: Colors.orange,
                    ),
                    UpcomingCard(
                      title: 'Normal BMI',
                      value: 110.0,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Text('$value',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
