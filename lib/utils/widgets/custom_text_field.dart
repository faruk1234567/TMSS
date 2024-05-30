import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final String? initialValue;
  final bool? isSuffixIcon;
  final Widget?SuffixIcon;
  final bool readOnly;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? isIcon;
  final Widget? icon;
  final Widget? icon2;
  final int? maxLength;
  final bool ?suffixIcon;
  final Widget? InkWell;
  final Widget?decoration;

  final bool? obscureText;
  final TextEditingController? controll;
  final void Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    this.readOnly = true,
    this.isSuffixIcon,
    this.labelText,
    required this.hintText,
    this.initialValue,
    this.textInputType,
    this.textInputAction,
    this.isIcon = false,
    this.icon,
    this.maxLength,
    this.obscureText,
    this.validator,
    this.icon2,
    this.controll,
    this.onChanged,
    this.suffixIcon,
    this.InkWell,
    this.decoration,
    this.SuffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 1),
            blurRadius: 2,
          )
        ],
      ),
      child: TextFormField(
        autofocus: true,
        maxLength: maxLength,
        obscureText: obscureText!,
        textInputAction: textInputAction,
        validator: validator,
        keyboardType: textInputType,
        enabled: readOnly,
        cursorColor: Colors.black,
        initialValue: initialValue,
        onChanged: onChanged,
        controller: controll,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black26),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),

          prefixIcon: isIcon == true ? icon : null,
          suffixIcon: isSuffixIcon == true ? icon2 : null,
          // border: InputBorder.none,
          // focusedBorder: InputBorder.none,
          // enabledBorder: InputBorder.none
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0),
          ),
        ),
      ),
    );
  }
}
