<?php

/* default/social/search.tpl */
class __TwigTemplate_6b0e1db26150b75f61fa6954c71c675186b522f1007da7ac1439e70a964af7de extends Twig_Template
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
        return $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"), "default/social/search.tpl", 1);
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
        
            <div class=\"form-search-sm\">
                ";
        // line 14
        echo (isset($context["search_form"]) ? $context["search_form"] : null);
        echo "
            </div>
            <div class=\"list-search-sm\">
                ";
        // line 17
        echo (isset($context["social_search"]) ? $context["social_search"] : null);
        echo "
            </div>
        
    </div>
</div>

";
        // line 23
        if (array_key_exists("form_modals", $context)) {
            // line 24
            echo "    ";
            echo (isset($context["form_modals"]) ? $context["form_modals"] : null);
            echo "
";
        }
    }

    public function getTemplateName()
    {
        return "default/social/search.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  65 => 24,  63 => 23,  54 => 17,  48 => 14,  39 => 8,  35 => 7,  30 => 4,  27 => 3,  18 => 1,);
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
/*         */
/*             <div class="form-search-sm">*/
/*                 {{ search_form }}*/
/*             </div>*/
/*             <div class="list-search-sm">*/
/*                 {{ social_search }}*/
/*             </div>*/
/*         */
/*     </div>*/
/* </div>*/
/* */
/* {% if form_modals is defined %}*/
/*     {{ form_modals }}*/
/* {% endif %}*/
/* {% endblock %}*/
/* */
