import 'package:earthquake_app/models/model.dart';
import 'package:earthquake_app/services/service.dart';
import 'package:get/get.dart';

enum EarthquakeState{ IDLE, BUSY, ERROR}

class EarthquakeController extends GetxController{
 var isLoading = true.obs;
 var earthquakeListObs = <EarthQuakeData>[].obs;

 @override
  void onInit() {
    fetchData();
    //print(earthquakeListObs[0].result[0].title);
    super.onInit();
  }

 void fetchData() async{
   try{
     isLoading(true);
     var earthquakes = await WebService.getData();
     if(earthquakes != null){
       //earthquakeListObs.map((e) => e.result.map((e) => e.title));
       for (int i=0;i<earthquakes.result.length;i++) {
         earthquakeListObs.add(earthquakes);
       }//BURADA HATA VAR !!!!!!!!!!!!!!!!
     }
   }finally{
     isLoading(false);
   }

 }
   
}