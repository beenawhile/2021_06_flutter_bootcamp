import 'package:flutter_design_patterns/design_patterns/facade/apis/apis.dart';
import 'package:flutter_design_patterns/design_patterns/facade/smart_home_state.dart';

class GamingFacade {
  final PlaystationApi _playstationApi = PlaystationApi();
  final CameraApi _cameraApi = CameraApi();

  void startGaming(SmartHomeState state) {
    state.gamingConsoleOn = _playstationApi.turnOn();
  }

  void stopGaming(SmartHomeState state) {
    state.gamingConsoleOn = _playstationApi.turnOff();
  }

  void startStreaming(SmartHomeState state) {
    state.streamingCameraOn = _cameraApi.turnCameraOn();
    startGaming(state);
  }

  void stopStreaming(SmartHomeState state) {
    state.streamingCameraOn = _cameraApi.turnCameraOff();
    stopGaming(state);
  }
}
