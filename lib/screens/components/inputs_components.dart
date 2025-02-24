/*
manejo de componentes para los inputs
*/
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

class InputsComponents extends StatelessWidget {
  final String title;
  final String hintext;
  final String? initialValue;
  final bool? enabled;
  final int? maxLine;
  final bool? autocorrect;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;
  const InputsComponents({
    super.key,
    required this.title,
    required this.hintext,
    this.initialValue,
    this.enabled,
    this.maxLine,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.controller,
    required this.validator,
    required this.onChanged,
    this.autocorrect,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: size.height * .01,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: size.height * .01),
        TextFormField(
          textAlign: TextAlign.start,
          controller: controller,
          initialValue: initialValue,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          enabled: enabled,
          maxLines: maxLine ?? 1,
          autocorrect: autocorrect ?? true,
          style: Theme.of(context).textTheme.headlineMedium,
          cursorColor: PaletteTheme.principal,
          keyboardType: keyboardType ?? TextInputType.text,
          onChanged: (value) => onChanged(value),
          validator: validator,
          textInputAction: textInputAction ?? TextInputAction.done,
          decoration: InputDecoration(
            hintText: hintext,
            fillColor: PaletteTheme.cards,
            filled: true,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: PaletteTheme.grey, width: 3),
              borderRadius: BorderRadius.circular(14),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(14),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PaletteTheme.grey, width: 2),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PaletteTheme.grey, width: 2),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        )
      ],
    );
  }
}
