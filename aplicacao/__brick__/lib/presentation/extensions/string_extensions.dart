extension StringExtensions on String {
  String get initials {
    final split = this.split(' ');
    if (split.length >= 2) {
      return '${split[0][0]}${split[1][0]}';
    } else if (length > 1) {
      return '${this[0]}${this[1]}';
    } else {
      return this;
    }
  }

  String get firstName {
    final split = this.split(' ');
    return split[0];
  }

  String get lastName {
    final split = this.split(' ');
    if (split.length >= 2) {
      return split[1];
    } else {
      return '';
    }
  }
}
