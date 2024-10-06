import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatelessWidget {
  final List<Map<String, String>> communities = [
    {
      'name': 'Programmers Arena',
      'url': 'https://www.facebook.com/pa.hstu',
    },
    {
      'name': 'CSE Club of HSTU',
      'url': 'https://www.facebook.com/cseclub.hstu',
    },
    {
      'name': 'IEEE Computer Society HSTU Student Branch Chapter',
      'url': 'https://www.facebook.com/profile.php?id=61565907492071',
    },
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showUrl(BuildContext context, String url) {
    // Show a dialog with the URL and a button to open it
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Community URL'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(url),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  _launchURL(url); // Launch the URL when clicked
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Open in Browser'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                communities[index]['name']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _showUrl(context, communities[index]['url']!); // Show URL dialog on tap
              },
            ),
          );
        },
      ),
    );
  }
}
