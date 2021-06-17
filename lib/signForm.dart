import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.supervisor_account,
                  color: Color(0xff65748D),
                ),
                labelText: 'Kullanıcı Adı'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kullancı Adı hatalı!';
              }
              return null;
            },
          ),
          SizedBox(
            height: size.height / 25,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.vpn_key),
            ),
          ),
          SizedBox(
            height: size.height / 25,
          ),
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 12,
              color: Color(0xff65748D),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text(
                'Giriş',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
    );
  }
}
