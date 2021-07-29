import 'package:flutter/material.dart';

class HarfNotuCalculation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HarfNotuCalculation();
  }
}

class _HarfNotuCalculation extends State<HarfNotuCalculation> {
  final TextEditingController sOrtalamasi = new TextEditingController();
  final TextEditingController score = new TextEditingController();

  var sinifOrtalmasi = 0;
  var tScore = 0;
  var harfNotu = '';

  void hesapla() {
    sinifOrtalmasi = int.parse(sOrtalamasi.text);
    tScore = int.parse(score.text);

    setState(() {
      if (sinifOrtalmasi < 69.99 && sinifOrtalmasi > 62.50) {
        if (tScore < 100 && tScore > 61) {
          harfNotu = 'AA';
        } else if (tScore < 60.99 && tScore > 56) {
          harfNotu = 'BA';
        } else if (tScore < 55.99 && tScore > 51) {
          harfNotu = 'BB';
        } else if (tScore < 50.99 && tScore > 46) {
          harfNotu = 'CB';
        } else if (tScore < 45.99 && tScore > 41) {
          harfNotu = 'CC';
        } else if (tScore < 40.99 && tScore > 36) {
          harfNotu = 'DC';
        } else if (tScore < 35.99 && tScore > 31) {
          harfNotu = 'DD';
        } else {
          harfNotu = 'FF';
        }
      } else if (sinifOrtalmasi < 62.49 && sinifOrtalmasi > 57.50) {
        if (tScore < 100 && tScore > 63) {
          harfNotu = 'AA';
        } else if (tScore < 62.99 && tScore > 58) {
          harfNotu = 'BA';
        } else if (tScore < 57.99 && tScore > 53) {
          harfNotu = 'BB';
        } else if (tScore < 52.99 && tScore > 48) {
          harfNotu = 'CB';
        } else if (tScore < 47.99 && tScore > 43) {
          harfNotu = 'CC';
        } else if (tScore < 42.99 && tScore > 38) {
          harfNotu = 'DC';
        } else if (tScore < 37.99 && tScore > 33) {
          harfNotu = 'DD';
        } else {
          harfNotu = 'FF';
        }
      } else if (sinifOrtalmasi < 57.49 && sinifOrtalmasi > 52.50) {
        if (tScore < 100 && tScore > 65) {
          harfNotu = 'AA';
        } else if (tScore < 64.99 && tScore > 60) {
          harfNotu = 'BA';
        } else if (tScore < 59.99 && tScore > 55) {
          harfNotu = 'BB';
        } else if (tScore < 54.99 && tScore > 50) {
          harfNotu = 'CB';
        } else if (tScore < 49.99 && tScore > 45) {
          harfNotu = 'CC';
        } else if (tScore < 44.99 && tScore > 40) {
          harfNotu = 'DC';
        } else if (tScore < 39.99 && tScore > 35) {
          harfNotu = 'DD';
        } else {
          harfNotu = 'FF';
        }
      } else if (sinifOrtalmasi < 52.49 && sinifOrtalmasi > 47.50) {
        if (tScore < 100 && tScore > 67) {
          harfNotu = 'AA';
        } else if (tScore < 66.99 && tScore > 62) {
          harfNotu = 'BA';
        } else if (tScore < 61.99 && tScore > 57) {
          harfNotu = 'BB';
        } else if (tScore < 56.99 && tScore > 52) {
          harfNotu = 'CB';
        } else if (tScore < 51.99 && tScore > 47) {
          harfNotu = 'CC';
        } else if (tScore < 46.99 && tScore > 42) {
          harfNotu = 'DC';
        } else if (tScore < 41.99 && tScore > 37) {
          harfNotu = 'DD';
        } else {
          harfNotu = 'FF';
        }
      } else if (sinifOrtalmasi < 47.49 && sinifOrtalmasi > 42.50) {
        if (tScore < 100 && tScore > 69) {
          harfNotu = 'AA';
        } else if (tScore < 68.99 && tScore > 64) {
          harfNotu = 'BA';
        } else if (tScore < 63.99 && tScore > 59) {
          harfNotu = 'BB';
        } else if (tScore < 58.99 && tScore > 54) {
          harfNotu = 'CB';
        } else if (tScore < 53.99 && tScore > 49) {
          harfNotu = 'CC';
        } else if (tScore < 48.99 && tScore > 44) {
          harfNotu = 'DC';
        } else if (tScore < 43.99 && tScore > 39) {
          harfNotu = 'DD';
        } else {
          harfNotu = 'FF';
        }
      } else {
        if (tScore < 100 && tScore > 71) {
          harfNotu = 'AA';
        } else if (tScore < 70.99 && tScore > 66) {
          harfNotu = 'BA';
        } else if (tScore < 65.99 && tScore > 61) {
          harfNotu = 'BB';
        } else if (tScore < 60.99 && tScore > 56) {
          harfNotu = 'CB';
        } else if (tScore < 55.99 && tScore > 51) {
          harfNotu = 'CC';
        } else if (tScore < 50.99 && tScore > 46) {
          harfNotu = 'DC';
        } else if (tScore < 45.99 && tScore > 41) {
          harfNotu = 'DD';
        } else {
          harfNotu = 'FF';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harf Notu Hesaplama'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'HBNO (Sınıf Ortalamasını Giriniz)',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: sOrtalamasi,
            ),
            Text(''),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 't-Score Giriniz',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: score,
            ),
            Text(''),
            ElevatedButton(
              child: Text('Hesapla'),
              onPressed: () {
                hesapla();
              },
            ),
            Text(''),
            Text(
              'Harf Notu: $harfNotu',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
