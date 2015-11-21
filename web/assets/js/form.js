jQuery(document).ready(function() {
	
	// Tags Input
	jQuery('#tags').tagsInput({width:'auto'});
	 
	// Textarea Autogrow
	jQuery('#autoResizeTA').autogrow();
		
	// Spinner
	var spinner = jQuery('#spinner').spinner();
	spinner.spinner('value', 0);

	// Form Toggles
	jQuery('.toggle').toggles({on: true});

	// Time Picker
	jQuery('#timepicker').timepicker({defaultTIme: false});
	jQuery('#timepicker2').timepicker({showMeridian: false});
	jQuery('#timepicker3').timepicker({minuteStep: 15});

	// Date Picker
	jQuery('#datepicker, .datepicker').datepicker();
	jQuery('#datepicker-inline').datepicker();
	jQuery('#datepicker-multiple').datepicker({
	    numberOfMonths: 3,
	    showButtonPanel: true
	});

	// Input Masks
	jQuery("#date").mask("99/99/9999");
	jQuery("#phone").mask("(999) 999-9999");
	jQuery("#ssn").mask("999-99-9999");
	
	// Select2
	jQuery("#select-basic, #select-multi").select2();
	jQuery('#select-search-hide').select2({
	    minimumResultsForSearch: -1
	});
	
	function format(item) {
	    return '<i class="fa ' + ((item.element[0].getAttribute('rel') === undefined)?"":item.element[0].getAttribute('rel') ) + ' mr10"></i>' + item.text;
	}
		
	// This will empty first option in select to enable placeholder
	jQuery('select option:first-child').text('');
		
	jQuery("select").select2({
		formatResult: format,
	    formatSelection: format,
	    escapeMarkup: function(m) { return m; }
	});	
});