import 'package:flutter/material.dart';

class FirebaseEditText extends StatelessWidget {
  FirebaseEditText({
    Key? key,
    required this.nameController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController nameController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        labelText: '$hintText',
      ),
    );
  }
}

errorMessage() {
  return 'please enter email';
}

validate() {
  return '';
}
