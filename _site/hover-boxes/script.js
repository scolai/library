$(document).ready(function() {
  var $projectsList = $('.container-tours');
  var $projects = $projectsList.find('.tour-card');
  var $projectsTags = $('.filter-tours');
  var tagsObj = {};
  var fadeSpeed = 500;
  
  $projects.each(function() {
    var project = this;
    var $project = $(this);
    var $tagsList = $project.find('.tags');
    var tags = $project.data('tags').split(',');
    tags.forEach(function(tag) {
		var tourCard = '<tour-card class="tag">' + tag + '</tour-card>';
		$tagsList.append($(tourCard));
      if (!tagsObj.hasOwnProperty(tag))
        tagsObj[tag] = [];
      tagsObj[tag].push(project);
    });
  });
  
  //console.log(tagsObj);
  $.each(tagsObj, function(tag) {
    var $button = $('<button>' + tag + '</button>');
    $button.on('click',function() {
      if ($projects.is(':animated'))
        return false;
      $(this).addClass('active').siblings().removeClass('active');
      $projects.filter(':visible').fadeOut(fadeSpeed, function() {
        $projects.filter(tagsObj[tag]).fadeIn(fadeSpeed);
      });
    }).appendTo($projectsTags);
  });
  
  $('#all').on('click',function() {
    $(this).addClass('active').siblings().removeClass('active');
    $projects.filter(':visible').fadeOut(fadeSpeed, function() {
      $projects.fadeIn(fadeSpeed);
    });
  });
});
