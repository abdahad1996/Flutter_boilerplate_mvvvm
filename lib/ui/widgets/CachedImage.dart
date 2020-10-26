import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

typedef callBack = void Function(bool IsRetry);

class Cached_Image extends StatelessWidget {
  String imageURL;
  final shape;
  final callBack retry;
  double width;
  double height;

  Cached_Image(
      {Key key, this.imageURL, this.shape, this.retry, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageURL,
        imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: shape,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        placeholder: (context, url) => Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
            ),
        errorWidget: (context, url, error) => Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  retry(true);
                })));
  }
}
