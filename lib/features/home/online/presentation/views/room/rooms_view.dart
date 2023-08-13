import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/providers/rooms_provider.dart';

class RoomsView extends ConsumerStatefulWidget {
  const RoomsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomsViewState();
}

class _RoomsViewState extends ConsumerState<RoomsView> {
  @override
  void initState() {
    super.initState();
    ref.read(roomsProvider.notifier).getRooms();
  }

  @override
  Widget build(BuildContext context) {
    final rooms = ref.watch(roomsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
      ),
      body: rooms == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: ref.read(roomsProvider.notifier).getRooms,
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return RoomWidget(
                    room: room,
                  );
                },
              ),
            ),
    );
  }
}

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.navigator.pushNamed(
        Routes.room,
        arguments: room,
      ),
      title: Text(room.name),
      subtitle: Text(room.code),
      trailing: Text(room.isAdmin ? 'Admin' : 'Member'),
    );
  }
}
