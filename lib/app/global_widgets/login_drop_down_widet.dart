import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../models/paly_role_model.dart';

class CurrencyDropdownItem extends StatelessWidget {
  const CurrencyDropdownItem(
      {super.key,
      required this.valueChanged,
      required this.value,
      required this.data});

  final ValueChanged<String> valueChanged;
  final String? value;
  final List<PlayRoleModel> data;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "SelectCurrency",
          ),
        ),
        onChanged: (newValue) {
          print('value + == $newValue');

          valueChanged(newValue!);
        },
        value: value,
        items: data
            .map((item) => DropdownMenuItem(
                  value: item.playRole,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.playRole ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
