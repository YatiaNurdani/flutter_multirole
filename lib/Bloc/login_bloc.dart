import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:multirole/Model/login.dart';
import 'package:multirole/Helper/api_url.dart';

// const String baseUrl = 'http://192.168.65.138:8080/multirole-api/public';

class LoginBloc {
  static Future<Login> login({required String email, required String password, required String role}) async {
    final url = Uri.parse(ApiUrl.baseUrl+'/login/$role');
    print('Login URL: $url'); // Tambahkan log untuk memeriksa URL

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      print('Status Code: ${response.statusCode}'); // Tambahkan log untuk status kode
      print('Response Body: ${response.body}'); // Tambahkan log untuk isi respons

      if (response.statusCode == 200) {
        print('Login berhasil: ${response.body}');
        return Login.fromJson(jsonDecode(response.body));
      } else {
        print('Login gagal: ${response.body}');
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Error: $e'); // Tambahkan log untuk menangkap error
      throw Exception('Failed to login');
    }
  }
}