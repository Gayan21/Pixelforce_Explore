import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/trip.dart';
import '../models/living_style.dart';
import '../models/experience.dart';

class ApiClient {
  static const _tripsUrl = 'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/trips.json';
  static const _livingStyleUrl = 'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/living-style.json';
  static const _experiencesUrl = 'https://pfx-interview.s3.ap-southeast-2.amazonaws.com/other-experiences.json';

  static Future<List<Trip>> fetchTrips() async {
    final resp = await http.get(Uri.parse(_tripsUrl));
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => Trip.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trips');
    }
  }

  static Future<List<LivingStyle>> fetchLivingStyles() async {
    final resp = await http.get(Uri.parse(_livingStyleUrl));
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => LivingStyle.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load living styles');
    }
  }

  static Future<List<Experience>> fetchExperiences() async {
    final resp = await http.get(Uri.parse(_experiencesUrl));
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((e) => Experience.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load experiences');
    }
  }
}