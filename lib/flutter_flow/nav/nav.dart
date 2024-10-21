import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Center(
                  child: Image.asset(
                    'assets/images/01_Splash_screen.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Image.asset(
                        'assets/images/01_Splash_screen.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : NavBarPage(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'ChooseRole',
          path: '/chooseRole',
          builder: (context, params) => ChooseRoleWidget(),
        ),
        FFRoute(
          name: 'PatientSignIn',
          path: '/patientSignIn',
          builder: (context, params) => PatientSignInWidget(),
        ),
        FFRoute(
          name: 'PatientSignUp',
          path: '/patientSignUp',
          builder: (context, params) => PatientSignUpWidget(),
        ),
        FFRoute(
          name: 'Verification',
          path: '/verification',
          builder: (context, params) => VerificationWidget(),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'Pharmacy',
          path: '/pharmacy',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Pharmacy')
              : PharmacyWidget(),
        ),
        FFRoute(
          name: 'DoctorAppointment',
          path: '/doctorAppointment',
          builder: (context, params) => DoctorAppointmentWidget(),
        ),
        FFRoute(
          name: 'allCategories',
          path: '/allCategories',
          builder: (context, params) => AllCategoriesWidget(),
        ),
        FFRoute(
          name: 'allNearbyHospital',
          path: '/allNearbyHospital',
          builder: (context, params) => AllNearbyHospitalWidget(),
        ),
        FFRoute(
          name: 'Category',
          path: '/category',
          builder: (context, params) => CategoryWidget(
            category: params.getParam(
              'category',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PopularDoctor',
          path: '/popularDoctor',
          builder: (context, params) => PopularDoctorWidget(),
        ),
        FFRoute(
          name: 'DoctorDetails',
          path: '/doctorDetails',
          builder: (context, params) => DoctorDetailsWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            workingHospital: params.getParam(
              'workingHospital',
              ParamType.String,
            ),
            exp: params.getParam(
              'exp',
              ParamType.String,
            ),
            rating: params.getParam(
              'rating',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'BookAppointment',
          path: '/bookAppointment',
          builder: (context, params) => BookAppointmentWidget(),
        ),
        FFRoute(
          name: 'PatientsDetails',
          path: '/patientsDetails',
          builder: (context, params) => PatientsDetailsWidget(
            typeOfService: params.getParam(
              'typeOfService',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Payment',
          path: '/payment',
          builder: (context, params) => PaymentWidget(
            typeOfService: params.getParam(
              'typeOfService',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Notifications',
          path: '/notifications',
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: 'MyAppointments',
          path: '/myAppointments',
          builder: (context, params) => MyAppointmentsWidget(
            typeOfAppointment: params.getParam(
              'typeOfAppointment',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'OnlineAppointmentDetails',
          path: '/onlineAppointmentDetails',
          builder: (context, params) => OnlineAppointmentDetailsWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            hospital: params.getParam(
              'hospital',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Chat',
          path: '/chat',
          builder: (context, params) => ChatWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'VoiceCall',
          path: '/voiceCall',
          builder: (context, params) => VoiceCallWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'VideoCall',
          path: '/videoCall',
          builder: (context, params) => VideoCallWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CallEnded',
          path: '/callEnded',
          builder: (context, params) => CallEndedWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WriteReview',
          path: '/writeReview',
          builder: (context, params) => WriteReviewWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'nearbyPharmacy',
          path: '/nearbyPharmacy',
          builder: (context, params) => NearbyPharmacyWidget(),
        ),
        FFRoute(
          name: 'pharmacyCategories',
          path: '/pharmacyCategories',
          builder: (context, params) => PharmacyCategoriesWidget(),
        ),
        FFRoute(
          name: 'PharmacyDiagnosticDetails',
          path: '/pharmacyDiagnosticDetails',
          builder: (context, params) => PharmacyDiagnosticDetailsWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            location: params.getParam(
              'location',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'MedicineDetails',
          path: '/medicineDetails',
          builder: (context, params) => MedicineDetailsWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            secondary: params.getParam(
              'secondary',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'MyCart',
          path: '/myCart',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MyCart')
              : MyCartWidget(),
        ),
        FFRoute(
          name: 'CheckOut',
          path: '/checkOut',
          builder: (context, params) => CheckOutWidget(),
        ),
        FFRoute(
          name: 'ShippingAddress',
          path: '/shippingAddress',
          builder: (context, params) => ShippingAddressWidget(),
        ),
        FFRoute(
          name: 'PaymentMethod',
          path: '/paymentMethod',
          builder: (context, params) => PaymentMethodWidget(),
        ),
        FFRoute(
          name: 'ConfirmYourOrder',
          path: '/confirmYourOrder',
          builder: (context, params) => ConfirmYourOrderWidget(),
        ),
        FFRoute(
          name: 'YourOrderSuccessfully',
          path: '/yourOrderSuccessfully',
          builder: (context, params) => YourOrderSuccessfullyWidget(),
        ),
        FFRoute(
          name: 'TrackMyOrder',
          path: '/trackMyOrder',
          builder: (context, params) => TrackMyOrderWidget(),
        ),
        FFRoute(
          name: 'OrderDetails',
          path: '/orderDetails',
          builder: (context, params) => OrderDetailsWidget(),
        ),
        FFRoute(
          name: 'Diagnostics',
          path: '/diagnostics',
          builder: (context, params) => DiagnosticsWidget(),
        ),
        FFRoute(
          name: 'History',
          path: '/history',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'History')
              : HistoryWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: 'BookAppointmentDiagnostics',
          path: '/bookAppointmentDiagnostics',
          builder: (context, params) => BookAppointmentDiagnosticsWidget(
            diagnosticsName: params.getParam(
              'diagnosticsName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DiagnosticsDetils',
          path: '/diagnosticsDetils',
          builder: (context, params) => DiagnosticsDetilsWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            hospital: params.getParam(
              'hospital',
              ParamType.String,
            ),
            doctorName: params.getParam(
              'doctorName',
              ParamType.String,
            ),
            diagnosticsType: params.getParam(
              'diagnosticsType',
              ParamType.String,
            ),
            status: params.getParam(
              'status',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'Ambulance',
          path: '/ambulance',
          builder: (context, params) => AmbulanceWidget(),
        ),
        FFRoute(
          name: 'BookAmbulance',
          path: '/bookAmbulance',
          builder: (context, params) => BookAmbulanceWidget(
            ambulanceType: params.getParam(
              'ambulanceType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ConfirmAmbulanceBook',
          path: '/confirmAmbulanceBook',
          builder: (context, params) => ConfirmAmbulanceBookWidget(
            ambulanceType: params.getParam(
              'ambulanceType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NursingCare',
          path: '/nursingCare',
          builder: (context, params) => NursingCareWidget(),
        ),
        FFRoute(
          name: 'NursingPacks',
          path: '/nursingPacks',
          builder: (context, params) => NursingPacksWidget(
            packType: params.getParam(
              'packType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NurseDayPack',
          path: '/nurseDayPack',
          builder: (context, params) => NurseDayPackWidget(
            packType: params.getParam(
              'packType',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NurseBook',
          path: '/nurseBook',
          builder: (context, params) => NurseBookWidget(),
        ),
        FFRoute(
          name: 'NursingCareDetails',
          path: '/nursingCareDetails',
          builder: (context, params) => NursingCareDetailsWidget(),
        ),
        FFRoute(
          name: 'AmbulanceDetails',
          path: '/ambulanceDetails',
          builder: (context, params) => AmbulanceDetailsWidget(
            ambulanceType: params.getParam(
              'ambulanceType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'MedicineReminders',
          path: '/medicineReminders',
          builder: (context, params) => MedicineRemindersWidget(),
        ),
        FFRoute(
          name: 'RateUs',
          path: '/rateUs',
          builder: (context, params) => RateUsWidget(),
        ),
        FFRoute(
          name: 'WeeklyCheckup',
          path: '/weeklyCheckup',
          builder: (context, params) => WeeklyCheckupWidget(),
        ),
        FFRoute(
          name: 'Language',
          path: '/language',
          builder: (context, params) => LanguageWidget(),
        ),
        FFRoute(
          name: 'redirectUber',
          path: '/redirectUber',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'redirectUber')
              : RedirectUberWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
