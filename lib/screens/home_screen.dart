// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

// 기초적인 data fetching 방식
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;

//   void waitForWebtoons() async {
//     webtoons = await ApiService.getTodaysToons();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     waitForWebtoons();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "오늘의 웹툰",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         foregroundColor: Colors.green,
//         backgroundColor: Colors.white,
//         elevation: 2,
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot: future의 상태값
          if (snapshot.hasData) {
            // 기본적인 ListView. 최적화가 되어있지 않아서 메모리 낭비가 심함
            // return ListView(
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );

            // ListView 최적화
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: snapshot.data!.length,
            // itemBuilder: (context, index) {
            //   var webtoon = snapshot.data![index];
            //   return Text(webtoon.title);
            // },
            // );

            return ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
