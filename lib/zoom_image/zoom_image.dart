import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_widget/zoom_widget.dart';

/// [Zoom_ImageViewerNetwork] which is a  use to Circle Image Viewer Network
/// [String] which is a url
/// [Function] that a click event.
/// [double] that a mHeight of image
class Zoom_ImageViewerNetwork extends StatelessWidget {
  final String url;

  final double? height;
  final double? width;
  final BoxFit? mFit;

  const Zoom_ImageViewerNetwork({
    Key? key,
    required this.url,
    this.height,
    this.mFit,
    this.width,
    // this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return PhotoView(
      backgroundDecoration: BoxDecoration(color: Colors.transparent),
       loadingBuilder: (context, progress) => Center(
         child:  Image.asset(
               'assets/images/ic_loading.gif',
               height: height,
               width: width,
               fit: mFit ?? BoxFit.cover,
             ),
       ),
      imageProvider:
      CachedNetworkImageProvider(
          url,
      ), // CachedNetworkImage(
      //     height: height,
      //     width: width,
      //     fit: mFit ?? BoxFit.cover,
      //     errorWidget: (context, url, error) => Image.asset(
      //       'assets/images/ic_placeholder.png',
      //       height: height,
      //       width: width,
      //       // fit: mFit ?? BoxFit.cover,
      //     ),
      //     placeholder: (context, url) => Image.asset(
      //       'assets/images/ic_loading.gif',
      //       height: height,
      //       width: width,
      //       fit: mFit ?? BoxFit.cover,
      //     ),
      //     imageUrl: url
      // ),
      );
  }
}
