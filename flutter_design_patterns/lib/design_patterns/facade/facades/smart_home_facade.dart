import 'package:flutter_design_patterns/design_patterns/facade/apis/apis.dart';
import 'package:flutter_design_patterns/design_patterns/facade/facades/gaming_facade.dart';
import 'package:flutter_design_patterns/design_patterns/facade/smart_home_state.dart';

class SmartHomeFacade {
  final GamingFacade _gamingFacade = GamingFacade();
  final TvApi _tvApi = TvApi();
  final AudioApi _audioApi = AudioApi();
  final NetflixApi _netflixApi = NetflixApi();
  final SmartHomeApi _smartHomeApi = SmartHomeApi();

  void startMovie(SmartHomeState state, String movieTitle) {
    state.lightsOn = _smartHomeApi.turnLightsOff();
    state.tvOn = _tvApi.turnOn();
    state.audioSystemOn = _audioApi.turnSpeakerOn();
    state.netflixConnected = _netflixApi.connect();
    _netflixApi.play(movieTitle);
  }

  void stopMovie(SmartHomeState state) {
    state.netflixConnected = _netflixApi.disconnect();
    state.audioSystemOn = _audioApi.turnSpeakerOff();
    state.tvOn = _tvApi.turnOff();
    state.lightsOn = _smartHomeApi.turnLightsOn();
  }

  void startGaming(SmartHomeState state) {
    state.lightsOn = _smartHomeApi.turnLightsOff();
    state.tvOn = _tvApi.turnOn();
    _gamingFacade.startGaming(state);
  }

  void stopGaming(SmartHomeState state) {
    _gamingFacade.stopGaming(state);
    state.tvOn = _tvApi.turnOff();
    state.lightsOn = _smartHomeApi.turnLightsOn();
  }

  void startStreaming(SmartHomeState state) {
    state.lightsOn = _smartHomeApi.turnLightsOn();
    state.tvOn = _tvApi.turnOn();
    _gamingFacade.startStreaming(state);
  }

  void stopStreaming(SmartHomeState state) {
    _gamingFacade.stopStreaming(state);
    state.tvOn = _tvApi.turnOff();
    state.lightsOn = _smartHomeApi.turnLightsOff();
  }
}
