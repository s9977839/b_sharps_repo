<?php

/* default/javascript/editor/ckeditor/templates.tpl */
class __TwigTemplate_a53ed682d6a710a05be84aedeaf84f743b48bb2aa7e336ee451cd7d194295714 extends Twig_Template
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
        echo "CKEDITOR.addTemplates(\"default\",
{
    imagesPath: ' ',
    templates:
        ";
        // line 5
        echo (isset($context["templates"]) ? $context["templates"] : null);
        echo "
});";
    }

    public function getTemplateName()
    {
        return "default/javascript/editor/ckeditor/templates.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  25 => 5,  19 => 1,);
    }
}
/* CKEDITOR.addTemplates("default",*/
/* {*/
/*     imagesPath: ' ',*/
/*     templates:*/
/*         {{ templates }}*/
/* });*/
