import "package:flutter/material.dart";
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:hello_oschina/http/api.dart';
import 'package:hello_oschina/models/summary_new_banner_entity.dart';
import 'package:hello_oschina/pages/LoginVisitPage.dart';

class SummaryNewPage extends StatefulWidget {
  const SummaryNewPage({super.key});

  @override
  State<SummaryNewPage> createState() => _SummaryNewPageState();
}

class _SummaryNewPageState extends State<SummaryNewPage> {
  List<SummaryNewBannerResultItems> _bannerList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBannerData();
  }

  void getBannerData() async {
    var data = await Api.summaryNewBanner();
    SummaryNewBannerEntity entity = SummaryNewBannerEntity.fromJson(data);
    print(entity.result?.items);
    if (entity.result!.items!.isNotEmpty) {
      setState(() {
        _bannerList = entity.result!.items!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 150.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  _bannerList[index].img!,
                  fit: BoxFit.cover,
                );
              },
              onTap: (index) {
                Navigator.push(context,MaterialPageRoute(builder: (builder)=>const LoginVisitPage()));
              },
              autoplay: true,
              itemCount: _bannerList.length,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
