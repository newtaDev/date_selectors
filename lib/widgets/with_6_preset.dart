import 'package:flutter/material.dart';

import 'package:date_selectors/widgets/custom_datepicker.dart';

import 'footer.dart';

enum Selectable6Presets {
  yesterday,
  today,
  tomorrow,
  thisSaturday,
  thisSunday,
  nextTuesday,
}

class DatePickerWith6Preset extends StatefulWidget {
  final DateTime initialDate;
  const DatePickerWith6Preset({
    Key? key,
    required this.initialDate,
  }) : super(key: key);

  @override
  State<DatePickerWith6Preset> createState() => _DatePickerWith6PresetState();
}

class _DatePickerWith6PresetState extends State<DatePickerWith6Preset> {
  late DateTime selectedDate;
  Selectable6Presets? selectedPreset;
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
                  text: 'Yesterday',
                  onPressed: () {
                    selectedDate =
                        DateTime.now().subtract(const Duration(days: 1));
                    selectedPreset = Selectable6Presets.yesterday;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable6Presets.yesterday,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: 'Today',
                  onPressed: () {
                    selectedDate = DateTime.now();
                    selectedPreset = Selectable6Presets.today;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable6Presets.today,
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
                  text: 'Tomorrow',
                  onPressed: () {
                    selectedDate = DateTime.now().add(const Duration(days: 1));
                    selectedPreset = Selectable6Presets.tomorrow;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable6Presets.tomorrow,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: 'This Saturday',
                  onPressed: () {
                    DateTime thisSaturday = DateTime.now();
                    while (thisSaturday.weekday != 6) {
                      thisSaturday = thisSaturday.add(const Duration(days: 1));
                    }
                    selectedDate = thisSaturday;
                    selectedPreset = Selectable6Presets.thisSaturday;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable6Presets.thisSaturday,
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
                  text: 'This Sunday',
                  onPressed: () {
                    DateTime thisSunday = DateTime.now();

                    while (thisSunday.weekday != 7) {
                      thisSunday = thisSunday.subtract(const Duration(days: 1));
                    }
                    selectedDate = thisSunday;
                    selectedPreset = Selectable6Presets.thisSunday;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable6Presets.thisSunday,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _selectableButton(
                  text: 'Next Tuesday',
                  onPressed: () {
                    selectedDate = DateTime.now().add(const Duration(days: 7));
                    DateTime nextTuesday = selectedDate;
                    if (nextTuesday.weekday > 2 && nextTuesday.weekday != 7) {
                      while (nextTuesday.weekday != 2) {
                        nextTuesday =
                            nextTuesday.subtract(const Duration(days: 1));
                        selectedDate = nextTuesday;
                      }
                    } else {
                      while (nextTuesday.weekday != 2) {
                        nextTuesday = nextTuesday.add(const Duration(days: 1));
                        selectedDate = nextTuesday;
                      }
                    }

                    selectedPreset = Selectable6Presets.nextTuesday;
                    setState(() {});
                  },
                  isSelected: selectedPreset == Selectable6Presets.nextTuesday,
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
