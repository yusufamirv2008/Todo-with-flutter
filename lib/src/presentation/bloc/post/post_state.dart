import 'package:alif_academy/src/data/models/comment_model.dart';
import 'package:alif_academy/src/domain/entities/post.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;
  CommentLoaded(this.comments);
}

class CommentError extends CommentState {
  final String message;
  CommentError(this.message);
}
