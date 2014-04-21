package edu.clayton.irb

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class JavascriptController {

  def grailsApplication

  @Secured('permitAll')
  def main() {
    def config = grailsApplication.config.irb
    def supportedFiletypes = new StringBuilder()
    config.supportedFiletypes.eachWithIndex { filetype, i ->
      if (i > 0) {
        supportedFiletypes.append('|')
      }
      supportedFiletypes.append(filetype.toLowerCase())
    }
    [supportedFiletypes: supportedFiletypes.toString(), maxFileSize: config.maxFileSize]
  }
}
