import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/app_routes.dart';
import 'data/services/user_service.dart';
import 'data/repositories/user_repository.dart';
import 'ui/viewmodels/login_viewmodel.dart';
import 'ui/viewmodels/cadastro_viewmodel.dart';
import 'ui/views/login_view.dart';
import 'ui/views/cadastro_view.dart';
import 'ui/views/home_view.dart';

void main() {
  final userService = UserService();
  final userRepository = UserRepository(userService);

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({
    super.key,
    required this.userRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(userRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => CadastroViewModel(userRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Avaliação Final',
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.login: (_) => const LoginView(),
          AppRoutes.cadastro: (_) => const CadastroView(),
          AppRoutes.home: (_) => const HomeView(),
        },
      ),
    );
  }
}