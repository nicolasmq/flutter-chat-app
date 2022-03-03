import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData? icon;
  final String? placeholder;
  final TextEditingController? textController;
  final TextInputType? keyboardType;
  final bool? isPassword;

  const CustomInput(
      {Key? key,
      this.icon,
      this.placeholder,
      this.textController,
      this.keyboardType,
      this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0, right: 20.0),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: isPassword!,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeholder),
      ),
    );
  }
}
