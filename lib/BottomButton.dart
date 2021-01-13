import 'package:flutter/material.dart';

import 'constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.buttonText, @required this.route});

  final String buttonText;
  final String route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
