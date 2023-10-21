class ApiConstants {
  static String baseUrl = 'https://roongtagroup.co.in/api/';
  static String login = 'customer_login';
  static String addLead = 'addLead';
  static String addLeadFollowUp = 'add_lead_calls';
  static String getProperty = "property_category";
  static String getPropertyByLocation = "getPropertyByLocation";
  static String getAllLeads = "getAllLeads";
  static String getLostLead = "get_TotalClosed_Leads";
  static String getAssignLead = "get_TotalAssign_Leads";
  static String getFollowUpLead = "get_TotalFollowup_Leads";
  static String getNewLead = "get_TotalNew_Leads";
  static String getTotal = "getTotalLeads";
 static String getAllCount = "get_all_count";
 static String getTodays_follow_up = "get_TodaysFollowup_Leads";
 static String get_wone_leads = "get_TotalWon_Leads";
 static String get_view_leads = "viewLead";

  static String stateList = '/GetStateList/';
  static String getCities = "/GetCityByStateId/";
  static String getLocationCity = "/GetLocationByCityId";
  static String addClientAddress = "/AddClientAddress";
  static String getBookingList = "/GetBookingList/";
  static String register = "/UpdateClient";
  static String getClientDetails = "/Perm_GetClientDetails";
  static String getBranchId = "/GetLocationZoneBranchIds";
  static String temporaryBook = "/SubmitTemporaryBooking";
  static String getTokenDate =
      "https://script.google.com/macros/s/AKfycbxJ0zVrybYniAVxbvzt4ctRWlKAwAeKVJnXKxMwd2ugXjhUjSmQACpz8mRPDNWMaCWi4Q/exec";
  static String inquiry = "https://script.googleusercontent.com/macros/echo";
  static String getReasonList = "/GetReasonListForApp";
  static String cancelBooking = "/CancelBooking";
  static String feedBackForDriver = "/FeedbackforDriver";
  static String addFavDriver = "/AddFavoriteDriver";
  static String getFavDriver = "/FavoriteDriverList/";
  static String getBookingById = "/GetBookingByID/";
}
