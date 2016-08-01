<?php

/* default//user_portal/session.tpl */
class __TwigTemplate_dd74316bf120799b78fcc6aeeefadee2346f9f4e11f067820e0a9460209192dd extends Twig_Template
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
        echo "<div class=\"panel panel-default\">
";
        // line 2
        if ( !$this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_simple_session_info", array())) {
            // line 3
            echo "    ";
            $context["collapsable"] = "";
            // line 4
            echo "    <div class=\"panel-heading\">
        ";
            // line 5
            if (($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "course_list_session_style", array()) == 1)) {
                // line 6
                echo "            ";
                // line 7
                echo "            <a href=\"";
                echo (($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array()) . "session/index.php?session_id=") . $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array()));
                echo "\">
                <img id=\"session_img_";
                // line 8
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array());
                echo "\" src=\"";
                echo Template::get_icon_path("window_list.png", 32);
                echo "\" width=\"32\" height=\"32\" alt=\"";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "\" title=\"";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "\" />
                ";
                // line 9
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "
            </a>
        ";
            } elseif (($this->getAttribute(            // line 11
(isset($context["session"]) ? $context["session"] : null), "course_list_session_style", array()) == 2)) {
                // line 12
                echo "            ";
                // line 13
                echo "            <img id=\"session_img_";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array());
                echo "\" src=\"";
                echo Template::get_icon_path("window_list.png", 32);
                echo "\" width=\"32\" height=\"32\" alt=\"";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "\" title=\"";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "\" />
            ";
                // line 14
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "
        ";
            } elseif (($this->getAttribute(            // line 15
(isset($context["session"]) ? $context["session"] : null), "course_list_session_style", array()) == 3)) {
                // line 16
                echo "            ";
                // line 17
                echo "            <a role=\"button\" data-toggle=\"collapse\" data-parent=\"#page-content\" href=\"#collapse_";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array());
                echo "\" aria-expanded=\"false\" >
                <img id=\"session_img_";
                // line 18
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array());
                echo "\" src=\"";
                echo Template::get_icon_path("window_list.png", 32);
                echo "\" width=\"32\" height=\"32\" alt=\"";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "\" title=\"";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "\" />
                ";
                // line 19
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array());
                echo "
            </a>
            ";
                // line 21
                $context["collapsable"] = "collapse";
                // line 22
                echo "        ";
            }
            // line 23
            echo "
        ";
            // line 24
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_actions", array())) {
                // line 25
                echo "            <div class=\"pull-right\">
                <a href=\"";
                // line 26
                echo (($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array()) . "session/resume_session.php?id_session=") . $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array()));
                echo "\">
                    <img src=\"";
                // line 27
                echo Template::get_icon_path("edit.png", 22);
                echo "\" width=\"22\" height=\"22\" alt=\"";
                echo get_lang("Edit");
                echo "\" title=\"";
                echo get_lang("Edit");
                echo "\" />
                </a>
            </div>
        ";
            }
            // line 31
            echo "    </div>
";
        }
        // line 33
        echo "
<div class=\"sessions panel-body ";
        // line 34
        echo (isset($context["collapsable"]) ? $context["collapsable"] : null);
        echo "\" id=\"collapse_";
        echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array());
        echo "\">
    ";
        // line 35
        if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_simple_session_info", array())) {
            // line 36
            echo "        <div class=\"row\">
            <div class=\"col-md-7\">
                <h3>
                    ";
            // line 39
            echo ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "title", array()) . $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "notifications", array()));
            echo "
                </h3>
                ";
            // line 41
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_description", array())) {
                // line 42
                echo "                    <div>
                        ";
                // line 43
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "description", array());
                echo "
                    </div>
                ";
            }
            // line 46
            echo "
                ";
            // line 47
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "subtitle", array())) {
                // line 48
                echo "                    <small>";
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "subtitle", array());
                echo "</small>
                ";
            }
            // line 50
            echo "
                ";
            // line 51
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "teachers", array())) {
                // line 52
                echo "                    <h5 class=\"teacher-name\">";
                echo (Template::get_icon_path("teacher.png", 16) . $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "teachers", array()));
                echo "</h5>
                ";
            }
            // line 54
            echo "
                ";
            // line 55
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "coaches", array())) {
                // line 56
                echo "                    <h5 class=\"teacher-name\">";
                echo (Template::get_icon_path("teacher.png", 16) . $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "coaches", array()));
                echo "</h5>
                ";
            }
            // line 58
            echo "            </div>

            ";
            // line 60
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_actions", array())) {
                // line 61
                echo "                <div class=\"col-md-5 text-right\">
                    <a href=\"";
                // line 62
                echo (($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array()) . "session/resume_session.php?id_session=") . $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "id", array()));
                echo "\">
                        <img src=\"";
                // line 63
                echo Template::get_icon_path("edit.png", 22);
                echo "\" width=\"22\" height=\"22\" alt=\"";
                echo get_lang("Edit");
                echo "\" title=\"";
                echo get_lang("Edit");
                echo "\">
                    </a>
                </div>
            ";
            }
            // line 67
            echo "        </div>
    ";
        } else {
            // line 69
            echo "        <div class=\"row\">
            <div class=\"col-md-12\">
                ";
            // line 71
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "subtitle", array())) {
                // line 72
                echo "                    <div class=\"subtitle-session\">
                        <em class=\"fa fa-clock-o\"></em> ";
                // line 73
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "subtitle", array());
                echo "
                    </div>
                ";
            }
            // line 76
            echo "                ";
            if ($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "show_description", array())) {
                // line 77
                echo "                    <div class=\"description-session\">
                        ";
                // line 78
                echo $this->getAttribute((isset($context["session"]) ? $context["session"] : null), "description", array());
                echo "
                    </div>
                ";
            }
            // line 81
            echo "                <div class=\"sessions-items\">
                    ";
            // line 82
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["session"]) ? $context["session"] : null), "courses", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["item"]) {
                // line 83
                echo "                        <div class=\"row\">
                            <div class=\"col-md-2\">
                                ";
                // line 85
                if ($this->getAttribute($context["item"], "link", array())) {
                    // line 86
                    echo "                                    <a href=\"";
                    echo $this->getAttribute($context["item"], "link", array());
                    echo "\" class=\"thumbnail\">";
                    echo $this->getAttribute($context["item"], "icon", array());
                    echo "</a>
                                ";
                } else {
                    // line 88
                    echo "                                    ";
                    echo $this->getAttribute($context["item"], "icon", array());
                    echo "
                                ";
                }
                // line 90
                echo "                            </div>
                            <div class=\"col-md-10\">
                                ";
                // line 92
                echo $this->getAttribute($context["item"], "title", array());
                echo "
                                ";
                // line 93
                if ((twig_length_filter($this->env, $this->getAttribute($context["item"], "coaches", array())) > 0)) {
                    // line 94
                    echo "                                    <img src=\"";
                    echo Template::get_icon_path("teacher.png", 16);
                    echo "\" width=\"16\" height=\"16\">
                                    ";
                    // line 95
                    $context['_parent'] = $context;
                    $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["item"], "coaches", array()));
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
                    foreach ($context['_seq'] as $context["_key"] => $context["coach"]) {
                        // line 96
                        echo "                                        ";
                        echo ((($this->getAttribute($context["loop"], "index", array()) > 1)) ? (" | ") : (""));
                        echo "
                                        <a href=\"";
                        // line 97
                        echo (($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_ajax", array()) . "user_manager.ajax.php?") . twig_urlencode_filter(array("a" => "get_user_popup", "user_id" => $this->getAttribute($context["coach"], "user_id", array()))));
                        echo "\" data-title=\"";
                        echo $this->getAttribute($context["coach"], "full_name", array());
                        echo "\" class=\"ajax\">
                                            ";
                        // line 98
                        echo $this->getAttribute($context["coach"], "full_name", array());
                        echo "
                                        </a>
                                    ";
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
                    unset($context['_seq'], $context['_iterated'], $context['_key'], $context['coach'], $context['_parent'], $context['loop']);
                    $context = array_intersect_key($context, $_parent) + $_parent;
                    // line 101
                    echo "                                ";
                }
                // line 102
                echo "                            </div>
                        </div>
                    ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['item'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 105
            echo "                </div>
            </div>
        </div>
    ";
        }
        // line 109
        echo "    </div>
</div>
";
    }

    public function getTemplateName()
    {
        return "default//user_portal/session.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  353 => 109,  347 => 105,  339 => 102,  336 => 101,  319 => 98,  313 => 97,  308 => 96,  291 => 95,  286 => 94,  284 => 93,  280 => 92,  276 => 90,  270 => 88,  262 => 86,  260 => 85,  256 => 83,  252 => 82,  249 => 81,  243 => 78,  240 => 77,  237 => 76,  231 => 73,  228 => 72,  226 => 71,  222 => 69,  218 => 67,  207 => 63,  203 => 62,  200 => 61,  198 => 60,  194 => 58,  188 => 56,  186 => 55,  183 => 54,  177 => 52,  175 => 51,  172 => 50,  166 => 48,  164 => 47,  161 => 46,  155 => 43,  152 => 42,  150 => 41,  145 => 39,  140 => 36,  138 => 35,  132 => 34,  129 => 33,  125 => 31,  114 => 27,  110 => 26,  107 => 25,  105 => 24,  102 => 23,  99 => 22,  97 => 21,  92 => 19,  82 => 18,  77 => 17,  75 => 16,  73 => 15,  69 => 14,  58 => 13,  56 => 12,  54 => 11,  49 => 9,  39 => 8,  34 => 7,  32 => 6,  30 => 5,  27 => 4,  24 => 3,  22 => 2,  19 => 1,);
    }
}
/* <div class="panel panel-default">*/
/* {% if not session.show_simple_session_info %}*/
/*     {% set collapsable = '' %}*/
/*     <div class="panel-heading">*/
/*         {% if session.course_list_session_style == 1 %}*/
/*             {# Classic #}*/
/*             <a href="{{ _p.web_main ~ 'session/index.php?session_id=' ~ session.id }}">*/
/*                 <img id="session_img_{{ session.id }}" src="{{ "window_list.png"|icon(32) }}" width="32" height="32" alt="{{ session.title }}" title="{{ session.title }}" />*/
/*                 {{ session.title }}*/
/*             </a>*/
/*         {% elseif session.course_list_session_style == 2 %}*/
/*             {# No link #}*/
/*             <img id="session_img_{{ session.id }}" src="{{ "window_list.png"|icon(32) }}" width="32" height="32" alt="{{ session.title }}" title="{{ session.title }}" />*/
/*             {{ session.title }}*/
/*         {% elseif session.course_list_session_style == 3 %}*/
/*             {# Foldable #}*/
/*             <a role="button" data-toggle="collapse" data-parent="#page-content" href="#collapse_{{ session.id }}" aria-expanded="false" >*/
/*                 <img id="session_img_{{ session.id }}" src="{{ "window_list.png"|icon(32) }}" width="32" height="32" alt="{{ session.title }}" title="{{ session.title }}" />*/
/*                 {{ session.title }}*/
/*             </a>*/
/*             {% set collapsable = 'collapse' %}*/
/*         {% endif %}*/
/* */
/*         {% if session.show_actions %}*/
/*             <div class="pull-right">*/
/*                 <a href="{{ _p.web_main ~ "session/resume_session.php?id_session=" ~ session.id }}">*/
/*                     <img src="{{ "edit.png"|icon(22) }}" width="22" height="22" alt="{{ "Edit"|get_lang }}" title="{{ "Edit"|get_lang }}" />*/
/*                 </a>*/
/*             </div>*/
/*         {% endif %}*/
/*     </div>*/
/* {% endif %}*/
/* */
/* <div class="sessions panel-body {{ collapsable }}" id="collapse_{{ session.id }}">*/
/*     {% if session.show_simple_session_info %}*/
/*         <div class="row">*/
/*             <div class="col-md-7">*/
/*                 <h3>*/
/*                     {{ session.title ~ session.notifications }}*/
/*                 </h3>*/
/*                 {% if session.show_description %}*/
/*                     <div>*/
/*                         {{ session.description }}*/
/*                     </div>*/
/*                 {% endif %}*/
/* */
/*                 {% if session.subtitle %}*/
/*                     <small>{{ session.subtitle }}</small>*/
/*                 {% endif %}*/
/* */
/*                 {% if session.teachers %}*/
/*                     <h5 class="teacher-name">{{ "teacher.png"|icon(16) ~ session.teachers }}</h5>*/
/*                 {% endif %}*/
/* */
/*                 {% if session.coaches %}*/
/*                     <h5 class="teacher-name">{{ "teacher.png"|icon(16) ~ session.coaches }}</h5>*/
/*                 {% endif %}*/
/*             </div>*/
/* */
/*             {% if session.show_actions %}*/
/*                 <div class="col-md-5 text-right">*/
/*                     <a href="{{ _p.web_main ~ "session/resume_session.php?id_session=" ~ session.id }}">*/
/*                         <img src="{{ "edit.png"|icon(22) }}" width="22" height="22" alt="{{ "Edit"|get_lang }}" title="{{ "Edit"|get_lang }}">*/
/*                     </a>*/
/*                 </div>*/
/*             {% endif %}*/
/*         </div>*/
/*     {% else %}*/
/*         <div class="row">*/
/*             <div class="col-md-12">*/
/*                 {% if session.subtitle %}*/
/*                     <div class="subtitle-session">*/
/*                         <em class="fa fa-clock-o"></em> {{ session.subtitle }}*/
/*                     </div>*/
/*                 {% endif %}*/
/*                 {% if session.show_description %}*/
/*                     <div class="description-session">*/
/*                         {{ session.description }}*/
/*                     </div>*/
/*                 {% endif %}*/
/*                 <div class="sessions-items">*/
/*                     {% for item in session.courses %}*/
/*                         <div class="row">*/
/*                             <div class="col-md-2">*/
/*                                 {% if item.link %}*/
/*                                     <a href="{{ item.link }}" class="thumbnail">{{ item.icon }}</a>*/
/*                                 {% else %}*/
/*                                     {{ item.icon }}*/
/*                                 {% endif %}*/
/*                             </div>*/
/*                             <div class="col-md-10">*/
/*                                 {{ item.title }}*/
/*                                 {% if item.coaches|length > 0 %}*/
/*                                     <img src="{{ 'teacher.png'|icon(16) }}" width="16" height="16">*/
/*                                     {% for coach in item.coaches %}*/
/*                                         {{ loop.index > 1 ? ' | ' }}*/
/*                                         <a href="{{ _p.web_ajax ~ 'user_manager.ajax.php?' ~ {'a': 'get_user_popup', 'user_id': coach.user_id}|url_encode() }}" data-title="{{ coach.full_name }}" class="ajax">*/
/*                                             {{ coach.full_name }}*/
/*                                         </a>*/
/*                                     {% endfor %}*/
/*                                 {% endif %}*/
/*                             </div>*/
/*                         </div>*/
/*                     {% endfor %}*/
/*                 </div>*/
/*             </div>*/
/*         </div>*/
/*     {% endif %}*/
/*     </div>*/
/* </div>*/
/* */
