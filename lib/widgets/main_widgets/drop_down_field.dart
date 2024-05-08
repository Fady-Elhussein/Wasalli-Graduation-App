import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:wasili/const/const.dart';

// ignore: must_be_immutable
class DropDownField extends StatefulWidget {
  DropDownField({
    super.key,
    required this.hint,
    required this.label1,
    required this.label2,
    required this.onOptionSelected,
  });
  String hint;
  String label1;
  String label2;
  Function(List<ValueItem<dynamic>>) onOptionSelected;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<dynamic>(
      hint: widget.hint,
      hintColor: kPrimaryColor,
      hintFontSize: 30.0,
      fieldBackgroundColor: kPrimaryColorfieldS,
      focusedBorderColor: Colors.black,
      borderColor: Colors.black,
      onOptionSelected: widget.onOptionSelected,
      options: <ValueItem>[
        ValueItem(label: widget.label1, value: 1),
        ValueItem(label: widget.label2, value: 2),
      ],
      selectionType: SelectionType.single,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 100,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
    );
  }
}
