import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/user_auth_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final fetchUsers = ref.watch(fetchUsersProvider);
    final fetchUsers = ref.watch(userAuthProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ref.read(checkAPICallProvider);
        },
      ),
      body: Container(
        color: Colors.transparent,
        child: SafeArea(
          child: Column(
            children: [
              //Riverpod When call
              fetchUsers.when(
                data: (userModel) => Expanded(
                  child: ListView.separated(
                    itemCount: userModel.data!.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      var data = fetchUsers.value?.data?[index];
                      var firstName = data?.firstName ?? " FirstName";
                      var lastName = data?.lastName ?? "LastName";
                      var email = data?.email ?? "Email";
                      var id = data?.id ?? 0;
                      return ListTile(
                        leading: Text("$id"),
                        title: Text(firstName),
                        subtitle: Text(email),
                        trailing: Text(lastName),
                        onTap: () async {
                          ref.read(userAuthProvider.notifier).userClick();
                        },
                      );
                    },
                  ),
                ),
                loading: () => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                )),
                error: (e, st) => Center(child: Text(e.toString())),
              ),

              //My Method with Provider
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: fetchUsers,
              //     itemBuilder: (context, index) {
              //       var data = fetchUsers.value?.data?[index];
              //       var firstName = data?.firstName ?? " FirstName";
              //       var lastName = data?.lastName ?? "LastName";
              //       var email = data?.email ?? "Email";
              //       var id = data?.id ?? 0;
              //
              //       return ListTile(
              //         leading: Text("$id"),
              //         title: Text(firstName),
              //         subtitle: Text(email),
              //         trailing: Text(lastName),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
