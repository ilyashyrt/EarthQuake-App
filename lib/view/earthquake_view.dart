import 'package:earthquake_app/services/service.dart';
import 'package:earthquake_app/constants/constants.dart';
import 'package:earthquake_app/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EarthQuakeView extends StatelessWidget {
  const EarthQuakeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EarthquakeController controller = Get.put(EarthquakeController());
    //print(controller.earthquakeListObs.value[0].result[0]);
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.appTitle),backgroundColor: AppConstants.themeColor,),
      body: Obx((){
        if(controller.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return ListView.builder(
            itemCount: controller.earthquakeListObs.length,
            itemBuilder: (context,index){
              var myFinalList = controller.earthquakeListObs[index].result[index];
              return InkWell(
                onTap: ()=> launch('https://www.google.com/maps/search/?api=1&query=${myFinalList.lat},${myFinalList.lng}'),
                child: ListTile(
                  title: Text(myFinalList.title,style: AppConstants.boldTextStyle,),
                  leading: Text("${index+1}"),
                  trailing: Text("${myFinalList.mag}",style: AppConstants.boldTextStyle,),
                  subtitle: Text("${myFinalList.date}"),
                ),
              );
            },
          );
        }
      }),
    );
  }
}