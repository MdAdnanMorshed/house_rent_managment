import 'package:get/get.dart';

import '../modules/admin_dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin_dashboard/views/admin_dashboard_view.dart';
import '../modules/admin_flat_floor/bindings/admin_flat_floor_binding.dart';
import '../modules/admin_flat_floor/views/admin_flat_floor_view.dart';
import '../modules/admin_flat_no/bindings/admin_flat_no_binding.dart';
import '../modules/admin_flat_no/views/admin_flat_no_view.dart';
import '../modules/admin_flat_size/bindings/admin_flat_size_binding.dart';
import '../modules/admin_flat_size/views/admin_flat_size_view.dart';
import '../modules/admin_flat_type/bindings/admin_flat_type_binding.dart';
import '../modules/admin_flat_type/views/admin_flat_type_view.dart';
import '../modules/admin_pay_role/bindings/admin_play_role_binding.dart';
import '../modules/admin_pay_role/views/admin_play_role_view.dart';
import '../modules/admin_registation/bindings/admin_registration_binding.dart';
import '../modules/admin_registation/views/admin_registration_view.dart';
import '../modules/create_flat/bindings/create_flat_binding.dart';
import '../modules/create_flat/views/create_flat_view.dart';
import '../modules/flat_details/bindings/flat_details_binding.dart';
import '../modules/flat_details/views/flat_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/live_chat/bindings/login_binding.dart';
import '../modules/live_chat/views/live_chat_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/rent_assign/bindings/rent_assign_binding.dart';
import '../modules/rent_assign/views/rent_assign_view.dart';
import '../modules/rent_assign_confirm/bindings/rent_assign_confirm_binding.dart';
import '../modules/rent_assign_confirm/views/rent_assign_confirm_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FLAT_DETAILS,
      page: () => const FlatDetailsView(),
      binding: FlatDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CREATEFLAT,
      page: () => const CreateFlatView(),
      binding: CreateFlatBinding(),
    ),
    GetPage(
      name: _Paths.RENTASSIGN,
      page: () => const RentAssignView(),
      binding: RentAssignBinding(),
    ),
    GetPage(
      name: _Paths.RENTASSIGNCONFIRM,
      page: () => const RentAssignConfirmView(),
      binding: RentAssignConfirmBinding(),
    ),
    GetPage(
      name: _Paths.RENTANDRENTOWNERCHAT,
      page: () => const LiveCHatView(),
      binding: LiveChatBinding(),
    ),
    GetPage(
      name: _Paths.ADMINDASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.ADMINPLAYROLE,
      page: () => const AdminPlayRoleView(),
      binding: AdminPlayRoleBinding(),
    ),
    GetPage(
      name: _Paths.ADMINREGISTRATION,
      page: () => const AdminRegistrationView(),
      binding: AdminRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.ADMINFLATNO,
      page: () => const AdminFlatNoView(),
      binding: AdminFlatNoBinding(),
    ),
    GetPage(
      name: _Paths.ADMINFLATTYPE,
      page: () => const AdminFlatTypeView(),
      binding: AdminFlatTypeBinding(),
    ),
    GetPage(
      name: _Paths.ADMINPFLATSIZE,
      page: () => const AdminFlatSizeView(),
      binding: AdminFlatSizeBinding(),
    ),
    GetPage(
      name: _Paths.ADMINFLATFLOOR,
      page: () => const AdminFlatFloorView(),
      binding: AdminFlatFloorBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
