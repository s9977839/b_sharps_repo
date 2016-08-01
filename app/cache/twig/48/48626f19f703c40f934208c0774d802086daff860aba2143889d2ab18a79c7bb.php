<?php

/* openmeetings/listing.tpl */
class __TwigTemplate_df6ba87e5919508ea8f0c031262a7a25891faaf06240d8fb21a6e6172a013eca extends Twig_Template
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
        if (((isset($context["openmeetings_status"]) ? $context["openmeetings_status"] : null) == true)) {
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
        <!--span id=\"users_online\" class=\"label label-warning\">";
                // line 9
                echo sprintf(get_lang("XUsersOnLine"), (isset($context["users_online"]) ? $context["users_online"] : null));
                echo " </span-->
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
                <th>#</th>
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
                <td>";
                // line 32
                echo $this->getAttribute($context["meeting"], "id", array());
                echo "</td>
                <td>";
                // line 33
                echo $this->getAttribute($context["meeting"], "created_at", array());
                echo "</td>
                <td>
                    ";
                // line 35
                if (($this->getAttribute($context["meeting"], "status", array()) == 1)) {
                    // line 36
                    echo "                        <span class=\"label label-success\">";
                    echo get_lang("MeetingOpened");
                    echo "</span>
                    ";
                } else {
                    // line 38
                    echo "                        <span class=\"label label-info\">";
                    echo get_lang("MeetingClosed");
                    echo "</span>
                    ";
                }
                // line 40
                echo "                </td>
                <td>
                    ";
                // line 42
                if (($this->getAttribute($context["meeting"], "record", array()) == 1)) {
                    // line 43
                    echo "                        ";
                    // line 44
                    echo "                        ";
                    echo $this->getAttribute($context["meeting"], "show_links", array());
                    echo "
                    ";
                }
                // line 46
                echo "                </td>

                ";
                // line 48
                if ((isset($context["allow_to_edit"]) ? $context["allow_to_edit"] : null)) {
                    // line 49
                    echo "                    <td>
                    ";
                    // line 50
                    if (($this->getAttribute($context["meeting"], "status", array()) == 1)) {
                        // line 51
                        echo "                        <a class=\"btn btn-default\" href=\"";
                        echo $this->getAttribute($context["meeting"], "end_url", array());
                        echo " \"> ";
                        echo get_lang("CloseMeeting");
                        echo "</a>
                    ";
                    }
                    // line 53
                    echo "                    <a class=\"btn btn-danger\" href=\"";
                    echo $this->getAttribute($context["meeting"], "delete_url", array());
                    echo " \"> ";
                    echo get_lang("DeleteMeeting");
                    echo "</a>
                    </td>
                ";
                }
                // line 56
                echo "
            </tr>
            ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['meeting'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 59
            echo "        </table>
    </div>
";
        } else {
            // line 62
            echo "    <div class =\"span12\" style=\"text-align:center\">
        ";
            // line 63
            echo Display::return_message_and_translate("ServerIsNotRunning", "warning");
            echo "
    </div>
";
        }
        // line 66
        echo "</div>
";
    }

    public function getTemplateName()
    {
        return "openmeetings/listing.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  179 => 66,  173 => 63,  170 => 62,  165 => 59,  157 => 56,  148 => 53,  140 => 51,  138 => 50,  135 => 49,  133 => 48,  129 => 46,  123 => 44,  121 => 43,  119 => 42,  115 => 40,  109 => 38,  103 => 36,  101 => 35,  96 => 33,  92 => 32,  89 => 31,  85 => 30,  81 => 28,  75 => 26,  73 => 25,  68 => 23,  64 => 22,  60 => 21,  51 => 15,  46 => 12,  40 => 9,  35 => 7,  31 => 6,  28 => 5,  25 => 4,  23 => 3,  19 => 1,);
    }
}
/* <div class ="row">*/
/* */
/* {% if openmeetings_status == true %}*/
/*   {% if show_join_button == true %}*/
/*     <div class ="span12" style="text-align:center">*/
/*         <a href="{{ conference_url }}" target="_blank" class="btn btn-primary btn-large">*/
/*             {{ 'EnterConference'|get_lang }}*/
/*         </a>*/
/*         <!--span id="users_online" class="label label-warning">{{ 'XUsersOnLine'| get_lang | format(users_online) }} </span-->*/
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
/*                 <th>#</th>*/
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
/*                 <td>{{ meeting.id }}</td>*/
/*                 <td>{{ meeting.created_at }}</td>*/
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
/*                         <a class="btn btn-default" href="{{ meeting.end_url }} "> {{ 'CloseMeeting' | get_lang }}</a>*/
/*                     {% endif %}*/
/*                     <a class="btn btn-danger" href="{{ meeting.delete_url }} "> {{ 'DeleteMeeting' | get_lang }}</a>*/
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
