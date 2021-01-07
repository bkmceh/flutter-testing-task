class UsersElement {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  UsersElement(this.id, this.name, this.username, this.email, this.address,
      this.phone, this.website, this.company);

  UsersElement.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'] ?? 'NAME',
        name = json['name'] ?? 'FILE',
        username = json['username'] ?? 'username',
        email = json['email'] ?? 'email',
        address = json['address'],
        phone = json['phone'],
        website = json['website'],
        company = json['company'];
}

class UsersElementList {
  List<UsersElement> usersList;

  UsersElementList.fromMappedJson(List<dynamic> json) {
    usersList = json.map((user) => UsersElement.fromMappedJson(user)).toList();
  }
}

class UserStore {
  static List<UsersElement> userData = List();
}
