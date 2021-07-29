import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/service/auth_service.dart';

class AuthPages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPages> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  TextEditingController _kullaniciAdi = TextEditingController();
  TextEditingController _parola = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // late var _kullaniciAdi;
    // late var _parola;
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
            child: Form(
              key: _keyForm,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _kullaniciAdi,
                      decoration: InputDecoration(
                        labelText: 'Kullanıcı Adını Giriniz',
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
                    TextFormField(
                      controller: _parola,
                      decoration: InputDecoration(
                        labelText: 'Parolayı Giriniz',
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
                        'GİRİŞ YAP',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _auth.girisYap(_kullaniciAdi.text, _parola.text).then(
                              (value) => Navigator.pushReplacementNamed(
                                  context, '/login'),
                            );
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      child: Text(
                        'KAYIT OL',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
