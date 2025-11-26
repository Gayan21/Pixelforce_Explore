class Trip {
  final String name;
  final String image;
  final int rentedPropsCount;

  Trip({
    required this.name,
    required this.image,
    required this.rentedPropsCount,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      name: json['name'] as String,
      image: json['image'] as String,
      rentedPropsCount: (json['rented_props_count'] as num).toInt(),
    );
  }
}