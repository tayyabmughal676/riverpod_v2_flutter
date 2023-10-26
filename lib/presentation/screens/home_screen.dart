// Created by Tayyab Mughal on 26/10/2023.
// Tayyab Mughal
// tayyabmughal676@gmail.com
// © 2022-2023  - All Rights Reserved

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_v2/presentation/providers/user_entries.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<HomeScreen> {
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
    //
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
                          context.go('/details');
                        },
                      ),
                    );
                  }),
              AsyncError() => const Text("Oops, something unexpected happened"),
              _ => const CircularProgressIndicator(),
            },
          ),
        ),
      ),
    );
  }
}
