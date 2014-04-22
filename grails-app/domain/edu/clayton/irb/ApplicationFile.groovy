package edu.clayton.irb

class ApplicationFile {

  Application application
  String location
  String filename
  User user

  static constraints = {
    application nullable: true
  }

  String path() {
    "${location}/${filename}"
  }

  String extension() {
    filename.substring(filename.lastIndexOf(".") + 1)
  }

  String toString() {
    filename
  }

}
