import 'package:date_selectors/widgets/with_4_preset.dart';
import 'package:date_selectors/widgets/with_6_preset.dart';
import 'package:date_selectors/widgets/without_preset.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? withoutPreSelectedDate;
  DateTime? with4PreSelectedDate;
  DateTime? with6PreSelectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const Text('Calendar Widget'),
                      const SizedBox(height: 20),
                      _button(
                          text: 'Without preset',
                          onPressed: () async {
                            final selectedDate = await showDialog<DateTime>(
                              context: context,
                              builder: (context) => DatePickerWithoutPreset(
                                initialDate:
                                    withoutPreSelectedDate ?? DateTime.now(),
                              ),
                            );
                            if (selectedDate != null) {
                              withoutPreSelectedDate = selectedDate;
                              setState(() {});
                            }
                          }),
                      const SizedBox(height: 10),
                      if (withoutPreSelectedDate != null)
                        _buldChips(
                          date: withoutPreSelectedDate!,
                          onDelected: () {
                            withoutPreSelectedDate = null;
                            setState(() {});
                          },
                        ),
                      const SizedBox(height: 10),
                      _button(
                          text: 'With 4 preset',
                          onPressed: () async {
                            final selectedDate = await showDialog<DateTime>(
                              context: context,
                              builder: (context) => DatePickerWith4Preset(
                                initialDate:
                                    with4PreSelectedDate ?? DateTime.now(),
                              ),
                            );
                            if (selectedDate != null) {
                              with4PreSelectedDate = selectedDate;
                              setState(() {});
                            }
                          }),
                      const SizedBox(height: 10),
                      if (with4PreSelectedDate != null)
                        _buldChips(
                          date: with4PreSelectedDate!,
                          onDelected: () {
                            with4PreSelectedDate = null;
                            setState(() {});
                          },
                        ),
                      const SizedBox(height: 10),
                      _button(
                          text: 'With 6 preset',
                          onPressed: () async {
                            final selectedDate = await showDialog<DateTime>(
                              context: context,
                              builder: (context) => DatePickerWith6Preset(
                                initialDate:
                                    with6PreSelectedDate ?? DateTime.now(),
                              ),
                            );
                            if (selectedDate != null) {
                              with6PreSelectedDate = selectedDate;
                              setState(() {});
                            }
                          }),
                      const SizedBox(height: 10),
                      if (with6PreSelectedDate != null)
                        _buldChips(
                          date: with6PreSelectedDate!,
                          onDelected: () {
                            with6PreSelectedDate = null;
                            setState(() {});
                          },
                        ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            const Text('Newton Michael')
          ],
        ),
      ),
    );
  }

  Widget _buldChips({required DateTime date, void Function()? onDelected}) {
    return Chip(
      avatar: const Icon(
        Icons.calendar_month_outlined,
        color: Colors.blue,
        size: 18,
      ),
      label: Text(
        DateFormat('d MMM y').format(date),
        style: const TextStyle(color: Colors.blue),
      ),
      backgroundColor: Colors.blue.withOpacity(0.1),
      deleteIconColor: Colors.blue,
      onDeleted: onDelected,
    );
  }

  ElevatedButton _button({required String text, void Function()? onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
