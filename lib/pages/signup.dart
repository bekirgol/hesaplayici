import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/service/auth_service.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  TextEditingController _ad = TextEditingController();
  TextEditingController _soyad = TextEditingController();
  TextEditingController _kullaniciAdi = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _parola = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // String? _ad;
    // String? _soyad;
    // String? _kullaniciAdi;
    // late String _email;
    // late var _parola;
    AuthService _auth = AuthService();
    PageState? _state;

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
                    controller: _ad,
                    decoration: InputDecoration(
                      labelText: 'Adınız',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    // onChanged: (String value) {
                    //   _ad = value;
                    // },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _soyad,
                    decoration: InputDecoration(
                      labelText: 'Soyadınız',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    // onChanged: (String value) {
                    //   _soyad = value;
                    // },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _kullaniciAdi,
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: (String value) {
                    //   _kullaniciAdi = value;
                    // },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    // onChanged: (String value) {
                    //   _email = value;
                    // },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _parola,
                    decoration: InputDecoration(
                      labelText: 'Parola',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    obscureText: true,
                    // onChanged: (String value) {
                    //   _parola = value;
                    // },
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
                      if (_state == PageState.LOADING) {
                        Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        _auth
                            .kullaniciOlustur(_ad.text, _soyad.text,
                                _kullaniciAdi.text, _email.text, _parola.text)
                            .then(
                              (value) =>
                                  Navigator.pushNamed(context, '/logout'),
                            );
                      }
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
