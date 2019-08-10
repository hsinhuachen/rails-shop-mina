// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
$(function(){
	$('#twzipcode').twzipcode();
	
	$(".add_to_cart").click(function(event) {
		var url = $(this).attr("href");
		var quantity = $(this).data("quantity");
		$.ajax({
		    type: "PUT",
		    url: url,
		    data: { quantity: quantity } 
		});

		return false
	});

	//數量＋－
    $(".btn-number").on("click", function(){
		var btn_type = $(this).data("type");
		var btn_target = $("#" + $(this).data("field"));
		var product_cur_count = parseInt(btn_target.val());
		var product_min = 1;
		var product_max = btn_target.attr("max");

		if(btn_type == "plus"){
			if(product_cur_count < product_max){
			  product_cur_count++;
			  btn_target.val(product_cur_count);
			}
		}else if(btn_type == "minus"){
			if(product_cur_count > 1){
				product_cur_count--;
				btn_target.val(product_cur_count);
			}
		}

		// 移除disable
		if(product_cur_count > 1){
			$('.btn-number[data-type="minus"]').attr("disabled",false);
		}else if(product_cur_count == 1){
			$('.btn-number[data-type="minus"]').attr("disabled",true);
		}

		if(product_cur_count == product_max){
			$('.btn-number[data-type="plus"]').attr("disabled",true);
		}else{
			$('.btn-number[data-type="plus"]').attr("disabled",false);
		}

		$("#add_to_cart").attr("data-quantity",product_cur_count);

      	event.preventDefault();
    });
})

function selectchange(object,productid){
	var value = object.value;
	
	$("#add_to_cart" + productid).attr("data-quantity",value);
}
