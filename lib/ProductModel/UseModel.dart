class UserModels {
  String? id;
  String? name;
  String? address;

  UserModels({
    this.id,
    this.name,
    this.address,
  });

  UserModels copyWith({
    String? id,
    String? name,
    String? address,
  }) =>
      UserModels(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
      );

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
    id: json["id"],
    name: json["name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
  };
}
