// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:geocoding/geocoding.dart';

class PlacePicker extends StatefulWidget {
  const PlacePicker({
    super.key,
    this.width,
    this.height,
    this.updateContainingPage,
  });

  final double? width;
  final double? height;
  final Future Function()? updateContainingPage;

  @override
  State<PlacePicker> createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePicker> {
  TextEditingController _controller = TextEditingController();
  Uuid uuid = Uuid();
  String _sessionToken = '12345';
  List<dynamic> _placesList = [];
  double? Latitude = null;
  double? Longitude = null;
  String main_text = '';
  bool place_selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    // String google_places_api_key = GOOGLE_API_KEY;
    // String baseURL = BASEURL;
    String request =
        'https://proxy-server-kohl-eta.vercel.app/autocomplete/$input';
    var response = await http.get(Uri.parse(request));

    // String data = response.body.toString();
    // print('data');
    // print(data);
    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
        main_text = jsonDecode(response.body.toString())['predictions'][0]
            ['structured_formatting']['main_text'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void getLatLng(String address) async {
    String request =
        'https://proxy-server-kohl-eta.vercel.app/geocode?address=$address';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      double lat = decodedResponse['results'][0]['geometry']['location']['lat'];
      double lng = decodedResponse['results'][0]['geometry']['location']['lng'];

      setState(() {
        _controller.text = main_text;
        FFAppState().locationFromAddress = LatLng(lat, lng);

        _placesList = [];
        place_selected = true;
      });
      widget.updateContainingPage!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft:
              Radius.circular(8), // Apply 8px border radius to the bottom-left
          bottomRight:
              Radius.circular(8), // Apply 8px border radius to the bottom-right
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            TextFormField(
              onChanged: (_) {
                place_selected = false;
                setState(() {});
              },
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Find desired address',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).tertiary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                prefixIcon: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          _controller.clear();
                        },
                        child: Icon(
                          Icons.clear,
                          size: 22,
                        ),
                      )
                    : null,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            Expanded(
              child: _placesList.length != 0 && place_selected == false
                  ? Container(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      child: ListView.builder(
                        itemCount: _placesList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            // style: FlutterFlowTheme.of(context)
                            //     .titleLarge
                            //     .override(
                            //       fontFamily: 'Outfit',
                            //       letterSpacing: 0.0,
                            //     ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),

                            title: Text(_placesList[index]['description']),
                            onTap: () async {
                              String address =
                                  _placesList[index]['description'];
                              getLatLng(address);

                              // print(Latitude);
                              // print(Longitude);
                              // print(locations.latitude);
                            },
                            // trailing: Text('$Latitude, $Longitude'),
                          );
                        },
                      ),
                    )
                  : Container(
                      height: 0,
                      width: 0,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
