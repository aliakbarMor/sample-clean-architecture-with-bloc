import 'package:eterex/feature/main/presentation/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget(
      {super.key, required this.maxPage, required this.currentPage});
  final int maxPage;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (currentPage != 1) {
                    context.read<MainBloc>().add(MainStarted(currentPage - 1));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Previous page',
                      style: themeData.textTheme.button?.copyWith(
                          color: themeData.primaryColor
                              .withOpacity(currentPage == 1 ? 0.5 : 1))),
                ),
              ),
              InkWell(
                onTap: () {
                  if (currentPage != maxPage) {
                    context.read<MainBloc>().add(MainStarted(currentPage + 1));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Next page',
                      style: themeData.textTheme.button?.copyWith(
                          color: themeData.primaryColor
                              .withOpacity(currentPage == maxPage ? 0.5 : 1))),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(currentPage.toString(),
                style: themeData.textTheme.bodyText2),
          ),
        ),
      ],
    );
  }
}
