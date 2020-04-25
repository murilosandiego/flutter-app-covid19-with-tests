import 'package:covid_19/app/modules/home/models/covid_state.dart';
import 'package:covid_19/app/modules/home/widgets/container/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_markers/map_markers.dart';

class MapWidget extends StatelessWidget {
  final covidsStates;

  MapWidget({Key key, this.covidsStates})
      : assert(covidsStates != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(header: 'Mapa do Brasil', content: brazilMap);
  }

  FlutterMap get brazilMap {
    return FlutterMap(
      options: new MapOptions(
        center: LatLng(-14.24, -49.00),
        zoom: 4.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(markers: markers),
      ],
    );
  }

  List<Marker> get markers {
    if (covidsStates == null) return [];
    return covidsStates
        .map<Marker>((CovidState item) => Marker(
              width: 120.0,
              height: 100.0,
              point: LatLng(item.lat, item.log),
              builder: (context) => BubbleMarker(
                widgetBuilder: (BuildContext context) {
                  return Icon(
                    Icons.location_on,
                    size: 30.0,
                    color: Color(0xFF5D78FF),
                  );
                },
                bubbleColor: Colors.black.withAlpha(120),
                bubbleContentWidgetBuilder: (BuildContext context) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Text('${item.state}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        Text(
                          '${item.cases} casos',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
              ),
            ))
        .toList();
  }
}
