<?php

/* add_facebook_login_button/template.tpl */
class __TwigTemplate_e18226d06843ff7bda81e149ed741f25c2a1c0d8b2cdf61f78f79075725fd0a8 extends Twig_Template
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
        if ($this->getAttribute((isset($context["add_facebook_login_button"]) ? $context["add_facebook_login_button"] : null), "show_message", array())) {
            // line 2
            echo "<a href=\"";
            echo $this->getAttribute((isset($context["add_facebook_login_button"]) ? $context["add_facebook_login_button"] : null), "facebook_href_link", array());
            echo "\">
    <img src=\"";
            // line 3
            echo $this->getAttribute((isset($context["add_facebook_login_button"]) ? $context["add_facebook_login_button"] : null), "facebook_button_url", array());
            echo "\" style=\"margin-left:15px; border-radius:0\"/>
</a>
";
        }
    }

    public function getTemplateName()
    {
        return "add_facebook_login_button/template.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  26 => 3,  21 => 2,  19 => 1,);
    }
}
/* {% if add_facebook_login_button.show_message %}*/
/* <a href="{{add_facebook_login_button.facebook_href_link}}">*/
/*     <img src="{{add_facebook_login_button.facebook_button_url}}" style="margin-left:15px; border-radius:0"/>*/
/* </a>*/
/* {% endif %}*/
/* */
