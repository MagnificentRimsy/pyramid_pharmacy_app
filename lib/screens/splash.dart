
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pyramid_pharmacy/screens/dashboard.dart';
import 'package:pyramid_pharmacy/widgets/color_loader_4.dart';
import 'package:pyramid_pharmacy/widgets/dot_type.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';

// import '../controllers/splash_screen_controller.dart';
// import '../repository/user_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  // SplashScreenController _con;

  // SplashScreenState() : super(SplashScreenController()) {
  //   _con = controller;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) =>  DashboardPage()));
  Navigator.pushReplacementNamed(context, '/onboarding');
          // dashboard
    });
  }

  // void loadData() {
  //   _con.progress.addListener(() {
  //     double progress = 0;
  //     _con.progress.value.values.forEach((_progress) {
  //       progress += _progress;
  //     });
  //     if (progress == 100) {
  //       try {
  //         if (currentUser.value.apiToken == null) {
  //           Navigator.of(context).pushReplacementNamed('/Login');
  //         } else {
  //           Navigator.of(context).pushReplacementNamed('/Pages', arguments: 1);
  //         }
  //       } catch (e) {}
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff173882)
          
          //  Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50),
              SpinKitThreeBounce(color: Colors.white, size: 30,)
              //  SpinKitFadingCircle(color: Colors.white, size: 50)
              // ColorLoader4(
              //   dotOneColor: Colors.lime.withOpacity(0.5),
              //   dotTwoColor: Colors.green.withOpacity(0.8),
              //   dotThreeColor: Color(0xff1b7ec2),
              //   dotType: DotType.square,
              //   duration: Duration(milliseconds: 1200),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
