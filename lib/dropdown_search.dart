import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DashDropDownSearch extends StatefulWidget {
  const DashDropDownSearch(
      {Key? key,
      this.width,
      this.height,
      this.optionBoxMinHeight,
      this.optionBoxMaxHeight,
      this.dropDownHintText,
      this.dropDownLabelText,
      this.noMatchingText,
      this.selectedItem,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.errorBorderColor,
      this.trailingIcon,
      this.borderRadius,
      this.borderWidth,
      this.borderWidthFocused,
      required this.onSelected,
      this.cursorColor,
      required this.options})
      : super(key: key);

  final double? width;
  final double? height;
  final double? optionBoxMinHeight;
  final double? optionBoxMaxHeight;
  final String? dropDownHintText;
  final String? dropDownLabelText;
  final String? noMatchingText;
  final String? selectedItem;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Widget? trailingIcon;
  final double? borderRadius;
  final double? borderWidth;
  final double? borderWidthFocused;
  final Function() onSelected;
  final Color? cursorColor;
  final List<String> options;

  @override
  State<DashDropDownSearch> createState() => _DashDropDownSearchState();
}

class _DashDropDownSearchState extends State<DashDropDownSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownSearch<String>(
        onChanged: (value) {
          String selectedValue = value.toString();
          widget.onSelected();
        },
        popupProps: PopupProps.menu(
          showSearchBox: true,
          showSelectedItems: true,
          constraints: BoxConstraints(
            minHeight: widget.optionBoxMinHeight ?? 300,
            maxHeight: widget.optionBoxMaxHeight ?? 400,
          ),
          emptyBuilder: (context, searchEntry) => Container(
            height: 70,
            alignment: Alignment.center,
            child: Text(widget.noMatchingText ?? 'No data found'),
          ),
          fit: FlexFit.loose,
          searchFieldProps: TextFieldProps(
            cursorColor: widget.cursorColor,
            decoration: InputDecoration(
              suffixIcon: widget.trailingIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.enabledBorderColor ?? Colors.black38,
                  width: widget.borderWidth ?? 1,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.focusedBorderColor ?? Colors.black,
                  width: widget.borderWidthFocused ?? 2,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              ),
            ),
          ),
        ),
        items: widget.options,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: widget.dropDownLabelText,
            hintText: widget.dropDownHintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.enabledBorderColor ?? Colors.black38,
                width: widget.borderWidth ?? 1,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.focusedBorderColor ?? Colors.black,
                width: widget.borderWidthFocused ?? 2,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.errorBorderColor ?? Colors.red,
                width: widget.borderWidth ?? 1,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.errorBorderColor ?? Colors.red,
                width: widget.borderWidthFocused ?? 2,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            ),
            contentPadding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
          ),
        ),
        selectedItem: widget.selectedItem,
      ),
    );
  }
}
