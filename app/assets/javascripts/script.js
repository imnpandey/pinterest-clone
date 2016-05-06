  function fileSelecter(){
    var oFile = $('#image_file')[0].files[0];
    $('.error').hide();

    var rFilter = /^(image\/jpeg|image\/png)$/i;
    if (! rFilter.test(oFile.type)) {
        $('.error').html('Please select jpg or png').show();
        return;
    }
    if (oFile.size > 1024 * 1024) {
        $('.error').html('File size too large').show();
        return;
    }
    $("#disp").slideDown(500);
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

$(function(){
  var $container = $('.main_container');
  $container.imagesLoaded( function(){
    $container.masonry({
    isAnimated: true,
    itemSelector : '.pin',
    isAnimated: true,
    isFitWidth: true
    });
  });
});