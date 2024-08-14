import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      locale: const Locale('en', 'GB'),
      fieldHintText: 'dd/mm/yyyy',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }
}
