import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String buttonName;
  final Function onClickFunction;
  final Color color;
  const PrimaryButton(
      {Key? key,
      required this.buttonName,
      required this.onClickFunction,
      this.color = Colors.amberAccent,})
      : super(key: key);
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClickFunction();
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          widget.buttonName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
