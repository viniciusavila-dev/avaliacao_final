import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';
import '../viewmodels/cadastro_viewmodel.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CadastroViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xfff7f7fb),
      appBar: AppBar(
        backgroundColor: const Color(0xfff7f7fb),
        elevation: 0,
        title: const Text(
          'AppBrand',
          style: TextStyle(
            color: Color(0xff07348a),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff07348a),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Criar Conta',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Preencha os dados abaixo para começar',
            ),
            const SizedBox(height: 30),

            const Text('Nome Completo'),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Ex: João Silva',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Email'),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'nome@exemplo.com',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Senha'),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Mínimo 8 caracteres',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: const [
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Expanded(
                  child: Text(
                    'Eu aceito os Termos e Condições e a Política de Privacidade.',
                  ),
                ),
              ],
            ),

            if (viewModel.erro != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  viewModel.erro!,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff07348a),
                ),
                onPressed: () {
                  final sucesso = viewModel.cadastrar(
                    nomeController.text,
                    emailController.text,
                    senhaController.text,
                  );

                  if (sucesso) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                      ),
                    );

                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    );
                  }
                },
                child: const Text(
                  'Criar Conta',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}