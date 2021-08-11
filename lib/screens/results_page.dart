import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyramid_pharmacy/components/reusable_card.dart';
import 'package:pyramid_pharmacy/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyramid_pharmacy/widgets/table-cell.dart';
import 'package:pyramid_pharmacy/widgets/theme.dart';

import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/result';
  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    final ResultPage resultPage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

        
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
                  Navigator.pushReplacementNamed(context, '/bmi-input');
                },
              ),
              Text(
                'BMI DATA',
                style: TextStyle(
                    fontSize: 18,
                    color: kActiveCardColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(height: 24, width: 24)
            ],
          ),
        ),
        
                  
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(top:0, left:15.0, right:0, bottom: 0),
              child: Text(
                'Your result:',
                style: kTitleTextStyle,
                
              ),
            ),
          ),
          Expanded(
             flex: 9,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        resultPage.resultText,
                        style: kResultTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      resultPage.bmiResult,
                      style: kBMITextStyle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      resultPage.interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE - CALCULATE',
            onTap: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
        ],
      ),
    );
  }
}
