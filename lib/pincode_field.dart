import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DashPinCodeField extends StatefulWidget {
  const DashPinCodeField({super.key});

  @override
  State<DashPinCodeField> createState() => _DashPinCodeFieldState();
}

class _DashPinCodeFieldState extends State<DashPinCodeField> {
  bool _obsureTextState = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
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
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: _obsureTextState,
              obscuringCharacter: '•',
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                activeColor: Colors.red,
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.grey,
                selectedFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              cursorColor: Colors.red,
              errorAnimationController: null,
              controller: null,
              keyboardType: TextInputType.number,
              inputFormatters: [MaskTextInputFormatter(mask: '####')],
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
                print("Changed");
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
          ],
        ));
  }
}
