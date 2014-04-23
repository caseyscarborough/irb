package edu.clayton.irb

class ApplicationFile {

  Application application
  Integer size
  String location
  String filename
  String originalFilename
  String hash
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
    grailsLinkGenerator.link(controller: 'file', action: 'download', params: [fileHash: this?.hash])
  }

  String getDeleteUrl() {
    grailsLinkGenerator.link(controller: 'file', action: 'delete', id: this?.id)
  }

  String getSizeString() {
    if (sizeInMegabytes > 1) {
      return "${sizeInMegabytes}MB"
    }
    return "${sizeInKilobytes}KB"
  }

  Double getSizeInKilobytes() {
    return Math.round(this?.size / 100) / 10
  }

  Double getSizeInMegabytes() {
    return Math.round(this?.size / 100000) / 10
  }

  String toString() {
    filename
  }

}
