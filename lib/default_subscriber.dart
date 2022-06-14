import 'package:design_patterns_talk/video_model.dart';
import 'package:design_patterns_talk/subscriber.dart';

class DefaultSubscriber extends Subscriber {
  @override
  void update(Video video) {
    videoStreamController.add(video);
  }
}
