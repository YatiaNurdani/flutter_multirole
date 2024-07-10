import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multirole/Model/registrasi.dart';
import 'package:multirole/Helper/api_url.dart';

// const String baseUrl = 'http://192.168.65.138:8080/multirole-api/public';

class RegistrasiBloc {
  static Future<Registrasi> registrasi({required String nama, required String email, required String password, required String role}) async {
    final url = Uri.parse(ApiUrl.baseUrl+'/register/$role');
    print('Register URL: $url'); // Tambahkan log untuk memeriksa URL

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nama': nama,
        'email': email,
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      return Registrasi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}