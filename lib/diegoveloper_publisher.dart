import 'dart:async';

import 'package:design_patterns_talk/publisher.dart';
import 'package:design_patterns_talk/video_model.dart';
import 'package:faker/faker.dart';

class DiegoveloperPublisher extends Publisher {
  DiegoveloperPublisher() {
    title = 'Diegoveloper';
    videoTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      final randomNumber = faker.randomGenerator.integer(20, min: 1);
      bool isChallenge = randomNumber > 10;
      print(randomNumber);
      publish(
          isChallenge ? 'Nuevo challenge' : 'Video normal',
          isChallenge
              ? 'Disfruta este nuevo challenge de animacion'
              : 'Disfruta este video normal',
          isChallenge ? VideoType.challenge : VideoType.normal,
          isChallenge
              ? 'https://i.ibb.co/s1YSmZ5/Captura-de-pantalla-de-2022-06-13-17-42-44.png'
              : 'https://i.ibb.co/6tstZxK/Captura-de-pantalla-de-2022-06-13-17-45-04.png');
      notifiySubs();
    });
  }
}
