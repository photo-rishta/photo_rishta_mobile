import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:photo_rishta_mobile/components/my_button.dart';
import 'package:photo_rishta_mobile/components/text_input.dart';

class AddNewStudio extends StatefulWidget {
  const AddNewStudio({super.key});

  @override
  State<AddNewStudio> createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewStudio> {
  final TextEditingController _dateController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _studios = ["frames by ram", "moment makers", "pixel perfect"];
  final String _selectedStudio = "frames by ram";

  final _events = ["Engagement", "Pre wedding", "Haldi", "Wedding"];
  final String _selectedEvent = "Engagement";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Add New Studio"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // logo

              // welcome text

              const SizedBox(height: 30),
              Container(
                height: 200,
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromRGBO(130, 168, 224, 0.3),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.teal,
                            ))
                      ],
                    ),
                    Text("Tap to upload studio logo")
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // studio name
              MyTextfield(
                controller: emailController,
                hintText: "Studio Name",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              // Sign in button
              MyButton(
                onTap: () {},
                text: "Add New Studio",
              ),

              const SizedBox(height: 30),
            ],
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
