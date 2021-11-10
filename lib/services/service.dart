import 'package:earthquake_app/models/model.dart';
import 'package:http/http.dart' as http;

class WebService {
  static Future<EarthQuakeData> getData() async {
    final response = await http.get(
        Uri.parse('https://api.orhanaydogdu.com.tr/deprem/live.php?limit=25'));
    if (response.statusCode == 200) {
      return earthQuakeDataFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }
}
