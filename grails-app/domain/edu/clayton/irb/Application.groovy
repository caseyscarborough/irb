package edu.clayton.irb

class Application {

  User user
  User reviewedBy
  Date dateCreated
  Date lastUpdated
  String comments

  static belongsTo = [User]

  static constraints = {
    reviewedBy nullable: true
    comments nullable: true
  }

}
