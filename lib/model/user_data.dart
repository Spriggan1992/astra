class UserData {
  final String name;

  UserData(this.name);

  factory UserData.emptyReff() {
    return UserData('');
  }
}
