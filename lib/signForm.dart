import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
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
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.vpn_key,
                  color: Color(0xff65748D),
                ),
                labelText: 'Şifre'),
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Şifreniz eksik veya hatalı';
              }
              return null;
            },
          ),
          SizedBox(
            height: size.height / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.height / 12,
                  color: Color(0xff65748D),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                    // _signIn();
                  },
                  child: Text(
                    'Kayıt Et',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.height / 12,
                  color: Color(0xff65748D),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                    // _signIn();
                  },
                  child: Text(
                    'Giriş',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
