  function fileSelecter(){
    var oFile = $('#file')[0].files[0];
    $('.error').hide();

    var rFilter = /^(image\/jpeg|image\/png)$/i;
    if (! rFilter.test(oFile.type)) {
        $('.error').html('Please select jpg or png').show();
        $("#disp").slideUp(500);
        return;
    }
    if (oFile.size > 1024 * 1024) {
        $('.error').html('File size too large').show();
        $("#disp").slideUp(500);
        return;
    }
    $("#disp").slideDown(500);
    $(".prev_img img").css("padding", "0px");
    var oImage = document.getElementById('preview');

    var oReader = new FileReader();
      oReader.onload = function(e) {
        oImage.src = e.target.result;
        oImage.onload = function () {
        var maxWidth = 200;
        var width = oImage.naturalWidth;
        var height = oImage.naturalHeight;
        height = height * maxWidth / width;
        ratio = maxWidth / width;
        $("#preview").css("width", maxWidth);
        $("#preview").css("height", height);
        };
    };
    oReader.readAsDataURL(oFile);
  }


// $(document).ready(function(){
//   var $container = $('.main_container');
//   $container.imagesLoaded( function(){
//     $container.masonry({
//     isAnimated: true,
//     itemSelector : '.pin',
//     isAnimated: true,
//     isFitWidth: true
//     });
//   });

  function call_masonary(){
    var $container = $('.main_container');
    $container.imagesLoaded( function(){
      $container.masonry({
      isAnimated: true,
      itemSelector : '.pin',
      isAnimated: true,
      isFitWidth: true
      });
    });
  }

$(document).on('page:load', function() {
  call_masonary()
});

$(document).ready(function(){
 call_masonary();

   $('#resetPassword').click(function () {
    $('#login_form').slideUp();
    $('#reset_password').slideDown();
  });

  $('#backToLogin').click(function () {
    $('#reset_password').slideUp();
    $('#login_form').slideDown();
  });

 $('#signUp').click(function () {
    $('#signup_form').slideDown();
    $('#social_signup').slideUp();
  });

  $('#socailSignup').click(function () {
    $('#social_signup').slideDown();
    $('#signup_form').slideUp();
  });


    $('.comment_tr').click(function () {
        $(this).toggleClass('disabled');
        $(this).parent().parent().parent().find('form.comment').slideToggle(400, function () {
            $('.main_container').masonry();
        });
    });

    $( ".inputfile" ).change(function(e) {
        fileName = e.target.value.split( '\\' ).pop();
        if( fileName )
          $('#file_label>span').text(fileName);
        else
          $('#file_label>span').text("Choose an image..");
      });
});
