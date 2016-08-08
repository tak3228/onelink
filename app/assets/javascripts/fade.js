$('head').append(
'<style type="text/css">#fade {display:none;}'
);
$(window).load(function() {
$('#fade').delay(600).fadeIn("slow");
});
