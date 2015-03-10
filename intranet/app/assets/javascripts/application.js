// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


$(document).ready(function(){

	var worker = $(".js-worker"),
		update = $(".js-update");

	update.on("change", function(){
		initialize();
	});

	function initialize(){
		var teachers = null,
			self = $(this),
			value = $(this).val();
		try{
			self.find("option").each(function(a){
				if($(this).val() == value)
					teachers = $(this).attr("data-values");
			});
			teachers = JSON.parse(teachers);
		}
		catch(e){}

		if(teachers){
			worker.html(teachers.map(function(a){
				return "<option>"+a+"</option>"
			}).join(""));
		}
	}
	initialize.apply(update, []);

});
