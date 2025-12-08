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


