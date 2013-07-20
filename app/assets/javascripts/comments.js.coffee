# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
	$('.markdown_preview').hide()

	$('.edit').click -> 
		$('#conmment_area').show()
		$('.markdown_preview').empty()
		$('.markdown_preview').hide()
		false


	$('.preview').click -> 
		$('#conmment_area').hide()
		$('.markdown_preview').show()
		$.post '/posts/preview',{body: $('#conmment_area').val()},(data) -> 
			markdown_div = "<div class='markdown_commments'>"
			div_end = "</div>"
			$('.markdown_preview').html "#{markdown_div}#{data}#{div_end}"
			false
		false


