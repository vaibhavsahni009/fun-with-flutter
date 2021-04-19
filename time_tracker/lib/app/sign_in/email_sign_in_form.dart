import 'package:flutter/material.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passowordController = TextEditingController();
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit() {
    print(_emailController.text + " " + _passowordController.text);
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an Account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an Account? Register'
        : 'Have an Account? Sign In';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: 'Email', hintText: 'Example123@Test.com'),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _passowordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text(primaryText),
          ),
          TextButton(
            onPressed: _toggleFormType,
            child: Text(secondaryText),
          ),
        ],
      ),
    );
  }
}
