import 'package:bloccourse/cubit/post_cubit.dart';
import 'package:bloccourse/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PostCubit>().fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note App'),
        ),
        body: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
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
                  context.read<PostCubit>().fetchPosts();
                },
                child: Center(child: Text('Error Try again')));
          } else {
            return SizedBox();
          }
        }));
  }
}
