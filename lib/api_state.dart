import 'api_cubit.dart';

import 'package:flutter/material.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoadingState extends PostState {}

final class PostSuccessState extends PostState {}

final class PostErrorState extends PostState {}
