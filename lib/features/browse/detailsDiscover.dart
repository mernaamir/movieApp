import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';

import '../../models/detailsDiscover.dart';

class detailsDiscover extends StatelessWidget {
  static const String routeName = "detailsDiscover";


  detailsDiscover({super.key});


  @override
  Widget build(BuildContext context) {

    return Text('hhhhhhhhhhhhhhhh');
    // return FutureBuilder(
    //     future: ApiManager.getgenreDiscover(),
    //     builder: (context, snapshot) {
    //       if(snapshot.connectionState==ConnectionState.waiting){
    //         return CircularProgressIndicator();
    //       }
    //       if(snapshot.hasError){
    //         return Text("Some thing has Error");
    //       }
    //       var discoverList=snapshot.data?.results??[];
    //       if(discoverList.isEmpty){
    //         return Text("List is Empty");
    //       }
    //       return ListView.builder(itemBuilder: (context,index){
    //         return Container(
    //           child: Text(discoverList[index].title??""),
    //         );
    //       },itemCount: discoverList.length);
    //
    //     });
  }
}
