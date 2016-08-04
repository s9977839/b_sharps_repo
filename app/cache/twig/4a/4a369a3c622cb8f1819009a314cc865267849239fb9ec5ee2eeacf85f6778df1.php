<?php

/* default/social/friends.tpl */
class __TwigTemplate_a69ff2f528e7c940057390c7bfaa439bfda4831c615b42d4d2ee795f456da9d1 extends Twig_Template
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
        return $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"), "default/social/friends.tpl", 1);
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
    <div id=\"wallMessages\" class=\"col-md-9\" style=\"min-height:1px\">
        <div class=\"row\">
            <div class=\"col-md-12\">
                <div id=\"message_ajax_reponse\" class=\"\"></div>
            </div>
        </div>
        <div class=\"row\">
            ";
        // line 18
        echo (isset($context["social_right_content"]) ? $context["social_right_content"] : null);
        echo "
        </div>
        <div id=\"display_response_id\" class=\"span5\"></div>
        ";
        // line 21
        echo (isset($context["social_auto_extend_link"]) ? $context["social_auto_extend_link"] : null);
        echo "
    </div>
    <div class=\"col-md-4\">
        <div class=\"row\">
            ";
        // line 25
        echo (isset($context["social_right_information"]) ? $context["social_right_information"] : null);
        echo "
        </div>
    </div>
</div>
";
    }

    public function getTemplateName()
    {
        return "default/social/friends.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  65 => 25,  58 => 21,  52 => 18,  39 => 8,  35 => 7,  30 => 4,  27 => 3,  18 => 1,);
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
/*     <div id="wallMessages" class="col-md-9" style="min-height:1px">*/
/*         <div class="row">*/
/*             <div class="col-md-12">*/
/*                 <div id="message_ajax_reponse" class=""></div>*/
/*             </div>*/
/*         </div>*/
/*         <div class="row">*/
/*             {{ social_right_content}}*/
/*         </div>*/
/*         <div id="display_response_id" class="span5"></div>*/
/*         {{ social_auto_extend_link }}*/
/*     </div>*/
/*     <div class="col-md-4">*/
/*         <div class="row">*/
/*             {{ social_right_information }}*/
/*         </div>*/
/*     </div>*/
/* </div>*/
/* {% endblock %}*/
/* */
