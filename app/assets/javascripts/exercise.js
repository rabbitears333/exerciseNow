$(document).ready(function() {
    $('#exercise_workout_date').datepicker({dateFormat: 'yy-mm-dd'});
    
    var regex = /\/users\/\d+\/exercises$/i;
    
    if($(location).attr('pathname').match(regex)){
        drawchart();
    }
});