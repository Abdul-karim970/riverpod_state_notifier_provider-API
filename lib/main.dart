import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_notifier_provider/provider.dart';
import 'package:riverpod_state_notifier_provider/states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          AlbumState state = ref.watch(albumStateProvider);
          if (state is AlbumInitialState) {
            return const Text('Click button to load data');
          } else if (state is AlbumLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is AlbumLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var album = state.albums[index];
                return ListTile(
                  leading: Text(album.id.toString()),
                  title: Text(album.title),
                );
              },
            );
          } else {
            return Text((state as AlbumErrorState).errorMessage);
          }
        },
      ),
    );
  }
}
