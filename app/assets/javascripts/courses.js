$(function() {
  $('#course_internship_course').click(function() {
    if ($(this).is(':checked')) {
      $('#course_active').val(true);
    } else {
      $('#course_active').val(null);
    }
  });
});
