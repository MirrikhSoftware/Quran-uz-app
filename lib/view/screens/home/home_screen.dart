import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';
import 'package:quran/view/screens/home/components/juz_list_widget.dart';
import 'package:quran/view/screens/home/components/sura_list_widget.dart';
import 'package:quran/view/widgets/app_search_delegate.dart';
import 'package:quran/view/widgets/buttons/app_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final QuranUz _quranUz = QuranUz();
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.quranKarim),
        actions: [
          AppIconButton(
            icon: CupertinoIcons.search,
            onPressed: () {
              showSearch(
                context: context,
                delegate: AppSearchDelegate(_quranUz.verseList),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: AppStrings.suras),
            Tab(text: AppStrings.juzs),
            Tab(text: AppStrings.bookmarks),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      body: TabBarView(
        controller: _tabController,
        children: [
          SuraListWidget(
            controller: _scrollController,
            suraList: _quranUz.suraList,
          ),
          JuzListWidget(juzList: _quranUz.juzList),
          Container(),
        ],
      ),
    );
  }
}
