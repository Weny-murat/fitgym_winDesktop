import 'package:fit_gym/components/components.dart';
import 'package:fit_gym/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          CommonFormField(
            controller: _emailController,
            icon: Icons.supervisor_account,
            labelText: 'Kullanıcı Adı',
            isObscure: false,
          ),
          SizedBox(
            height: size.height / 25,
          ),
          CommonFormField(
              isObscure: true,
              labelText: 'Şifre',
              icon: Icons.vpn_key,
              controller: _passwordController),
          SizedBox(
            height: size.height / 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 8,
                  height: 60,
                  color: Color(0xffFE7A2B),
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
                  height: 60,
                  color: Color(0xffFE7A2B),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      Get.to(() => MainPage());
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
