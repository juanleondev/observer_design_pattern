import 'dart:async';

import 'package:design_patterns_talk/video_model.dart';
import 'package:faker/faker.dart';

abstract class Subscriber {
  late final String title;
  final id = faker.guid.guid();
  StreamController<Video> videoStreamController =
      StreamController<Video>.broadcast();
  Stream<Video> get stream => videoStreamController.stream;
  void update(Video video);
}
