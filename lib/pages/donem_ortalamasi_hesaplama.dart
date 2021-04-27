import 'package:flutter/material.dart';

class DonemOrtalamasiCalculation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DonemOrtalamasiCalculation();
  }
}

class _DonemOrtalamasiCalculation extends State<DonemOrtalamasiCalculation> {
  String dersAdi = "";
  int dersKredisi = 1;
  double harfNotu = 4;
  List<Ders> tumDersler;
  double ortalama = 0;
  static int statikSayac = 0;
  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    tumDersler = [];
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dönem Ortalaması Hesaplama'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ders Adını Giriniz',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (girilenDeger) {
                  if (girilenDeger.length < 3) {
                    return "Ders Adı 2 den büyük olmalı";
                  } else {
                    return null;
                  }
                },
                onSaved: (girilenDeger) {
                  dersAdi = girilenDeger;
                  setState(() {
                    tumDersler.add(Ders(dersAdi, harfNotu, dersKredisi));
                    hesapla();
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<int>(
                    items: dersKrediItems(),
                    value: dersKredisi,
                    onChanged: (secilenKredi) {
                      setState(() {
                        dersKredisi = secilenKredi;
                      });
                    },
                  ),
                  DropdownButton<double>(
                    items: harfNotuItem(),
                    value: harfNotu,
                    onChanged: (secilenHarf) {
                      setState(() {
                        harfNotu = secilenHarf;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                child: Text('Ders Ekle'),
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    formkey.currentState.save();
                  } else {}
                },
              ),
              Text(''),
              Text(
                'Ortalama: ' + ortalama.toStringAsFixed(2),
                style: TextStyle(fontSize: 30),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemBuilder: _listeElemanlariniOlustur,
                    itemCount: tumDersler.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listeElemanlariniOlustur(BuildContext context, int index) {
    statikSayac++;

    return Dismissible(
      key: Key(statikSayac.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        setState(() {
          hesapla();
          tumDersler.removeAt(index);
        });
      },
      child: Card(
        child: ListTile(
          title: Text(tumDersler[index].ad),
          subtitle: Text(
            tumDersler[index].kredi.toString() +
                'Kredi Ders Not Değeri' +
                tumDersler[index].harfDegeri.toString(),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> dersKrediItems() {
    List<DropdownMenuItem<int>> krediler = [];
    for (var i = 1; i <= 10; i++) {
      krediler.add((DropdownMenuItem<int>(
        child: Text(
          "$i Kredi",
          style: TextStyle(fontSize: 25),
        ),
        value: i,
      )));
    }
    return krediler;
  }

  List<DropdownMenuItem<double>> harfNotuItem() {
    List<DropdownMenuItem<double>> listem = [];
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "AA Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 4,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "BA Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 3.5,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "BB Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 3,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "CB Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 2.5,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "CC Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 2,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "DC Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 1.5,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "DD Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 1,
    ));
    listem.add(DropdownMenuItem<double>(
      child: Text(
        "FF Notu ",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      value: 0,
    ));
    return listem;
  }

  void hesapla() {
    double tKredi = 0;
    double tNot = 0;
    for (var item in tumDersler) {
      var kredi = item.kredi;
      var notdegeri = item.harfDegeri;
      tNot = tNot + (notdegeri * kredi);
      tKredi = tKredi + kredi;
    }
    ortalama = tNot / tKredi;
  }
}

class Ders {
  String ad;
  double harfDegeri;
  int kredi;
  Ders(
    this.ad,
    this.harfDegeri,
    this.kredi,
  );
}
