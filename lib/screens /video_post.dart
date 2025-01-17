// video_post_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_sharing_app2/screens%20/bloc/share_bloc.dart';
import 'package:share_plus/share_plus.dart';

class VideoPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShareBloc(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is a sample video post'),
            BlocConsumer<ShareBloc, ShareState>(
              listener: (context, state) {
                if (state is LinkGenerated) {
                  Share.share(state.url);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<ShareBloc>().add(GenerateLink(type: 'video'));
                  },
                  child: Text('Share'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
