import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAwesomeDialog(BuildContext context, int code) {
  return AwesomeDialog(
    context: context,
    dialogType: code >= 400 ? DialogType.ERROR : DialogType.SUCCES,
    animType: AnimType.BOTTOMSLIDE,
    title: _getStatusTitle(code),
    desc: _getStatusDescription(code),
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  )..show();
}

String _getStatusTitle(int code) {
  switch (code) {
    case 200:
      return 'İşlem Başarılı';
    case 201:
      return 'Kullanıcı başarı ile kayıt edildi';
    case 204:
      return 'Silme İşlemi Başarılı';
    case 400:
      return 'İstek Sorunlu.';
    case 401:
      return 'Yetkiniz dışında işlem girişimi';
    case 403:
      return 'İşlem Reddedildi';
    case 404:
      return 'İstek hatalı';
    case 409:
      return 'Kullanıcı zaten kayıtlı';
    case 429:
      return 'İşlem sınır aşımı';
    case 500:
      return 'Server hatası.';
    case 503:
      return 'Server servis veremiyor.';
    case 504:
      return 'Server servis veremiyor.';
  }
  return 'Sorun var. İşlem Tamamlanamadı';
}

String _getStatusDescription(int code) {
  switch (code) {
    case 200:
      return 'İşlem Başarılı';
    case 201:
      return 'Kayıt edildi. Giriş yapabilirsiniz';
    case 204:
      return 'Silme İşlemi Başarılı';
    case 400:
      return 'İstek Sorunlu.';
    case 401:
      return 'Yetkiniz dışında işlem girişimi';
    case 403:
      return 'İşlem Reddedildi';
    case 404:
      return 'İstek hatalı';
    case 409:
      return 'Kullanıcı zaten kayıtlı';
    case 429:
      return 'İşlem sınır aşımı';
    case 500:
      return 'Server hatası.';
    case 503:
      return 'Server servis veremiyor.';
    case 504:
      return 'Server servis veremiyor.';
  }
  return 'Sorun var. İşlem Tamamlanamadı';
}
