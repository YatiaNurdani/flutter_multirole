import 'package:flutter/material.dart';
import 'package:multirole/bloc/login_bloc.dart';
import 'package:multirole/Model/login.dart';
import 'package:multirole/UI/dashboard_technician.dart';
import 'technician_register_page.dart';

class TechnicianLoginPage extends StatefulWidget {
  const TechnicianLoginPage({Key? key}) : super(key: key);

  @override
  _TechnicianLoginPageState createState() => _TechnicianLoginPageState();
}

class _TechnicianLoginPageState extends State<TechnicianLoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login as Technician'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Icon(Icons.person_outlined, color: const Color.fromARGB(255, 41, 25, 25), size: 140),
                SizedBox(height: 13),
                Text(
                  "Login As Technician",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _emailTextField(),
                      _passwordTextField(),
                      SizedBox(height: 30),
                      _buttonLogin(),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum punya akun?", style: TextStyle(fontSize: 18)),
                          _menuRegistrasi()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Membuat Textbox email
  Widget _emailTextField() {
    return TextFormField(
      controller: _emailTextboxController,
      decoration: const InputDecoration(
        hintText: "Email",
        labelText: "Email",
        prefixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }
        return null;
      },
    );
  }

  // Membuat Textbox password
  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordTextboxController,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Password",
        prefixIcon: Icon(Icons.password_rounded),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Login
  Widget _buttonLogin() {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) _submit();
          }
        },
        child: Text("Login", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final login = await LoginBloc.login(
        email: _emailTextboxController.text,
        password: _passwordTextboxController.text,
        role: 'technician',
      );

      if (login.role == 'technician') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TechnicianDashboard()),
        );
      } else {
        _showErrorDialog("Peran pengguna tidak dikenal");
      }
    } catch (e) {
      _showErrorDialog("Login gagal, silahkan coba lagi");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TechnicianRegisterPage()), // Ganti dengan halaman registrasi technician
          );
        },
      ),
    );
  }
}