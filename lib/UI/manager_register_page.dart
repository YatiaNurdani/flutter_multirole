import 'package:flutter/material.dart';
import 'package:multirole/bloc/registrasi_bloc.dart';
import 'package:multirole/Model/registrasi.dart';

class ManagerRegisterPage extends StatefulWidget {
  const ManagerRegisterPage({Key? key}) : super(key: key);

  @override
  _ManagerRegisterPageState createState() => _ManagerRegisterPageState();
}

class _ManagerRegisterPageState extends State<ManagerRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register as Manager'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Icon(Icons.person_add, color: const Color.fromARGB(255, 41, 25, 25), size: 140),
                SizedBox(height: 13),
                Text(
                  "Register As Manager",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _namaTextField(),
                      _emailTextField(),
                      _passwordTextField(),
                      SizedBox(height: 30),
                      _buttonRegister(),
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

  // Membuat Textbox nama
  Widget _namaTextField() {
    return TextFormField(
      controller: _namaTextboxController,
      decoration: const InputDecoration(
        hintText: "Nama",
        labelText: "Nama",
        prefixIcon: Icon(Icons.person),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nama harus diisi';
        }
        return null;
      },
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

  // Membuat Tombol Register
  Widget _buttonRegister() {
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
        child: Text("Register", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final registrasi = await RegistrasiBloc.registrasi(
        nama: _namaTextboxController.text,
        email: _emailTextboxController.text,
        password: _passwordTextboxController.text,
        role: 'manager',
      );

      if (registrasi.status == true) {
        Navigator.pop(context);
      } else {
        _showErrorDialog("Registrasi gagal, silahkan coba lagi");
      }
    } catch (e) {
      _showErrorDialog("Registrasi gagal, silahkan coba lagi");
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
}