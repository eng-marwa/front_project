import 'package:flutter/material.dart';
import 'package:front_project/core/resources/app_color.dart';
import 'package:front_project/core/resources/app_style.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false, required this.controller,
  });

  final String label;
  final String hint;
  final bool? isPassword;
  final TextEditingController controller;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppStyle.black12Color14Medium),
        const SizedBox(height: 6),
        TextFormField(controller: widget.controller,
          obscureText: widget.isPassword == true && !isVisible,
          decoration: InputDecoration(
            fillColor: AppColor.greyFAColor,
            filled: true,
            hintText: widget.hint,
            suffixIcon: widget.isPassword == true
                ? IconButton(onPressed: () {
                  setState(() {
                    isVisible=!isVisible;
                  });
            }, icon: Icon(isVisible?Icons.visibility_off:Icons.visibility),)
                : null,
            border: border(AppColor.greyFAColor),
            enabledBorder: border(AppColor.greyFAColor),
            focusedBorder:  border(AppColor.greyFAColor),
          ),
        ),
      ],
    );
  }

  InputBorder? border(Color color, [BorderStyle? style]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, style: style ?? BorderStyle.none),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
