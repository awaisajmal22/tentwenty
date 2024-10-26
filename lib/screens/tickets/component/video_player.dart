import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends HookWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoController = useMemoized(
        () => VideoPlayerController.networkUrl(Uri.parse(videoUrl)));
    final isVideoInitialized = useState(false);

    useEffect(() {
      videoController.initialize().then((_) {
        isVideoInitialized.value = true;
        videoController.play();
        videoController.setLooping(false);
      });

      
      videoController.addListener(() {
        if (videoController.value.position == videoController.value.duration) {
          Navigator.of(context).pop();
        }
      });

      return videoController.dispose;
    }, [videoController]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: isVideoInitialized.value
            ? AspectRatio(
                aspectRatio: videoController.value.aspectRatio,
                child: VideoPlayer(videoController),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
