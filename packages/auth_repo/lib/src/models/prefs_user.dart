class PrefsUser {
  PrefsUser({
    required this.id,
    required this.name,
    required this.role,
    this.imageUrl,
  });

  final String id;
  final String name;
  final String role;
  final String? imageUrl;

  // Create User from a Map
  factory PrefsUser.fromJson(Map<String, dynamic> json) => PrefsUser(
        id: json['id'] as String,
        name: json['name'] as String,
        role: json['role'] as String,
        imageUrl: json['imageUrl'] as String,
      );

  // Convert User to a Map for storage
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role,
        'imageUrl': imageUrl,
      };
}
