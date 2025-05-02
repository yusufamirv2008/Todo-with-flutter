import 'dart:convert';

import 'package:alif_academy/src/data/datasources/Post_remote_data_source.dart';
import 'package:alif_academy/src/data/models/comment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostsByUserEvent>((event, emit) async {
      emit(PostLoading());
      final result = await PostRemoteDataSourceImpl().getPostsByUser(
        event.userId,
      );

      if (result.isNotEmpty) {
        emit(PostLoaded(result));
      } else {
        emit(PostError("Ошибка загрузки данных"));
      }
    });
  }
  Future<void> _onGetComments(
    GetCommentsEvent event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoading());
    try {
      final response = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/comments?postId=${event.postId}',
        ),
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final comments = data.map((e) => Comment.fromJson(e)).toList();
        emit(CommentLoaded(comments));
      } else {
        emit(CommentError("Failed to load comments"));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}
