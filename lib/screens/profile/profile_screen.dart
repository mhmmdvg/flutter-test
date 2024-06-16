import 'package:flutter/material.dart';
import 'package:flutter_application_test/ui/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  _launchGit() async {
    final Uri url = Uri.parse('https://github.com/mhmmdvg');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  _launchLinkedin() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/muhammad-vikri/');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade200.withOpacity(0.8),
            Colors.deepPurple.shade800.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(text: 'Profile'),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 120,
                  backgroundColor: Color.fromARGB(255, 131, 78, 221),
                  child: CircleAvatar(
                    radius: 115,
                    backgroundImage: AssetImage('assets/images/me.JPG'),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  'Muhammad Vikri',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const Text(
                  'Frontend Developer',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color.fromARGB(255, 238, 238, 238),
                    // color: Colors.grey[200]
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _launchGit,
                      child: const SizedBox(
                          height: 50,
                          child: Image(
                              image: AssetImage('assets/images/github.png'))),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    TextButton(
                      onPressed: _launchLinkedin,
                      child: const SizedBox(
                          height: 50,
                          child: Image(
                              image: AssetImage('assets/images/linkedin.png'))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
