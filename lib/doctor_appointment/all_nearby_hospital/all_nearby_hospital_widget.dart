import '/backend/schema/structs/index.dart';
import '/components/hospital_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_nearby_hospital_model.dart';
export 'all_nearby_hospital_model.dart';

class AllNearbyHospitalWidget extends StatefulWidget {
  const AllNearbyHospitalWidget({super.key});

  @override
  State<AllNearbyHospitalWidget> createState() =>
      _AllNearbyHospitalWidgetState();
}

class _AllNearbyHospitalWidgetState extends State<AllNearbyHospitalWidget> {
  late AllNearbyHospitalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllNearbyHospitalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Nearby Hospital',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Builder(
              builder: (context) {
                final hospital = FFAppState().hospitals.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.6,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: hospital.length,
                  itemBuilder: (context, hospitalIndex) {
                    final hospitalItem = hospital[hospitalIndex];
                    return HospitalItemWidget(
                      key: Key('Keyu9w_${hospitalIndex}_of_${hospital.length}'),
                      name: hospitalItem.name,
                      location: hospitalItem.location,
                      rating: hospitalItem.rating,
                      image: hospitalItem.image,
                      btnAction: () async {},
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
