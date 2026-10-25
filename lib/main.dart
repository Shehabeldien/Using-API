import 'package:api_app/view.dart';

import 'api_cubit.dart';
import "api_state.dart";

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit()..fetchPosts(),
      child: const MaterialApp(home: PostsView()),
    );
  }
}
