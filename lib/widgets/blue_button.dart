import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? elevation;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const BlueButton(
      {Key? key,
      required this.text,
      this.color,
      this.elevation,
      required this.onPressed,
      this.width,
      this.height
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: width,
        height: height,
        child: Center(child: Text(text!, style: const TextStyle(fontSize: 18),)),),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color)
      ),
      onPressed: onPressed,
    );
  }
}
