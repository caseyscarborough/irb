package edu.clayton.irb

class ApplicationFile {

  Application application
  String location
  String filename

  static constraints = {
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
