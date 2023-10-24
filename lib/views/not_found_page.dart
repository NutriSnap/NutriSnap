import 'package:flutter/material.dart';
// import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nutrisnap/views/settings/settings_page.dart';

const pageSpecification = '''
# Page Not Found

This page appears when there is a bug in routing.
''';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  static const routeName = '404';

  @override
  Widget build(BuildContext context) {
    return const MockupMarkdownView(
      title: 'Page Not Found',
      data: pageSpecification,
    );
  }
}

class MockupMarkdownView extends StatelessWidget {
  const MockupMarkdownView({Key? key, this.title = "Title", this.data = "Data"})
      : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: const DrawerView(),
        appBar: AppBar(
          title: Text(title),
          // add a button to the AppBar that navigates to the settings page.
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
            )
          ],
        ),
        body: Markdown(data: data));
  }
}
