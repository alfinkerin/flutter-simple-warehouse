import 'package:app_gudang_demo/auth_services.dart';
import 'package:flutter/material.dart';

import 'auth_services.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailControler = TextEditingController(text: "");
  TextEditingController passwordControler = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login App Gudang',
        ),
        backgroundColor: const Color(0xFF217481),
        elevation: 4.0,
        leading: Icon(Icons.wb_auto),
      ),
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.all(3),
              child: Image(
                image: NetworkImage(
                    "https://cdn.statically.io/img/cargomurah.id/f=auto%2Cq=75/wp-content/uploads/2019/07/gudang.png"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: emailControler,
                decoration: InputDecoration(hintText: 'Email address'),
              ),
            ),
            Container(
              width: 300,
              height: 80,
              child: TextField(
                controller: passwordControler,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey[800]),
                  ),
                  child: Text('Sign In'),
                  onPressed: () async {
                    await AuthServices.signIn(
                        emailControler.text, passwordControler.text);
                  }),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey[800]),
                  ),
                  child: Text('Sign Up'),
                  onPressed: () async {
                    await AuthServices.signUp(
                        emailControler.text, passwordControler.text);
                  }),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF217481),
                    ),
                  ),
                  child: Text('Guest Login'),
                  onPressed: () async {
                    await AuthServices.signInAnonymous();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
