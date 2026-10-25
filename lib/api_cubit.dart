import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'model.dart';
import 'api_state.dart';
import "api_cubit.dart";

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  List<PostModel> posts = [];

  Future<void> fetchPosts() async {
    emit(PostLoadingState());
    try {
      final response = await Dio(
        BaseOptions(headers: {"Content-Type": "application/json"}),
      ).get("https://dummyjson.com/posts");

      List apiList = response.data["posts"];
      posts = apiList.map((e) => PostModel.fromJson(e)).toList();
      emit(PostSuccessState());
    } catch (e) {
      emit(PostErrorState());
      print(e);
    }
  }
}
