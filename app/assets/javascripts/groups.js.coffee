$ ->
  $("#pickadate").pickadate(
    format: 'yyyy/mm/dd',
    formatSubmit: 'yyyy/mm/dd',
    hiddenPrefix: 'submit__',
    hiddenSuffix: '',
    min: new Date()
  )

  $('.js-example-basic-multiple').select2()
