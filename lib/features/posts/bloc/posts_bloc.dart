import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_with_apis/features/posts/models/post.dart';
import 'package:bloc_with_apis/features/posts/repos/posts_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());

    final List<Post> posts = await PostsRepo.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }

  FutureOr<void> postAddEvent(
      PostAddEvent event, Emitter<PostsState> emit) async {
    bool success = await PostsRepo.addPost();
    // print(success);
    if (success) {
      emit(PostsAddSuccessState());
    } else {
      emit(PostsAddErrorState());
    }
  }
}
