import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VizeFinalCalculation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VizeFinalCalculation();
  }
}

class _VizeFinalCalculation extends State<VizeFinalCalculation> {
  final TextEditingController t1 = new TextEditingController(text: '');
  final TextEditingController t2 = new TextEditingController(text: '');

  var vizePuani = 0;
  var finalPuani = 0;
  var ortalama = 0.0;

  void topla() {
    setState(() {
      vizePuani = int.parse(t1.text);
      finalPuani = int.parse(t2.text);
      ortalama = (vizePuani * 40 / 100 + finalPuani * 60 / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vize-Final Hesaplama'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Vize Puanı
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Vize Puanı ( %40 )',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: t1,
            ),
            Text(''),
            // Final Puanı
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Final Puanı ( %60 )',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: t2,
            ),
            Text(''),
            // Button
            ElevatedButton(
              child: Text('Hesapla'),
              onPressed: () {
                topla();
              },
            ),
            Text(''),
            Center(
              child: Text(
                "Ortalama: $ortalama",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
