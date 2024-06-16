import 'package:flutter_application_test/datasource/remote_datasource.dart';
import 'package:flutter_application_test/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'detail_post_event.dart';
part 'detail_post_state.dart';

class DetailPostBloc extends Bloc<DetailPostEvent, DetailPostState> {
  final RemoteDatasource remoteDatasource;
  final int id;

  DetailPostBloc({required this.id, required this.remoteDatasource})
      : super(DetailPostInitial()) {
    on<LoadDetailPost>((event, emit) async {
      emit(DetailPostLoading());

      try {
        final result = await remoteDatasource.getDetailPost(id);
        emit(DetailPostLoaded(result));
      } catch (e) {
        emit(DetailPostError(e.toString()));
      }
    });
  }
}
