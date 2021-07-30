class Session {
  final String sessid;
  final String tutorid;
  final String tutornm;
  final String tuteeid;
  final String tuteenm;
  final String subject;
  final String date;
  final String day;
  final String venue;
  final int slot;
  final String status;
  final bool rate;
  final bool mark;

  Session(
    this.sessid,
    this.tutorid,
    this.tutornm,
    this.tuteeid,
    this.tuteenm,
    this.subject,
    this.date,
    this.day,
    this.venue,
    this.slot,
    this.status,
    this.rate,
    this.mark,
  );
}
