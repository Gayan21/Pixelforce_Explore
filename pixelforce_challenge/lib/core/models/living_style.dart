class LivingStyle {
  final String name;
  final String image;
  LivingStyle({required this.name, required this.image});
  factory LivingStyle.fromJson(Map<String, dynamic> json) => LivingStyle(
    name: json['name'] as String,
    image: json['image'] as String,
  );
}