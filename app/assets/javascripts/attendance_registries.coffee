# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@AttendantUtils =
  init: ->
    $('.attendant_item').click (ev) ->
      ev.preventDefault()
      $(@).toggleClass('absent')
      false
  submit: ->
    absentees_ids = []
    $.each($('.attendant_item.absent'), (index, ele) -> absentees_ids.push(ele.dataset.studentId))
    $('#attendance_registry_absent_student_ids').val(absentees_ids.join(','))
    $('#attendance_registry_form input.submit').click()

$ ->
  $('a#submit-attendance').click (ev) ->
    ev.preventDefault()
    AttendantUtils.submit()
    false
