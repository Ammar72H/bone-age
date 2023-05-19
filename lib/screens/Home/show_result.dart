import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ShowResultScreen extends StatelessWidget {
   ShowResultScreen({Key? key,required this.imageLink,required this.result,required this.date}) : super(key: key);

  String imageLink ;
  String result ;
  String date ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.blue,
        elevation: 0,
        title:  Text("Result",style: TextStyle()),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageLink,
                    height: 300,

                  ),),
                    SizedBox(height: 20,),
                    Text("${result} ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24)),
                    SizedBox(height: 15,),
                    Text(date,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),)
                  ],
                ),
              ),
              const SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
