import 'package:eterex/feature/campaign/domain/entities/reward_history.dart';
import 'package:flutter/material.dart';

class RewardHistory extends StatelessWidget {
  final List<RewardHistoryEntity> items;
  const RewardHistory({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => ItemRewardHistory(item: items[index]),
      ),
    );
  }
}

class ItemRewardHistory extends StatelessWidget {
  final RewardHistoryEntity item;
  const ItemRewardHistory({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[700],
              ),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Icon(Icons.done_rounded, color: Colors.white, size: 14),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsetsDirectional.only(end: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      item.image ?? '',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.title ?? '',
                                style: themeData.textTheme.bodyText1
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                item.date ?? '',
                                style: themeData.textTheme.bodyText1?.copyWith(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(item.description ?? '',
                              maxLines: 1,
                              style: themeData.textTheme.caption?.copyWith(
                                  fontWeight: FontWeight.w600, height: 1.3)),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
