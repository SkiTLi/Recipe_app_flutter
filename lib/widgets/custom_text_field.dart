import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';

class CustomTextField extends StatefulWidget {
  // // final bool Function(int index) onChange;
  // final CustomCallback onChange;

  final TextEditingController controller;
  final String placeholder;
  final TextStyle style;
  final FormFieldValidator<String>? validator;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.placeholder,
      required this.style,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ThemeColors.greyLight,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              focusNode: _focusNode,
              cursorColor: ThemeColors.dark,
              controller: widget.controller,
              style: widget.style,
              validator: widget.validator,
              decoration: InputDecoration(
                // filled: true,
                // fillColor: ThemeColors.greyLight,
                contentPadding: EdgeInsets.all(15),
                hintText: widget.placeholder,
                hintStyle: widget.style
                    .copyWith(color: widget.style.color?.withOpacity(.5)),
                border: _NoInputBorder(),
                enabledBorder: _NoInputBorder(),
                focusedBorder: _NoInputBorder(),
                errorBorder: _NoInputBorder(),
                focusedErrorBorder: _NoInputBorder(),
                disabledBorder: _NoInputBorder(),



              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: ThemeColors.primary,
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/images/searchWhite.svg'),
          ),
          const SizedBox(width: 0),
        ],
      ),
    );
  }
}

class _NoInputBorder extends OutlineInputBorder {
  @override
  BorderSide get borderSide => const BorderSide(color: Colors.transparent);
}
