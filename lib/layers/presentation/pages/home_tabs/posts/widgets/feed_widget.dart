import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jiffy/jiffy.dart';
import 'package:posts_app/layers/data/dto/posts_dto.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/comment_button.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/image_widget.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/like_button.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/like_widget.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/love_widget.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/widgets/share_button.dart';

class FeedListItem extends StatelessWidget {
  const FeedListItem({super.key, required this.data});

  final PostsDataDto data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: ImageWidget(
                        data: data.image ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${data.owner?.title ?? ''}.${data.owner?.firstName ?? ''} ${data.owner?.lastName ?? ''}',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          Jiffy.parse(data.publishDate ?? '').fromNow(),
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data.text ?? '',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                height: 1.5,
                letterSpacing: .7,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (data.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: ImageWidget(
                  data: data.image ?? '',
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            if (data.tags!.isNotEmpty)
              Wrap(
                children: data.tags!
                    .map(
                      (e) => Text(
                        '#$e ',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const LikeWidget(),
                    Transform.translate(
                      offset: const Offset(-5, 0),
                      child: const LoveWidget(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      data.likes?.toString() ?? '',
                      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                    ),
                  ],
                ),
                Text(
                  '400 Comments',
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(isActive: true),
                CommentButton(),
                ShareButton(),
              ],
            ),
          ],
        ),
      ),
    ).animate().shimmer(duration: 1.seconds).fade(duration: 1.seconds);
  }
}
