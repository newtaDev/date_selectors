
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(DateFormat('d MMM y').format(selectedDate)),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: Navigator.of(context).pop,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.withOpacity(0.1),
              shadowColor: Colors.blue.withOpacity(0.1),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(selectedDate);
              },
              child: const Text('Save')),
        ],
      ),
    );
  }
}
