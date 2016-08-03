<?php

/* default/auth/inscription.tpl */
class __TwigTemplate_44cf93f73bde60c05a91e7c506425f120acb524efd5d1c215dec06bb850a7d06 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->blocks = array(
            'content' => array($this, 'block_content'),
        );
    }

    protected function doGetParent(array $context)
    {
        // line 4
        return $this->loadTemplate((((        // line 2
(isset($context["hide_header"]) ? $context["hide_header"] : null) == true)) ? ((        // line 3
(isset($context["template"]) ? $context["template"] : null) . "/layout/blank.tpl")) : ((        // line 4
(isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"))), "default/auth/inscription.tpl", 4);
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->getParent($context)->display($context, array_merge($this->blocks, $blocks));
    }

    // line 7
    public function block_content($context, array $blocks = array())
    {
        // line 8
        echo "
";
        // line 9
        echo (isset($context["inscription_header"]) ? $context["inscription_header"] : null);
        echo "
";
        // line 10
        echo (isset($context["inscription_content"]) ? $context["inscription_content"] : null);
        echo "
";
        // line 11
        echo (isset($context["form"]) ? $context["form"] : null);
        echo "
";
        // line 12
        echo (isset($context["text_after_registration"]) ? $context["text_after_registration"] : null);
        echo "

";
    }

    public function getTemplateName()
    {
        return "default/auth/inscription.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  48 => 12,  44 => 11,  40 => 10,  36 => 9,  33 => 8,  30 => 7,  21 => 4,  20 => 3,  19 => 2,  18 => 4,);
    }
}
/* {%*/
/*     extends hide_header == true*/
/*     ? template ~ "/layout/blank.tpl"*/
/*     : template ~ "/layout/layout_1_col.tpl"*/
/* %}*/
/* */
/* {% block content %}*/
/* */
/* {{ inscription_header }}*/
/* {{ inscription_content }}*/
/* {{ form }}*/
/* {{ text_after_registration }}*/
/* */
/* {% endblock %}*/
/* */
