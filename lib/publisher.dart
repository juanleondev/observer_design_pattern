import 'dart:async';

import 'package:design_patterns_talk/video_model.dart';
import 'package:design_patterns_talk/subscriber.dart';
import 'package:flutter/cupertino.dart';

abstract class Publisher {
  late final String title;
  late final Timer videoTimer;

  void removeSubscriber(Subscriber subscriber) =>
      subscribers.removeWhere((element) => element.id == subscriber.id);
  void addSubscriber(Subscriber subscriber) => subscribers.add(subscriber);
  List<Subscriber> subscribers = [];

  Video? lastVideo;

  void notifiySubs() {
    for (var subscriber in subscribers) {
      subscriber.update(lastVideo!);
    }
  }

  void publish(String title, String description, VideoType type, String url) {
    lastVideo = Video(title, description, type, url);
  }

  void stopTimer() {
    videoTimer.cancel();
  }
}
