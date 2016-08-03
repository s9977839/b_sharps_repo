<?php

/* default/javascript/editor/elfinder_standalone.tpl */
class __TwigTemplate_099a8f17a8c1ebf743d2647c49febba1f20a02fbc5d5178c491f4c37bd4aaccc extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        $context["finderFolder"] = ($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web", array()) . "vendor/barryvdh/elfinder-builds/");
        // line 2
        echo "<!-- elFinder CSS (REQUIRED) -->
<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"";
        // line 3
        echo (isset($context["finderFolder"]) ? $context["finderFolder"] : null);
        echo "css/elfinder.full.css\">
<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"";
        // line 4
        echo (isset($context["finderFolder"]) ? $context["finderFolder"] : null);
        echo "css/theme.css\">

<!-- elFinder JS (REQUIRED) -->
<script type=\"text/javascript\" src=\"";
        // line 7
        echo (isset($context["finderFolder"]) ? $context["finderFolder"] : null);
        echo "js/elfinder.full.js\"></script>

<!-- elFinder translation (OPTIONAL) -->
<script type=\"text/javascript\" src=\"";
        // line 10
        echo (isset($context["finderFolder"]) ? $context["finderFolder"] : null);
        echo "js/i18n/elfinder.ru.js\"></script>

<script type=\"text/javascript\" charset=\"utf-8\">
    // Helper function to get parameters from the query string.
    function getUrlParam(paramName) {
        var reParam = new RegExp('(?:[\\?&]|&amp;)' + paramName + '=([^&]+)', 'i');
        var match = window.location.search.match(reParam);
        return (match && match.length > 1) ? match[1] : '';
    }

    \$().ready(function() {
        var funcNum = getUrlParam('CKEditorFuncNum');
        var elf = \$('#elfinder').elfinder({
            url : '";
        // line 23
        echo ($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_lib", array()) . "elfinder/connectorAction.php");
        echo "',  // connector URL (REQUIRED)
            getFileCallback : function(file) {
                window.opener.CKEDITOR.tools.callFunction(funcNum, file.url);
                window.close();
            },
            resizable: false
        }).elfinder('instance');
    });
</script>
<div id=\"elfinder\"></div>



";
    }

    public function getTemplateName()
    {
        return "default/javascript/editor/elfinder_standalone.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  56 => 23,  40 => 10,  34 => 7,  28 => 4,  24 => 3,  21 => 2,  19 => 1,);
    }
}
/* {% set finderFolder = _p.web ~ 'vendor/barryvdh/elfinder-builds/' %}*/
/* <!-- elFinder CSS (REQUIRED) -->*/
/* <link rel="stylesheet" type="text/css" media="screen" href="{{ finderFolder }}css/elfinder.full.css">*/
/* <link rel="stylesheet" type="text/css" media="screen" href="{{ finderFolder }}css/theme.css">*/
/* */
/* <!-- elFinder JS (REQUIRED) -->*/
/* <script type="text/javascript" src="{{ finderFolder }}js/elfinder.full.js"></script>*/
/* */
/* <!-- elFinder translation (OPTIONAL) -->*/
/* <script type="text/javascript" src="{{ finderFolder }}js/i18n/elfinder.ru.js"></script>*/
/* */
/* <script type="text/javascript" charset="utf-8">*/
/*     // Helper function to get parameters from the query string.*/
/*     function getUrlParam(paramName) {*/
/*         var reParam = new RegExp('(?:[\?&]|&amp;)' + paramName + '=([^&]+)', 'i');*/
/*         var match = window.location.search.match(reParam);*/
/*         return (match && match.length > 1) ? match[1] : '';*/
/*     }*/
/* */
/*     $().ready(function() {*/
/*         var funcNum = getUrlParam('CKEditorFuncNum');*/
/*         var elf = $('#elfinder').elfinder({*/
/*             url : '{{ _p.web_lib ~ 'elfinder/connectorAction.php' }}',  // connector URL (REQUIRED)*/
/*             getFileCallback : function(file) {*/
/*                 window.opener.CKEDITOR.tools.callFunction(funcNum, file.url);*/
/*                 window.close();*/
/*             },*/
/*             resizable: false*/
/*         }).elfinder('instance');*/
/*     });*/
/* </script>*/
/* <div id="elfinder"></div>*/
/* */
/* */
/* */
/* */
