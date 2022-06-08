import 'dart:convert';

class ReposModel {
  String name;
  int stargazersCount;
  int forksCount;
  int id;
  ReposModel({
    required this.name,
    required this.stargazersCount,
    required this.forksCount,
    required this.id,
  });

  ReposModel copyWith({
    String? name,
    int? stargazersCount,
    int? forksCount,
    int? id,
  }) {
    return ReposModel(
      name: name ?? this.name,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      forksCount: forksCount ?? this.forksCount,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'stargazers_count': stargazersCount,
      'forks_count': forksCount,
      'id': id,
    };
  }

  factory ReposModel.fromMap(Map<String, dynamic> map) {
    return ReposModel(
      name: map['name'] ?? '',
      stargazersCount: map['stargazersCount']?.toInt() ?? 0,
      forksCount: map['forksCount']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReposModel.fromJson(String source) =>
      ReposModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FollowingModel(name: $name, stargazersCount: $stargazersCount, forksCount: $forksCount, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReposModel &&
        other.name == name &&
        other.stargazersCount == stargazersCount &&
        other.forksCount == forksCount &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        stargazersCount.hashCode ^
        forksCount.hashCode ^
        id.hashCode;
  }
}
