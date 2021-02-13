class Employess {
  int id;

  String name;
  String position;
  int wage;

  Employess({this.id, this.name, this.position, this.wage});

  Employess.fromJson(Map json) {
    if (json != null) {
      this.id = json["id"];

      this.name = json["name"];
      this.position = json["position"];
      this.wage = json["wage"];
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "wage": wage,
      };
}
