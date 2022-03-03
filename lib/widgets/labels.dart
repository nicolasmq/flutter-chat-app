import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String? route;
  final String? questionLabel;
  final String? boldLabel;

  const Labels({Key? key, this.route, this.questionLabel, this.boldLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          questionLabel!,
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
            child: Text(
              boldLabel!,
          style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
          onTap: () {
              Navigator.pushNamed(context, route!);
          },
        )
      ],
    );
  }
}
