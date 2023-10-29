import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toy/src/authentication/domian/presentation/cubit/authentication_cubit.dart';
import 'package:flutter_toy/src/authentication/domian/presentation/views/home_screen.dart';
import 'package:flutter_toy/src/core/services/injection_container.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        home: const HomeScreen(),

      ),
    );
  }
}
