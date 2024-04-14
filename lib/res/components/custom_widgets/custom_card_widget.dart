import 'package:flutter/material.dart';

class DealCardWidget extends StatelessWidget {
  final String imageUrl;
  final int commentsCount;
  final String createdDate;

  const DealCardWidget({
    Key? key,
    required this.imageUrl,
    required this.commentsCount,
    required this.createdDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: GestureDetector(
        onTap: () {
        },
        child: Card(
          elevation: 2,
          shadowColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      imageUrl,
                      height: 50,
                      width: 100,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 10),
                    Expanded(
                      child: Text(
                        "Top Deals",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 44),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.thumb_up, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '10',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(Icons.comment, size: 18),
                        SizedBox(width: 4),
                        Text(
                          '$commentsCount',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: 4),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 18),
                        SizedBox(width: 4),
                        Text(
                          createdDate.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 4),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Text(
                          'At Other',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
