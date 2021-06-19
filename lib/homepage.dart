import 'package:flutter/material.dart';
import 'package:fit_gym/signForm.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Color(0xff65748D),
                child: Center(
                    child: Text(
                  'Logo, Amblem',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 48),
                )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HOŞGELDİNİZ',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff65748D),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: size.width / 2.4,
                    child: SignInForm(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
