<?php

/* default/learnpath/list.tpl */
class __TwigTemplate_b94a2ee7fb12f9faf50a554b809f17e63b905f66ff3a970168cdcf7da38fc3db extends Twig_Template
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
        echo "<script>
    function confirmation(name) {
        if (confirm(\"";
        // line 3
        echo get_lang("AreYouSureToDeleteJS");
        echo " \\\"\" + name + \"\\\" ?\")) {
            return true;
        } else {
            return false;
        }
    }
</script>

";
        // line 11
        echo (isset($context["introduction_section"]) ? $context["introduction_section"] : null);
        echo "

";
        // line 13
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["data"]) ? $context["data"] : null));
        $context['loop'] = array(
          'parent' => $context['_parent'],
          'index0' => 0,
          'index'  => 1,
          'first'  => true,
        );
        if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof Countable)) {
            $length = count($context['_seq']);
            $context['loop']['revindex0'] = $length - 1;
            $context['loop']['revindex'] = $length;
            $context['loop']['length'] = $length;
            $context['loop']['last'] = 1 === $length;
        }
        foreach ($context['_seq'] as $context["_key"] => $context["lp_data"]) {
            // line 14
            echo "    <h3 class=\"page-header\">
        ";
            // line 15
            if ((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null)) {
                // line 16
                echo "            ";
                if ((twig_length_filter($this->env, (isset($context["categories"]) ? $context["categories"] : null)) > 1)) {
                    // line 17
                    echo "                ";
                    echo $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getName", array(), "method");
                    echo "
            ";
                }
                // line 19
                echo "        ";
            } else {
                // line 20
                echo "            ";
                if ((twig_length_filter($this->env, (isset($context["categories"]) ? $context["categories"] : null)) > 1)) {
                    // line 21
                    echo "                ";
                    if (( !twig_test_empty($this->getAttribute($context["lp_data"], "lp_list", array())) && ($this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method") != 0))) {
                        // line 22
                        echo "                    ";
                        echo $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getName", array(), "method");
                        echo "
                ";
                    } elseif (( !twig_test_empty($this->getAttribute(                    // line 23
$context["lp_data"], "lp_list", array())) && ($this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method") == 0))) {
                        // line 24
                        echo "                    ";
                        echo $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getName", array(), "method");
                        echo "
                ";
                    } elseif (( !twig_test_empty($this->getAttribute(                    // line 25
$context["lp_data"], "lp_list", array())) && ($this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method") != 0))) {
                        // line 26
                        echo "                    ";
                        echo $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getName", array(), "method");
                        echo "
                ";
                    }
                    // line 28
                    echo "            ";
                }
                // line 29
                echo "        ";
            }
            // line 30
            echo "
        ";
            // line 31
            if ((($this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method") > 0) && (isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null))) {
                // line 32
                echo "            <a href=\"";
                echo ((("lp_controller.php?" . $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_cid_query", array())) . "&action=add_lp_category&id=") . $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method"));
                echo "\" title=\"";
                echo get_lang("Edit");
                echo "\">
                <img src=\"";
                // line 33
                echo Template::get_icon_path("edit.png");
                echo "\" alt=\"";
                echo get_lang("Edit");
                echo "\">
            </a>

            ";
                // line 36
                if (($this->getAttribute($context["loop"], "index0", array()) == 1)) {
                    // line 37
                    echo "                <a href=\"#\">
                    <img src=\"";
                    // line 38
                    echo Template::get_icon_path("up_na.png");
                    echo "\" alt=\"";
                    echo get_lang("Move");
                    echo "\">
                </a>
            ";
                } else {
                    // line 41
                    echo "                <a href=\"";
                    echo ((("lp_controller.php?" . $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_cid_query", array())) . "&action=move_up_category&id=") . $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method"));
                    echo "\" title=\"";
                    echo get_lang("Move");
                    echo "\">
                    <img src=\"";
                    // line 42
                    echo Template::get_icon_path("up.png");
                    echo "\" alt=\"";
                    echo get_lang("Move");
                    echo "\">
                </a>
            ";
                }
                // line 45
                echo "
            ";
                // line 46
                if (((twig_length_filter($this->env, (isset($context["data"]) ? $context["data"] : null)) - 1) == $this->getAttribute($context["loop"], "index0", array()))) {
                    // line 47
                    echo "                <a href=\"#\">
                    <img src=\"";
                    // line 48
                    echo Template::get_icon_path("down_na.png");
                    echo "\" alt=\"";
                    echo get_lang("Move");
                    echo "\">
                </a>
            ";
                } else {
                    // line 51
                    echo "                <a href=\"";
                    echo ((("lp_controller.php?" . $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_cid_query", array())) . "&action=move_down_category&id=") . $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method"));
                    echo "\" title=\"";
                    echo get_lang("Move");
                    echo "\">
                    <img src=\"";
                    // line 52
                    echo Template::get_icon_path("down.png");
                    echo "\" alt=\"";
                    echo get_lang("Move");
                    echo "\">
                </a>
            ";
                }
                // line 55
                echo "
            <a href=\"";
                // line 56
                echo ((("lp_controller.php?" . $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_cid_query", array())) . "&action=delete_lp_category&id=") . $this->getAttribute($this->getAttribute($context["lp_data"], "category", array()), "getId", array(), "method"));
                echo "\" title=\"";
                echo get_lang("Delete");
                echo "\">
                <img src=\"";
                // line 57
                echo Template::get_icon_path("delete.png");
                echo "\" alt=\"";
                echo get_lang("Delete");
                echo "\">
            </a>
        ";
            }
            // line 60
            echo "    </h3>

    ";
            // line 62
            if ($this->getAttribute($context["lp_data"], "lp_list", array())) {
                // line 63
                echo "        <div class=\"table-responsive\">
            <table class=\"table table-hover table-striped\">
                <thead>
                    <tr>
                        <th>";
                // line 67
                echo get_lang("Title");
                echo "</th>
                        ";
                // line 68
                if ((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null)) {
                    // line 69
                    echo "                            <th>";
                    echo get_lang("PublicationDate");
                    echo "</th>
                            <th>";
                    // line 70
                    echo get_lang("ExpirationDate");
                    echo "</th>
                            <th>";
                    // line 71
                    echo get_lang("Progress");
                    echo "</th>
                            <th>";
                    // line 72
                    echo get_lang("AuthoringOptions");
                    echo "</th>
                        ";
                } else {
                    // line 74
                    echo "                            ";
                    if ( !(isset($context["is_invitee"]) ? $context["is_invitee"] : null)) {
                        // line 75
                        echo "                                <th>";
                        echo get_lang("Progress");
                        echo "</th>
                            ";
                    }
                    // line 77
                    echo "
                            <th>";
                    // line 78
                    echo get_lang("Actions");
                    echo "</th>
                        ";
                }
                // line 80
                echo "                    </tr>
                </thead>
                <tbody>
                    ";
                // line 83
                $context['_parent'] = $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["lp_data"], "lp_list", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["row"]) {
                    // line 84
                    echo "                        <tr>
                            <td>
                                ";
                    // line 86
                    echo $this->getAttribute($context["row"], "learnpath_icon", array());
                    echo "
                                <a href=\"";
                    // line 87
                    echo $this->getAttribute($context["row"], "url_start", array());
                    echo "\">
                                    ";
                    // line 88
                    echo $this->getAttribute($context["row"], "title", array());
                    echo "
                                    ";
                    // line 89
                    echo $this->getAttribute($context["row"], "session_image", array());
                    echo "
                                    ";
                    // line 90
                    echo $this->getAttribute($context["row"], "extra", array());
                    echo "
                                </a>
                            </td>
                            ";
                    // line 93
                    if ((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null)) {
                        // line 94
                        echo "                                <td>
                                    ";
                        // line 95
                        if ($this->getAttribute($context["row"], "start_time", array())) {
                            // line 96
                            echo "                                        <span class=\"small\">";
                            echo $this->getAttribute($context["row"], "start_time", array());
                            echo "</span>
                                    ";
                        }
                        // line 98
                        echo "                                </td>
                                <td>
                                    <span class=\"small\">";
                        // line 100
                        echo $this->getAttribute($context["row"], "end_time", array());
                        echo "</span>
                                </td>
                                <td>
                                    ";
                        // line 103
                        echo $this->getAttribute($context["row"], "dsp_progress", array());
                        echo "
                                </td>
                            ";
                    } else {
                        // line 106
                        echo "                                ";
                        if ( !(isset($context["is_invitee"]) ? $context["is_invitee"] : null)) {
                            // line 107
                            echo "                                    <td>
                                        ";
                            // line 108
                            echo $this->getAttribute($context["row"], "dsp_progress", array());
                            echo "
                                    </td>
                                ";
                        }
                        // line 111
                        echo "                            ";
                    }
                    // line 112
                    echo "
                            <td>
                                ";
                    // line 114
                    echo $this->getAttribute($context["row"], "action_build", array());
                    echo "
                                ";
                    // line 115
                    echo $this->getAttribute($context["row"], "action_edit", array());
                    echo "
                                ";
                    // line 116
                    echo $this->getAttribute($context["row"], "action_visible", array());
                    echo "
                                ";
                    // line 117
                    echo $this->getAttribute($context["row"], "action_tracking", array());
                    echo "
                                ";
                    // line 118
                    echo $this->getAttribute($context["row"], "action_publish", array());
                    echo "
                                ";
                    // line 119
                    echo $this->getAttribute($context["row"], "action_subscribe_users", array());
                    echo "
                                ";
                    // line 120
                    echo $this->getAttribute($context["row"], "action_serious_game", array());
                    echo "
                                ";
                    // line 121
                    echo $this->getAttribute($context["row"], "action_reinit", array());
                    echo "
                                ";
                    // line 122
                    echo $this->getAttribute($context["row"], "action_default_view", array());
                    echo "
                                ";
                    // line 123
                    echo $this->getAttribute($context["row"], "action_debug", array());
                    echo "
                                ";
                    // line 124
                    echo $this->getAttribute($context["row"], "action_export", array());
                    echo "
                                ";
                    // line 125
                    echo $this->getAttribute($context["row"], "action_copy", array());
                    echo "
                                ";
                    // line 126
                    echo $this->getAttribute($context["row"], "action_auto_launch", array());
                    echo "
                                ";
                    // line 127
                    echo $this->getAttribute($context["row"], "action_pdf", array());
                    echo "
                                ";
                    // line 128
                    echo $this->getAttribute($context["row"], "action_delete", array());
                    echo "
                                ";
                    // line 129
                    echo $this->getAttribute($context["row"], "action_order", array());
                    echo "
                            </td>
                        </tr>
                    ";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['row'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 133
                echo "                </tbody>
            </table>
        </div>
    ";
            }
            ++$context['loop']['index0'];
            ++$context['loop']['index'];
            $context['loop']['first'] = false;
            if (isset($context['loop']['length'])) {
                --$context['loop']['revindex0'];
                --$context['loop']['revindex'];
                $context['loop']['last'] = 0 === $context['loop']['revindex0'];
            }
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['lp_data'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 138
        echo "
";
        // line 139
        if (((isset($context["is_allowed_to_edit"]) ? $context["is_allowed_to_edit"] : null) &&  !(isset($context["lp_is_shown"]) ? $context["lp_is_shown"] : null))) {
            // line 140
            echo "    <div id=\"no-data-view\">
        <h2>";
            // line 141
            echo get_lang("LearningPaths");
            echo "</h2>
        <img src=\"";
            // line 142
            echo Template::get_icon_path("scorms.png", 64);
            echo "\" width=\"64\" height=\"64\">
        <div class=\"controls\">
            <a href=\"";
            // line 144
            echo ((((isset($context["web_self"]) ? $context["web_self"] : null) . "?") . $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_cid_query", array())) . "&action=add_lp");
            echo "\" class=\"btn btn-default\">
                ";
            // line 145
            echo get_lang("LearnpathAddLearnpath");
            echo "
            </a>
        </div>
    </div>
";
        }
    }

    public function getTemplateName()
    {
        return "default/learnpath/list.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  446 => 145,  442 => 144,  437 => 142,  433 => 141,  430 => 140,  428 => 139,  425 => 138,  407 => 133,  397 => 129,  393 => 128,  389 => 127,  385 => 126,  381 => 125,  377 => 124,  373 => 123,  369 => 122,  365 => 121,  361 => 120,  357 => 119,  353 => 118,  349 => 117,  345 => 116,  341 => 115,  337 => 114,  333 => 112,  330 => 111,  324 => 108,  321 => 107,  318 => 106,  312 => 103,  306 => 100,  302 => 98,  296 => 96,  294 => 95,  291 => 94,  289 => 93,  283 => 90,  279 => 89,  275 => 88,  271 => 87,  267 => 86,  263 => 84,  259 => 83,  254 => 80,  249 => 78,  246 => 77,  240 => 75,  237 => 74,  232 => 72,  228 => 71,  224 => 70,  219 => 69,  217 => 68,  213 => 67,  207 => 63,  205 => 62,  201 => 60,  193 => 57,  187 => 56,  184 => 55,  176 => 52,  169 => 51,  161 => 48,  158 => 47,  156 => 46,  153 => 45,  145 => 42,  138 => 41,  130 => 38,  127 => 37,  125 => 36,  117 => 33,  110 => 32,  108 => 31,  105 => 30,  102 => 29,  99 => 28,  93 => 26,  91 => 25,  86 => 24,  84 => 23,  79 => 22,  76 => 21,  73 => 20,  70 => 19,  64 => 17,  61 => 16,  59 => 15,  56 => 14,  39 => 13,  34 => 11,  23 => 3,  19 => 1,);
    }
}
/* <script>*/
/*     function confirmation(name) {*/
/*         if (confirm("{{ "AreYouSureToDeleteJS"|get_lang }} \"" + name + "\" ?")) {*/
/*             return true;*/
/*         } else {*/
/*             return false;*/
/*         }*/
/*     }*/
/* </script>*/
/* */
/* {{ introduction_section }}*/
/* */
/* {% for lp_data in data %}*/
/*     <h3 class="page-header">*/
/*         {% if is_allowed_to_edit %}*/
/*             {% if (categories|length) > 1 %}*/
/*                 {{ lp_data.category.getName() }}*/
/*             {% endif %}*/
/*         {% else %}*/
/*             {% if (categories|length) > 1 %}*/
/*                 {% if lp_data.lp_list is not empty and lp_data.category.getId() != 0 %}*/
/*                     {{ lp_data.category.getName() }}*/
/*                 {% elseif lp_data.lp_list is not empty and lp_data.category.getId() == 0 %}*/
/*                     {{ lp_data.category.getName() }}*/
/*                 {% elseif lp_data.lp_list is not empty and lp_data.category.getId() != 0 %}*/
/*                     {{ lp_data.category.getName() }}*/
/*                 {% endif %}*/
/*             {% endif %}*/
/*         {% endif %}*/
/* */
/*         {% if lp_data.category.getId() > 0 and is_allowed_to_edit %}*/
/*             <a href="{{ 'lp_controller.php?' ~ _p.web_cid_query ~ '&action=add_lp_category&id=' ~ lp_data.category.getId() }}" title="{{ "Edit"|get_lang }}">*/
/*                 <img src="{{ "edit.png"|icon }}" alt="{{ "Edit"|get_lang }}">*/
/*             </a>*/
/* */
/*             {% if loop.index0 == 1 %}*/
/*                 <a href="#">*/
/*                     <img src="{{ "up_na.png"|icon }}" alt="{{ "Move"|get_lang }}">*/
/*                 </a>*/
/*             {% else %}*/
/*                 <a href="{{ 'lp_controller.php?' ~ _p.web_cid_query ~ '&action=move_up_category&id=' ~ lp_data.category.getId() }}" title="{{ "Move"|get_lang }}">*/
/*                     <img src="{{ "up.png"|icon }}" alt="{{ "Move"|get_lang }}">*/
/*                 </a>*/
/*             {% endif %}*/
/* */
/*             {% if (data|length - 1) == loop.index0 %}*/
/*                 <a href="#">*/
/*                     <img src="{{ "down_na.png"|icon }}" alt="{{ "Move"|get_lang }}">*/
/*                 </a>*/
/*             {% else %}*/
/*                 <a href="{{ 'lp_controller.php?' ~ _p.web_cid_query ~ '&action=move_down_category&id=' ~ lp_data.category.getId() }}" title="{{ "Move"|get_lang }}">*/
/*                     <img src="{{ "down.png"|icon }}" alt="{{ "Move"|get_lang }}">*/
/*                 </a>*/
/*             {% endif %}*/
/* */
/*             <a href="{{ 'lp_controller.php?' ~ _p.web_cid_query  ~ '&action=delete_lp_category&id=' ~ lp_data.category.getId() }}" title="{{ "Delete"|get_lang }}">*/
/*                 <img src="{{ "delete.png"|icon }}" alt="{{ "Delete"|get_lang }}">*/
/*             </a>*/
/*         {% endif %}*/
/*     </h3>*/
/* */
/*     {% if lp_data.lp_list %}*/
/*         <div class="table-responsive">*/
/*             <table class="table table-hover table-striped">*/
/*                 <thead>*/
/*                     <tr>*/
/*                         <th>{{ "Title"|get_lang }}</th>*/
/*                         {% if is_allowed_to_edit %}*/
/*                             <th>{{ "PublicationDate"|get_lang }}</th>*/
/*                             <th>{{ "ExpirationDate"|get_lang }}</th>*/
/*                             <th>{{ "Progress"|get_lang }}</th>*/
/*                             <th>{{ "AuthoringOptions"|get_lang }}</th>*/
/*                         {% else %}*/
/*                             {% if not is_invitee %}*/
/*                                 <th>{{ "Progress"|get_lang }}</th>*/
/*                             {% endif %}*/
/* */
/*                             <th>{{ "Actions"|get_lang }}</th>*/
/*                         {% endif %}*/
/*                     </tr>*/
/*                 </thead>*/
/*                 <tbody>*/
/*                     {% for row in lp_data.lp_list %}*/
/*                         <tr>*/
/*                             <td>*/
/*                                 {{ row.learnpath_icon }}*/
/*                                 <a href="{{ row.url_start }}">*/
/*                                     {{ row.title }}*/
/*                                     {{ row.session_image }}*/
/*                                     {{ row.extra }}*/
/*                                 </a>*/
/*                             </td>*/
/*                             {% if is_allowed_to_edit %}*/
/*                                 <td>*/
/*                                     {% if row.start_time %}*/
/*                                         <span class="small">{{ row.start_time }}</span>*/
/*                                     {% endif %}*/
/*                                 </td>*/
/*                                 <td>*/
/*                                     <span class="small">{{ row.end_time }}</span>*/
/*                                 </td>*/
/*                                 <td>*/
/*                                     {{ row.dsp_progress }}*/
/*                                 </td>*/
/*                             {% else %}*/
/*                                 {% if not is_invitee %}*/
/*                                     <td>*/
/*                                         {{ row.dsp_progress }}*/
/*                                     </td>*/
/*                                 {% endif %}*/
/*                             {% endif %}*/
/* */
/*                             <td>*/
/*                                 {{ row.action_build }}*/
/*                                 {{ row.action_edit }}*/
/*                                 {{ row.action_visible }}*/
/*                                 {{ row.action_tracking }}*/
/*                                 {{ row.action_publish }}*/
/*                                 {{ row.action_subscribe_users }}*/
/*                                 {{ row.action_serious_game }}*/
/*                                 {{ row.action_reinit }}*/
/*                                 {{ row.action_default_view }}*/
/*                                 {{ row.action_debug }}*/
/*                                 {{ row.action_export }}*/
/*                                 {{ row.action_copy }}*/
/*                                 {{ row.action_auto_launch }}*/
/*                                 {{ row.action_pdf }}*/
/*                                 {{ row.action_delete }}*/
/*                                 {{ row.action_order }}*/
/*                             </td>*/
/*                         </tr>*/
/*                     {% endfor %}*/
/*                 </tbody>*/
/*             </table>*/
/*         </div>*/
/*     {% endif %}*/
/* {% endfor %}*/
/* */
/* {% if is_allowed_to_edit and not lp_is_shown %}*/
/*     <div id="no-data-view">*/
/*         <h2>{{ "LearningPaths"|get_lang }}</h2>*/
/*         <img src="{{ "scorms.png"|icon(64) }}" width="64" height="64">*/
/*         <div class="controls">*/
/*             <a href="{{ web_self ~ "?" ~ _p.web_cid_query ~ "&action=add_lp" }}" class="btn btn-default">*/
/*                 {{ "LearnpathAddLearnpath"|get_lang }}*/
/*             </a>*/
/*         </div>*/
/*     </div>*/
/* {% endif %}*/
/* */
