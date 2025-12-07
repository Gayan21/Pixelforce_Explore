import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/trip_model.dart';
import '../models/living_style_model.dart';
import '../models/experience_model.dart';

class ApiClient {
  static const _tripsUrl = 'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/trips.json';
  static const _livingStyleUrl = 'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/living-style.json';
  static const _experiencesUrl = 'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/other-experiences.json';

  static Future<List<TripModel>> fetchTrips() async {
    final resp = await http.get(Uri.parse(_tripsUrl));
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => TripModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trips');
    }
  }

  static Future<List<LivingStyleModel>> fetchLivingStyles() async {
    final resp = await http.get(Uri.parse(_livingStyleUrl));
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => LivingStyleModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load living styles');
    }
  }

  static Future<List<ExperienceModel>> fetchExperiences() async {
    final resp = await http.get(Uri.parse(_experiencesUrl));
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => ExperienceModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load experiences');
    }
  }
}



// 1. Please include the social logins as in the figma 
// 2. ⁠Include loading indicators
// 3. ⁠if error occurs indicate it the user
// 4. ⁠Good if we can rename the model class lose living_style_model.dart (Just a good have a thing)
// 5. ⁠WithaOpacity key word is deprecated