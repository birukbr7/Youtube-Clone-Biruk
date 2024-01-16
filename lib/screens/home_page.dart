import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/youtube.png',
              width: 150,
            ),
            const Row(
              children: [
                Icon(
                  Icons.tv,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Badge(
                  label: Text(
                    '20',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FilterCatagories(),
            for (int i = 0; i < 10; i++) const VideoWidget(),
          ],
        ),
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.greenAccent,
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/800/450/"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/800/450"),
          ),
          title: const Text(
            'How to clone youtube by Biruk',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                '${Random().nextInt(1000)} views',
                style: const TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${Random().nextInt(15)} day ago',
                style: const TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.white54,
          ),
        )
      ],
    );
  }
}

class FilterCatagories extends StatelessWidget {
  const FilterCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterVideo(
            label: "All",
            isSelected: true,
          ),
          FilterVideo(
            label: "Mixes",
          ),
          FilterVideo(
            label: "Music",
          ),
          FilterVideo(
            label: "Live",
          ),
          FilterVideo(
            label: "Shorts",
          ),
          FilterVideo(
            label: "Gaming",
          ),
        ],
      ),
    );
  }
}

class FilterVideo extends StatelessWidget {
  final String label;
  final bool isSelected;
  const FilterVideo({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 10, top: 10, bottom: 10),
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
