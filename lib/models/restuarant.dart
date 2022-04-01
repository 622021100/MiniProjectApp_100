import 'dart:convert';

class Restuarant {
  final String id;
  final String name;
  final String detail;
  final String address;
  final String image;
  Restuarant({
    required this.id,
    required this.name,
    required this.detail,
    required this.address,
    required this.image,
  });

  Restuarant copyWith({
    String? id,
    String? name,
    String? detail,
    String? address,
    String? image,
  }) {
    return Restuarant(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      address: address ?? this.address,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'detail': detail});
    result.addAll({'address': address});
    result.addAll({'image': image});

    return result;
  }

  factory Restuarant.fromMap(Map<String, dynamic> map) {
    return Restuarant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      detail: map['detail'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Restuarant.fromJson(String source) =>
      Restuarant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Restuarant(id: $id, name: $name, detail: $detail, address: $address, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Restuarant &&
        other.id == id &&
        other.name == name &&
        other.detail == detail &&
        other.address == address &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        detail.hashCode ^
        address.hashCode ^
        image.hashCode;
  }
}
