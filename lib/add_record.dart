import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key});

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();
  void pickDate(BuildContext context) async {
    var initialDate = DateTime.now();
    _selectedDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: initialDate.subtract(Duration(days: 365)),
            lastDate: initialDate.add(Duration(days: 30)),
            builder: (context, child) {
              return Theme(
                  data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    secondary: Colors.yellow,
                    onSecondary: Colors.red,
                    error: Colors.red,
                    onError: Colors.red,
                    background: Colors.cyan,
                    onBackground: Colors.cyanAccent,
                    surface: Colors.cyan,
                    onSurface: Colors.black26,
                  )),
                  child: child ?? Text(''));
            }) ??
        _selectedDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Record'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FontAwesomeIcons.weightScale, size: 40),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          NumberPicker(
                              itemCount: 3,
                              itemWidth: 80,
                              itemHeight: 50,
                              axis: Axis.horizontal,
                              minValue: 40,
                              maxValue: 130,
                              value: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey))),
                          Icon(FontAwesomeIcons.chevronUp, size: 16)
                        ],
                      )
                    ]),
              )),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            /*onTap: () async {
              var initialDate = DateTime.now();
              var newDate = await showDatePicker(
                  context: context,
                  firstDate: initialDate.subtract(Duration(days: 365)),
                  lastDate:
                      initialDate.subtract(Duration(days: 30)) ?? _selectedDate,
                  initialDate: DateTime.now());
              setState(() {});
            },*/
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(FontAwesomeIcons.calendar, size: 40),
                        Expanded(
                            child: Text(
                          DateFormat('EEE,MMM d').format(_selectedDate),
                          textAlign: TextAlign.center,
                        ))
                      ]),
                )),
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.calendar, size: 40),
                ],
              )),
          ElevatedButton(
            onPressed: null,
            child: Text('Save Record'),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}
