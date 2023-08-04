const String tableName = 'contacts';
const String columnId = 'id';
const String columnAccount = 'accountType';
const String columnEmail = 'email';

class Users {
  int? userID;
  String accountType;
  String email;

  Users({this.userID, required this.accountType, required this.email});

  Map<String, dynamic> toMap() {
    return {
      columnId: userID,
      columnAccount: accountType,
      columnEmail: email,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      userID: map[columnId],
      accountType: map[columnAccount],
      email: map[columnEmail],
    );
  }
}
