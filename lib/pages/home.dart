import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Seçiniz'),
            ),
            ListTile(
              title: Text('Vize-Final Hesaplama'),
              onTap: () {
                Navigator.pushNamed(context, '/vize-final');
              },
            ),
            ListTile(
              title: Text('t-Score Hesaplama'),
              onTap: () {
                Navigator.pushNamed(context, '/t-score');
              },
            ),
            ListTile(
              title: Text('Harf Notu Hesaplama'),
              onTap: () {
                Navigator.pushNamed(context, '/harfNotu');
              },
            ),
            ListTile(
              title: Text('Dönem Ortalaması'),
              onTap: () {
                Navigator.pushNamed(context, '/donem');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "HESAPLAYICI' YA HOŞGELDİNİZ",
              style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Hesaplayıcı ile yapabileceğiniz işlemler;',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(''),
            Text(
              '1-) Vize-Final Hesabı ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '2-) t-Score Hesabı ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '3-) Harf Notu Hesabı ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '4-) Dönem Ortalaması Hesabı ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
