import 'package:flutter_blue_plus/gen/flutterblueplus.pb.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:collection/collection.dart';

abstract class FlutterBluePlatform extends PlatformInterface {
  FlutterBluePlatform() : super(token: _token);

  static final Object _token = Object();

  static late FlutterBluePlatform _instance;

  static FlutterBluePlatform get instance => _instance;

  static set instance(FlutterBluePlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Checks whether the device supports Bluetooth
  Future<bool> get isAvailable {
    throw UnimplementedError();
  }

  /// Checks if Bluetooth functionality is turned on
  Future<bool> get isOn {
    throw UnimplementedError();
  }

  /// Tries to turn on Bluetooth (Android only),
  ///
  /// Returns true if bluetooth is being turned on.
  /// You have to listen for a stateChange to ON to ensure bluetooth is already running
  ///
  /// Returns false if an error occured or bluetooth is already running
  ///
  Future<bool> turnOn() {
    throw UnimplementedError();
  }

  /// Tries to turn off Bluetooth (Android only),
  ///
  /// Returns true if bluetooth is being turned off.
  /// You have to listen for a stateChange to OFF to ensure bluetooth is turned off
  ///
  /// Returns false if an error occured
  ///
  Future<bool> turnOff() {
    throw UnimplementedError();
  }

  /// Gets the current state of the Bluetooth module
  Stream<BluetoothState> get state async* {
    throw UnimplementedError();
  }

  /// Retrieve a list of connected devices
  Future<List<BluetoothDevice>> get connectedDevices {
    throw UnimplementedError();
  }

  /// Retrieve a list of bonded devices (Android only)
  Future<List<BluetoothDevice>> get bondedDevices {
    throw UnimplementedError();
  }

  Future startScan(ScanSettings setting) async {
    throw UnimplementedError();
  }

  Future stopScan() async {
    throw UnimplementedError();
  }

  /// Sets the log level of the FlutterBlue instance
  /// Messages equal or below the log level specified are stored/forwarded,
  /// messages above are dropped.
  void setLogLevel(LogLevel level) async {
    throw UnimplementedError();
  }

  Future readDescriptor(ReadDescriptorRequest request) {
    throw UnimplementedError();
  }

  Future writeDescriptor(WriteDescriptorRequest request) {
    throw UnimplementedError();
  }

  Future writeCharacteristic(WriteCharacteristicRequest request) {
    throw UnimplementedError();
  }

  Future readCharacteristic(ReadCharacteristicRequest request) {
    throw UnimplementedError();
  }

  Future setNotification(SetNotificationRequest request) {
    throw UnimplementedError();
  }

  Future connect(ConnectRequest request) {
    throw UnimplementedError();
  }

  Future disconnect(String id) {
    throw UnimplementedError();
  }

  Future discoverServices(String id) {
    throw UnimplementedError();
  }

  Future services(String id) {
    throw UnimplementedError();
  }

  Future deviceState(String id) {
    throw UnimplementedError();
  }

  Future mtu(String id) {
    throw UnimplementedError();
  }

  Future requestMtu(MtuSizeRequest request) {
    throw UnimplementedError();
  }

  Future readRssi(String remoteId) {
    throw UnimplementedError();
  }
}

/// State of the bluetooth adapter.
enum BluetoothState {
  unknown,
  unavailable,
  unauthorized,
  turningOn,
  on,
  turningOff,
  off
}

/// Log levels for FlutterBlue
enum LogLevel {
  emergency,
  alert,
  critical,
  error,
  warning,
  notice,
  info,
  debug,
}

class DeviceIdentifier {
  final String id;
  const DeviceIdentifier(this.id);

  @override
  String toString() => id;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) =>
      other is DeviceIdentifier && compareAsciiLowerCase(id, other.id) == 0;
}
