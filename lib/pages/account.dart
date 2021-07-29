import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harfnotuhesaplama/model/modelapi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AccountPages extends StatefulWidget {
  @override
  _AccountPagesState createState() => _AccountPagesState();
}

class _AccountPagesState extends State<AccountPages> {
  File? imageFile;
  final picker = ImagePicker();
  Person? personResult;
  final url = Uri.parse(
      'https://raw.githubusercontent.com/bekirgol/bekirgol.github.io/master/apidata/api.json');

  Future callApi() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = personFromJson(response.body);
        if (mounted)
          setState(() {
            personResult = result;
          });
        return result;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _openGallery() async {
    var picture = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (picture != null) {
        imageFile = File(picture.path);
      } else {
        print('Fotoğraf seçiniz');
      }
    });
  }

  _openCamera() async {
    var picture = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (picture != null) {
        imageFile = File(picture.path);
      } else {
        print('Fotoğraf Seçiniz');
      }
      Navigator.pop(context);
    });
  }

  Future<void> _showDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Birini Seçin'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('Galeri'),
                  onTap: () {
                    _openGallery();
                  },
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  child: Text('Kamera'),
                  onTap: () {
                    _openCamera();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 80.0,
              // alignment: Alignment.center,
              child: imageFile == null
                  ? InkWell(
                      onTap: _showDialog,
                      child: Text('Fotoğraf Ekle'),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.file(
                        imageFile!,
                        width: MediaQuery.of(context).size.width - 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),

              // width: MediaQuery.of(context).size.width - 200,
              // height: 200,
              // decoration: BoxDecoration(
              //   border: Border.all(width: 1.0, color: Colors.black),
              //   borderRadius: BorderRadius.circular(100.0),
              // ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  personResult!.ad!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  personResult!.soyad!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/logout');
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'Çıkış Yap',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
