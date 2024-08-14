import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:photo_rishta_mobile/components/my_button.dart';
import 'package:photo_rishta_mobile/components/text_input.dart';

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({super.key});

  @override
  State<AddNewEvent> createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  final TextEditingController _dateController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _studios = ["frames by ram", "moment makers", "pixel perfect"];
  String? _selectedStudio = "frames by ram";

  final _events = ["Engagement", "Pre wedding", "Haldi", "Wedding"];
  String? _selectedEvent = "Engagement";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // logo
              const SizedBox(height: 50),

              // welcome text
              const Text(
                'Add New Event',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),

              const SizedBox(height: 30),
              Container(
                height: 120,
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromRGBO(130, 168, 224, 0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/thumbs.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Awesome",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text("Keep Growing"),
                                ],
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Fill the below fields to add event",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // search studios
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                child: DropdownButtonFormField(
                  dropdownColor: Colors.grey.shade200,
                  value: _selectedStudio,
                  items: _studios
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedStudio = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.grey,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),

              // search Events
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                child: DropdownButtonFormField(
                  value: _selectedEvent,
                  items: _events
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedEvent = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.grey,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                ),
              ),

              // Droppdown
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                child: TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Event Date',
                    filled: true,
                    prefixIcon: const Icon(Icons.calendar_month),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    fillColor: Colors.grey.shade200,
                  ),
                  readOnly: false,
                  onTap: () {
                    _selectDate();
                  },
                ),
              ),

              // Amount
              MyTextfield(
                controller: emailController,
                hintText: "Amount",
                obscureText: false,
              ),

              const SizedBox(height: 15),
              // Location
              MyTextfield(
                controller: passwordController,
                hintText: "Location",
                obscureText: false,
              ),

              const SizedBox(height: 50),

              // Sign in button
              MyButton(
                onTap: () {},
                text: "Add New Event",
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
