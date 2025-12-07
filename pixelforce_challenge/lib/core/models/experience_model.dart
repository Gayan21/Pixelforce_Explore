class ExperienceModel {
  final String name;
  final String image;
  ExperienceModel({required this.name, required this.image});
  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
    name: json['name'] as String,
    image: json['image'] as String,
  );
}