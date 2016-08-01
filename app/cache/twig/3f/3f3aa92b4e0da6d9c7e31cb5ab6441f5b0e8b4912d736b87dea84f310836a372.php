<?php

/* default/auth/lost_password.tpl */
class __TwigTemplate_d2b45c5ee05a3319d9095241d5def46370f8570abcbf8ac215a66343088aa9fe extends Twig_Template
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
        // line 1
        return $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"), "default/auth/lost_password.tpl", 1);
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->getParent($context)->display($context, array_merge($this->blocks, $blocks));
    }

    // line 3
    public function block_content($context, array $blocks = array())
    {
        // line 4
        echo "
";
        // line 5
        echo (isset($context["form"]) ? $context["form"] : null);
        echo "

";
    }

    public function getTemplateName()
    {
        return "default/auth/lost_password.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  33 => 5,  30 => 4,  27 => 3,  18 => 1,);
    }
}
/* {% extends template ~ "/layout/layout_1_col.tpl" %}*/
/* */
/* {% block content %}*/
/* */
/* {{ form }}*/
/* */
/* {% endblock %}*/
/* */
