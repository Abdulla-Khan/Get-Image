import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class ApiService {
  fetchUsers() async {
    final response = await http.get(Uri.parse('https://image0.herokuapp.com/'));

    if (response.statusCode == 200) {
      print('running');
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => User.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Users');
    }
  }
}
