import 'package:bloccourse/bloc/post_bloc.dart';
import 'package:bloccourse/bloc/post_event.dart';
import 'package:bloccourse/cubit/post_cubit.dart';
import 'package:bloccourse/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomePage extends StatefulWidget {
  const BlocHomePage({super.key});

  @override
  State<BlocHomePage> createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  @override
  void initState() {
    context.read<PostBloc>().add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note App'),
        ),
        body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is PostLoading) {
            return const CircularProgressIndicator();
          } else if (state is PostLoaded) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index]['id'].toString()),
                    subtitle: Text(state.posts[index]['title']),
                  );
                });
          } else if (state is PostError) {
            // return Text(state.message);
            return InkWell(
                onTap: () {
                  // context.read<PostCubit>().fetchPosts();
                  context.read<PostBloc>().add(FetchPostEvent());
                },
                child: Center(child: Text('Error Try again')));
          } else {
            return SizedBox();
          }
        }));
  }
}
