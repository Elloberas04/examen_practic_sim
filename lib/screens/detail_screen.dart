import 'package:examen_practic_sim/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userForm = Provider.of<UserService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: _UserForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (userForm.isValidForm()) {
            userForm.saveOrCreateUser();
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

class _UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userForm = Provider.of<UserService>(context);
    final tempUser = userForm.tempUser;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: _buildBoxDecoration(),
          child: Form(
            key: userForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  initialValue: tempUser.name,
                  onChanged: (value) => tempUser.name = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El nom és obligatori';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nom', labelText: 'Nom:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: '${tempUser.email}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}')),
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      tempUser.email = '';
                    } else {
                      tempUser.email = value;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Email', labelText: 'Email:'),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: tempUser.address,
                  onChanged: (value) => tempUser.address = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El address és obligatori';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'address', labelText: 'address:'),
                ),
                TextFormField(
                  initialValue: tempUser.phone,
                  onChanged: (value) => tempUser.phone = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El phone és obligatori';
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'phone', labelText: 'phone:'),
                ),
                FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(tempUser.photo),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5),
        ],
      );
}
