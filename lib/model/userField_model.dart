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

  User({ this.id,required  this.name, required this.cost, this.data});

  User copy({
   int? id,
    String? name,
    String? cost,
    String? data,

  })=>User(
      data: data??this.data,
      name: name??this.name,
      id: id??this.id,
      cost: cost??this.cost
  );

  Map<String, dynamic> toJson() => {
        UserField.id: id,
        UserField.name: name,
        UserField.cost: cost,
        UserField.data: data,
      };

}
