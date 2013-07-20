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


			