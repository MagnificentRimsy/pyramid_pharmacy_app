import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyramid_pharmacy/constant.dart';

class SubmitSubscription extends StatefulWidget {
  SubmitSubscription({Key key}) : super(key: key);

  @override
  _SubmitSubscriptionState createState() => _SubmitSubscriptionState();
}

class _SubmitSubscriptionState extends State<SubmitSubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            prescriptionScreen() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget prescriptionScreen() {
    return Column(
      children: <Widget>[
       
        Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: Colors.black54,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              Text(
                'Submit Prescription',
                style: TextStyle(
                    fontSize: 18,
                    color: kActiveCardColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(height: 24, width: 24)
            ],
          ),
        ),
        
        Padding(
          padding: EdgeInsets.fromLTRB(5, 50, 5, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Prescription Title:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff173882),
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color(0xff173882),
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Brief description',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 24, width: 24)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/photo.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ))
            ],
          ),
        ),
       
        SizedBox(
          height: 44.0,
        ),
        new Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
          alignment: Alignment.center,
          child: new Row(
            children: <Widget>[
              Divider(
                height: 10.0,
              ),
              new Expanded(
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  color: Color(0xff173882),
                  onPressed: () =>
                      {Navigator.pushReplacementNamed(context, '/dashboard')},
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Text(
                            "Submit Prescription",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
