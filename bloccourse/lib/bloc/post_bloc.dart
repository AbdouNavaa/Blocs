import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloccourse/bloc/post_event.dart';
import 'package:bloccourse/cubit/post_state.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoading()) {
    on<FetchPostEvent>((event, emit) async {
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
    });
  }
}
