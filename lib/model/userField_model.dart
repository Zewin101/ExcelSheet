class UserField {
  static const String id = 'الرقم';
  static const String name = 'اسم العميل';
  static const String cost = 'المبلغ';
  static const String data = 'التاريخ';

  static List<String> getFields() => [id, name, cost, data];
}

class User {
  int? id;
  String? name;
  String? cost;
  String? data;

  User(this.id, this.name, this.cost, this.data);

  Map<String, dynamic> toJson() => {
        UserField.id: id,
        UserField.name: name,
        UserField.cost: cost,
        UserField.data: data,
      };
}
