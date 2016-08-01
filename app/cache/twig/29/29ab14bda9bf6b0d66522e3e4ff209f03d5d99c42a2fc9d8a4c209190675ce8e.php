<?php

/* bbb/listing.tpl */
class __TwigTemplate_b512009a3003a488fe43232b56675fbec0375bb083b5c4b826e9fe5c068b24c6 extends Twig_Template
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
        echo "<div class =\"row\">

";
        // line 3
        if (((isset($context["bbb_status"]) ? $context["bbb_status"] : null) == true)) {
            // line 4
            echo "  ";
            if (((isset($context["show_join_button"]) ? $context["show_join_button"] : null) == true)) {
                // line 5
                echo "    <div class =\"span12\" style=\"text-align:center\">
        <a href=\"";
                // line 6
                echo (isset($context["conference_url"]) ? $context["conference_url"] : null);
                echo "\" target=\"_blank\" class=\"btn btn-primary btn-large\">
            ";
                // line 7
                echo get_lang("EnterConference");
                echo "
        </a>
        <span id=\"users_online\" class=\"label label-warning\">";
                // line 9
                echo sprintf(get_lang("XUsersOnLine"), (isset($context["users_online"]) ? $context["users_online"] : null));
                echo " </span>
    </div>
  ";
            }
            // line 12
            echo "
    <div class =\"span12\">
        <div class=\"page-header\">
            <h2>";
            // line 15
            echo get_lang("RecordList");
            echo "</h2>
        </div>

        <table class=\"table\">
            <tr>
                <!-- th>#</th -->
                <th>";
            // line 21
            echo get_lang("CreatedAt");
            echo "</th>
                <th>";
            // line 22
            echo get_lang("Status");
            echo "</th>
                <th>";
            // line 23
            echo get_lang("Records");
            echo "</th>

                ";
            // line 25
            if ((isset($context["allow_to_edit"]) ? $context["allow_to_edit"] : null)) {
                // line 26
                echo "                    <th>";
                echo get_lang("Actions");
                echo "</th>
                ";
            }
            // line 28
            echo "
            </tr>
            ";
            // line 30
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["meetings"]) ? $context["meetings"] : null));
            foreach ($context['_seq'] as $context["_key"] => $context["meeting"]) {
                // line 31
                echo "            <tr>
                <!-- td>";
                // line 32
                echo $this->getAttribute($context["meeting"], "id", array());
                echo "</td -->
                ";
                // line 33
                if (($this->getAttribute($context["meeting"], "visibility", array()) == 0)) {
                    // line 34
                    echo "                    <td class=\"muted\">";
                    echo $this->getAttribute($context["meeting"], "created_at", array());
                    echo "</td>
                ";
                } else {
                    // line 36
                    echo "                    <td>";
                    echo $this->getAttribute($context["meeting"], "created_at", array());
                    echo "</td>
                ";
                }
                // line 38
                echo "                <td>
                    ";
                // line 39
                if (($this->getAttribute($context["meeting"], "status", array()) == 1)) {
                    // line 40
                    echo "                        <span class=\"label label-success\">";
                    echo get_lang("MeetingOpened");
                    echo "</span>
                    ";
                } else {
                    // line 42
                    echo "                        <span class=\"label label-info\">";
                    echo get_lang("MeetingClosed");
                    echo "</span>
                    ";
                }
                // line 44
                echo "                </td>
                <td>
                    ";
                // line 46
                if (($this->getAttribute($context["meeting"], "record", array()) == 1)) {
                    // line 47
                    echo "                        ";
                    // line 48
                    echo "                        ";
                    echo $this->getAttribute($context["meeting"], "show_links", array());
                    echo "
                    ";
                }
                // line 50
                echo "                </td>

                ";
                // line 52
                if ((isset($context["allow_to_edit"]) ? $context["allow_to_edit"] : null)) {
                    // line 53
                    echo "                    <td>
                    ";
                    // line 54
                    if (($this->getAttribute($context["meeting"], "status", array()) == 1)) {
                        // line 55
                        echo "                        <a class=\"btn btn-default\" href=\"";
                        echo $this->getAttribute($context["meeting"], "end_url", array());
                        echo " \"> ";
                        echo get_lang("CloseMeeting");
                        echo "</a>
                    ";
                    } else {
                        // line 57
                        echo "                        ";
                        echo $this->getAttribute($context["meeting"], "action_links", array());
                        echo "
                    ";
                    }
                    // line 59
                    echo "                    </td>
                ";
                }
                // line 61
                echo "
            </tr>
            ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['meeting'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 64
            echo "        </table>
    </div>
";
        } else {
            // line 67
            echo "    <div class =\"span12\" style=\"text-align:center\">
        ";
            // line 68
            echo Display::return_message_and_translate("ServerIsNotRunning", "warning");
            echo "
    </div>
";
        }
        // line 71
        echo "</div>
";
    }

    public function getTemplateName()
    {
        return "bbb/listing.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  192 => 71,  186 => 68,  183 => 67,  178 => 64,  170 => 61,  166 => 59,  160 => 57,  152 => 55,  150 => 54,  147 => 53,  145 => 52,  141 => 50,  135 => 48,  133 => 47,  131 => 46,  127 => 44,  121 => 42,  115 => 40,  113 => 39,  110 => 38,  104 => 36,  98 => 34,  96 => 33,  92 => 32,  89 => 31,  85 => 30,  81 => 28,  75 => 26,  73 => 25,  68 => 23,  64 => 22,  60 => 21,  51 => 15,  46 => 12,  40 => 9,  35 => 7,  31 => 6,  28 => 5,  25 => 4,  23 => 3,  19 => 1,);
    }
}
/* <div class ="row">*/
/* */
/* {% if bbb_status == true %}*/
/*   {% if show_join_button == true %}*/
/*     <div class ="span12" style="text-align:center">*/
/*         <a href="{{ conference_url }}" target="_blank" class="btn btn-primary btn-large">*/
/*             {{ 'EnterConference'|get_lang }}*/
/*         </a>*/
/*         <span id="users_online" class="label label-warning">{{ 'XUsersOnLine'| get_lang | format(users_online) }} </span>*/
/*     </div>*/
/*   {% endif %}*/
/* */
/*     <div class ="span12">*/
/*         <div class="page-header">*/
/*             <h2>{{ 'RecordList'|get_lang }}</h2>*/
/*         </div>*/
/* */
/*         <table class="table">*/
/*             <tr>*/
/*                 <!-- th>#</th -->*/
/*                 <th>{{ 'CreatedAt'|get_lang }}</th>*/
/*                 <th>{{ 'Status'|get_lang }}</th>*/
/*                 <th>{{ 'Records'|get_lang }}</th>*/
/* */
/*                 {% if allow_to_edit  %}*/
/*                     <th>{{ 'Actions'|get_lang }}</th>*/
/*                 {% endif %}*/
/* */
/*             </tr>*/
/*             {% for meeting in meetings %}*/
/*             <tr>*/
/*                 <!-- td>{{ meeting.id }}</td -->*/
/*                 {% if meeting.visibility == 0 %}*/
/*                     <td class="muted">{{ meeting.created_at }}</td>*/
/*                 {% else %}*/
/*                     <td>{{ meeting.created_at }}</td>*/
/*                 {% endif %}*/
/*                 <td>*/
/*                     {% if meeting.status == 1 %}*/
/*                         <span class="label label-success">{{ 'MeetingOpened'|get_lang }}</span>*/
/*                     {% else %}*/
/*                         <span class="label label-info">{{ 'MeetingClosed'|get_lang }}</span>*/
/*                     {% endif %}*/
/*                 </td>*/
/*                 <td>*/
/*                     {% if meeting.record == 1 %}*/
/*                         {# Record list #}*/
/*                         {{ meeting.show_links }}*/
/*                     {% endif %}*/
/*                 </td>*/
/* */
/*                 {% if allow_to_edit %}*/
/*                     <td>*/
/*                     {% if meeting.status == 1 %}*/
/*                         <a class="btn btn-default" href="{{ meeting.end_url }} "> {{ 'CloseMeeting'|get_lang }}</a>*/
/*                     {% else %}*/
/*                         {{ meeting.action_links }}*/
/*                     {% endif %}*/
/*                     </td>*/
/*                 {% endif %}*/
/* */
/*             </tr>*/
/*             {% endfor %}*/
/*         </table>*/
/*     </div>*/
/* {% else %}*/
/*     <div class ="span12" style="text-align:center">*/
/*         {{ 'ServerIsNotRunning' | return_message('warning') }}*/
/*     </div>*/
/* {% endif %}*/
/* </div>*/
/* */
