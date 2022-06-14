import 'dart:async';

import 'package:design_patterns_talk/challenge_subscriber.dart';
import 'package:design_patterns_talk/default_subscriber.dart';
import 'package:design_patterns_talk/diegoveloper_publisher.dart';
import 'package:design_patterns_talk/video_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _publisher = DiegoveloperPublisher();
  final _subscriberList = [DefaultSubscriber(), ChallengeSubscriber()];

  late StreamSubscription<Video> _videSubscription;
  int _selectedSubscriberIndex = 0;
  List<Video> videoList = [];
  @override
  void initState() {
    _publisher.addSubscriber(_subscriberList[0]);
    _videSubscription = _subscriberList[0].stream.listen((event) {
      setState(() {
        videoList.add(event);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _videSubscription.cancel();
    _publisher.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Videos'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<int>(
                title: const Text('All'),
                value: 0,
                groupValue: _selectedSubscriberIndex,
                onChanged: (value) {
                  _publisher.removeSubscriber(_subscriberList[1]);
                  _videSubscription.cancel();
                  videoList.clear();
                  _publisher.addSubscriber(_subscriberList[0]);
                  _videSubscription = _subscriberList[0].stream.listen((event) {
                    setState(() {
                      videoList.add(event);
                    });
                  });
                  setState(() {
                    _selectedSubscriberIndex = value!;
                  });
                }),
            RadioListTile<int>(
                title: const Text('Challenge'),
                value: 1,
                groupValue: _selectedSubscriberIndex,
                onChanged: (value) {
                  _publisher.removeSubscriber(_subscriberList[0]);
                  _videSubscription.cancel();
                  videoList.clear();
                  _publisher.addSubscriber(_subscriberList[1]);
                  _videSubscription = _subscriberList[1].stream.listen((event) {
                    setState(() {
                      videoList.add(event);
                    });
                  });
                  setState(() {
                    _selectedSubscriberIndex = value!;
                  });
                }),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Notificaciones',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(videoList[index].url),
                  title: const Text('Nuevo video'),
                  subtitle: Text(videoList[index].title),
                );
              },
              itemCount: videoList.length,
            ))
          ],
        ));
  }
}
