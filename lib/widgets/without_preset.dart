import 'package:flutter/material.dart';

import 'package:date_selectors/widgets/custom_datepicker.dart';

import 'footer.dart';

class DatePickerWithoutPreset extends StatefulWidget {
  final DateTime initialDate;
  const DatePickerWithoutPreset({
    Key? key,
    required this.initialDate,
  }) : super(key: key);

  @override
  State<DatePickerWithoutPreset> createState() =>
      _DatePickerWithoutPresetState();
}

class _DatePickerWithoutPresetState extends State<DatePickerWithoutPreset> {
  late DateTime selectedDate;
  @override
  void initState() {
    selectedDate = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: MediaQuery.of(context).size.width > 400 ? 0.8 : 1,
      child: CustomDatePickerDialog(
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        onDateTimeChanged: (date) {
          selectedDate = date;
          setState(() {});
        },
        footer: Footer(selectedDate: selectedDate),
      ),
    );
  }
}
