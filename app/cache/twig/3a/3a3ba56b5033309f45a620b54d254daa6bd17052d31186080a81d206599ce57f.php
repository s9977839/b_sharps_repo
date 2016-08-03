<?php

/* default/social/invitations.tpl */
class __TwigTemplate_42d4c2a23c03e21e4228ad9dcbd554e40295c120ee6f368a36274bf7375367af extends Twig_Template
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
        return $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"), "default/social/invitations.tpl", 1);
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->getParent($context)->display($context, array_merge($this->blocks, $blocks));
    }

    // line 3
    public function block_content($context, array $blocks = array())
    {
        // line 4
        echo "<div class=\"row\">
    <div class=\"col-md-3\">
        <div class=\"social-network-menu\">
            ";
        // line 7
        echo (isset($context["social_avatar_block"]) ? $context["social_avatar_block"] : null);
        echo "
            ";
        // line 8
        echo (isset($context["social_menu_block"]) ? $context["social_menu_block"] : null);
        echo "
        </div>
    </div>
    <div class=\"col-md-9\">
        ";
        // line 12
        echo (isset($context["social_invitations_block"]) ? $context["social_invitations_block"] : null);
        echo "
    </div>
</div>
";
    }

    public function getTemplateName()
    {
        return "default/social/invitations.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  46 => 12,  39 => 8,  35 => 7,  30 => 4,  27 => 3,  18 => 1,);
    }
}
/* {% extends template ~ "/layout/layout_1_col.tpl" %}*/
/* */
/* {% block content %}*/
/* <div class="row">*/
/*     <div class="col-md-3">*/
/*         <div class="social-network-menu">*/
/*             {{ social_avatar_block }}*/
/*             {{ social_menu_block }}*/
/*         </div>*/
/*     </div>*/
/*     <div class="col-md-9">*/
/*         {{ social_invitations_block }}*/
/*     </div>*/
/* </div>*/
/* {% endblock %}*/
