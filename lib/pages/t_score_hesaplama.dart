import 'package:flutter/material.dart';

class TScoreCalculation extends StatefulWidget {
  @override
  _TScoreCalculation createState() => _TScoreCalculation();
}

class _TScoreCalculation extends State<TScoreCalculation> {
  final TextEditingController sOrtalamasi = new TextEditingController();
  final TextEditingController nOrtalamasi = new TextEditingController();
  final TextEditingController sSapma = new TextEditingController();

  var sinifOrtalamasi = 0;
  var notOrtalamasi = 0;
  var standartSapma = 0;
  double tScore = 0.0;

  void hesapla() {
    setState(() {
      sinifOrtalamasi = int.parse(sOrtalamasi.text);
      notOrtalamasi = int.parse(nOrtalamasi.text);
      standartSapma = int.parse(sSapma.text);
      tScore = (((notOrtalamasi - sinifOrtalamasi) / standartSapma) * 10) + 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('t-Score Hesaplama'),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'HBNO (Sınıf Ortalması) Giriniz',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: sOrtalamasi,
              ),
              Text(''),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Not Ortalamanızı Giriniz',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: nOrtalamasi,
              ),
              Text(''),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Standart Sapma Giriniz',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: sSapma,
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
                't-Score: $tScore',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ));
  }
}
