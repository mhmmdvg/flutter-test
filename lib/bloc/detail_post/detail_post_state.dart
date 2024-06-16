part of 'detail_post_bloc.dart';

@immutable
sealed class DetailPostState {}

final class DetailPostInitial extends DetailPostState {}

final class DetailPostLoading extends DetailPostState {}

final class DetailPostLoaded extends DetailPostState {
  final Post post;

  DetailPostLoaded(this.post);
}

final class DetailPostError extends DetailPostState {
  final String error;

  DetailPostError(this.error);
}
