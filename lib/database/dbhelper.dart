// import 'dart:async';
// import 'dart:io' as io;
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:harfnotuhesaplama/model/personmodel.dart';

// class DbHelper {
//   static Database? _db;

//   final String tablePerson = 'Person';
//   final String columnId = 'id';
//   final String columnAd = 'ad';
//   final String columnSoyad = 'soyad';
//   final String columnKullaniciAdi = 'kullaniciadi';
//   final String columnEmail = 'email';
//   final String columnParola = 'parola';

//   Future<Database?> get db async {
//     if (_db != null) return _db;
//     _db = await initDb();
//   }

//   initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'Cars2019.db');
//     var MyDb = await openDatabase(path, version: 3, onCreate: _onCreate);
//     return MyDb;
//   }

//   void _onCreate(Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE $tablePerson($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnAd TEXT, $columnSoyad TEXT, $columnKullaniciAdi TEXT, $columnEmail TEXT, $columnParola TEXT)');
//   }

//   Future<int> deletePerson(int id) async {
//     var dbClient = await (db as FutureOr<Database>);
//     await dbClient.transaction((txn) async {
//       return await txn
//           .rawDelete('DELETE FROM $tablePerson WHERE $columnId = $id');
//     });
//   }

//   Future<int> updatePerson(Person person) async {
//     var dbClient = await (db as FutureOr<Database>);
//     await dbClient.transaction((txn) async {
//       return await txn.rawUpdate(
//           'UPDATE $tablePerson SET $columnAd = \'${person.ad},\', $columnSoyad = \'${person.soyad}\', $columnKullaniciAdi = ${person.kullaniciadi}, $columnEmail = \'${person.email}\', ${columnParola} = \'${person.parola} WHERE $columnId = ${person.id}');
//     });
//   }

//   void saveCar(Person person) async {
//     var dbClient = await (db as FutureOr<Database>);
//     await dbClient.transaction((txn) async {
//       return await txn.rawInsert(
//           'INSERT INTO $tablePerson ($columnAd, $columnSoyad, $columnKullaniciAdi, $columnEmail, $columnParola) VALUES(' +
//               '\'' +
//               person.ad! +
//               '\'' +
//               ',' +
//               '\'' +
//               person.soyad! +
//               '\'' +
//               ',' +
//               person.kullaniciadi! +
//               ',' +
//               '\'' +
//               person.email! +
//               '\'' +
//               ',' +
//               person.parola! +
//               '\'' +
//               ')');
//     });
//   }

//   Future<List<Person>> getCars() async {
//     var dbClient = await (db as FutureOr<Database>);
//     List<Map> list = await dbClient.rawQuery('SELECT * FROM $tablePerson Cars');
//     List<Person> person = List();
//     for (int i = 0; i < list.length; i++) {
//       person.add(Person(
//         list[i]['ad'],
//         list[i]['soyad'],
//         list[i]['kullaniciadi'],
//         list[i]['email'],
//         list[i]['parola'],
//       ));
//     }
//     return person;
//   }
// }
