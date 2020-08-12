class User {
  String _userName;
  String _firstName;
  String _lastName;
  String _avatar = '';
  String _email;

  User();

  set userName(String userName) {
    this._userName = userName;
  }

  set firstName(String firstName) {
    this._firstName = firstName;
  }

  set lastName(String lastName) {
    this._lastName = lastName;
  }

  set avatar(String avatar) {
    this._avatar = avatar;
  }

  set email(String email) {
    this._email = email;
  }

  get userName => this._userName;
  get firstName => this._firstName;
  get lastName => this._lastName;
  get avatar => this._avatar;
  get email => this._email;
}
