import 'dart:convert';
import 'package:http/http.dart' as http;

class DogApiService {
  Future<String> fetchRandomImage() async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String imageUrl = data['message'];
        return imageUrl;
      } else {
        throw Exception('Failed to fetch image');
      }
    } catch (e) {
      print('Error fetching image: $e');
      throw e;
    }
  }
}
