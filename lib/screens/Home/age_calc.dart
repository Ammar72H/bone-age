
import 'package:detict_age/screens/Home/states.dart';
import 'package:detict_age/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:lottie/lottie.dart';





class AgeCalcScreen extends StatefulWidget {

  AgeCalcScreen({Key? key,}) : super(key: key);
  @override
  State<AgeCalcScreen> createState() => _AgeCalcScreenState();
}

class _AgeCalcScreenState extends State<AgeCalcScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, DateTime initialDate, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  String _calculateAge() {
    int years = _currentDate.year - _selectedDate.year;
    int months = _currentDate.month - _selectedDate.month;
    int days = _currentDate.day - _selectedDate.day;

    if (days < 0) {
      months--;
      days += DateTime(DateTime.now().year, _selectedDate.month + 1, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return '$years ${"year".tr()}, $months ${"months".tr()}, $days ${"days".tr()}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/age.png",
              height: 80,
              width: 80,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 40),
            Text('Select'.tr(),style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              onTap: () {
                _selectDate(context, _selectedDate, (DateTime date) {
                  setState(() {
                    _selectedDate = date;
                  });
                });
              },
              decoration: InputDecoration(
                hintText: 'Select'.tr(),
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(
                text: DateFormat('dd/MM/yyyy').format(_selectedDate),
              ),
            ),
            SizedBox(height: 20),
            Text('Select the current date'.tr(),style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              onTap: () {
                _selectDate(context, _currentDate, (DateTime date) {
                  setState(() {
                    _currentDate = date;
                  });
                });
              },
              decoration: InputDecoration(
                //hintText: 'Select the current date',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(
                text: DateFormat('dd/MM/yyyy').format(_currentDate),
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Background color
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60)),
                      fixedSize: const Size.fromHeight(63),
                    ),
                    onPressed: () {
                      String age = _calculateAge();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.deepPurple,
                            titleTextStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            //content: Text("log out"),
                            contentTextStyle:
                            const TextStyle(color: Colors.black),
                            title: Text('Your age is'.tr()),
                            content: Text(age,style: TextStyle(color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'.tr(),style: TextStyle(color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Calculate age'.tr(),style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

