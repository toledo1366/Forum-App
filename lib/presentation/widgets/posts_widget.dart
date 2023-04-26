import 'package:flutter/material.dart';

import '../../domain/models/posts/post.dart';

class PostsWidget extends StatelessWidget {
  final Post post;
  final bool isRemovable;
  final void Function(Post post)? onRemove;
  final void Function(Post post)? onPostPressed;

  const PostsWidget({
    Key? key,
    required this.post,
    this.onPostPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              post.title ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  post.body ?? '',
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (onPostPressed != null) {
      onPostPressed?.call(post);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove?.call(post);
    }
  }
}