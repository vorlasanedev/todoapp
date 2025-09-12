import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/widgets/widgets.dart';

class SelectDartTime extends StatelessWidget {
  const SelectDartTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: 'Date',
            readOnly: true,
            hintText: 'Aug 7, 2025',
            suffixIcon: IconButton(
              onPressed: () => _selectDate(context),
              icon: FaIcon(FontAwesomeIcons.calendar),
            ),
          ),
        ),
        Gap(5),
        Expanded(
          child: CommonTextField(
            title: 'Time',
            readOnly: true,
            hintText: '10:00',
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context),
              icon: FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext contex) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: contex,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      // print(pickedTime);
    }
  }

  void _selectDate(BuildContext contex) async {
    DateTime? pickedDate = await showDatePicker(
      context: contex,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2090),
    );
    if (pickedDate != null) {
      print(pickedDate);
    }
  }
}
