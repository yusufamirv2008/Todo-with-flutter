import 'package:alif_academy/src/presentation/bloc/post/post_bloc.dart';
import 'package:alif_academy/src/presentation/bloc/user/user_bloc.dart';
import 'package:alif_academy/src/presentation/pages/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const UserListPage(),
      ),
    );
  }
}
