import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloccourse/cubit/post_state.dart';
import 'package:http/http.dart' as http;

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading());
  Future fetchPosts() async {
    emit(PostLoading());
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/POSTS'));
      if (response.statusCode == 200) {
        final List posts = json.decode(response.body);
        emit(PostLoaded(posts));
      }
    } catch (e) {
      emit(PostError('Error $e'));
    }
  }
}
