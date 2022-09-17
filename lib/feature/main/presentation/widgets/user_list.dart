import 'package:eterex/core/route/app_route.dart';
import 'package:eterex/feature/main/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserEntity> items;
  const UserList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return UserItem(user: items[index]);
        },
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final UserEntity user;
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRouts.campaign),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              user.avatar ?? '',
              width: 60,
              height: 60,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.firstName ?? ''} ${user.lastName ?? ''}',
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 4),
              Text(user.email ?? '',
                  style: Theme.of(context).textTheme.bodyText2)
            ],
          )
        ]),
      ),
    );
  }
}
