<?php

/* default/agenda/event_list.tpl */
class __TwigTemplate_978a46bf734e5416060d97794344c962a8005442cbf116b36e297e2cf6573909 extends Twig_Template
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
        echo "<table class=\"data_table\">
    <tr>
        <th>
            ";
        // line 4
        echo get_lang("StartDate");
        echo "
        </th>
        <th>
            ";
        // line 7
        echo get_lang("EndDate");
        echo "
        </th>
        <th>
            ";
        // line 10
        echo get_lang("Title");
        echo "
        </th>
        ";
        // line 12
        if ((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null)) {
            // line 13
            echo "            <th>
                ";
            // line 14
            echo get_lang("Actions");
            echo "
            </th>
        ";
        }
        // line 17
        echo "    </tr>
    ";
        // line 18
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["agenda_events"]) ? $context["agenda_events"] : null));
        foreach ($context['_seq'] as $context["_key"] => $context["event"]) {
            // line 19
            echo "        <tr>
            <td style=\"width:20%\">
                ";
            // line 21
            echo $this->getAttribute($context["event"], "start_date_localtime", array());
            echo "
            </td>
            <td style=\"width:20%\">
                ";
            // line 24
            if ($this->getAttribute($context["event"], "allDay", array())) {
                // line 25
                echo "                    ";
                echo get_lang("AllDay");
                echo "
                ";
            } else {
                // line 27
                echo "                    ";
                echo $this->getAttribute($context["event"], "end_date_localtime", array());
                echo "
                ";
            }
            // line 29
            echo "            </td>
            <td style=\"width:50%\">
                ";
            // line 31
            echo $this->getAttribute($context["event"], "title", array());
            echo "

                ";
            // line 33
            if ($this->getAttribute($context["event"], "description", array())) {
                // line 34
                echo "                    <p>";
                echo $this->getAttribute($context["event"], "description", array());
                echo "</p>
                ";
            }
            // line 36
            echo "
                ";
            // line 37
            if ($this->getAttribute($context["event"], "comment", array())) {
                // line 38
                echo "                    <p>";
                echo $this->getAttribute($context["event"], "comment", array());
                echo "</p>
                ";
            }
            // line 40
            echo "
                ";
            // line 41
            echo $this->getAttribute($context["event"], "attachment", array());
            echo "
            </td>

            ";
            // line 44
            if ((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null)) {
                // line 45
                echo "                <td>
                    ";
                // line 46
                if (($this->getAttribute($context["event"], "visibility", array()) == 1)) {
                    // line 47
                    echo "                        <a class=\"btn btn-default\" href=\"";
                    if ((isset($context["url"]) ? $context["url"] : null)) {
                        echo (isset($context["url"]) ? $context["url"] : null);
                    } else {
                        echo $this->getAttribute($context["event"], "url", array());
                    }
                    echo "&action=change_visibility&visibility=0&id=";
                    echo $this->getAttribute($context["event"], "real_id", array());
                    echo "\">
                            <img title=\"";
                    // line 48
                    echo "Invisible";
                    echo "\" src=\"";
                    echo Template::get_icon_path("visible.png", 32);
                    echo " \" width=\"32\" height=\"32\">
                        </a>
                    ";
                } else {
                    // line 51
                    echo "                        ";
                    if ((($this->getAttribute($context["event"], "type", array()) == "course") || ($this->getAttribute($context["event"], "type", array()) == "session"))) {
                        // line 52
                        echo "                            <a class=\"btn btn-default\" href=\"";
                        if ((isset($context["url"]) ? $context["url"] : null)) {
                            echo (isset($context["url"]) ? $context["url"] : null);
                        } else {
                            echo $this->getAttribute($context["event"], "url", array());
                        }
                        echo "&action=change_visibility&visibility=1&id=";
                        echo $this->getAttribute($context["event"], "real_id", array());
                        echo "\">
                                <img title=\"";
                        // line 53
                        echo "Visible";
                        echo "\" src=\"";
                        echo Template::get_icon_path("invisible.png", 32);
                        echo " \" width=\"32\" height=\"32\">
                            </a>
                        ";
                    }
                    // line 56
                    echo "                    ";
                }
                // line 57
                echo "                </td>
            ";
            }
            // line 59
            echo "
        </tr>
    ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['event'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 62
        echo "</table>
";
    }

    public function getTemplateName()
    {
        return "default/agenda/event_list.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  183 => 62,  175 => 59,  171 => 57,  168 => 56,  160 => 53,  149 => 52,  146 => 51,  138 => 48,  127 => 47,  125 => 46,  122 => 45,  120 => 44,  114 => 41,  111 => 40,  105 => 38,  103 => 37,  100 => 36,  94 => 34,  92 => 33,  87 => 31,  83 => 29,  77 => 27,  71 => 25,  69 => 24,  63 => 21,  59 => 19,  55 => 18,  52 => 17,  46 => 14,  43 => 13,  41 => 12,  36 => 10,  30 => 7,  24 => 4,  19 => 1,);
    }
}
/* <table class="data_table">*/
/*     <tr>*/
/*         <th>*/
/*             {{ 'StartDate'| get_lang }}*/
/*         </th>*/
/*         <th>*/
/*             {{ 'EndDate'| get_lang }}*/
/*         </th>*/
/*         <th>*/
/*             {{ 'Title' | get_lang }}*/
/*         </th>*/
/*         {% if is_allowed_to_edit %}*/
/*             <th>*/
/*                 {{ 'Actions' | get_lang }}*/
/*             </th>*/
/*         {% endif %}*/
/*     </tr>*/
/*     {% for event in agenda_events %}*/
/*         <tr>*/
/*             <td style="width:20%">*/
/*                 {{ event.start_date_localtime }}*/
/*             </td>*/
/*             <td style="width:20%">*/
/*                 {% if event.allDay %}*/
/*                     {{ 'AllDay' | get_lang }}*/
/*                 {% else %}*/
/*                     {{ event.end_date_localtime }}*/
/*                 {% endif %}*/
/*             </td>*/
/*             <td style="width:50%">*/
/*                 {{ event.title }}*/
/* */
/*                 {% if event.description %}*/
/*                     <p>{{ event.description}}</p>*/
/*                 {% endif %}*/
/* */
/*                 {% if event.comment %}*/
/*                     <p>{{ event.comment}}</p>*/
/*                 {% endif %}*/
/* */
/*                 {{ event.attachment }}*/
/*             </td>*/
/* */
/*             {% if is_allowed_to_edit %}*/
/*                 <td>*/
/*                     {% if event.visibility == 1 %}*/
/*                         <a class="btn btn-default" href="{% if url %}{{ url }}{% else %}{{ event.url }}{% endif %}&action=change_visibility&visibility=0&id={{ event.real_id }}">*/
/*                             <img title="{{ 'Invisible' }}" src="{{'visible.png'|icon(32)}} " width="32" height="32">*/
/*                         </a>*/
/*                     {% else %}*/
/*                         {% if event.type == 'course' or event.type == 'session' %}*/
/*                             <a class="btn btn-default" href="{% if url %}{{ url }}{% else %}{{ event.url }}{% endif %}&action=change_visibility&visibility=1&id={{ event.real_id }}">*/
/*                                 <img title="{{ 'Visible' }}" src="{{'invisible.png'|icon(32)}} " width="32" height="32">*/
/*                             </a>*/
/*                         {% endif %}*/
/*                     {% endif %}*/
/*                 </td>*/
/*             {% endif %}*/
/* */
/*         </tr>*/
/*     {% endfor %}*/
/* </table>*/
/* */
