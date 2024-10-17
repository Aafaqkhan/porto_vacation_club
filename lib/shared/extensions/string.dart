extension StringExtended on String? {
  bool get isNull => this == null;
  bool get isNotNull => isNull == false;
  bool get isNullorEmpty => this == null || (this ?? '').isEmpty;
  String get removeSpaces => isNullorEmpty?'':this!.replaceAll(" ", "");
  String get toCapitalize => isNullorEmpty
      ? ''
      : this![0].toUpperCase() + this!.substring(1).toLowerCase();
  String get toTitleCase => isNullorEmpty
      ? ''
      : this!
          .replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.toCapitalize)
          .join(' ');
  String? get onlyNumbers {
    if (isNullorEmpty) {
      return '';
    }
    var regex = RegExp(r'([^0-9]+)');
    return this!.replaceAll(regex, '');
  }

  String? get removeSpecial {
    if (isNullorEmpty) {
      return this;
    }
    var regex = RegExp(r'[/!@#$%^\-&*()+",.?":{}|<>~_-`]');
    return this!.replaceAll(regex, '');
  }
   bool get isUrl {
    if (isNullorEmpty) {
      return false;
    }
    var regex = RegExp(
        r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
    return regex.hasMatch(this!);
  }
    bool get isMail {
    if (isNullorEmpty) {
      return false;
    }
    var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this!);
  }
}
