// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_blue_plus/src/flutter_blue_platform_interface.dart';

import '../gen/flutterblueplus.pb.dart' as protos;
import 'bluetooth_characteristic.dart';
import 'guid.dart';

class BluetoothService {
  final Guid uuid;
  final DeviceIdentifier deviceId;
  final bool isPrimary;
  final List<BluetoothCharacteristic> characteristics;
  final List<BluetoothService> includedServices;

  BluetoothService.fromProto(protos.BluetoothService p)
      : uuid = Guid(p.uuid),
        deviceId = DeviceIdentifier(p.remoteId),
        isPrimary = p.isPrimary,
        characteristics = p.characteristics
            .map((c) => BluetoothCharacteristic.fromProto(c))
            .toList(),
        includedServices = p.includedServices
            .map((s) => BluetoothService.fromProto(s))
            .toList();

  @override
  String toString() {
    return 'BluetoothService{uuid: $uuid, deviceId: $deviceId, isPrimary: $isPrimary, characteristics: $characteristics, includedServices: $includedServices}';
  }
}
