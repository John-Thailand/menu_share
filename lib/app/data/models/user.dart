import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class User {
  final String userId;
  final String email;
  final String name;
  final String imageUrl;

  const User({
    required this.userId,
    required this.email,
    this.name = '',
    this.imageUrl = '',
  });

  factory User.fromUser(auth.User user) {
    return User(
      userId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      imageUrl: user.photoURL ?? '',
    );
  }

  User copyWith({
    String? userId,
    String? email,
    String? name,
    String? imageUrl,
  }) {
    return User(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'imageUrl': imageUrl});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userId: $userId, email: $email, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ email.hashCode ^ name.hashCode ^ imageUrl.hashCode;
  }
}
