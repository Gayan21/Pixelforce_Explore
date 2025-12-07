class TripModel {
  final String name;
  final String image;
  final int rentedPropsCount;

  TripModel({
    required this.name,
    required this.image,
    required this.rentedPropsCount,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      name: json['name'] as String,
      image: json['image'] as String,
      rentedPropsCount: (json['rented_props_count'] as num).toInt(),
    );
  }
}