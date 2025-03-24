import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:instaflow/models/user_model.dart';

class ApiService {
  static const String _baseUrl = "https://randomuser.me/api/?results=50";

  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<User> users =
            (data["results"] as List)
                .map((json) => User.fromJson(json))
                .toList();
        return users;
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
