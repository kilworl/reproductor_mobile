import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:soundfunction/consts/colors.dart';
import 'package:soundfunction/consts/text_style.dart';
import 'package:soundfunction/controllers/players_controllers.dart';

class Player extends StatelessWidget {
  final SongModel data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerControllers>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
              child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: QueryArtworkWidget(
              id: data.id,
              type: ArtworkType.AUDIO,
              artworkHeight: double.infinity,
              artworkWidth: double.infinity,
              nullArtworkWidget: const Icon(
                Icons.music_note,
                size: 48,
                color: whiteColor,
              ),
            ),
          )),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: Color.fromARGB(142, 33, 30, 30),
            ),
            child: Column(
              children: [
                Text(
                  data.displayNameWOExt,
                  style: ourStyle(
                    color: bgDarkColor,
                    family: bold,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  data.artist.toString(),
                  style: ourStyle(
                    color: bgDarkColor,
                    family: bold,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      controller.duration.value,
                      style: ourStyle(
                        color: whiteColor,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        min: const Duration(seconds: 0).inSeconds.toDouble(),
                        max: controller.max.value,
                        value: controller.value.value,
                        onChanged: (newValue) {
                          controller.changeDurationToSeconds(newValue.toInt());
                          newValue = newValue;
                        },
                        thumbColor: sliderColor,
                        activeColor: sliderColor,
                        inactiveColor: bgColor,
                      ),
                    ),
                    Text(
                      controller.position.value,
                      style: ourStyle(color: whiteColor),
                    )
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                          color: bgDarkColor,
                        )),
                    Obx(
                      () => CircleAvatar(
                        radius: 35,
                        backgroundColor: bgDarkColor,
                        child: Transform.scale(
                          scale: 2.5,
                          child: IconButton(
                              onPressed: () {
                                if (controller.isPlaying.value) {
                                  controller.audioPlayer.pause();
                                  controller.isPlaying(false);
                                } else {
                                  controller.audioPlayer.play();
                                  controller.isPlaying(true);
                                }
                              },
                              icon: controller.isPlaying.value
                                  ? const Icon(
                                      Icons.pause,
                                      color: whiteColor,
                                    )
                                  : const Icon(
                                      Icons.play_arrow_rounded,
                                      color: whiteColor,
                                    )),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.skip_next_rounded,
                            size: 40, color: bgDarkColor)),
                  ],
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
