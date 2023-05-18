import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key, this.controller}) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofillHints: const [AutofillHints.email],
    );
  }
}
