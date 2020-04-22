{%- extends 'full.tpl' -%}

{% block output_group %}
<div class="output_hidden">
{{ super() }}
</div>
{% endblock output_group %}

{% block input_group -%}
<div class="input_hidden">
{{ super() }}
</div>
{% endblock input_group %}

{%- block input -%}
<div class="in_container">
<div class="in_hidden">
{{ super() }}
<div class="gradient">
</div>
</div>
</div>
{%- endblock input -%}


{%- block header -%}
{{ super() }}

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<style type="text/css">
div.output_wrapper {
  margin-top: 0px;
}
.output_hidden {
  display: block;
  margin-top: 5px;
}
.in_hidden {
   width: 100%;
   overflow: hidden;
   position: relative;
}

.in_container {
    width: 100%;
    margin-left: 20px;
    margin-right: 20px;
}

.gradient {
    width:100%;
    height:3px;  
    background:#eeeeee;
    position:absolute;
    bottom:0px;
    left:0;
    display: none;
    opacity: 0.4;
    border-bottom: 2px dashed #000;
}
div.input_prompt {
    color: #178CE3;
    font-weight: bold;
}
div.output_prompt {
    color: rgba(249, 33, 33, 1);
    font-weight: bold;
}
</style>

<script>
$(document).ready(function(){
  $(".output_hidden").click(function(){
      $(this).prev('.input_hidden').slideToggle();
  });
  $(".input_hidden").click(function(){
      $(this).next('.output_hidden').slideToggle();
  });
var slideHeight = 25;
$(".in_container").each(function () {
    var $this = $(this);
    var $in_hidden = $this.children(".in_hidden");
    var defHeight = $in_hidden.height();
    if (defHeight >= 61) {
        var $prompt = $this.prev(".input_prompt");
        var $gradient = $in_hidden.children(".gradient");
        $in_hidden.css("height", slideHeight + "px");
        $gradient.css("display", "block");
        $prompt.click(function () {
            var curHeight = $in_hidden.height();
            if (curHeight == slideHeight) {
                $in_hidden.animate({
                    height: defHeight
                }, "normal");
                $gradient.fadeOut();
            } 
            else {
                $in_hidden.animate({
                    height: slideHeight
                }, "normal");
                $gradient.fadeIn();
            }
            return false;
        });
    }
});
});

</script>
{%- endblock header -%}