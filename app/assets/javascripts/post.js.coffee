$(document).ready -> 
	$('.post_markdown_preview').hide()
	$('.edit').click -> 
		$(this).addClass("active")
		$('.preview').removeClass("active")
		$('.new_post_content').show()
		$('.post_markdown_preview').empty()
		$('.post_markdown_preview').hide()
		false
	$('.preview').click -> 
		$('.new_post_content').hide()
		$('.post_markdown_preview').html("loading...")
		$(this).addClass("active")
		$('.edit').removeClass("active")
		$('.post_markdown_preview').show()
		$.post '/posts/preview',{body: $('.new_post_content textarea').val()},(data) -> 
			markdown_div = "<div class='markdown_commments'>"
			div_end = "</div>"
			$('.post_markdown_preview').html "#{markdown_div}#{data}#{div_end}"
			false
		false
			