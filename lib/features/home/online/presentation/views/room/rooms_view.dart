import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/constants.dart';
import 'package:foodito/config/utils/lottie.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/core/errors/views/server_error.dart';
import 'package:foodito/core/state/providers/loading_provider.dart';
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
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: AppConstants.create,
                child: Text(AppStrings.createRoom.tr()),
              ),
              PopupMenuItem(
                value: AppConstants.join,
                child: Text(AppStrings.joinRoom.tr()),
              ),
            ],
            onSelected: (value) {
              if (value == AppConstants.create) {
                context.navigator.pushNamed(Routes.createRoom);
              } else if (value == AppConstants.join) {
                showDialog(
                  context: context,
                  builder: (context) => JoinRoomDialog(
                    onAdd: (code) async {
                      ref.read(loadingProvider.notifier).loading();
                      final room =
                          await ref.read(roomsProvider.notifier).joinRoom(code);
                      ref.read(loadingProvider.notifier).doneLoading();
                      if (context.mounted) {
                        if (room != null) {
                          context.navigator.pushNamed(
                            Routes.room,
                            arguments: room,
                          );
                        }
                      }
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: rooms.fold(
        (l) => ServerTryAgain(
            onPressed: () => ref.read(roomsProvider.notifier).getRooms()),
        (rooms) => rooms == null
            ? const LottieLoading()
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

typedef CodeCallback = void Function(String code);

class JoinRoomDialog extends StatefulWidget {
  const JoinRoomDialog({
    super.key,
    required this.onAdd,
  });

  final CodeCallback onAdd;

  @override
  State<JoinRoomDialog> createState() => _JoinRoomDialogState();
}

class _JoinRoomDialogState extends State<JoinRoomDialog> {
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.joinRoom.tr()),
      content: TextField(
        controller: _codeController,
        decoration: InputDecoration(
          labelText: AppStrings.enterRoomCode.tr(),
          border: const OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.navigator.pop(),
          child: Text(AppStrings.cancel.tr()),
        ),
        TextButton(
          onPressed: () {
            final code = _codeController.text;
            if (code.isNotEmpty) {
              widget.onAdd(code);
              context.navigator.pop();
            }
          },
          child: Text(AppStrings.joinRoom.tr()),
        ),
      ],
    );
  }
}
