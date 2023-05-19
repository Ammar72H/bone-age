import 'package:detict_age/screens/Home/show_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/controller.dart';
import '../Home/states.dart';


class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController()..getReportsDataModel(),
      child: BlocConsumer<HomeController, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = HomeController.get(
              context); // get object from cubit
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child:controller.getReportsData==null?Center(child: CircularProgressIndicator(),): ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.getReportsData?.count.toInt(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 5,
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowResultScreen(imageLink:"${controller.getReportsData?.results[index].image}" ,result: "result is : ${controller.getReportsData?.results[index].result?.split(".").first??"Image problem"}",date:
                            "${controller.getReportsData?.results[index].date}"),));
                          },
                            leading: const Icon(Icons.list),
                            trailing:  Text(
                              "${controller.getReportsData?.results[index].date}",
                              style: TextStyle(color: Colors.green, fontSize: 15),
                            ),
                            //subtitle: Text("result is : ${controller.getReportsData?.results[index].result?.split(".").first}"),
                            title: Text("result is : ${controller.getReportsData?.results[index].result?.split(".").first??"Image problem"}")),
                      ),
                      SizedBox(height: 5,)
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
