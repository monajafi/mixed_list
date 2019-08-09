import 'package:flutter/material.dart';

void main() => runApp(MyApp(
      items: List<ListItem>.generate(
          120,
          (i) => (i % 6 == 0)
              ? HeadingItem(heading: "Heading $i")
              : MessageItem(sender: "Sender $i", message: "Message $i")),
    ));

class MyApp extends StatelessWidget {
  final title = "Mixed list";
  final List<ListItem> items;
  MyApp({this.items});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            ListItem item = items[index];
            if (item is HeadingItem) {
              return ListTile(
                  title: Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ));
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.message),
              );
            }
          },
        ),
      ),
    );
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem({this.heading});
}

class MessageItem implements ListItem {
  final String sender;
  final String message;

  MessageItem({this.sender, this.message});
}
