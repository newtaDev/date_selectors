import 'package:flutter/material.dart';

import 'package:date_selectors/widgets/custom_datepicker.dart';

import 'footer.dart';

enum Selectable4Presets {
  neverEnds,
  days15,
  days30,
  days60,
}

class DatePickerWith4Preset extends StatefulWidget {
  final DateTime initialDate;
  const DatePickerWith4Preset({
    Key? key,
    required this.initialDate,
  }) : super(key: key);

  @override
  State<DatePickerWith4Preset> createState() => _DatePickerWith4PresetState();
}

class _DatePickerWith4PresetState extends State<DatePickerWith4Preset> {
  late DateTime selectedDate;
  Selectable4Presets? selectedPreset;
  @override
  void initState() {
    selectedDate = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDatePickerDialog(
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      onDateTimeChanged: (date) {
        selectedDate = date;
        setState(() {});
      },
      header: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: 'Never Ends',
                  onPressed: () {
                    selectedDate = DateTime.now();
                    selectedPreset = Selectable4Presets.neverEnds;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable4Presets.neverEnds,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: '15 days later',
                  onPressed: () {
                    selectedDate = DateTime.now().add(const Duration(days: 15));
                    selectedPreset = Selectable4Presets.days15;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable4Presets.days15,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: '30 days later',
                  onPressed: () {
                    selectedDate = DateTime.now().add(const Duration(days: 30));
                    selectedPreset = Selectable4Presets.days30;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable4Presets.days30,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: '60 days later',
                  onPressed: () {
                    selectedDate = DateTime.now().add(const Duration(days: 60));
                    selectedPreset = Selectable4Presets.days60;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable4Presets.days60,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
      footer: Footer(selectedDate: selectedDate),
    );
  }

  ElevatedButton _selectableButton({
    bool isSelected = false,
    void Function()? onPressed,
    required String text,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? null : Colors.blue.withOpacity(0.1),
        shadowColor: isSelected ? null : Colors.blue.withOpacity(0.1),
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
      ),
    );
  }
}
