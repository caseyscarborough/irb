<g:if test='${flash.message}'>
  <div data-alert class='alert-box'>
    ${flash.message}
    <a href="#" class="close">&times;</a>
  </div>
</g:if>
<g:if test='${flash.error}'>
  <div data-alert class='alert-box alert'>
    ${flash.message}
    <a href="#" class="close">&times;</a>
  </div>
</g:if>