import 'dart:convert';

class ItemDefinition {
  int id;
  String name;
  String description;
  double amount;
  String dueDate;
  String category;
  int status;
  ItemDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.dueDate,
    required this.category,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return id > 0
        ? {
            'id': id,
            'name': name,
            'description': description,
            'amount': amount,
            'dueDate': dueDate,
            'category': category,
            'status': status,
          }
        : {
            'name': name,
            'description': description,
            'amount': amount,
            'dueDate': dueDate,
            'category': category,
            'status': status,
          };
  }

  factory ItemDefinition.fromMap(Map<String, dynamic> map) {
    return ItemDefinition(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      dueDate: map['dueDate'] ?? '',
      category: map['category'] ?? '',
      status: map['status'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDefinition.fromJson(String source) =>
      ItemDefinition.fromMap(json.decode(source));
}
