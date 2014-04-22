package edu.clayton.irb

class ApplicationFile {

  Application application
  Integer size
  String location
  String filename
  User user

  def grailsLinkGenerator

  static transients = ['grailsLinkGenerator']

  def afterDelete() {
    log.info("Deleting file at ${this.path}")
    def file = new File(this.path)
    file.delete()
  }

  static constraints = {
    application nullable: true
  }

  String getPath() {
    "${location}/${filename}"
  }

  String getExtension() {
    filename.substring(filename.lastIndexOf(".") + 1)
  }

  String getDownloadUrl() {
    grailsLinkGenerator.link(controller: 'file', action: 'download', id: this?.id)
  }

  String getDeleteUrl() {
    grailsLinkGenerator.link(controller: 'file', action: 'delete', id: this?.id)
  }

  String toString() {
    filename
  }

}
