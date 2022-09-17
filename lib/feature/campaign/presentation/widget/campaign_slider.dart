import 'package:flutter/material.dart';
import 'package:eterex/feature/campaign/domain/entities/banner.dart';

class CampaignSlider extends StatelessWidget {
  const CampaignSlider({Key? key, required this.bannerList}) : super(key: key);
  final List<BannerEntity> bannerList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bannerList.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) =>
            ItemCampaignSlider(banner: bannerList[index]),
      ),
    );
  }
}

class ItemCampaignSlider extends StatelessWidget {
  final BannerEntity banner;
  const ItemCampaignSlider({Key? key, required this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              banner.image ?? '',
              width: 180,
              height: 130,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              banner.title ?? '',
              style: themeData.textTheme.bodyText1
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(banner.description ?? '',
                style: themeData.textTheme.bodyText2
                    ?.copyWith(fontWeight: FontWeight.w500, height: 1.3)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              banner.time ?? '',
              style: themeData.textTheme.caption
                  ?.copyWith(color: Colors.blue[800]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Expanded(
                    flex: banner.percent!,
                    child: Container(
                      height: 2,
                      color: Colors.blue[800],
                    )),
                Expanded(
                    flex: 100 - banner.percent!,
                    child: Container(
                      height: 1.5,
                      color: Colors.grey[350],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
