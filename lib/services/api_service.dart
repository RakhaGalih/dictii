import 'dart:convert';
import 'package:dictii/models/word_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Word?> fetchWord(String query) async {
    final url = Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$query');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        return Word.fromJson(data[0]);
      } else {
        return null; // Word not found
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
