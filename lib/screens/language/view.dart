import 'package:detict_age/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title:  Text("Language",style: TextStyle()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.language_outlined),
                  SizedBox(width: 10,),
                  Text("Select Language")
                ],
              ),
            ),
            const SizedBox(height: 30,),
            DropdownButton(
              onChanged: (v) => setState(() {
                translator.setNewLanguage(
                  context,
                  newLanguage: v.toString(),
                  remember: true,
                  restart: true,
                );
              }),
              value: translator.currentLanguage , // change this line with your way to get current locale to select it as default in dropdown
              items: [
                DropdownMenuItem(
                    child: Text( 'English'), value: 'en'
                ),
                DropdownMenuItem(
                  child: Text( 'العربية'), value: 'ar',
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
