import 'package:flutter/services.dart';
import 'nyx_printer_platform_interface.dart';
import 'nyx_text_format.dart';
import 'dart:typed_data'; // Make sure to import this for Uint8List

export 'nyx_text_format.dart';

class NyxPrinter {
  /// [getVersion] will return printer version number.
  /// success result is 0.
  Future<int?> getVersion() {
    return NyxPrinterPlatform.instance.getVersion();
  }

  /// [printText] will print text
  /// to format text you can use [NyxTextFormat] to set font size or font style ...etc
  /// success result is 0.
  Future<int?> printText(String text, {NyxTextFormat? textFormat}) {
    return NyxPrinterPlatform.instance
        .printText(text, textFormat ?? NyxTextFormat());
  }

  /// [printBarcode] will print barcode and you can set width and height.
  /// default width is 300
  /// default height is 160
  /// success result is 0.
  Future<int?> printBarcode(String text, {int? width, int? height}) {
    return NyxPrinterPlatform.instance
        .printBarcode(text, width ?? 300, height ?? 160);
  }

  /// [printQrCode] will print QR code and you can set width and height.
  /// default width is 300
  /// default height is 300
  /// success result is 0.
  Future<int?> printQrCode(String text, {int? width, int? height}) {
    return NyxPrinterPlatform.instance
        .printQrCode(text, width ?? 300, height ?? 300);
  }

  /// [printImage] will print only png images.
  /// success result is 0.
  Future<int?> printImage(Uint8List bytes) {
    return NyxPrinterPlatform.instance.printBitmap(bytes);
  }
}
