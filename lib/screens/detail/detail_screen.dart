import 'package:flutter/material.dart';
import 'package:flutter_application_test/datasource/remote_datasource.dart';
import 'package:flutter_application_test/bloc/detail_post/detail_post_bloc.dart';
import 'package:flutter_application_test/ui/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailPostBloc(id: id, remoteDatasource: RemoteDatasource())
            ..add(LoadDetailPost()),
      child: BlocBuilder<DetailPostBloc, DetailPostState>(
        builder: (context, state) {
          if (state is DetailPostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DetailPostLoaded) {
            final data = state.post;
            return Container(
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
                  appBar: CustomAppBar(text: data.title),
                  body: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data.body,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  )),
            );
          } else if (state is DetailPostError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
