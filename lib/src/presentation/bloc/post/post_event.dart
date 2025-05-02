class PostEvent {}

class GetPostsByUserEvent extends PostEvent {
  final int userId;

  GetPostsByUserEvent(this.userId);
}

abstract class CommentEvent {}

class GetCommentsEvent extends CommentEvent {
  final int postId;
  GetCommentsEvent(this.postId);
}
