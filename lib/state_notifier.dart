import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_state_notifier_provider/states.dart';

import 'api_provider.dart';

class AlbumStateNotifier extends StateNotifier<AlbumState> {
  AlbumStateNotifier() : super(const AlbumInitialState());
  void fetch() async {
    var albumApiProvider = AlbumApiProvider();
    state = const AlbumLoadingState();
    try {
      var albums = await albumApiProvider.fetchAlbums();
      state = AlbumLoadedState(albums);
    } catch (e) {
      state = AlbumErrorState(e.toString());
    }
  }
}
