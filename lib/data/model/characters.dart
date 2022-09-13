
class Characters_model {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;


  Characters_model(
       {this.charId,
        this.name,
        this.birthday,
        this.occupation,
        this.img,
        this.status,
        this.nickname,
        this.appearance,
        this.portrayed,
        this.category,
       });

  Characters_model.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['birthday'] = birthday;
    data['occupation'] = occupation;
    data['img'] = img;
    data['status'] = status;
    data['nickname'] = nickname;
    data['appearance'] = appearance;
    data['portrayed'] = portrayed;
    data['category'] = category;

    return data;
  }
}