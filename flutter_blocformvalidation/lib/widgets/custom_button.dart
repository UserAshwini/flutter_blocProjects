import 'package:flutter/material.dart';
import 'package:flutter_blocformvalidation/styles/colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool enabled;
  final void Function(String)? onChanged;

  const CustomButton({
    Key? key, 
    required this.text,
     this.onPressed,
     this.enabled = true,
      this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:enabled ? () => _handleTap(context) : null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration:  BoxDecoration(
            color: enabled ? Palette.appPrimaryColor : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
          child: Text(
            text,
            style:  TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: enabled ? Colors.black : Colors.white,),
          ),
        ),
      ),
    );
  }
  void _handleTap(BuildContext context) {
    onPressed?.call(); // Calling onPressed if it's not null
    if (onChanged != null) {
      onChanged!(''); // Calling onChanged if it's not null, with an empty string
    }
  }

}
