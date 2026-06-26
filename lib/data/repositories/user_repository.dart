import '../models/user_model.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService service;

  UserRepository(this.service);

  void cadastrarUsuario(UserModel user) {
    service.cadastrar(user);
  }

  UserModel? buscarUsuarioPorEmail(String email) {
    return service.buscarPorEmail(email);
  }
}