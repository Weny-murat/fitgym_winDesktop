import 'package:flutter/material.dart';

class CommonFormField extends StatelessWidget {
  const CommonFormField({
    required this.isObscure,
    required this.labelText,
    required this.icon,
    Key? key,
    required TextEditingController controller,
  })  : _emailController = controller,
        super(key: key);

  final TextEditingController _emailController;
  final IconData icon;
  final String labelText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      style: TextStyle(color: Color(0xFFF3A87D)),
      cursorColor: Color(0xffFE7A2B),
      controller: _emailController,
      decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Color(0xffFE7A2B),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Color(0xffFE7A2B),
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Color(0xffFE7A2B),
              width: 2.0,
            ),
          ),
          suffixIcon: Icon(
            icon,
            color: Color(0xffFE7A2B),
          ),
          labelText: labelText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText hatalı veya boş!';
        }
        return null;
      },
    );
  }
}
