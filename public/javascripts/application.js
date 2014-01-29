// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function updateCountdown() {
    // 140 is the max message length
    var remaining = 140 - jQuery('.content').val().length; 
    jQuery('.countdown').text(remaining + ' characters remaining.');
} 

jQuery(document).ready(function($) { 
    updateCountdown(); 
    $('.content').change(updateCountdown); 
    $('.content').keyup(updateCountdown); 
}); 