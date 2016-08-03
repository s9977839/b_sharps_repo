<?php

/* default/social/myfiles.tpl */
class __TwigTemplate_80668d0e276f19128d49a0750a8cf8db20c00470bf03cfe8d4ed4e15d244170b extends Twig_Template
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
        return $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"), "default/social/myfiles.tpl", 1);
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
        <div id=\"display_response_id\" class=\"col-md-12\"></div>
        ";
        // line 21
        echo (isset($context["social_auto_extend_link"]) ? $context["social_auto_extend_link"] : null);
        echo "
    </div>
</div>
";
    }

    public function getTemplateName()
    {
        return "default/social/myfiles.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  58 => 21,  52 => 18,  39 => 8,  35 => 7,  30 => 4,  27 => 3,  18 => 1,);
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
/*             {{ social_right_content }}*/
/*         </div>*/
/*         <div id="display_response_id" class="col-md-12"></div>*/
/*         {{ social_auto_extend_link }}*/
/*     </div>*/
/* </div>*/
/* {% endblock %}*/
/* */
