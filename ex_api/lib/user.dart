class User {
  final String name;
  final int age;
  final String message;

  User({required this.name, required this.age, required this.message});

  // JSON에서 User 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      message: json['message'] ?? '',
    );
  }

  // User 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'message': message};
  }

  @override
  String toString() {
    return 'User(name: $name, age: $age, message: $message)';
  }
}
