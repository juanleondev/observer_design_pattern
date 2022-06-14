import 'package:design_patterns_talk/video_model.dart';
import 'package:design_patterns_talk/subscriber.dart';

class ChallengeSubscriber extends Subscriber {
  @override
  void update(Video video) {
    if (video.type == VideoType.challenge) {
      videoStreamController.add(video);
    }
  }
}
