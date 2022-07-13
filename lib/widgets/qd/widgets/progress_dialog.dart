import 'package:flutter/material.dart';
import 'package:video_compress/video_compress.dart';

class ProgressDialog extends StatefulWidget {
  const ProgressDialog({Key? key}) : super(key: key);

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog> {
  late Subscription subscription;
  double? progress;
  @override
  void initState() {
    subscription = VideoCompress.compressProgress$
        .subscribe((progress) => setState(() => this.progress = progress));
    super.initState();
  }

  @override
  void dispose() {
    VideoCompress.cancelCompression();
    subscription.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = progress == null ? progress : progress! / 100;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Compressing video..."),
          SizedBox(
            height: 20,
          ),
          LinearProgressIndicator(
            value: value,
            minHeight: 12,
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () => VideoCompress.cancelCompression(),
              child: Text("cancel"))
        ],
      ),
    );
  }
}
