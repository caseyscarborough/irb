package edu.clayton.irb

public enum StatusType {

  PENDING(1),
  UNDER_REVIEW(2),
  REVIEWED(3),
  DENIED(4),
  APPROVED(5),
  ATTENTION_NEEDED(6)

  final int id

  private StatusType(int id) {
    this.id = id
  }

  static findById(int id) {
    values().find { it.id == id }
  }

}