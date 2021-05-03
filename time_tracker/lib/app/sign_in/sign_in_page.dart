import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/services/auth_provider.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);

      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);

      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Time Tracker'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () => _signInWithGoogle(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/google-logo.png'),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Sign In with Google',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Image.asset('images/google-logo.png'),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(primary: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => _signInWithFacebook(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/facebook-logo.png'),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Sign In with Facebook',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Opacity(
                      opacity: 0,
                      child: Image.asset('images/facebook-logo.png')),
                ],
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => _signInWithEmail(context),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Sign In with Email',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.teal[700]),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'or',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => _signInAnonymously(context),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Go anonymous',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.limeAccent),
            ),
          ],
        ));
  }
}
