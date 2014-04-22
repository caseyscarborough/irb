package edu.clayton.irb

class ApplicationFile {

  Application application
  Integer size
  String location
  String filename
  User user

  def afterDelete() {
    log.info("Deleting file at ${this.path()}")
    def file = new File(this.path())
    file.delete()
  }

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
