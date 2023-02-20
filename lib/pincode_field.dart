import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DashPinCodeField extends StatefulWidget {
  const DashPinCodeField({
    Key? key,
    this.iconColor,
    this.length,
    this.obscureText,
    this.obscuringCharacter,
    this.borderRadius,
    this.fieldHeight,
    this.fieldWidth,
    this.activeFillColor,
    this.activeColor,
    this.inactiveFillColor,
    this.inactiveColor,
    this.selectedFillColor,
    this.selectedColor,
    this.enableActiveFill,
    this.cursorColor,
    this.onChangeFunction,
    this.onSubmitFunction,
  }) : super(key: key);
  final Color? iconColor;
  final int? length;
  final bool? obscureText;
  final String? obscuringCharacter;
  final double? borderRadius;
  final double? fieldHeight;
  final double? fieldWidth;
  final Color? activeFillColor;
  final Color? activeColor;
  final Color? inactiveFillColor;
  final Color? inactiveColor;
  final Color? selectedFillColor;
  final Color? selectedColor;
  final bool? enableActiveFill;
  final Color? cursorColor;
  final Future<dynamic> Function()? onChangeFunction;
  final Future<dynamic> Function()? onSubmitFunction;

  @override
  State<DashPinCodeField> createState() => _DashPinCodeFieldState();
}

class _DashPinCodeFieldState extends State<DashPinCodeField> {
  bool _obsureTextState = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pin"),
            IconButton(
              onPressed: () {
                setState(() {
                  _obsureTextState = !_obsureTextState;
                });
              },
              icon: Icon(
                _obsureTextState ? Icons.visibility : Icons.visibility_off,
                color: widget.iconColor ?? Colors.black,
              ),
            ),
          ],
        ),
        PinCodeTextField(
          appContext: context,
          length: widget.length ?? 4,
          obscureText: _obsureTextState,
          obscuringCharacter: widget.obscuringCharacter ?? "*",
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
            fieldHeight: widget.fieldHeight ?? 50,
            fieldWidth: widget.fieldWidth ?? 50,
            activeFillColor: widget.activeFillColor ?? Colors.white,
            activeColor: widget.activeColor ?? Colors.green,
            inactiveFillColor: widget.iconColor ?? Colors.white,
            inactiveColor: widget.inactiveColor ?? Colors.grey,
            selectedFillColor: widget.selectedFillColor ?? Colors.white,
            selectedColor: widget.selectedColor ?? Colors.green,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: widget.enableActiveFill ?? true,
          cursorColor: widget.cursorColor ?? Colors.black,
          controller: null,
          keyboardType: TextInputType.number,
          inputFormatters: [MaskTextInputFormatter(mask: '####')],
          onCompleted: (v) {
            if (widget.onChangeFunction != null) {
              widget.onChangeFunction!();
            }
          },
          onChanged: (value) {
            if (widget.onSubmitFunction != null) {
              widget.onSubmitFunction!();
            }
          },
        ),
      ],
    ));
  }
}
