<?php

/* default/session/resume_session.tpl */
class __TwigTemplate_b9be857bbc19364e94be098bed02f3ceb29a741fb1c6ce549708ec8551c53f04 extends Twig_Template
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
        return $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/layout/layout_1_col.tpl"), "default/session/resume_session.tpl", 1);
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
        echo (isset($context["session_header"]) ? $context["session_header"] : null);
        echo "
";
        // line 6
        echo (isset($context["title"]) ? $context["title"] : null);
        echo "

<table id=\"session-properties\" class=\"data_table\">
    <tr>
        <td>";
        // line 10
        echo get_lang("CreatedBy");
        echo "</td>
        <td>";
        // line 11
        echo $this->getAttribute((isset($context["session_admin"]) ? $context["session_admin"] : null), "complete_name", array());
        echo "</td>
    </tr>
    <tr>
        <td>";
        // line 14
        echo get_lang("GeneralCoach");
        echo " :</td>
        <td>";
        // line 15
        echo $this->getAttribute((isset($context["general_coach"]) ? $context["general_coach"] : null), "complete_name", array());
        echo "</td>
    </tr>
    ";
        // line 17
        if ((isset($context["session_category"]) ? $context["session_category"] : null)) {
            // line 18
            echo "    <tr>
        <td>";
            // line 19
            echo get_lang("SessionCategory");
            echo " </td>
        <td>";
            // line 20
            echo (isset($context["session_category"]) ? $context["session_category"] : null);
            echo "</td>
    </tr>
    ";
        }
        // line 23
        echo "
    ";
        // line 24
        if (($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "duration", array()) > 0)) {
            // line 25
            echo "    <tr>
        <td>";
            // line 26
            echo get_lang("Duration");
            echo " </td>
        <td>
            ";
            // line 28
            echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "duration", array());
            echo " ";
            echo get_lang("Days");
            echo "
        </td>
    </tr>
    ";
        } else {
            // line 32
            echo "    <tr>
        <td>";
            // line 33
            echo get_lang("DisplayDates");
            echo " </td>
        <td>";
            // line 34
            echo $this->getAttribute((isset($context["session_dates"]) ? $context["session_dates"] : null), "display", array());
            echo "</td>
    </tr>
    <tr>
        <td>";
            // line 37
            echo get_lang("AccessDates");
            echo " </td>
        <td>";
            // line 38
            echo $this->getAttribute((isset($context["session_dates"]) ? $context["session_dates"] : null), "access", array());
            echo "</td>
    </tr>
    <tr>
        <td>";
            // line 41
            echo get_lang("CoachDates");
            echo " </td>
        <td>";
            // line 42
            echo $this->getAttribute((isset($context["session_dates"]) ? $context["session_dates"] : null), "coach", array());
            echo "</td>
    </tr>
    ";
        }
        // line 45
        echo "
    <tr>
        <td>";
        // line 47
        echo get_lang("Description");
        echo " </td>
        <td>
            ";
        // line 49
        echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "description", array());
        echo "
        </td>
    </tr>
    <tr>
        <td>";
        // line 53
        echo get_lang("ShowDescription");
        echo " </td>
        <td>
            ";
        // line 55
        if (($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_description", array()) == 1)) {
            // line 56
            echo "                ";
            echo get_lang("Yes");
            echo "
            ";
        } else {
            // line 58
            echo "                ";
            echo get_lang("No");
            echo "
            ";
        }
        // line 60
        echo "        </td>
    </tr>
    <tr>
        <td>";
        // line 63
        echo get_lang("SessionVisibility");
        echo " </td>
        <td>
            ";
        // line 65
        echo (isset($context["session_visibility"]) ? $context["session_visibility"] : null);
        echo "
        </td>
    </tr>
    ";
        // line 68
        if ((isset($context["url_list"]) ? $context["url_list"] : null)) {
            // line 69
            echo "        <tr>
            <td>URL</td>
        <td>
        ";
            // line 72
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["url_list"]) ? $context["url_list"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["url"]) {
                // line 73
                echo "            ";
                echo $this->getAttribute($context["url"], "url", array());
                echo "
        ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['url'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 75
            echo "        </td>
        </tr>
    ";
        }
        // line 78
        echo "
    ";
        // line 79
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["extra_fields"]) ? $context["extra_fields"] : null));
        foreach ($context['_seq'] as $context["_key"] => $context["extra_field"]) {
            // line 80
            echo "        <tr>
            <td>";
            // line 81
            echo $this->getAttribute($context["extra_field"], "text", array());
            echo "</td>
            <td>";
            // line 82
            echo $this->getAttribute($context["extra_field"], "value", array());
            echo "</td>
        </tr>
    ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['extra_field'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 85
        echo "</table>

";
        // line 87
        echo (isset($context["course_list"]) ? $context["course_list"] : null);
        echo "
";
        // line 88
        echo (isset($context["user_list"]) ? $context["user_list"] : null);
        echo "

";
        // line 90
        echo (isset($context["requirements"]) ? $context["requirements"] : null);
        echo "
";
        // line 91
        echo (isset($context["dependencies"]) ? $context["dependencies"] : null);
        echo "
";
    }

    public function getTemplateName()
    {
        return "default/session/resume_session.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  249 => 91,  245 => 90,  240 => 88,  236 => 87,  232 => 85,  223 => 82,  219 => 81,  216 => 80,  212 => 79,  209 => 78,  204 => 75,  195 => 73,  191 => 72,  186 => 69,  184 => 68,  178 => 65,  173 => 63,  168 => 60,  162 => 58,  156 => 56,  154 => 55,  149 => 53,  142 => 49,  137 => 47,  133 => 45,  127 => 42,  123 => 41,  117 => 38,  113 => 37,  107 => 34,  103 => 33,  100 => 32,  91 => 28,  86 => 26,  83 => 25,  81 => 24,  78 => 23,  72 => 20,  68 => 19,  65 => 18,  63 => 17,  58 => 15,  54 => 14,  48 => 11,  44 => 10,  37 => 6,  33 => 5,  30 => 4,  27 => 3,  18 => 1,);
    }
}
/* {% extends template ~ "/layout/layout_1_col.tpl" %}*/
/* */
/* {% block content %}*/
/* */
/* {{ session_header }}*/
/* {{ title }}*/
/* */
/* <table id="session-properties" class="data_table">*/
/*     <tr>*/
/*         <td>{{ 'CreatedBy'|get_lang }}</td>*/
/*         <td>{{ session_admin.complete_name }}</td>*/
/*     </tr>*/
/*     <tr>*/
/*         <td>{{ 'GeneralCoach' | get_lang}} :</td>*/
/*         <td>{{ general_coach.complete_name }}</td>*/
/*     </tr>*/
/*     {% if session_category  %}*/
/*     <tr>*/
/*         <td>{{ 'SessionCategory' | get_lang}} </td>*/
/*         <td>{{ session_category }}</td>*/
/*     </tr>*/
/*     {% endif %}*/
/* */
/*     {% if session.duration > 0 %}*/
/*     <tr>*/
/*         <td>{{ 'Duration' | get_lang}} </td>*/
/*         <td>*/
/*             {{ session.duration }} {{ 'Days' | get_lang }}*/
/*         </td>*/
/*     </tr>*/
/*     {% else %}*/
/*     <tr>*/
/*         <td>{{ 'DisplayDates' | get_lang}} </td>*/
/*         <td>{{ session_dates.display }}</td>*/
/*     </tr>*/
/*     <tr>*/
/*         <td>{{ 'AccessDates' | get_lang}} </td>*/
/*         <td>{{ session_dates.access }}</td>*/
/*     </tr>*/
/*     <tr>*/
/*         <td>{{ 'CoachDates' | get_lang}} </td>*/
/*         <td>{{ session_dates.coach }}</td>*/
/*     </tr>*/
/*     {% endif %}*/
/* */
/*     <tr>*/
/*         <td>{{ 'Description' | get_lang}} </td>*/
/*         <td>*/
/*             {{ session.description }}*/
/*         </td>*/
/*     </tr>*/
/*     <tr>*/
/*         <td>{{ 'ShowDescription' | get_lang}} </td>*/
/*         <td>*/
/*             {% if session.show_description == 1 %}*/
/*                 {{ 'Yes' | get_lang}}*/
/*             {% else %}*/
/*                 {{ 'No' | get_lang}}*/
/*             {% endif %}*/
/*         </td>*/
/*     </tr>*/
/*     <tr>*/
/*         <td>{{ 'SessionVisibility' | get_lang}} </td>*/
/*         <td>*/
/*             {{ session_visibility }}*/
/*         </td>*/
/*     </tr>*/
/*     {% if url_list %}*/
/*         <tr>*/
/*             <td>URL</td>*/
/*         <td>*/
/*         {% for url in url_list %}*/
/*             {{ url.url }}*/
/*         {% endfor %}*/
/*         </td>*/
/*         </tr>*/
/*     {% endif %}*/
/* */
/*     {% for extra_field in extra_fields %}*/
/*         <tr>*/
/*             <td>{{ extra_field.text }}</td>*/
/*             <td>{{ extra_field.value }}</td>*/
/*         </tr>*/
/*     {% endfor %}*/
/* </table>*/
/* */
/* {{ course_list }}*/
/* {{ user_list }}*/
/* */
/* {{ requirements }}*/
/* {{ dependencies }}*/
/* {% endblock %}*/
/* */
