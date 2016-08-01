<?php

/* default/gradebook/my_certificates.tpl */
class __TwigTemplate_b3a2ca193376b08f92a2a7c0b5763b9d94cf7fe555797b7fa2bc39761da36436 extends Twig_Template
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
        if ( !twig_test_empty((isset($context["course_list"]) ? $context["course_list"] : null))) {
            // line 2
            echo "    <h1 class=\"page-header\">";
            echo get_lang("Courses");
            echo "</h1>

    <div class=\"table-responsive\">
        <table class=\"table table-hover table-striped\">
            <thead>
                <tr>
                    <th>";
            // line 8
            echo get_lang("Course");
            echo "</th>
                    <th class=\"text-right\">";
            // line 9
            echo get_lang("Score");
            echo "</th>
                    <th class=\"text-center\">";
            // line 10
            echo get_lang("Date");
            echo "</th>
                    <th class=\"text-right\">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                ";
            // line 15
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["course_list"]) ? $context["course_list"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["row"]) {
                // line 16
                echo "                    <tr>
                        <td>";
                // line 17
                echo $this->getAttribute($context["row"], "course", array());
                echo "</td>
                        <td class=\"text-right\">";
                // line 18
                echo $this->getAttribute($context["row"], "score", array());
                echo "</td>
                        <td class=\"text-center\">";
                // line 19
                echo $this->getAttribute($context["row"], "date", array());
                echo "</td>
                        <td class=\"text-right\">
                            <a href=\"";
                // line 21
                echo $this->getAttribute($context["row"], "link", array());
                echo "\" target=\"_blank\" class=\"btn btn-default\">
                                <em class=\"fa fa-external-link\"></em> ";
                // line 22
                echo get_lang("Certificate");
                echo "
                            </a>
                        </td>
                    </tr>
                ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['row'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 27
            echo "            </tbody>
        </table>
    </div>
";
        }
        // line 31
        echo "
";
        // line 32
        if ( !twig_test_empty((isset($context["session_list"]) ? $context["session_list"] : null))) {
            // line 33
            echo "    <h1 class=\"page-header\">";
            echo get_lang("Sessions");
            echo "</h1>

    <div class=\"table-responsive\">
        <table class=\"table table-hover table-striped\">
            <thead>
                <tr>
                    <th>";
            // line 39
            echo get_lang("Session");
            echo "</th>
                    <th>";
            // line 40
            echo get_lang("Course");
            echo "</th>
                    <th class=\"text-right\">";
            // line 41
            echo get_lang("Score");
            echo "</th>
                    <th class=\"text-center\">";
            // line 42
            echo get_lang("Date");
            echo "</th>
                    <th class=\"text-right\">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                ";
            // line 47
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["session_list"]) ? $context["session_list"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["row"]) {
                // line 48
                echo "                    <tr>
                        <td>";
                // line 49
                echo $this->getAttribute($context["row"], "session", array());
                echo "</td>
                        <td>";
                // line 50
                echo $this->getAttribute($context["row"], "course", array());
                echo "</td>
                        <td class=\"text-right\">";
                // line 51
                echo $this->getAttribute($context["row"], "score", array());
                echo "</td>
                        <td class=\"text-center\">";
                // line 52
                echo $this->getAttribute($context["row"], "date", array());
                echo "</td>
                        <td class=\"text-right\">
                            <a href=\"";
                // line 54
                echo $this->getAttribute($context["row"], "link", array());
                echo "\" target=\"_blank\" class=\"btn btn-default\">
                                <em class=\"fa fa-external-link\"></em> ";
                // line 55
                echo get_lang("Certificate");
                echo "
                            </a>
                        </td>
                    </tr>
                ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['row'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 60
            echo "            </tbody>
        </table>
    </div>
";
        }
    }

    public function getTemplateName()
    {
        return "default/gradebook/my_certificates.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  162 => 60,  151 => 55,  147 => 54,  142 => 52,  138 => 51,  134 => 50,  130 => 49,  127 => 48,  123 => 47,  115 => 42,  111 => 41,  107 => 40,  103 => 39,  93 => 33,  91 => 32,  88 => 31,  82 => 27,  71 => 22,  67 => 21,  62 => 19,  58 => 18,  54 => 17,  51 => 16,  47 => 15,  39 => 10,  35 => 9,  31 => 8,  21 => 2,  19 => 1,);
    }
}
/* {% if course_list is not empty %}*/
/*     <h1 class="page-header">{{ "Courses"|get_lang }}</h1>*/
/* */
/*     <div class="table-responsive">*/
/*         <table class="table table-hover table-striped">*/
/*             <thead>*/
/*                 <tr>*/
/*                     <th>{{ "Course"|get_lang }}</th>*/
/*                     <th class="text-right">{{ "Score"|get_lang }}</th>*/
/*                     <th class="text-center">{{ "Date"|get_lang }}</th>*/
/*                     <th class="text-right">&nbsp;</th>*/
/*                 </tr>*/
/*             </thead>*/
/*             <tbody>*/
/*                 {% for row in course_list %}*/
/*                     <tr>*/
/*                         <td>{{ row.course }}</td>*/
/*                         <td class="text-right">{{ row.score }}</td>*/
/*                         <td class="text-center">{{ row.date }}</td>*/
/*                         <td class="text-right">*/
/*                             <a href="{{ row.link }}" target="_blank" class="btn btn-default">*/
/*                                 <em class="fa fa-external-link"></em> {{ 'Certificate'|get_lang }}*/
/*                             </a>*/
/*                         </td>*/
/*                     </tr>*/
/*                 {% endfor %}*/
/*             </tbody>*/
/*         </table>*/
/*     </div>*/
/* {% endif %}*/
/* */
/* {% if session_list is not empty %}*/
/*     <h1 class="page-header">{{ "Sessions"|get_lang }}</h1>*/
/* */
/*     <div class="table-responsive">*/
/*         <table class="table table-hover table-striped">*/
/*             <thead>*/
/*                 <tr>*/
/*                     <th>{{ "Session"|get_lang }}</th>*/
/*                     <th>{{ "Course"|get_lang }}</th>*/
/*                     <th class="text-right">{{ "Score"|get_lang }}</th>*/
/*                     <th class="text-center">{{ "Date"|get_lang }}</th>*/
/*                     <th class="text-right">&nbsp;</th>*/
/*                 </tr>*/
/*             </thead>*/
/*             <tbody>*/
/*                 {% for row in session_list %}*/
/*                     <tr>*/
/*                         <td>{{ row.session }}</td>*/
/*                         <td>{{ row.course }}</td>*/
/*                         <td class="text-right">{{ row.score }}</td>*/
/*                         <td class="text-center">{{ row.date }}</td>*/
/*                         <td class="text-right">*/
/*                             <a href="{{ row.link }}" target="_blank" class="btn btn-default">*/
/*                                 <em class="fa fa-external-link"></em> {{ 'Certificate'|get_lang }}*/
/*                             </a>*/
/*                         </td>*/
/*                     </tr>*/
/*                 {% endfor %}*/
/*             </tbody>*/
/*         </table>*/
/*     </div>*/
/* {% endif %}*/
/* */
