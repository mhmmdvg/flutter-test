import 'package:flutter/material.dart';
import 'package:flutter_application_test/datasource/remote_datasource.dart';
import 'package:flutter_application_test/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final RemoteDatasource remoteDatasource;
  PostBloc({required this.remoteDatasource}) : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      emit(PostLoading());
      try {
        final result = await remoteDatasource.getPost();
        emit(PostLoaded(result.data));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
