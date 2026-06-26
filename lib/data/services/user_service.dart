import '../models/user_model.dart';

class UserService {
  final List<UserModel> _usuarios = [];

  void cadastrar(UserModel user) {
    _usuarios.add(user);
  }

  UserModel? buscarPorEmail(String email) {
    try {
      return _usuarios.firstWhere(
        (user) => user.email == email,
      );
    } catch (e) {
      return null;
    }
  }
}