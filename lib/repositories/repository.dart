import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sqflite/sqlite_api.dart';

import './db.connection.dart';

class Repository {
  DatabaseConnection _connection;

  String url = 'https://app.pyramidpharmacy.com/api';

  Repository() {
    _connection = new DatabaseConnection();
  }

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;

    _db = await _connection.setDb();
    return _db;
  }

  httpGet(String api, String token) async {
    try {
      return await http.get(Uri.parse('$url/$api'),
          headers: {
              "Accept": "application/json",
              "Content-type": "application/json",
              // HttpHeaders.authorizationHeader: 'Bearer $token'
            
            });
    } catch (exception) {
      print(exception.toString());
    }
  }



    httpGetDistributionsByBvn(String api, bvn, firstOid,  secondOid,  thirdOid,  lastOid) async {
    try {

    var result =   await http.get(
          Uri.parse(url + '/' + api + '?Bvn=' + bvn + '&providerOid=' + firstOid.toString() + '&anchorOid='+ secondOid.toString() +'&seasonOid='+ thirdOid.toString() + '&stateOid=' + lastOid.toString()),
           headers: {
             "Accept": "application/json",
             "Content-type": "application/json",
            //  HttpHeaders.authorizationHeader: 'Bearer $token'
             }
          );
          
          if (result.statusCode == 500) {
            return 500;
          }
          
          return result;

    } catch (exception) {
      print(exception.toString());
      
    }
  } 

// There was String token - here
  httpGetById(String api, id) async {
    try {
      return await http.get(
          Uri.parse(this.url + '/' + api + '?providerOid=' + id.toString()),
           headers: {
             "Accept": "application/json",
             "Content-type": "application/json",
            //  HttpHeaders.authorizationHeader: 'Bearer $token'
             }
          );
    } catch (exception) {
      print(exception.toString());
    }
  }

    httpGetStockItemsByStockId(String api, id) async {
    try {
      return await http.get(
          Uri.parse(this.url + '/' + api + '?stockId=' + id.toString()),
           headers: {
             "Accept": "application/json",
             "Content-type": "application/json",
              //HttpHeaders.authorizationHeader: 'Bearer $token'
             }
          );
    } catch (exception) {
      print(exception.toString());
    }
  }

  httpGetByIdWithMoreArgs(String api, firstOid,  secondOid,  thirdOid,  lastOid) async {
    try {
      return await http.get(
          Uri.parse(url + '/' + api + '?providerOid=' + firstOid.toString() +'&anchorOid='+ secondOid.toString() +'&seasonOid='+ thirdOid.toString() + '&stateOid=' + lastOid.toString()),
           headers: {
             "Accept": "application/json",
             "Content-type": "application/json",
            //  HttpHeaders.authorizationHeader: 'Bearer $token'
             }
          );
    } catch (exception) {
      print(exception.toString());
    }
  }  
 

  httpGetProductsByIds(String api, firstOid,  secondOid,  thirdOid) async {
    try {
      return await http.get(
          Uri.parse(url + '/' + api + '?seasonOid='+ firstOid.toString() + '&providerOid=' + secondOid.toString() +'&anchorOid='+ thirdOid.toString() ),
           headers: {
             "Accept": "application/json",
             "Content-type": "application/json",
            //  HttpHeaders.authorizationHeader: 'Bearer $token'
             }
          );
    } catch (exception) {
      print(exception.toString());
    }
  }

  httpPost(String api, data, String token) async {
      Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      // HttpHeaders.authorizationHeader: 'ApiKey $token'
    };

    try {
      return await http.post(Uri.parse(this.url + '/' + api),
          body:  jsonEncode(data),
          headers:headers
        );
    } catch (exception) {
      print(exception.toString());
    }
  }

  httpPut(String api, data, int id, String token) async {
    try {
      return await http.put(
          Uri.parse(this.url + '/' + api + '/' + id.toString()),
          body: data,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    } catch (exception) {
      print(exception.toString());
    }
  }

  httpDelete(String api, int id, String token) async {
    try {
      return await http.delete(
          Uri.parse(this.url + '/' + api + '/' + id.toString()),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    } catch (exception) {
      print(exception.toString());
    }
  }

  save(table, data) async {
    try {
      var conn = await db;
      return await conn.insert(table, data);
    } catch (exception) {
      print(exception.toString());
    }
  }

  getAll(table) async {
    try {
      var conn = await db;
      List<Map> list = await conn.query(table);
      return list;
    } catch (exception) {
      print(exception.toString());
    }
  }

  update(table, obj) async {
    try {
      var conn = await db;
      return await conn
          .update(table, obj, where: 'id = ?', whereArgs: [obj['id']]);
    } catch (exception) {
      print(exception.toString());
    }
  }

  delete(table) async {
    try {
      var conn = await db;
      return await conn.delete(table);
    } catch (exception) {
      print(exception.toString());
    }
  }

  getByEmail(table, email) async {
    try {
      var _con = await db;
      return await _con
          .query(table, where: 'email=?', whereArgs: <String>[email]);
    } catch (exception) {
      print(exception.toString());
    }
  }
}
