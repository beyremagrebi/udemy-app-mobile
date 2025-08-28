import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

import '../base_view_model.dart';

class ExcelViewerViewModel extends BaseViewModel {
  final String url;

  bool isLoading = true;
  bool screenTaped = false;
  List<List<String>> rows = [];

  ExcelViewerViewModel(super.context, {required this.url}) {
    loadExcel(url);
  }

  void closeViewer() {
    Navigator.of(context).pop();
  }

  Future<void> loadExcel(String url) async {
    try {
      if (url.toLowerCase().endsWith('.xls')) {
        debugPrint('Error: .xls files are not supported.');
        isLoading = false;
        update();
        return;
      }
      final Dio dio = Dio();
      final Response<Uint8List> response = await dio.get<Uint8List>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = response.data!;
      final excel = Excel.decodeBytes(bytes);

      rows.clear();

      final sheet = excel.sheets.values.first;
      for (final row in sheet.rows) {
        rows.add(row.map((cell) => cell?.value.toString() ?? '').toList());
      }

      isLoading = false;
      update();
    } on Exception catch (e) {
      debugPrint('Error loading Excel: $e');
      isLoading = false;
      update();
    }
  }

  void onTapScreen() {
    screenTaped = !screenTaped;
    update();
  }
}
