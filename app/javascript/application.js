//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap'

$('#box1').change(function() {
    $('#div1').toggle(this.checked);
});

$('#box2').change(function() {
    $('#div2').toggle(this.checked);
});


/*$("input[name='bug[type]']").change(function() {
    var obj = $("select[name='bug[status]']")[0][3]
    if(this.value=='bug'){
      obj.text  = "resolved"
    }
    else{
      obj.text = "completed"
}})
*/
