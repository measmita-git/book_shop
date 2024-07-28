import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DTTextField extends StatefulWidget {
  final String? label;
  final String hintText;
  final String placeholder;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? textColor;
  final int? maxLength;
  TextStyle? hintStyle;
  TextStyle? textStyle;
  final Color? suffixIconColor;
  final Color? cursorColor;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(DateTime)? onDateSelected; // New callback for date selection

  // Validator function
  final String? Function(String?)? validator;

  DTTextField({
    this.maxLength,
    this.controller,
    this.label,
    this.hintText = "",
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.borderColor,
    this.suffixIcon,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.hintStyle,
    this.textStyle,
    this.borderWidth,
    required this.placeholder,
    this.suffixIconColor,
    this.cursorColor,
    this.onDateSelected,
    this.validator,
    this.onChanged,

  });

  @override
  State<DTTextField> createState() => _DTTextFieldState();
}

class _DTTextFieldState extends State<DTTextField> {

  bool _isPasswordVisible = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      // If a date is selected, trigger the callback function
      widget.onDateSelected?.call(picked);
      // Update the text field's controller with the selected date
      widget.controller?.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: widget.borderWidth ?? 1.0,
            ),
          ),
        ),
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText && !_isPasswordVisible,
          keyboardType: widget.keyboardType,
          onTap: () {
            if (widget.onDateSelected != null) {
              _selectDate(context);
            }
          },
          validator: widget.validator,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.placeholder,
            hintStyle: widget.hintStyle,
            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0), // Adjust padding as needed
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: widget.suffixIconColor,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : (widget.suffixIcon != null
                ? Icon(
              widget.suffixIcon,
              color: widget.suffixIconColor,
            )
                : null),
            border: InputBorder.none,
          ),

          cursorColor: Theme.of(context).brightness == Brightness.dark ? Color(0xffFFFFFF) : Color(0xff000000),
        ),
      ),
    );
  }
}