import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/online/presentation/state/providers/room_provider.dart';

class RoomsView extends ConsumerWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rooms = ref.watch(roomProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
      ),
      body: rooms == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                final room = rooms[index];
                return ListTile(
                  title: Text(room.name),
                  subtitle: Text(room.code),
                  trailing: Text(room.isAdmin ? 'Admin' : 'Member'),
                );
              },
            ),
    );
  }
}
