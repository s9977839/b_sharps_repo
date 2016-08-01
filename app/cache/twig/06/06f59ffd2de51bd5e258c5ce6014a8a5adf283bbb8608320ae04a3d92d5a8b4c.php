<?php

/* default/mail/subject_registration_platform.tpl */
class __TwigTemplate_1bf357e935006ecbd488f113bff42dfd715bef1fcabb5bd9ec9f2ac777aaa747 extends Twig_Template
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
        echo ((((("[" . $this->getAttribute((isset($context["_s"]) ? $context["_s"] : null), "site_name", array())) . "] ") . get_lang("YourReg")) . " ") . $this->getAttribute((isset($context["_s"]) ? $context["_s"] : null), "site_name", array()));
        echo "
";
    }

    public function getTemplateName()
    {
        return "default/mail/subject_registration_platform.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  19 => 1,);
    }
}
/* {{ '[' ~ _s.site_name ~ '] ' ~ 'YourReg'|get_lang ~ ' ' ~ _s.site_name }}*/
/* */
