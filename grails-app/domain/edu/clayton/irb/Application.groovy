package edu.clayton.irb

class Application {

  User user
  User reviewedBy
  Date dateCreated
  Date lastUpdated
  Status status
  String title
  String description
  String comments

  static belongsTo = [User]

  static hasMany = [files: ApplicationFile]

  static constraints = {
    comments nullable: true
    description nullable: true
    reviewedBy nullable: true
  }

  def beforeValidate() {
    if (!files) {
      files = []
    }
  }

}
