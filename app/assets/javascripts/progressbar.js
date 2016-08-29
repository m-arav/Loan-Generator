var ProgressBar = {
  start: function(progress_url) {
    $.ajax({
      url: progress_url,
      dataType: 'json',
      success: function(data) {
        percent = data.percent+"%"
        $('.progress-bar').text(data.message);
        $('.progress-bar').css('width', percent);
        if (data.percent == 100)
          window.location.href = $('.show').attr('href');
      }
    });
  }
};
