class Experience {
  final String name;
  final String image;
  Experience({required this.name, required this.image});
  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    name: json['name'] as String,
    image: json['image'] as String,
  );
}