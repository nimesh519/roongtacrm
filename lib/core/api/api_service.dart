import 'dart:convert';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:clipboard/clipboard.dart';
import 'package:crm/core/api/api_constants.dart';
import 'package:crm/core/api/data_store.dart';
import 'package:crm/core/model/add_lead_request.dart';
import 'package:crm/core/model/follow_request.dart';
import 'package:crm/core/model/get_all_leads_request.dart';
import 'package:crm/core/model/get_leads_response.dart';
import 'package:crm/core/model/get_poperty_by_loc_req.dart';
import 'package:crm/core/model/get_property_reponse.dart';
import 'package:crm/core/model/login_request.dart';
import 'package:crm/core/model/login_response.dart';
import 'package:crm/core/model/prop_by_loc_response.dart';
import 'package:crm/core/model/property.dart';
import 'package:crm/core/model/todays_lead.dart';
import 'package:crm/core/model/total_count_response.dart';
import 'package:crm/core/model/total_leads_model.dart';
import 'package:crm/core/model/view_leads.dart';
import 'package:crm/core/model/wone_leads_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var timeoutDuration = Duration(seconds: 30);
  Future<LoginResponse?> loginUser(LoginRequest loginRequest) async {
    try {
      final response = await http.post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.login}'),
          headers: {
            'Content-Type': 'text/plain',
          },
          body: json.encode(loginRequest));
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        LoginResponse res = LoginResponse.fromJson(parsed);
        DataStore.saveUserLoginState(true);
        DataStore.saveUserID(res.data!.userId!);
        await getPropertyApi();
        return res;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> addLeadApi(AddLeadRequest addLeadRequest) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.addLead}',
          data: jsonEncode(addLeadRequest));
      if (response.statusCode == 200) {
        return "true";
      } else {
        throw Exception("Failed to add lead");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
  Future<String?> addFollow(FollowRequest followRequest) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.addLeadFollowUp}',
          data: jsonEncode(followRequest));
      if (response.statusCode == 200) {
        return "true";
      } else {
        throw Exception("Failed to add follow");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> addLeadApi1(AddLeadRequest addLeadRequest,BuildContext context) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.addLead}',
          data: jsonEncode(addLeadRequest));

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to add lead");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  void _showCopyAlertDialog(BuildContext context, String body, String response) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Copy to Clipboard'),
          content:Column(children: [
            Text('Request : ${ Text(body)}'),
            Text('Response : ${ Text(response)}'),
          ],),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FlutterClipboard.copy('Request - > ${body}\n\nREsponse : ->${response}').then((value) {
                  Fluttertoast.showToast(
                    msg: 'Copied to clipboard',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                  Navigator.of(context).pop();
                });
              },
              child: Text('Copy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<GetLeadsResponse?> getAllLeadsApi() async {
    try {
      GetLeadsResponse? getLeadsResponse;
      String userID = await DataStore.getUserID();
      GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http
          .post(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllLeads}'),
              headers: {
                'Content-Type': 'text/plain',
              },
              body: json.encode(getAllLeadRequest))
          .timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getLeadsResponse = GetLeadsResponse.fromJson(parsed);

        // Convert the `getLeadsResponse` object to a JSON string
        String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        await DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getLeadsResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetLeadsResponse?> lostLeadApi() async {
    try {
      GetLeadsResponse? getLeadsResponse;
      String userID = await DataStore.getUserID();
      GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http
          .post(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getLostLead}'),
              headers: {
                'Content-Type': 'text/plain',
              },
              body: json.encode(getAllLeadRequest))
          .timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getLeadsResponse = GetLeadsResponse.fromJson(parsed);

        // Convert the `getLeadsResponse` object to a JSON string
        String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        await DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getLeadsResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetLeadsResponse?> assignLeadApi() async {
    try {
      GetLeadsResponse? getLeadsResponse;
      String userID = await DataStore.getUserID();
      GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http
          .post(
              Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAssignLead}'),
              headers: {
                'Content-Type': 'text/plain',
              },
              body: json.encode(getAllLeadRequest))
          .timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getLeadsResponse = GetLeadsResponse.fromJson(parsed);

        // Convert the `getLeadsResponse` object to a JSON string
        String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        await DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getLeadsResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetLeadsResponse?> followUpLeadApi() async {
    try {
      GetLeadsResponse? getLeadsResponse;
      String userID = await DataStore.getUserID();
      GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http
          .post(
              Uri.parse(
                  '${ApiConstants.baseUrl}${ApiConstants.getFollowUpLead}'),
              headers: {
                'Content-Type': 'text/plain',
              },
              body: json.encode(getAllLeadRequest))
          .timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getLeadsResponse = GetLeadsResponse.fromJson(parsed);

        // Convert the `getLeadsResponse` object to a JSON string
        String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        await DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getLeadsResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }


  Future<GetLeadsResponse?> newLeadApi() async {
    try {
      GetLeadsResponse? getLeadsResponse;
      String userID = await DataStore.getUserID();
      GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http
          .post(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getNewLead}'),
              headers: {
                'Content-Type': 'text/plain',
              },
              body: json.encode(getAllLeadRequest))
          .timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getLeadsResponse = GetLeadsResponse.fromJson(parsed);

        // Convert the `getLeadsResponse` object to a JSON string
        String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        await DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getLeadsResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetLeadsResponse?> getTotalAPI() async {
    try {
      GetLeadsResponse? getLeadsResponse;
      String userID = await DataStore.getUserID();
      GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http
          .post(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getTotal}'),
              headers: {
                'Content-Type': 'text/plain',
              },
              body: json.encode(getAllLeadRequest))
          .timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getLeadsResponse = GetLeadsResponse.fromJson(parsed);

        // Convert the `getLeadsResponse` object to a JSON string
        String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        await DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getLeadsResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<TotalCountResponse?> getTotalCount() async {
    try {
      TotalCountResponse? totalCountResponse;

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllCount}'),
        headers: {
          'Content-Type': 'text/plain',
        },
      ).timeout(timeoutDuration);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        totalCountResponse = TotalCountResponse.fromJson(parsed);
        return totalCountResponse;
      } else {
        throw Exception("Failed to get counts");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<TotalCountResponse?> fetchAllCount() async {
    String userID = await DataStore.getUserID();
    TotalCountResponse? totalCountResponse;
    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'ci_session=323cc3d497dd4dcd16ab43623f7245ac3e935e45'
    };
    var data = '''{\r\n    "user_id":"$userID"\r\n}''';
    var dio = Dio();
    var response = await dio.request(
      'https://roongtagroup.co.in/api/get_all_count',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
     // print(json.encode(response.data));
      totalCountResponse = TotalCountResponse.fromJson(response.data);
      return totalCountResponse;
    } else {
    //  print(response.statusMessage);
      return null;
    }
  }

  Future<TotalLeads?> fetchTodaysFollowupLeads() async {
    String userID = await DataStore.getUserID();
    TotalLeads? totlaLeads;
    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'ci_session=323cc3d497dd4dcd16ab43623f7245ac3e935e45'
    };
    // var data = '''{\r\n    "user_id":"29"\r\n}''';
    var data = '''{\r\n    "user_id":"$userID"\r\n}''';
    var dio = Dio();
    var response = await dio.request('${ApiConstants.baseUrl}${ApiConstants.getTodays_follow_up}',
       options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      totlaLeads = TotalLeads.fromJson(response.data);
      return totlaLeads;
    } else {
     print(response.statusMessage);
      return null;
    }
  }
  Future<WonLedsModel?> fetchWoneLeads() async {
    String userID = await DataStore.getUserID();
    WonLedsModel? woneleads;
    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'ci_session=323cc3d497dd4dcd16ab43623f7245ac3e935e45'
    };
    // var data = '''{\r\n    "user_id":"29"\r\n}''';
    var data = '''{\r\n    "user_id":"$userID"\r\n}''';
    var dio = Dio();
    var response = await dio.request('${ApiConstants.baseUrl}${ApiConstants.get_wone_leads}',
       options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      woneleads = WonLedsModel.fromJson(response.data);
      return woneleads;
    } else {
     print(response.statusMessage);
      return null;
    }
  }

  Future<ViewleadsModel?> getViewLeads(String leadId) async {
    String userID = await DataStore.getUserID();
    ViewleadsModel? totlaLeads;
    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'ci_session=323cc3d497dd4dcd16ab43623f7245ac3e935e45'
    };
    var data = '''{\r\n    "lead_id":"${leadId}"\r\n}''';
    var dio = Dio();
    var response = await dio.request('${ApiConstants.baseUrl}${ApiConstants.get_view_leads}',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      totlaLeads = ViewleadsModel.fromJson(response.data);
      return totlaLeads;
    } else {
      print(response.statusMessage);
      return null;
    }
  }

 Future<TodaysLead?> getViewTodaysLeads(String leadId) async {
    String userID = await DataStore.getUserID();
    TodaysLead? totlaLeads;
    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'ci_session=323cc3d497dd4dcd16ab43623f7245ac3e935e45'
    };
    var data = '''{\r\n    "lead_id":"${leadId}"\r\n}''';
    var dio = Dio();
    var response = await dio.request('${ApiConstants.baseUrl}${ApiConstants.get_view_leads}',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      totlaLeads = TodaysLead.fromJson(response.data);
      return totlaLeads;
    } else {
      print(response.statusMessage);
      return null;
    }
  }

  Future<Getpropertyresponse?> getPropertyApi() async {
    try {
      Getpropertyresponse? getPropertyResponse;
      //List<dynamic> properties = [];
      //  String userID = await DataStore.getUserID();
      //GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getProperty}'),
        headers: {
          'Content-Type': 'text/plain',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        //  final jsonData = jsonDecode(response.body);
        // Assuming that your properties are stored in the 'data' field under 'na_plots', 'residential', and 'commercial'
        /*     List<dynamic> naPlots = jsonData['data']['na_plots'];
        List<dynamic> residential = jsonData['data']['residential'];
        List<dynamic> commercial = jsonData['data']['commercial'];

        // Concatenate all property lists into one list
        properties = [...naPlots, ...residential, ...commercial];
        print(properties); */
        getPropertyResponse = Getpropertyresponse.fromJson(parsed);
        List<Property> properties = getPropertyResponse.toPropertyList();
        await DataStore.savePropertiesToSharedPrefs(properties);
        // Convert the `getLeadsResponse` object to a JSON string
        //  String jsonString = jsonEncode(getLeadsResponse.toJson());

        // Save the JSON string to shared preferences
        // DataStore.saveLeadsResponseToSharedPreferences(jsonString);

        return getPropertyResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<PropByLocResponse?> getByLocation(GetPropertylocReq req) async {
    try {
      PropByLocResponse? getPropertyByLocation;
      //  String userID = await DataStore.getUserID();
      //  GetAllLeadRequest getAllLeadRequest = GetAllLeadRequest(userId: userID);
      final response = await http.post(
          Uri.parse(
              '${ApiConstants.baseUrl}${ApiConstants.getPropertyByLocation}'),
          headers: {
            'Content-Type': 'text/plain',
          },
          body: json.encode(req));
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        getPropertyByLocation = PropByLocResponse.fromJson(parsed);

        return getPropertyByLocation;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
  /*

  Future<OtpResponse?> validateOtp(OtpRequest otpRequest) async {
    try {
      final response = await http.post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.otp}'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(otpRequest));
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        OtpResponse res = OtpResponse.fromJson(parsed);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('isNew', res.isNew ?? "Yes");

        var fd = res.objOtpValidationCls.lstClientFavoriteDriverVm!.isEmpty
            ? 0
            : res.objOtpValidationCls.lstClientFavoriteDriverVm![0]
                .clientFavoriteDriverId;
        prefs.setInt('favDriver', fd);
        prefs.setString('addressList',
            json.encode(res.objOtpValidationCls.lstClientAddressVm));

        return res;
      } else {
        null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool> updateClientDetails(
      UpdateClientRequest updateClientRequest) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('${ApiConstants.baseUrl}${ApiConstants.register}'));
      request.body = json.encode(updateClientRequest);
      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 200) {
        return true;
      } else {
        false;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<GetCliendDetailResponse?> getClientDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final int? action = prefs.getInt('clienId');
    try {
      GetCliendRequest getCliendRequest = GetCliendRequest(clientId: action!);
      final response = await http.post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getClientDetails}'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(getCliendRequest));
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        GetCliendDetailResponse res = GetCliendDetailResponse.fromJson(parsed);
        prefs.setString('clientDetails', json.encode(res));
        return res;
      } else {
        null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<StateListResponse>?> getStateList() async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response =
          await dio.get('${ApiConstants.baseUrl}${ApiConstants.stateList}');
      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((e) => StateListResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<GetCityResponse>?> getCities(String stateId) async {
    try {
      // List<GetCityResponse> result = [];
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio
          .get('${ApiConstants.baseUrl}${ApiConstants.getCities}$stateId');
      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((e) => GetCityResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to get list");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<GetLocationResponse>?> getLocationbyCity(String cityID) async {
    try {
      //List<GetLocationResponse> result = [];
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.get(
          '${ApiConstants.baseUrl}${ApiConstants.getLocationCity}?CityId=$cityID');
      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((e) => GetLocationResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to get list");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<GetFavDriverResponse>?> getFavouriteDriver() async {
    final prefs = await SharedPreferences.getInstance();
    final int? clientID = prefs.getInt('clienId');
    try {
      //List<GetLocationResponse> result = [];
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio
          .get('${ApiConstants.baseUrl}${ApiConstants.getFavDriver}$clientID');
      if (response.statusCode == 200) {
        Iterable list = response.data;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'favDList',
            json.encode(
                list.map((e) => GetFavDriverResponse.fromJson(e)).toList()));
        return list.map((e) => GetFavDriverResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to get list");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<AddClientResponse>?> addClientAddress(
      AddClientRequest addClientRequest) async {
    try {
      // List<AddClientResponse> result = [];
      Dio dio = Dio();
      Response response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.addClientAddress}',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(addClientRequest),
      );
      if (response.statusCode == 200) {
        Iterable list = response.data;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'addressList',
            json.encode(
                list.map((e) => AddClientResponse.fromJson(e)).toList()));
        return list.map((e) => AddClientResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to get list");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<GetBookingResponse>?> getBookingList() async {
    final prefs = await SharedPreferences.getInstance();
    final int? action = prefs.getInt('clienId');
    try {
      List<GetBookingResponse> result = [];
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio
          .get('${ApiConstants.baseUrl}${ApiConstants.getBookingList}$action');
      if (response.statusCode == 200) {
        Iterable list = response.data;

        for (var i in list) {
          result.add(GetBookingResponse.fromJson(i));
        }

        return result;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<BranchIdResponse?> getBranchIds(
      BranchIdRequest branchIdRequest) async {
    try {
      final response = await http.post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getBranchId}'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(branchIdRequest));

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = json.decode(response.body);
        BranchIdResponse res = BranchIdResponse.fromJson(parsed);
        return res;
      } else {
        null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String> doTempBooking(TempbookRequest tempbookRequest) async {
    final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.temporaryBook}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(tempbookRequest));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('date', tempbookRequest.bookingDate);
      await prefs.setString('time', tempbookRequest.startTime!);
      await prefs.setString('tc', response.body);
      return response.body;
    } else {
      return "failed";
    }
  }

  Future<GetBookingResponse?> getBookingByID(String bookingId) async {
    try {
      GetBookingResponse? getBookingResponse;
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.get(
          '${ApiConstants.baseUrl}${ApiConstants.getBookingById}$bookingId');
      if (response.statusCode == 200) {
        getBookingResponse = GetBookingResponse.fromJson(response.data);

        return getBookingResponse;
      } else {
        throw Exception("Failed to get Bookings");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String> doTempBooking2(TempbookRequest2 tempbookRequest) async {
    final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.temporaryBook}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(tempbookRequest));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('date', tempbookRequest.bookingDate);
      await prefs.setString('time', tempbookRequest.startTime);
      await prefs.setString('tc', response.body);
      return response.body;
    } else {
      return "failed";
    }
  }

  Future<String?> getToken(String name, String email, String phone,
      String state, String city, String location, String message) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(ApiConstants.getTokenDate));
      request.fields.addAll({
        'name': name,
        'email': email,
        'phone': phone,
        'stateSelect': state,
        'citySelect': city,
        'locationSelect': location,
        'message': message
      });

      http.StreamedResponse response1 = await request.send();

      if (response1.statusCode == 200 || response1.statusCode == 302) {
        Dio dio = Dio();
        var updated = response1.headers['location'];
        dio.options.headers['content-Type'] = 'application/json';
        Response response = await dio.get('$updated');
        if (response.statusCode == 200) {
          return 'success';
        } else {
          throw Exception("Failed to get Bookings");
        }
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<ReasonListResponse>?> getReasonListApi() async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.getReasonList}',
          data: jsonEncode(
              ReasonListRequest(reasonType: "Cancel", reasonFor: "Client")));
      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((e) => ReasonListResponse.fromJson(e)).toList();
      } else {
        throw Exception("Failed to get reason");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> sendCancelApi(CancelRequest cancelRequest) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.cancelBooking}',
          data: jsonEncode(cancelRequest));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to get reason");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> feedBackforDriver(FeedbackRequest feedbackRequest) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.feedBackForDriver}',
          data: jsonEncode(feedbackRequest));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to get reason");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<bool?> addFavDriver(FavDriverRequest favDriverRequest) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      Response response = await dio.post(
          '${ApiConstants.baseUrl}${ApiConstants.addFavDriver}',
          data: jsonEncode(favDriverRequest));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to get reason");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  } */
}
