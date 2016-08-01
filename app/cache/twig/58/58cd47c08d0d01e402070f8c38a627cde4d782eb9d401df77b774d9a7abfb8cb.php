<?php

/* default/mail/header.tpl */
class __TwigTemplate_dd1261c7c8f9ea3bedf5e540f846ab9396841c2135695142be18eb2c11e5cb01 extends Twig_Template
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
        echo "<table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\">
    <tr>
        <td width=\"245\">
            <a href=\"";
        // line 4
        echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web", array());
        echo "\">
                <img src=\"";
        // line 5
        echo ($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_css_theme", array()) . "images/header-logo.png");
        echo "\" alt=\"";
        echo $this->getAttribute((isset($context["_s"]) ? $context["_s"] : null), "site_name", array());
        echo "\">
            </a>
        </td>
        <td width=\"100%\">
            &nbsp;
        </td>
    </tr>
</table>
";
    }

    public function getTemplateName()
    {
        return "default/mail/header.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  28 => 5,  24 => 4,  19 => 1,);
    }
}
/* <table border="0" cellpadding="10" cellspacing="0" width="100%">*/
/*     <tr>*/
/*         <td width="245">*/
/*             <a href="{{ _p.web }}">*/
/*                 <img src="{{ _p.web_css_theme ~ 'images/header-logo.png' }}" alt="{{ _s.site_name }}">*/
/*             </a>*/
/*         </td>*/
/*         <td width="100%">*/
/*             &nbsp;*/
/*         </td>*/
/*     </tr>*/
/* </table>*/
/* */
