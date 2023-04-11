import 'package:flutter/cupertino.dart';

class DocumentSummaryPage extends StatelessWidget {
  const DocumentSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitleAndParagraph('Was ist das für ein Dokument?',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel dapibus sapien, ac malesuada justo. Maecenas vestibulum sagittis sapien in volutpat.'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          buildTitleAndParagraph('Inhalt',
              'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent interdum fermentum consequat.'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          buildTitleAndParagraph('Konsequenzen und Aufgaben',
              'Proin vitae mi ut orci malesuada tristique vel ut sapien. Donec id convallis odio, id lobortis velit. Pellentesque in ullamcorper enim.'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          buildTitleAndParagraph('Mögliche Antwort',
              'Fusce nec felis non lectus lacinia tempus. Integer suscipit urna ut risus consequat, ac feugiat tellus fermentum.'),
        ],
      ),
    );
  }

  Widget buildTitleAndParagraph(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
