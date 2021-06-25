import 'package:flutter/material.dart';

class AboutUsPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hakkımızda'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: Text(
          'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodllu MOBİL PROGRAMLAMA dersi kapsamında 183311062 numaralı Bekir GÖL tarafından 30 Nisan 2021 günü yapılmıştır.',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
