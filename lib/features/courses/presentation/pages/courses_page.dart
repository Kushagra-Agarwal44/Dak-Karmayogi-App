import 'package:dak_karmayogi_app/core/theme/app_colors.dart';
import 'package:dak_karmayogi_app/features/courses/presentation/providers/courses_provider.dart';
import 'package:dak_karmayogi_app/features/courses/presentation/widgets/course_card.dart';
import 'package:dak_karmayogi_app/features/courses/presentation/widgets/course_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoursesPage extends ConsumerStatefulWidget {
  const CoursesPage({super.key});

  @override
  ConsumerState<CoursesPage> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends ConsumerState<CoursesPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    }

  @override
  Widget build(BuildContext context) {
    // Fetches your default app background color (usually white or light grey)
    final normalBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      // 1. Make the base Scaffold red. This ensures the status bar is ALWAYS red.
      backgroundColor: AppColors.primary,

      body: SafeArea(
        bottom: false,
        // 2. Wrap everything below the status bar in your normal background color
        child: Container(
          color: normalBackgroundColor,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                /// NORMAL APPBAR (scrolls away)
                SliverAppBar(
                  title: const Text(
                    "My Courses",
                    style: TextStyle(color: Colors.white),
                  ),
                  pinned: false,
                  floating: false,
                  // 3. IMPORTANT: Set primary to false because SafeArea is now handling the status bar space
                  primary: false,
                  snap: false,
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                ),

                /// PINNED TAB BAR
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _TabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorAnimation: TabIndicatorAnimation.elastic,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),

                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(text: "Online"),
                        Tab(text: "Onsite"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,

              children: const [
                CoursesList(type: 'online'),
                CoursesList(type: 'onsite'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: AppColors.primary, child: tabBar);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CoursesList extends ConsumerWidget {
  final String type;

  const CoursesList({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesControllerProvider(type));

    return state.when(
      loading: () => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (_, __) => const CourseCardSkeleton(),
      ),

      error: (message) => RefreshIndicator(
        onRefresh: () async {
          ref
              .read(coursesControllerProvider(type).notifier)
              // .fetchCourses(type: type);
              .fetchCourses();
        },
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 12),
                    Text(message),
                    const SizedBox(height: 12),
                    const Text("Pull down to refresh"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      data: (courses) {
        if (courses.isEmpty) {
          return const Center(child: Text("No courses available"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref
                .read(coursesControllerProvider(type).notifier)
                .fetchCourses();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];

              return CourseCard(
                course: course,
                onTap: () {
                  context.push('/course-details', extra: course.courseId);
                },
              );
            },
          ),
        );
      },
    );
  }
}
