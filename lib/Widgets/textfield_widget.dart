import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.textFieldWidth,
      this.prefix,
      this.suffix,
      this.textEditingController, this.onTap, this.height, this.inputFormatters});
  final String hintText;
  final double textFieldWidth;
  final TextEditingController? textEditingController;
  final Icon? prefix;
  final Icon? suffix;
  final Function()? onTap;
   final double? height;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.textFieldWidth,
      height: widget.height,
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        controller: widget.textEditingController,
        onTap: widget.onTap,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: widget.prefix,
            prefixIcon: widget.suffix,
            prefixIconColor: Colors.grey,
            suffixIconColor: Colors.grey,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))), 
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))), 
                focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4))), errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)))),
      ),
    );
  }
}
