import 'dart:convert';

import 'package:earthquake_app/model.dart';
import 'package:earthquake_app/text_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 10;
  Future<EarthQuakeData> getData() async {
    final response = await http.get(Uri.parse(
        'https://api.orhanaydogdu.com.tr/deprem/live.php?limit=$counter'));
    if (response.statusCode == 200) {
      return earthQuakeDataFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh_rounded),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            counter = counter + 5;
          });
        },
      ),
      appBar: AppBar(
        title: Text("EarthQuake App"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: FutureBuilder<EarthQuakeData>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (context, index) {
                    List<Result> response = snapshot.data.result;
                    Result item = response[index];
                    return InkWell(
                      onTap: ()=> launch('https://www.google.com/maps/search/?api=1&query=${item.lat},${item.lng}'),
                      child: ListTile(
                        leading: Text("${index + 1}"),
                        title: Text("${item.title}",style: BoldTextStyle().boldTextStyle,),
                        trailing: Text("${item.mag}",style: BoldTextStyle().boldTextStyle,),
                        subtitle: Text("${item.date}"),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
