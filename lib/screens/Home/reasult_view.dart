import 'package:detict_age/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ReasultScreen extends StatelessWidget {
   ReasultScreen({required this.reasult ,Key? key}) : super(key: key);

  String reasult ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFF3E9DD),
      appBar: AppBar(title: Text("Result"),elevation: 0,backgroundColor: Colors.red),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Reasult is ",style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Center(
              child:Card(child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("${reasult.split(".").first} years", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.white)),
              ),elevation: 2,color: Colors.red,)
            ),
            SizedBox(height: 20,),
            //Text("Details about ${reasult}",style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            // IconButton(onPressed: (){
            //   print(reasult.split(" ")[5].toString());
            // }, icon: Icon(Icons.confirmation_num_sharp)),
          ],
        ),
      ),
    );
  }
}
