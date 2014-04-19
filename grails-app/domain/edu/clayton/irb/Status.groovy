package edu.clayton.irb

class Status {

  enum StatusType {
    PENDING,
    UNDER_REVIEW,
    REVIEWED,
    DENIED,
    APPROVED,
    ATTENTION_NEEDED
  }

  String name
  String description
  StatusType type

  static constraints = {
    description nullable: true
  }

  String toString() {
    name
  }
}
