import 'package:testproject/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/io.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late ViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ref.read(viewModelProvider.notifier);
    _viewModel.retrieveMessage();
    super.initState();
  }

  // This function will send the message to our backend.
  void sendMessage(msg) {
    IOWebSocketChannel? channel;
    // We use a try - catch statement, because the connection might fail.
    try {
      // Connect to our backend.
      channel = IOWebSocketChannel.connect('ws://localhost:3000');
    } catch (e) {
      // If there is any error that might be because you need to use another connection.
      print("Error on connecting to websocket: " + e.toString());
    }
    // Send message to backend
    channel?.sink.add(msg);

    // Listen for any message from backend
    channel?.stream.listen((event) {
      // Just making sure it is not empty
      if (event!.isNotEmpty) {
        print(event);
        // Now only close the connection and we are done here!
        channel!.sink.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('Jan', 1),
                SalesData('Feb', 28),
                SalesData('Mar', 34),
                SalesData('Apr', 32),
                SalesData('May', 40)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ]))));
  }
}
