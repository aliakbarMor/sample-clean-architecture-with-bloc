import 'package:eterex/core/route/app_route.dart';
import 'package:eterex/core/utils/token_container.dart';
import 'package:eterex/feature/campaign/presentation/screen/compaign_screen.dart';
import 'package:eterex/feature/login/domain/repository/user_repository.dart';
import 'package:eterex/feature/login/presentation/bloc/login_bloc.dart';
import 'package:eterex/feature/login/presentation/screens/login_screen.dart';
import 'package:eterex/feature/main/presentation/bloc/main_bloc.dart';
import 'package:eterex/feature/main/presentation/screens/main_screen.dart';
import 'package:eterex/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    locator<UserRepository>().loadToken();

    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (_) => locator<MainBloc>()),
      ],
      child: MaterialApp(
        title: 'aliakbar',
        theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'Yekan'),
        debugShowCheckedModeBanner: false,
        initialRoute:
            TokenContainer.token == null ? AppRouts.login : AppRouts.main,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRouts.login:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                    create: (_) => locator<LoginBloc>(),
                    child: const LoginScreen()),
                settings: settings,
              );
            case AppRouts.main:
              return MaterialPageRoute(
                builder: (_) => const MainScreen(),
                settings: settings,
              );
            case AppRouts.campaign:
              return MaterialPageRoute(
                builder: (_) => const CompaignScreen(),
                settings: settings,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
