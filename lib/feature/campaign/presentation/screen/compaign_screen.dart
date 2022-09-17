import 'package:eterex/feature/campaign/domain/entities/banner.dart';
import 'package:eterex/feature/campaign/domain/entities/reward_history.dart';
import 'package:eterex/feature/campaign/presentation/widget/campaign_slider.dart';
import 'package:eterex/feature/campaign/presentation/widget/reward_history.dart';
import 'package:flutter/material.dart';

class CompaignScreen extends StatelessWidget {
  const CompaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(.95),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('کمپین هــا',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      'پاداش های ویژه ای در مدت محدود در دسترس قرار خواهد گرفت.',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                const SizedBox(height: 20),
                CampaignSlider(bannerList: bannerList),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('سوابق پاداش ها',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'سوابق و جزئیات پاداش های دریافت شده ی شما در زیر قابل مشاهده است.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(height: 1.3),
                  ),
                ),
                RewardHistory(items: campainHistoryList),
                Center(
                  child: Text(
                    'مشاهده همه 45 پاداش',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.blue[800]),
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<BannerEntity> bannerList = [
  BannerEntity(
      image: 'https://picsum.photos/180/130',
      title: 'جایزه 500 دلاری',
      description: 'اترکس در تویتر راه اندازی شد. ما را دنبال کنید و ...',
      time: '3 روز و 20 ساعت و58 دقیفه',
      percent: 20),
  BannerEntity(
      image: 'https://picsum.photos/179/130',
      title: 'پاداش قراردادی 50 دلاری',
      description: 'رمز دو مرحله ای خود را فعال کنید. شما میتوانید از ...',
      time: '5 روز و 04 ساعت و 13 دقیفه',
      percent: 70),
  BannerEntity(
      image: 'https://picsum.photos/178/130',
      title: 'جایزه 500 دلاری',
      description: 'اترکس در تویتر راه اندازی شد. ما را دنبال کنید و ...',
      time: '3 روز و 20 ساعت و58 دقیفه',
      percent: 20),
  BannerEntity(
      image: 'https://picsum.photos/177/130',
      title: 'پاداش قراردادی 50 دلاری',
      description: 'رمز دو مرحله ای خود را فعال کنید. شما میتوانید از ...',
      time: '5 روز و 04 ساعت و 13 دقیفه',
      percent: 70),
];

List<RewardHistoryEntity> campainHistoryList = [
  RewardHistoryEntity(
    image: 'https://picsum.photos/50/50',
    title: 'کمپین جایزه 500 دلاری',
    description: 'اترکس در تویتر راه اندازی شد. ما را دنبال کنید و ...',
    date: '1400/10/25',
  ),
  RewardHistoryEntity(
    image: 'https://picsum.photos/55/55',
    title: 'تایید حساب کاربری',
    description: 'حساب کاربری خود را تاببد کنید. شما تاکنون ....',
    date: '1400/10/20',
  ),
];
