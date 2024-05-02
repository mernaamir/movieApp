import 'package:flutter/material.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/routes/routes.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Category",
            style: TextStyle(fontSize: 30),
          ),
          FutureBuilder(
              future: ApiManager.getgenre(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("something went error");
                }
                var generList = snapshot.data?.genres ?? [];
                if (generList.isEmpty) {
                  return Text("list is empty");
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemCount: generList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       AppRoutes.onGenerate(RouteSettings(
                        //           name: RoutesName.detailsDiscover,
                        //          )));
                        // },
                        child: Container(
                          height: 100.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/Image.png',
                                  ),
                                  fit: BoxFit.cover)),
                          child: Center(
                              child: Text(
                            generList[index].name ?? "",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
