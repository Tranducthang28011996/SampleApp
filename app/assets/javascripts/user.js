$(document).ready(function(){
	$('.new_user').on('submit', function(e){
		e.preventDefault();
		var value_name = $('.hello').val();
		$.ajax({
			url: '/users',
			method: 'POST',
			data: {user: {name: value_name}},
			dataType: 'html',
			success: function(data){
				$('table').append(data);
			}
		});
		return false;
	})
});