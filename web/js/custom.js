jQuery(document).ready(function() {
   "use strict";
   
   /* TAGS */
	try {
		jQuery('.tags').tagsInput({width:'auto'});
	}
	catch(e) { }
	
	/* WYSIWYG */
	try {
		jQuery('.wysiwyg').wysihtml5({
			"font-styles": true,
			"emphasis": true,
			"lists": true,
			"html": true,
			"link": true,
			"image": true,
			"color": true
		});
	}
	catch(e){}
	
	/* DATEPICKER */
	try {
		jQuery('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
	}
	catch(e){}
	
	/* FANCYBOX */
	try {
		jQuery("a[data-rel^='prettyPhoto']").prettyPhoto();
	}
	catch(e){}
	
	/* DATATABLE */
	try {
		jQuery('#basicTable, .datatable').DataTable({
			responsive: true
		});
	}
	catch(e){}
	
	try {
		jQuery('select').select2();
	}
	catch(e){}
   
   // Tooltip
   try {
	   jQuery('.tooltips').tooltip({ container: 'body'});
   }
   catch(e){}
   
   // Popover
   try {
	   jQuery('.popovers').popover();
   }
   catch(e){}
   
   // Show panel buttons when hovering panel heading
   try {
	   jQuery('.panel-heading').hover(function() {
		  jQuery(this).find('.panel-btns').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.panel-btns').fadeOut('fast');
	   });
   }
   catch(e){}
   
   // Close Panel
   try {
	   jQuery('.panel .panel-close').click(function() {
		  jQuery(this).closest('.panel').fadeOut(200);
		  return false;
	   });
   }
   catch(e){}
   
   // Minimize Panel
   try {
	   jQuery('.panel .panel-minimize').click(function(){
		  var t = jQuery(this);
		  var p = t.closest('.panel');
		  if(!jQuery(this).hasClass('maximize')) {
			 p.find('.panel-body, .panel-footer').slideUp(200);
			 t.addClass('maximize');
			 t.find('i').removeClass('fa-minus').addClass('fa-plus');
			 jQuery(this).attr('data-original-title','Maximize Panel').tooltip();
		  } else {
			 p.find('.panel-body, .panel-footer').slideDown(200);
			 t.removeClass('maximize');
			 t.find('i').removeClass('fa-plus').addClass('fa-minus');
			 jQuery(this).attr('data-original-title','Minimize Panel').tooltip();
		  }
		  return false;
	   });
   }
   catch(e){}
   
   try {
	   jQuery('.leftpanel .nav .parent > a').click(function() {
		  var coll = jQuery(this).parents('.collapsed').length;
		  if (!coll) {
			 jQuery('.leftpanel .nav .parent-focus').each(function() {
				jQuery(this).find('.children').slideUp('fast');
				jQuery(this).removeClass('parent-focus');
			 });
			 var child = jQuery(this).parent().find('.children');
			 if(!child.is(':visible')) {
				child.slideDown('fast');
				if(!child.parent().hasClass('active'))
				   child.parent().addClass('parent-focus');
			 } else {
				child.slideUp('fast');
				child.parent().removeClass('parent-focus');
			 }
		  }
		  return false;
	   });
   }
   catch(e){}
   
   
   // Menu Toggle
   try {
	   jQuery('.menu-collapse').click(function() {
		  if (!$('body').hasClass('hidden-left')) {
			 if ($('.headerwrapper').hasClass('collapsed')) {
				$('.headerwrapper, .mainwrapper').removeClass('collapsed');
			 } else {
				$('.headerwrapper, .mainwrapper').addClass('collapsed');
				$('.children').hide(); // hide sub-menu if leave open
			 }
		  } else {
			 if (!$('body').hasClass('show-left')) {
				$('body').addClass('show-left');
			 } else {
				$('body').removeClass('show-left');
			 }
		  }
		  return false;
	   });
   }
   catch(e){}
   
   // Add class nav-hover to mene. Useful for viewing sub-menu
   try {
	   jQuery('.leftpanel .nav li').hover(function(){
		  $(this).addClass('nav-hover');
	   }, function(){
		  $(this).removeClass('nav-hover');
	   });
   }
   catch(e){}
   
   // For Media Queries
   jQuery(window).resize(function() {
	   try {
	      hideMenu();
	   }
	   catch(e){}
   });
   
   hideMenu(); // for loading/refreshing the page
   function hideMenu() {
	   try {
		  if($('.header-right').css('position') == 'relative') {
			 $('body').addClass('hidden-left');
			 $('.headerwrapper, .mainwrapper').removeClass('collapsed');
		  } else {
			 $('body').removeClass('hidden-left');
		  }
		  
		  // Seach form move to left
		  if ($(window).width() <= 360) {
			 if ($('.leftpanel .form-search').length == 0) {
				$('.form-search').insertAfter($('.profile-left'));
			 }
		  } else {
			 if ($('.header-right .form-search').length == 0) {
				$('.form-search').insertBefore($('.btn-group-notification'));
			 }
		  }
	   }
	   catch(e){}
   }
   
   collapsedMenu(); // for loading/refreshing the page
   function collapsedMenu() {
	   try {
		  if($('.logo').css('position') == 'relative') {
			 $('.headerwrapper, .mainwrapper').addClass('collapsed');
		  } else {
			 $('.headerwrapper, .mainwrapper').removeClass('collapsed');
		  }
	   }
	   catch(e){}
   }

});