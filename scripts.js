$(document).ready(function(){
    // save comment to database
    $(document).on('click', '#submit_btn', function(){
      var placeName = $('#placeName').val();
      var personName = $('#personName').val();
      var coffeeGrade = $('#coffeeGrade').val();
      var priceGrade = $('#priceGrade').val();
      var atmosphereGrade = $('#atmosphereGrade').val();

      $.ajax({
        url: 'server.php',
        type: 'POST',
        data: {
          'save': 1,
          'placeName': placeName,
          'personName': personName,
          'coffeeGrade': coffeeGrade,
          'priceGrade': priceGrade,
          'atmosphereGrade': atmosphereGrade,
        },
        success: function(response){
          // $('#placeName').val('');
          // $('#personName').val('');
          // $('#coffeeGrade').val('');
          // $('#priceGrade').val('');
          // $('#atmosphereGrade').val('');
          $('#display_area').append(response);
        }
      });
    });

    // delete from database
    $(document).on('click', '.delete', function(){
        var id = $(this).data('id');
        $clicked_btn = $(this);
        $.ajax({
          url: 'server.php',
          type: 'GET',
          data: {
          'delete': 1,
          'id': id,
        },
        success: function(response){
          // remove the deleted comment
          $clicked_btn.parent().remove();
          $('#personName').val('');
          $('#placeName').val('');
          $('#coffeeGrade').val('');
          $('#priceGrade').val('');
          $('#atmosphereGrade').val('');


        }
        });
    });
    var $edit_id;
    var $edit_coffeeGrade;
    $(document).on('click', '.edit', function(){
        $edit_id = $(this).data('id');
        $edit_coffeeGrade = $(this).parent();
        // grab the comment to be editted
        var placeName = $(this).siblings('.display_name').text();
        var personName = $(this).siblings('.comment_text').text();
        
        // place comment in form
        $('#placeName').val(placeName);
        $('#personName').val(personName);
        $('#coffeeGrade').val(coffeeGrade);
        $('#priceGrade').val(priceGrade);
        $('#atmosphereGrade').val(atmosphereGrade);
        $('#submit_btn').hide();
        $('#update_btn').show();
    });
    $(document).on('click', '#update_btn', function(){
        var id = $edit_id;
        var placeName = $('#placeName').val();
        var personName = $('#personName').val();
        var coffeeGrade = $('#coffeeGrade').val();
        var priceGrade = $('#priceGrade').val();
        var atmosphereGrade = $('#atmosphereGrade').val();
        $.ajax({
        url: 'server.php',
        type: 'POST',
        data: {
            'update': 1,
            'id': id,
            'placeName': placeName,
            'personName': personName,
            'coffeeGrade': coffeeGrade,
            'priceGrade': priceGrade,
            'atmosphereGrade': atmosphereGrade,


        },
        success: function(response){
            // $('#placeName').val('');
            // $('#personName').val('');
            // $('#coffeeGrade').val('');
            // $('#priceGrade').val('');
            // $('#atmosphereGrade').val('');
            $('#submit_btn').show();
            $('#update_btn').show();
            $('#display_area').append(response);
            $edit_coffeeGrade.replaceWith(response);
        }
        });		
    });
  });