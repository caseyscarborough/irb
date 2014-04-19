package edu.clayton.irb

class Status {

  String name
  String description
  StatusType type

  static constraints = {
    description nullable: true
  }

  static mapping = {
  }

  String toString() {
    name
  }
}
