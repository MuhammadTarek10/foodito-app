import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/features/home/online/domain/entities/room.dart';
import 'package:foodito/features/home/online/presentation/state/providers/room_provider.dart';

class RoomView extends ConsumerStatefulWidget {
  const RoomView({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomViewState();
}

class _RoomViewState extends ConsumerState<RoomView> {
  @override
  void initState() {
    super.initState();
    ref.read(roomProvider.notifier).getRoom(widget.room.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
      ),
    );
  }
}
