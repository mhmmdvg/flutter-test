import 'package:flutter/material.dart';
import 'package:flutter_application_test/datasource/remote_datasource.dart';
import 'package:flutter_application_test/bloc/post/post_bloc.dart';
import 'package:flutter_application_test/ui/app_bar.dart';
import 'package:flutter_application_test/ui/list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostBloc(remoteDatasource: RemoteDatasource())..add(LoadPost()),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8)
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomAppBar(
            text: 'Home',
          ),
          body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostLoaded) {
                final data = state.posts;
                return ListViewCustom(data: data);
              } else if (state is PostError) {
                return Center(child: Text(state.error));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
