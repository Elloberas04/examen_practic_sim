import 'package:examen_practic_sim/preferences/preferences.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _isChecked = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: Preferences.correu,
            // controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            maxLength: 50,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Escrigui el seu correu',
              labelText: 'Correu',
              counterText: '',
              icon: Icon(Icons.email, size: 32.0, color: Colors.blue[800]),
            ),
          ),
          TextFormField(
            initialValue: Preferences.contrasenya,
            // controller: _passwordController,
            keyboardType: TextInputType.text,
            maxLength: 20,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Escrigui la contrasenya',
              labelText: 'Contrasenya',
              counterText: '',
              icon: Icon(Icons.lock, size: 32.0, color: Colors.blue[800]),
            ),
          ),
          CheckboxListTile(
            value: _isChecked,
            onChanged: (value) {
              _isChecked = value!;
            },
            title: Text('Recorda\'m'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          IconButton(
            onPressed: () {
              if (_isChecked) {
                Preferences.correu = _emailController.text;
                Preferences.contrasenya = _passwordController.text;
              }
              Navigator.of(context).pushNamed('home');
            },
            icon: const Icon(Icons.save),
          ),
          IconButton(
              onPressed: () {
                Preferences.correu = '';
                Preferences.contrasenya = '';
              },
              icon: const Icon(Icons.save))
        ],
      ),
    );
  }
}
