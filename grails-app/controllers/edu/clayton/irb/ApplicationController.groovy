package edu.clayton.irb

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import java.io.File

@Secured('IS_AUTHENTICATED_FULLY')
@Transactional
class ApplicationController {

  def springSecurityService

  def index() {
    def currentUser = springSecurityService.currentUser
    [applicationInstanceList: Application.findAllByUser(currentUser)]
  }

  def submit() { }

  def upload() {
    def file = params['files[]']
    def currentUser = springSecurityService.currentUser

    if (file?.empty) {
      flash.message = 'File cannot be empty.'
      render "Error"
      return
    }

    File path = new File("/Users/Casey/Desktop/${currentUser?.username}")
    String filename = "${new Date().format('yyyyMMddHHmmss')}_${file?.originalFilename}"
    path.mkdirs()

    file?.transferTo(new File("${path}/${filename}"))
    def file1 = [
        name: filename,
        size: file?.size,
        url: path,
        deleteType: "DELETE"
    ]
    def jsonResponse = [files: [file1]]

    // Having to do this the manual way for now, because render jsonResponse as JSON
    // throws StringIndexOutOfBoundsException: String index out of range: -1 and can't
    // figure it out right now.
    if (file) {
      render "{ \"files\": [ { \"name\": \"${filename}\", \"size\": ${file?.size}, \"url\": \"${path}\", \"deleteType\": \"DELETE\" } ] }"
      return
    }

    render ""
  }

  def random() {
    def file1 = [
        name: "asdf",
        size: 1234,
        url: "/users/casey",
        deleteType: "DELETE"
    ]
    def jsonResponse = [files: [file1]]
    println "${jsonResponse as JSON}"
    render jsonResponse as JSON
  }

}
