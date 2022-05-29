import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/user_model.dart';
import '../services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  submitForm() async {
    ApiService _apiService = ApiService();
    List<User> eachposts = await _apiService.fetchUsers();
    return eachposts;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: submitForm(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image(
                          image: NetworkImage(
                              "https://image0.herokuapp.com/pics/car-6810885_960_720_Mql6Acg.jpg")),
                      title: Text(
                        "${snapshot.data![index].title}",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

AssetImage getImg(url) {
  String a = url;

  String r = a.substring(a.indexOf('c') + 1);
  String result = r.substring(r.indexOf('s') + 1);
  print(result);

  return AssetImage(result);
}
