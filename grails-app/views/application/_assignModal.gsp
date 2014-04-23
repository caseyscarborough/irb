<div class="modal fade" id="assignModal" tabindex="-1" role="dialog" aria-labelledby="assignModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="${createLink(action: 'assign', id: applicationInstance?.id)}" method="POST">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="assignModalLabel">Assign to Reviewer</h4>
      </div>

        <div class="modal-body">
          <div class="form-group">
            <label for="reviewer">Reviewer</label>
            <select id="reviewer" name="reviewer" class="form-control">
              <g:each in="${reviewerInstanceList}" var="reviewerInstance">
                <option value="${reviewerInstance.id}">${reviewerInstance}</option>
              </g:each>
            </select>
          </div>
          <small id="application-review-message">This reviewer is currently reviewing <span id="application-review-count"></span> applications.</small>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <input type="submit" value="Assign" class="btn btn-primary" />
        </div>
    </div>
    </form>

  </div>
</div>