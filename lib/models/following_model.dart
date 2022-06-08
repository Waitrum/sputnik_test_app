import 'dart:convert';

class FollowingModel {
  String login;
  String avatarUrl;
  int id;
  FollowingModel({
    required this.login,
    required this.avatarUrl,
    required this.id,
  });

  FollowingModel copyWith({
    String? login,
    String? avatarUrl,
    int? id,
  }) {
    return FollowingModel(
      login: login ?? this.login,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
      'id': id,
    };
  }

  factory FollowingModel.fromMap(Map<String, dynamic> map) {
    return FollowingModel(
      login: map['login'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowingModel.fromJson(String source) =>
      FollowingModel.fromMap(json.decode(source));

  @override
  String toString() => 'FollowingModel(login: $login, avatarUrl: $avatarUrl, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FollowingModel &&
      other.login == login &&
      other.avatarUrl == avatarUrl &&
      other.id == id;
  }

  @override
  int get hashCode => login.hashCode ^ avatarUrl.hashCode ^ id.hashCode;
}
