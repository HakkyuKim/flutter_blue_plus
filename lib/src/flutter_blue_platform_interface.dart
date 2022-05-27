import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:collection/collection.dart';

import '../gen/flutterblueplus.pb.dart' as protos;
import 'bluetooth_device.dart';

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

  Future startScan(protos.ScanSettings settings) async {
    throw UnimplementedError();
  }

  Future stopScan() async {
    throw UnimplementedError();
  }

  Stream<protos.ScanResult> get scanResults{
    throw UnimplementedError();
  }

  /// Sets the log level of the FlutterBlue instance
  /// Messages equal or below the log level specified are stored/forwarded,
  /// messages above are dropped.
  Future setLogLevel(int level) async {
    throw UnimplementedError();
  }

  void log(LogLevel level, String message) {
    throw UnimplementedError();
  }

  Future readDescriptor(protos.ReadDescriptorRequest request) {
    throw UnimplementedError();
  }

  Stream<protos.ReadDescriptorResponse> get readDescriptorResponse {
    throw UnimplementedError();
  }

  Future writeDescriptor(protos.WriteDescriptorRequest request) {
    throw UnimplementedError();
  }

  Stream<protos.WriteDescriptorResponse> get writeDescriptorResponse {
    throw UnimplementedError();
  }

  Future readCharacteristic(protos.ReadCharacteristicRequest request) {
    throw UnimplementedError();
  }

  Stream<protos.ReadCharacteristicResponse> get readCharacteristicResponse {
    throw UnimplementedError();
  }

  Future writeCharacteristic(protos.WriteCharacteristicRequest request) {
    throw UnimplementedError();
  }

  Stream<protos.WriteCharacteristicResponse> get writeCharacteristicResponse {
    throw UnimplementedError();
  }

  Stream<protos.OnCharacteristicChanged> get onCharacteristicChanged {
    throw UnimplementedError();
  }

  Future setNotification(protos.SetNotificationRequest request) {
    throw UnimplementedError();
  }

  Stream<protos.SetNotificationResponse> get setNotificationResponse {
    throw UnimplementedError();
  }

  Future connect(protos.ConnectRequest request) {
    throw UnimplementedError();
  }

  Future disconnect(String id) {
    throw UnimplementedError();
  }

  Future discoverServices(String id) {
    throw UnimplementedError();
  }

  Stream<protos.DiscoverServicesResult> get discoverServicesResult {
    throw UnimplementedError();
  }

  Future services(String id) {
    throw UnimplementedError();
  }

  Future deviceState(String id) {
    throw UnimplementedError();
  }

  Stream<protos.DeviceStateResponse> get deviceStateResponse {
    throw UnimplementedError();
  }

  Future mtu(String id) {
    throw UnimplementedError();
  }

  Future requestMtu(protos.MtuSizeRequest request) {
    throw UnimplementedError();
  }

  Stream<protos.MtuSizeResponse> get mtuSizeResponse {
    throw UnimplementedError();
  }

  Future readRssi(String remoteId) {
    throw UnimplementedError();
  }

  Stream<protos.ReadRssiResult> get readRssiResult {
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
