class TransactionEntity {
  final int id;
  final String name;

  TransactionEntity({this.id, this.name});

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      new TransactionEntity(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  @override
  String toString() {
    return 'TransactionEntity{id: $id, name: $name}';
  }
}
