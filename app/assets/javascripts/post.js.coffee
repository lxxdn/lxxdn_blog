$(document).ready -> 
	$('.edit').click -> 
		$('#conmment_area').show()
		$('.markdown_preview').empty()
		false
	$('.preview').click -> 
		$('#conmment_area').hide()
		$.post '/posts/preview',{body: $('#conmment_area').val()},(data) -> 
			$('.markdown_preview').append "#{data}"
			false
		false


			