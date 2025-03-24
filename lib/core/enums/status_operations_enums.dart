enum SectionStatus {
  accepted,
  rejected,
  pending,
}

extension SectionStatusExtension on SectionStatus {
  String get displayName {
    switch (this) {
      case SectionStatus.accepted:
        return "مقبول";
      case SectionStatus.rejected:
        return "مرفوض";
      case SectionStatus.pending:
        return "قيد الانتظار";
    }
  }
}
