import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fit_gym/components/common_form_field.dart';
import 'package:fit_gym/components/custom_awesome_dialog.dart';
import 'package:fit_gym/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:fit_gym/networking/networker.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _networker = Networker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _networker.init();
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
                  minWidth: size.width / 8,
                  height: 60,
                  color: mainColor,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                    final regResult = await _networker.userRegister(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    switch (regResult) {
                      case 200:
                        customAwesomeDialog(context, 200);
                        break;
                      case 201:
                        customAwesomeDialog(context, 201);
                        break;
                      case 400:
                        customAwesomeDialog(context, 400);
                        break;
                      case 409:
                        customAwesomeDialog(context, 409);
                        break;
                      default:
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Bir Sorun Oluştu',
                          desc: 'Bir Sorun Oluştu. Tekrar Deneyiniz',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                    }
                  },
                  child: Text(
                    'Kayıt Et',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              MaterialButton(
                  minWidth: size.width / 8,
                  height: 60,
                  color: mainColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
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
