import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_notifier_provider/state_notifier.dart';
import 'package:riverpod_state_notifier_provider/states.dart';

final albumStateProvider =
    StateNotifierProvider<AlbumStateNotifier, AlbumState>((ref) {
  return AlbumStateNotifier();
});
