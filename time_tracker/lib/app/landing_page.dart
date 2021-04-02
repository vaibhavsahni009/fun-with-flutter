import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/home_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_page.dart';
import 'package:time_tracker/services/auth.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  const LandingPage({Key key, @required this.auth}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() {
    widget.auth.authStateChanges().listen((user) {
      print('uid ${user?.uid}');
    });
    _updateUser(widget.auth.currentUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? SignInPage(
            auth: widget.auth,
            onSignIn: _updateUser,
          )
        : HomePage(
            auth: widget.auth,
            onSignOut: () => _updateUser(null),
          );
  }
}
