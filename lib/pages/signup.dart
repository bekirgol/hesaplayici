import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/service/auth_service.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    String _ad;
    String _soyad;
    String _kullaniciAdi;
    String _email;
    var _parola;
    AuthService _auth = AuthService();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/hesaplama.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9),
              BlendMode.dstATop,
            ),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Adınız',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (String value) {
                      _ad = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Soyadınız',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (String value) {
                      _soyad = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      _kullaniciAdi = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (String value) {
                      _email = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Parola',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    obscureText: true,
                    onChanged: (String value) {
                      _parola = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    child: Text(
                      'KAYDET',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _auth
                          .kullaniciOlustur(
                              _ad, _soyad, _kullaniciAdi, _email, _parola)
                          .then(
                            (value) => Navigator.pushNamed(context, '/logout'),
                          );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
