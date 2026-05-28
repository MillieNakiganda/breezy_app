extension ValidationExtensions on String {
  bool get isValidEmail {
    final atIndex = lastIndexOf('@');
    if (atIndex == -1) return false;

    final local = substring(0, atIndex);
    final domain = substring(atIndex + 1);

    return isValidLocal(local) && isValidDomain(domain);
  }

  bool isValidLocal(String local) {
    if (local.isEmpty || local.length > 64) return false;
    if (local.startsWith('.') || local.endsWith('.')) return false;
    if (local.contains('..')) return false;

    return RegExp(r'^[a-zA-Z0-9._%+\-]+$').hasMatch(local);
  }

  bool isValidDomain(String domain) {
    if (domain.isEmpty) return false;

    final labels = domain.split('.');
    if (labels.length < 2) return false;

    final tld = labels.last;
    if (!RegExp(r'^[a-zA-Z]{2,63}$').hasMatch(tld)) return false;

    for (final label in labels.sublist(0, labels.length - 1)) {
      if (label.length < 2 || label.length > 63) return false;
      if (label.startsWith('-') || label.endsWith('-')) return false;
      if (!RegExp(r'^[a-zA-Z0-9\-]+$').hasMatch(label)) return false;
    }

    return true;
  }
}
