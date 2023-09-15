import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/screens/settings_screen.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';
import '../widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: const Icon(
                    FontAwesomeIcons.earthAfrica,
                    size: Sizes.size24,
                    color: Colors.black,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.instagram,
                        size: Sizes.size30,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.barsStaggered,
                        size: Sizes.size24,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Gaps.v32,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Dongy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Sizes.size32,
                                        color: Colors.black87),
                                  ),
                                  Gaps.v16,
                                  Row(
                                    children: [
                                      const Text(
                                        "Dongyyyy",
                                        style: TextStyle(
                                            fontSize: Sizes.size20,
                                            color: Colors.black87),
                                      ),
                                      Gaps.h14,
                                      Container(
                                        padding:
                                            const EdgeInsets.all(Sizes.size4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Sizes.size28),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: const Text(
                                          "threads.net",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gaps.v20,
                                  const Text(
                                    "Plant enthusiast!",
                                    style: TextStyle(
                                      fontSize: Sizes.size20,
                                    ),
                                  ),
                                ],
                              ),
                              const CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                foregroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/dongyyy"),
                              ),
                            ]),
                        Gaps.v20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: Sizes.size16,
                                    color: Colors.blue.shade500,
                                  ),
                                Positioned(
                                  left: 12,
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: Sizes.size16,
                                    color: Colors.blue.shade500,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.h20,
                            const Text(
                              "2 followers",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: Sizes.size18,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v24,
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12,
                                horizontal: Sizes.size40,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size7),
                                ),
                              ),
                              child: const Text(
                                'Edit profile',
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.h14,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12,
                                horizontal: Sizes.size40,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1.0, color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size7),
                                ),
                              ),
                              child: const Text(
                                'Share profile',
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v20,
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  controller: ScrollController(),
                  itemCount: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size40,
                  ),
                  itemBuilder: (context, index) => const Column(
                    children: [
                      Text(
                        "이전 과제를 하지 못했어요",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size40,
                  ),
                  itemBuilder: (context, index) => const Column(
                    children: [
                      Text(
                        "이제부턴 열심히!",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
