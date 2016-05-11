  function fileSelecter(){
    var oFile = $('#file')[0].files[0];
    $('.error').hide();

    var rFilter = /^(image\/jpeg|image\/png)$/i;
    if (! rFilter.test(oFile.type)) {
        $('.error').html('Please select jpg or png').show();
        $("#disp").slideUp(500);
        return;
    }
    // if (oFile.size > 1024 * 1024) {
    //     $('.error').html('File size too large').show();
    //     $("#disp").slideUp(500);
    //     return;
    // }
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

  function call_masonary(){
    var $container = $('.main_container').css({ opacity: 0 });
    $container.imagesLoaded(function(){
      $container.animate({ opacity: 1 });
      $container.masonry({
      isAnimated: true,
      itemSelector : '.pin',
      isAnimated: true,
      isFitWidth: true
      });
    });
  }

$(document).ready(function(){
 call_masonary();
 all_other();
});

$(document).on('page:load', function() {
  call_masonary();
  all_other();
});


function all_other(){
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
      $(this).parent().parent().parent().parent().find('form.comment').slideToggle(400, function () {
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
}



$(function() {
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on('scroll', function() {
      var more_posts_url;
      more_posts_url = $('.pagination a[rel=next]').attr('href');
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('.pagination').html("");
        $.ajax({
          url: more_posts_url,
          success: function(data) {
              var $newElems = $( data ).css({ opacity: 0 });;
              $newElems.imagesLoaded(function(){
                 $newElems.animate({ opacity: 1 });
                $(".main_container").append( $newElems ).masonry('appended', $newElems, true );
              });
          }
        });
      }
      if (!more_posts_url) {
        $('.pagination').html("");
      }
    });
  }
});
