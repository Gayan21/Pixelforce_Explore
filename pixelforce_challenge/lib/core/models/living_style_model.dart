class LivingStyleModel {
  final String name;
  final String image;
  LivingStyleModel({required this.name, required this.image});
  factory LivingStyleModel.fromJson(Map<String, dynamic> json) => LivingStyleModel(
    name: json['name'] as String,
    image: json['image'] as String,
  );
}