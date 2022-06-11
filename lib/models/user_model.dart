class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? typeSong;
  String? phoneNumber;
  String? cin;
  //User();
  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.typeSong,
        this.phoneNumber,
      this.cin});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    typeSong = json['type_song'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['type_song'] = this.typeSong;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }

}