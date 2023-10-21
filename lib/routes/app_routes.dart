import 'package:crm/presentation/dashboard.dart';
import 'package:crm/presentation/my_home_empty_screen/assign_screen.dart';
import 'package:crm/presentation/my_home_empty_screen/followup_screen.dart';
import 'package:crm/presentation/my_home_empty_screen/lost_screen.dart';
import 'package:crm/presentation/my_home_empty_screen/newlead_screen.dart';
import 'package:crm/presentation/my_home_empty_screen/total_screen.dart';
import 'package:crm/presentation/todays_followup_list/todays_folloup_list.dart';
import 'package:crm/presentation/won_leads/wone_leads.dart';
import 'package:flutter/material.dart';
import 'package:crm/presentation/splash_screen/splash_screen.dart';
import 'package:crm/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:crm/presentation/my_home_empty_screen/my_home_empty_screen.dart';
import 'package:crm/presentation/add_new_property_address_screen/add_lead.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String dash = "/dash";

  static const String homePage = '/home_page';

  static const String notificationScreen = '/notification_screen';

  static const String notificationEmptyStatesScreen =
      '/notification_empty_states_screen';

  static const String messagePage = '/message_page';

  static const String myHomeEmptyScreen = '/my_home_empty_screen';

  static const String lostScreen = '/lost_screen';
  static const String totalScreen = '/total_screen';
  static const String assignScreen = '/assign_screen';
  static const String followLeadScreen = '/follow_lead_screen';
  static const String todaysfollowLeadScreen = '/todaysfollow_lead_screen';
  static const String wonLeads = '/woneLeads';
  static const String newScreen = '/new_screen';
  static const String wonScreen = '/won_screen';

  static const String myHomePage = '/my_home_page';

  static const String addNewPropertyAddressScreen =
      '/add_new_property_address_screen';

  static const String addNewPropertyMeetWithAAgentScreen =
      '/add_new_property_meet_with_a_agent_screen';

  static const String addNewPropertyTimeToSellScreen =
      '/add_new_property_time_to_sell_screen';

  static const String addNewPropertyHomeFactsScreen =
      '/add_new_property_home_facts_screen';

  static const String addNewPropertySelectAmenitiesScreen =
      '/add_new_property_select_amenities_screen';

  static const String filterScreen = '/filter_screen';

  static const String homeSearchPage = '/home_search_page';

  static const String pickDateScreen = '/pick_date_screen';

  static const String profileScreen = '/profile_page';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signInScreen: (context) => SignInScreen(),
    dash: (context) => DashScreen(),
    lostScreen: (context) => LostScreen(),
    totalScreen:(context) => TotalScreen(),
    assignScreen:(context) => AssignScreen(),
    followLeadScreen:(context) => FollowUpScreen(),
    todaysfollowLeadScreen: (context) => TodaysFolloupList(),
    wonLeads: (context) => WoneLeads(),

    newScreen:(context) => NewScreen(),
  
    // notificationScreen: (context) => NotificationScreen(),
    myHomeEmptyScreen: (context) => MyHomeEmptyScreen(),
    addNewPropertyAddressScreen: (context) => AddLead(),

    // profileScreen: (context) => ProfilePage(getLeadsResponse: null),
  };
}
