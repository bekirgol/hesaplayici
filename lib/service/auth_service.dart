import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> girisYap(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future<User> kullaniciOlustur(String ad, String soyad, String kullaniciAdi,
      String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore.collection('Kullanıcı').doc(user.user.uid).set({
      'Ad': ad,
      'Soyad': soyad,
      'Kullanıcı Adı': kullaniciAdi,
      'email': email,
      'parola': password,
    });
    return user.user;
  }

  cikisYap() async {
    return await _auth.signOut();
  }
}
