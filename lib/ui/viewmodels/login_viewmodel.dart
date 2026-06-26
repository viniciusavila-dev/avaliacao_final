import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository repository;

  LoginViewModel(this.repository);

  String? erro;
  UserModel? usuarioLogado;

  bool login(String email, String senha) {
    erro = null;

    if (email.isEmpty) {
      erro = 'O e-mail é obrigatório';
    } else if (senha.isEmpty) {
      erro = 'A senha é obrigatória';
    } else if (senha.length < 8 || senha.length > 12) {
      erro = 'A senha deve ter entre 8 e 12 caracteres';
    } else {
      final usuario = repository.buscarUsuarioPorEmail(email);

      if (usuario == null) {
        erro = 'Usuário não encontrado';
      } else if (usuario.senha != senha) {
        erro = 'Senha incorreta';
      } else {
        usuarioLogado = usuario;
      }
    }

    notifyListeners();
    return erro == null;
  }
}