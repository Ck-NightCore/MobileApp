class Employee {
  int? id;
  String name;
  int age;
  String major;
  String email;
  String phone;
  String address;

  Employee({
    this.id,
    required this.name,
    required this.age,
    required this.major,
    required this.email,
    required this.phone,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "major": major,
      "email": email,
      "phone": phone,
      "address": address,
    };
  }
}
