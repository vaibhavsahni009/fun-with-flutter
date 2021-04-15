import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Email', hintText: 'Example123@Test.com'),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
