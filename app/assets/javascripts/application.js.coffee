#  This is a manifest file that'll be compiled into application.js, which will include all the files
#  listed below.
#
#  Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
#  vendor/assets/javascripts directory can be referenced here using a relative path.
#
#  It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#  compiled file. JavaScript code in this file should be added after the last require_* statement.
#
#  Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
#  about supported directives.
#
#= require jquery3
#= require popper
#= require bootstrap-sprockets
#= require rails-ujs
#= require activestorage
#= require pickadate/picker
#= require pickadate/picker.date
#= require pickadate/translations/ja_JP
#= require select2
#= require_self
#= require_tree .

(($) ->
  $.fn.flash_message = (options) ->
    options = $.extend({
      text: 'Done'
      time: 750
      how: 'before'
      class_name: ''
    }, options)
    $(this).each ->
      message = undefined
      if $(this).parent().find('.flash_message').get(0)
        return
      message = $('<span />',
        'class': 'flash_message ' + options.class_name
        text: options.text).hide().fadeIn('fast')
      $(this)[options.how] message
      message.delay(options.time).fadeOut 'normal', ->
        $(this).remove()
        return
      return
  return
) jQuery
