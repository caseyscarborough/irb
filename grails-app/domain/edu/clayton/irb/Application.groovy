package edu.clayton.irb

class Application {

  Date dateCreated
  Date lastUpdated
  Status status
  String title
  String description
  String comments
  User user
  User reviewedBy

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
