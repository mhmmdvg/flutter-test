import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/post.dart';
import 'package:flutter_application_test/screens/detail/detail_screen.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({
    super.key,
    required this.data,
  });

  final List<Post> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade800.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.of(context).push(_createRoute(data[index].id));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        data[index].title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Route _createRoute(int id) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DetailScreen(id: id),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      });
}
