import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/pages/auth.dart';

class AccountPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hesabım'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hesabım Sayfası'),
            ElevatedButton(
              child: Text('Çıkış Yap'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/logout');
              },
            )
          ],
        ),
      ),
    );
  }
}
