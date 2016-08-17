<?php

/* default/work/comments.tpl */
class __TwigTemplate_8c0e6149522876b7c09fcb98b8f53df03cf95d6f21cd85fefde6040e595d8b59 extends Twig_Template
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
        // line 2
        echo "
<hr>
<h3>
    ";
        // line 5
        echo get_lang("Comments");
        echo "
</h3>
<hr>
<ul>
    ";
        // line 9
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["comments"]) ? $context["comments"] : null));
        foreach ($context['_seq'] as $context["_key"] => $context["comment"]) {
            // line 10
            echo "        <li>
            <div class=\"page-header\">
                <a href=\"";
            // line 12
            echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_code", array());
            echo "\">
                    <img height=\"24\" src=\"";
            // line 13
            echo $this->getAttribute($context["comment"], "picture", array());
            echo "\"/> ";
            echo $this->getAttribute($context["comment"], "username", array());
            echo "
                </a>- ";
            // line 14
            echo api_get_local_time($this->getAttribute($context["comment"], "sent_at", array()));
            echo "
            </div>
            <p>
                ";
            // line 17
            if ( !twig_test_empty($this->getAttribute($context["comment"], "comment", array()))) {
                // line 18
                echo "                    ";
                echo $this->getAttribute($context["comment"], "comment", array());
                echo "
                ";
            } else {
                // line 20
                echo "                    ";
                echo get_lang("HereIsYourFeedback");
                echo "
                ";
            }
            // line 22
            echo "            </p>
            ";
            // line 23
            if ( !twig_test_empty($this->getAttribute($context["comment"], "file_url", array()))) {
                // line 24
                echo "                <p>
                    <a href=\"";
                // line 25
                echo $this->getAttribute($context["comment"], "file_url", array());
                echo "\">
                        <img src=\"";
                // line 26
                echo Template::get_icon_path("attachment.gif", 32);
                echo "\" width=\"32\" height=\"32\">
                        ";
                // line 27
                echo $this->getAttribute($context["comment"], "file_name_to_show", array());
                echo "
                    </a>
                    ";
                // line 29
                if ((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null)) {
                    // line 30
                    echo "                        <a href=\"";
                    echo $this->getAttribute($context["comment"], "delete_file_url", array());
                    echo "\">
                            <img src=\"";
                    // line 31
                    echo Template::get_icon_path("delete.png", 22);
                    echo "\" width=\"22\" height=\"22\">
                        </a>
                    ";
                }
                // line 34
                echo "                </p>
            ";
            }
            // line 36
            echo "        </li>
    ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['comment'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 38
        echo "</ul>
<br />
<hr>
";
        // line 41
        echo (isset($context["form"]) ? $context["form"] : null);
        echo "

";
    }

    public function getTemplateName()
    {
        return "default/work/comments.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  119 => 41,  114 => 38,  107 => 36,  103 => 34,  97 => 31,  92 => 30,  90 => 29,  85 => 27,  81 => 26,  77 => 25,  74 => 24,  72 => 23,  69 => 22,  63 => 20,  57 => 18,  55 => 17,  49 => 14,  43 => 13,  39 => 12,  35 => 10,  31 => 9,  24 => 5,  19 => 2,);
    }
}
/* {# "UpdatedBy"|get_lang|format(comment.username) #}*/
/* */
/* <hr>*/
/* <h3>*/
/*     {{ 'Comments' | get_lang }}*/
/* </h3>*/
/* <hr>*/
/* <ul>*/
/*     {% for comment in comments %}*/
/*         <li>*/
/*             <div class="page-header">*/
/*                 <a href="{{ _p.web_code }}">*/
/*                     <img height="24" src="{{ comment.picture }}"/> {{ comment.username }}*/
/*                 </a>- {{ comment.sent_at | api_get_local_time }}*/
/*             </div>*/
/*             <p>*/
/*                 {% if comment.comment is not empty %}*/
/*                     {{ comment.comment }}*/
/*                 {% else %}*/
/*                     {{ 'HereIsYourFeedback' | get_lang }}*/
/*                 {% endif %}*/
/*             </p>*/
/*             {% if comment.file_url is not empty %}*/
/*                 <p>*/
/*                     <a href="{{ comment.file_url }}">*/
/*                         <img src="{{ "attachment.gif"|icon(32) }}" width="32" height="32">*/
/*                         {{ comment.file_name_to_show }}*/
/*                     </a>*/
/*                     {% if is_allowed_to_edit %}*/
/*                         <a href="{{ comment.delete_file_url }}">*/
/*                             <img src="{{ "delete.png"|icon(22) }}" width="22" height="22">*/
/*                         </a>*/
/*                     {% endif %}*/
/*                 </p>*/
/*             {% endif %}*/
/*         </li>*/
/*     {% endfor %}*/
/* </ul>*/
/* <br />*/
/* <hr>*/
/* {{ form }}*/
/* */
/* */
