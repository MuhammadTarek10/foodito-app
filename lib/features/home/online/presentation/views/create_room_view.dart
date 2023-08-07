import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/online/presentation/state/providers/room_provider.dart';

class CreateRoomView extends StatefulWidget {
  const CreateRoomView({super.key});

  @override
  State<CreateRoomView> createState() => _CreateRoomViewState();
}

class _CreateRoomViewState extends State<CreateRoomView> {
  late TextEditingController _roomNameController;
  late TextEditingController _roomCodeController;

  @override
  void initState() {
    super.initState();
    _roomNameController = TextEditingController();
    _roomCodeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _roomNameController.dispose();
    _roomCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Room'),
      ),
      body: Column(
        children: [
          Center(
            child: SvgPicture.asset(AppAssets.room),
          ),
          const SizedBox(height: AppSizes.s20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _roomNameController,
              decoration: InputDecoration(
                labelText: AppStrings.roomNameHint.tr(),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.s20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _roomCodeController,
              decoration: InputDecoration(
                labelText: AppStrings.roomCodeHint.tr(),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.s20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s20),
            child: Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () => ref.read(roomProvider.notifier).addRoom(
                      _roomNameController.text, _roomCodeController.text),
                  child: const Text('Create Room'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
