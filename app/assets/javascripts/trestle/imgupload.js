$(document).on('turbolinks:load', function() {
	$(".thumbimg").change(function(event) {
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			$("#thumbpreview").html('<img src="' + image_base64 + '" class="thumbimg img-responsive" />')
		}

		reader.readAsDataURL(file);
	});
})