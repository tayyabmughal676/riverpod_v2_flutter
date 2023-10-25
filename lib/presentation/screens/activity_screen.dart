// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_v2/data/models/ActivityResponse.dart';
import 'package:riverpod_v2/presentation/providers/user_entries.dart';

class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRead = ref.read(userEntriesProvider.notifier);
    final entries = ref.watch(userEntriesProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          isRead.increment();
        },
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: switch (entries) {
              AsyncData(:final value) => ListView.builder(
                  itemCount: value.data!.entries!.length,
                  itemBuilder: (context, index) {
                    var data = value.data!.entries![index];
                    var title = data.category.toString();
                    var link = data.link.toString();
                    return Card(
                      child: ListTile(
                        title: Text("${index + 1}, $title"),
                        subtitle: Text(link),
                        onTap: () {
                          isRead.addCategory(data: data);
                        },
                      ),
                    );
                  }),
              AsyncError() => const Text("Oops, something unexpected happened"),
              _ => const CircularProgressIndicator(),
            },
          ),
        ),

        // Consumer(
        //   builder: (context, ref, child) {
        //     // Read the activityProvider. This will start the network request
        //     // if it wasn't already started.
        //     // By using ref.watch, this widget will rebuild whenever the
        //     // the activityProvider updates. This can happen when:
        //     // - The response goes from "loading" to "data/error"
        //     // - The request was refreshed
        //     // - The result was modified locally (such as when performing side-effects)
        //     // ...
        //
        //
        //     // return Center(
        //     //   /// Since network-requests are asynchronous and can fail, we need to
        //     //   /// handle both error and loading states. We can use pattern matching for this.
        //     //   /// We could alternatively use `if (activity.isLoading) { ... } else if (...)`
        //     //   child: switch (activity) {
        //     //     AsyncData(:final value) => Text('Activity: ${value.activity}'),
        //     //     AsyncError() =>
        //     //       const Text('Oops, something unexpected happened'),
        //     //     _ => const CircularProgressIndicator(
        //     //         color: Colors.orange,
        //     //       ),
        //     //   },
        //     // );
        //
        //
        //
        //     return SafeArea(
        //       child: Center(
        //         child: switch (entries) {
        //           AsyncData(:final value) => ListView.builder(
        //               itemCount: value.entries!.length,
        //               itemBuilder: (context, index) {
        //                 var data = value.entries![index];
        //                 var title = data.category.toString();
        //                 var link = data.link.toString();
        //                 return Card(
        //                   child: ListTile(
        //                     title: Text("${index + 1}, $title"),
        //                     subtitle: Text(link),
        //                   ),
        //                 );
        //               }),
        //           AsyncError() =>
        //           const Text("Oops, something unexpected happened"),
        //           _ => const CircularProgressIndicator(),
        //         },
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
