import 'package:flutter_riverpod/flutter_riverpod.dart';

final frameControllerProvider =
    StateNotifierProvider<FrameController, int>((ref) {
  return FrameController(0);
});

class FrameController extends StateNotifier<int> {
  FrameController(super.state);

  void setPosition(int value) {
    state = value;
  }
}
