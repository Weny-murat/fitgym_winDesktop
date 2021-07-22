import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fit_gym/components/common_form_field.dart';
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
                  minWidth: MediaQuery.of(context).size.width / 8,
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
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Kayıt Başarılı 200',
                          desc: 'Kayıt Başarılı Artık Giriş Yapabilirsiniz.',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                        break;
                      case 201:
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Kayıt Başarılı 201',
                          desc: 'Kayıt Başarılı Artık Giriş Yapabilirsiniz.',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                        break;
                      case 400:
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Kayıt Başarısız',
                          desc: 'Kayıt Başarısız Tekrar Deneyin',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                        break;
                      case 409:
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Mail Adresi Zaten Kayıtlı.',
                          desc:
                              'Mail Adresi kayıtlı Lütfen Başka Bir Mail Adresi Kullanın',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                        break;
                      default:
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Kayıt Başarılı Default',
                          desc: 'Kayıt Başarılı Artık Giriş Yapabilirsiniz.',
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
                  minWidth: MediaQuery.of(context).size.width / 8,
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
