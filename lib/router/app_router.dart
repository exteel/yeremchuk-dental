import 'package:go_router/go_router.dart';
import 'package:yeremchuk_dental/screens/about_screen.dart';
import 'package:yeremchuk_dental/screens/article_screen.dart';
import 'package:yeremchuk_dental/screens/blog_screen.dart';
import 'package:yeremchuk_dental/screens/cases_screen.dart';
import 'package:yeremchuk_dental/screens/category_screen.dart';
import 'package:yeremchuk_dental/screens/contacts_screen.dart';
import 'package:yeremchuk_dental/screens/dentist_profile_screen.dart';
import 'package:yeremchuk_dental/screens/doctor_faq_screen.dart';
import 'package:yeremchuk_dental/screens/home_screen.dart';
import 'package:yeremchuk_dental/screens/prices_screen.dart';
import 'package:yeremchuk_dental/screens/reviews_screen.dart';
import 'package:yeremchuk_dental/screens/subcategory_screen.dart';
import 'package:yeremchuk_dental/screens/team_screen.dart';
import 'package:yeremchuk_dental/screens/tourism_screen.dart';

abstract class AppRoutes {
  static const home = '/';
  static const category = '/poslugy/implantatsiya';
  static const subcategory = '/poslugy/implantatsiya/all-on-4-6';
  static const tourism = '/turyzm';
  static const doctorFaq = '/pytannya-likariv';
  static const cases = '/keysy';
  static const team = '/komanda';
  static const dentistProfile = '/komanda/likar';
  static const blog = '/blog';
  static const article = '/blog/stattya';
  static const reviews = '/vidhuky';
  static const prices = '/tsiny';
  static const contacts = '/kontakty';
  static const about = '/pro-nas';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.category,
      builder: (context, state) => const CategoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.subcategory,
      builder: (context, state) => const SubcategoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.tourism,
      builder: (context, state) => const TourismScreen(),
    ),
    GoRoute(
      path: AppRoutes.doctorFaq,
      builder: (context, state) => const DoctorFaqScreen(),
    ),
    GoRoute(
      path: AppRoutes.cases,
      builder: (context, state) => const CasesScreen(),
    ),
    GoRoute(
      path: AppRoutes.team,
      builder: (context, state) => const TeamScreen(),
    ),
    GoRoute(
      path: AppRoutes.dentistProfile,
      builder: (context, state) => const DentistProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.blog,
      builder: (context, state) => const BlogScreen(),
    ),
    GoRoute(
      path: AppRoutes.article,
      builder: (context, state) => const ArticleScreen(),
    ),
    GoRoute(
      path: AppRoutes.reviews,
      builder: (context, state) => const ReviewsScreen(),
    ),
    GoRoute(
      path: AppRoutes.prices,
      builder: (context, state) => const PricesScreen(),
    ),
    GoRoute(
      path: AppRoutes.contacts,
      builder: (context, state) => const ContactsScreen(),
    ),
    GoRoute(
      path: AppRoutes.about,
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);
