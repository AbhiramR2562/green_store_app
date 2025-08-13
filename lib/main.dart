import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greeny_app/features/cart/bloc/cart_bloc.dart';
import 'package:greeny_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:greeny_app/features/home/bloc/home_bloc.dart';
import 'package:greeny_app/features/home/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => FavoritesBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GREEN STORE',
        home: HomePage(),
      ),
    );
  }
}
