$(document).on('turbolinks:load', function(){
	// star rating
  $('.rating').raty( { path: '/images/raty', scoreName: 'comment[rating]' 
  	});

  $('.rated').raty({ path: '/images/raty',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });

	//textarea color
  $(".form-control").on({  	
    focus: function(){
      $(this).css("background-color", "gainsboro");
  	},
    focusout: function(){
      $(this).css("background-color", "white");
  	},
	}); 
});

