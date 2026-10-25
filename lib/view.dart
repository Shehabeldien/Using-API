import 'api_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import "api_cubit.dart";
import "api_state.dart";

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: cubit.fetchPosts,
                child: const Text('Retry'),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: cubit.posts.length,
            itemBuilder: (_, i) {
              final post = cubit.posts[i];
              return Card(
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(
                    post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.thumb_up, size: 16),
                      Text('${post.likes}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
