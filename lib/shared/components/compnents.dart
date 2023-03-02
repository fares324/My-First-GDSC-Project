import 'package:flutter/material.dart';

Widget MYTextFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  final String? Function(String?)? validator,
  final void Function(String?)? onSubmit,
  final void Function(String?)? onChange,
  void Function()? onTap,
  required String label,
  required Icon prefix,
  bool isPasswordOnsecure = false,
  bool isClickable = true,
  void Function()? suffixPressed,
  Icon? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPasswordOnsecure,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: suffix,
              )
            : null,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
           
        ),
      ),
      validator: validator,
      
    );

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 1.25);
    path.cubicTo(
      size.width / 2 * 0.6,
      size.height * 0.5,
      size.width * 2 / 2,
      size.height * 1.3,
      size.width * 1.2,
      size.height / 1.5,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
