import 'package:chat/widgets/blue_button.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../widgets/labels.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Logo(title: 'Registro',),
                const SizedBox(
                  height: 40,
                ),
                _Form(),
                const SizedBox(
                  height: 50,
                ),
                const Labels(route: 'login', questionLabel: '¿Ya tienes cuenta?', boldLabel: '¡Haz login!',),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passController = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            keyboardType: TextInputType.name,
            isPassword: false,
            placeholder: 'Nombre',
            textController: _nameController,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
            placeholder: 'Email',
            textController: _emailController,
          ),
          CustomInput(
            icon: Icons.lock_open_outlined,
            keyboardType: TextInputType.text,
            isPassword: true,
            placeholder: 'Password',
            textController: _passController,
          ),
          BlueButton(
            text: 'Ingresar',
            color: Color(Colors.blue.value),
            width: double.infinity,
            height: 55,
            elevation: 2,
            onPressed: () {
              print(_emailController.text);
            },
          )
        ],
      ),
    );
  }
}
