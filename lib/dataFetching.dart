import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  final response =
      await http.get('https://sheets.googleapis.com/v4/spreadsheets/1nKZxQH1nAVPPhpSLH1tPlYcW31-ZRM9qi7KoGvpLroc/values/ml?key=AIzaSyBHa8gIZFiDDGmSUKiDPBn6I-aDt6e0IHc');
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Something Went Wrong');
  }
}