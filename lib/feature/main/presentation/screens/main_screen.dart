import 'package:eterex/core/route/app_route.dart';
import 'package:eterex/feature/main/presentation/bloc/main_bloc.dart';
import 'package:eterex/feature/main/presentation/widgets/pagination.dart';
import 'package:eterex/feature/main/presentation/widgets/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    context.read<MainBloc>().add(MainStarted(1));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) =>
                          context.read<MainBloc>().add(MainSearch(value)),
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(CupertinoIcons.search),
                        label: const Text('Search users...'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  InkWell(
                      onTap: () {
                        context.read<MainBloc>().add(MainLogOut());
                        Navigator.popAndPushNamed(context, AppRouts.login);
                      },
                      child: const Icon(Icons.exit_to_app_rounded))
                ],
              ),
            ),
            Expanded(child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                if (state is MainSuccess) {
                  return Column(
                    children: [
                      UserList(items: state.items),
                      PaginationWidget(
                          currentPage: state.currentPage, maxPage: state.pages)
                    ],
                  );
                } else if (state is MainLoading || state is MainInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MainError) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else {
                  throw Exception('state is not valid..');
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
