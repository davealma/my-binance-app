library my_app.globals;

import 'package:binance_app/models/user_model.dart';

List<UserModel> users = [];

registerUser({required String email, required String password}) {
  UserModel user = UserModel(email, password);
  users.add(user);
}

bool userExist({required String email, required String password}) {
  var result = users.any((user) => user.email == email && user.password == password);

  return result;
}