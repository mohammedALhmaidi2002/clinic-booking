// lib/models/pharmacy.dart
class Pharmacy {
  final String name;
  final List<String> medicines;
  final String location;
  final double rating;
  final List<String> imagePaths;

  Pharmacy({
    required this.name,
    required this.medicines,
    required this.location,
    required this.rating,
    required this.imagePaths,
  });

  get id => null;
}
