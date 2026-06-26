import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class CadastroViewModel extends ChangeNotifier {
  final UserRepository repository;

  CadastroViewModel(this.repository);

  String? erro;

  bool cadastrar(String nome, String email, String senha) {
    erro = null;

    if (nome.isEmpty) {
      erro = 'O nome é obrigatório';
    } else if (email.isEmpty) {
      erro = 'O e-mail é obrigatório';
    } else if (!email.contains('@')) {
      erro = 'Digite um e-mail válido';
    } else if (senha.isEmpty) {
      erro = 'A senha é obrigatória';
    } else if (senha.length < 8 || senha.length > 12) {
      erro = 'A senha deve ter entre 8 e 12 caracteres';
    } else if (repository.buscarUsuarioPorEmail(email) != null) {
      erro = 'Este e-mail já está cadastrado';
    }

    if (erro != null) {
      notifyListeners();
      return false;
    }

    repository.cadastrarUsuario(
      UserModel(
        nome: nome,
        email: email,
        senha: senha,
      ),
    );

    notifyListeners();
    return true;
  }
}