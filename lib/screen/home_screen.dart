import 'package:flutter/material.dart';

import 'package:rosptam_task/model/GetModel.dart';
import 'package:rosptam_task/screen/login_screen.dart';
import 'package:rosptam_task/service/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Future<List<GetModel>> getApiData() async{
    return HttpService.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Home Screen'),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));

              }, icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left :10.0,right: 10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: HttpService.getApi(),
                  builder: (context,AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(snapshot.data[index].id.toString()),
                                ),
                                title: Text("Title : ${snapshot.data[index].title.toString()}"),
                                subtitle: Text("Body : ${snapshot.data[index].body.toString()}"),
                              ),
                            );
                          });
                    }
                    else {
                      return Text('Loading');

                    }
                  }),
            )
          ]
          ,
        ),
      ),
    );
  }
}
