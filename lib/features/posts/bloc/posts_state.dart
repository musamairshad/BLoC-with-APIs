part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

sealed class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostsFetchingErrorState extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<Post> posts;

  PostFetchingSuccessfulState({required this.posts});
}

class PostsAddSuccessState extends PostsActionState {}

class PostsAddErrorState extends PostsActionState {}
