import 'package:flutter/material.dart';
import '../mixins/validation.dart';

class RegisterScreen extends StatefulWidget {
  createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> with Validation {
  final formKey = GlobalKey<FormState>(); //Membuat global key untuk validasi

  //Define Variabel
  String name = '';
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: formKey, //MENGGUNAKAN GLOBAL KEY
          child: Column(
            children: [
              nameField(),
              emailField(),
              passwordField(),
              registerButton(),
            ],
          )
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama Lengkap'),
      validator: validateName,
      //Validate name adalah nama fungsi dari validation.dart
      onSaved: (String value) {
        //Ketika lolos validasi
        name = value; //variabel name akan diisi dengan text yang telah diinput
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'email@example.com'),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
      ),
      validator: validatePasssword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget registerButton() {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {
        //formKey ADALAH GLOBAL KEY, KEMUDIAN DIIKUTI DENGAN currentState
        //LALU METHOD validate(), NILAINYA ADALAH FALSE / TRUE
        if (formKey.currentState.validate()) { //JIKA TRUE
          formKey.currentState.save(); //MAKA FUNGSI SAVE() DIJALANKAN

          //DISINI KAMU BISA MENGHANDLE DATA YANG SDH DITAMPUNG PADA MASING-MASING VARIABLE
          //KAMU DAPAT MENGIRIMNYA KE API ATAU APAPUN
          //NAMUN UNTUK SEMENTARA KITA PRINT KE CONSOLE SAJA
          //KARENA BELUM MEMBAHAS TENTANG HTTP REQUEST
          print('Nama lengkap: $name');
          print('Email: $email');
          print('Passwor: $password');
        }
      },
      child: Text('Daftar'),
    );
  }
}
