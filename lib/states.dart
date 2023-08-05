import 'package:flutter/material.dart';

import 'Album.dart';

@immutable
abstract class AlbumState {
  const AlbumState();
}

@immutable
class AlbumInitialState implements AlbumState {
  const AlbumInitialState();
}

@immutable
class AlbumLoadingState implements AlbumState {
  const AlbumLoadingState();
}

@immutable
class AlbumLoadedState implements AlbumState {
  final List<Album> albums;
  const AlbumLoadedState(this.albums);
}

@immutable
class AlbumErrorState implements AlbumState {
  final String errorMessage;
  const AlbumErrorState(this.errorMessage);
}
