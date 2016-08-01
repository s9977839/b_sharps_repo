<?php

/* default/gamification/my_progress.tpl */
class __TwigTemplate_1bd1edd5dcfb37b4f8f292b5150b8d2a570b0bc77ba8d3650978dff8243c3d8a extends Twig_Template
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
        echo "<div class=\"my-progress row\">
    <div class=\"col-md-3\">
        <div class=\"panel panel-default\">
            <div class=\"panel-body\">
                <div class=\"profile-user\">
                    ";
        // line 6
        echo (isset($context["user_avatar"]) ? $context["user_avatar"] : null);
        echo "
                    <div class=\"username\">";
        // line 7
        echo $this->getAttribute((isset($context["user"]) ? $context["user"] : null), "getCompleteName", array(), "method");
        echo "</div>
                    <div class=\"star-progress\">
                        <span class=\"pull-right\">";
        // line 9
        echo sprintf(get_lang("XPoints"), (isset($context["gamification_points"]) ? $context["gamification_points"] : null));
        echo "</span>

                        ";
        // line 11
        if (((isset($context["gamification_stars"]) ? $context["gamification_stars"] : null) > 0)) {
            // line 12
            echo "                            ";
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable(range(1, (isset($context["gamification_stars"]) ? $context["gamification_stars"] : null)));
            foreach ($context['_seq'] as $context["_key"] => $context["i"]) {
                // line 13
                echo "                                <em class=\"fa fa-star\"></em>
                            ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['i'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 15
            echo "                        ";
        }
        // line 16
        echo "
                        ";
        // line 17
        if (((4 - (isset($context["gamification_stars"]) ? $context["gamification_stars"] : null)) > 0)) {
            // line 18
            echo "                            ";
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable(range(1, (4 - (isset($context["gamification_stars"]) ? $context["gamification_stars"] : null))));
            foreach ($context['_seq'] as $context["_key"] => $context["i"]) {
                // line 19
                echo "                                <em class=\"fa fa-star in\"></em>
                            ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['i'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 21
            echo "                        ";
        }
        // line 22
        echo "                    </div>

                    <div class=\"progress\">
                        <div class=\"progress-bar progress-bar-success\" role=\"progressbar\" aria-valuenow=\"";
        // line 25
        echo (isset($context["gamification_progress"]) ? $context["gamification_progress"] : null);
        echo "\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: ";
        echo (isset($context["gamification_progress"]) ? $context["gamification_progress"] : null);
        echo "%\">
                            <span class=\"sr-only\">";
        // line 26
        echo (isset($context["gamification_progress"]) ? $context["gamification_progress"] : null);
        echo " Complete (success)</span>
                        </div>
                    </div>

                    <div class=\"progress-percentage text-right\">";
        // line 30
        echo sprintf(get_lang("XPercent"), (isset($context["gamification_progress"]) ? $context["gamification_progress"] : null));
        echo "</div>
                </div>
            </div>
        </div>
        <div class=\"panel panel-default\">
            <div class=\"panel-heading\">
                ";
        // line 36
        echo get_lang("ShowProgress");
        echo "
            </div>
            <div class=\"panel-body\">
                <ul class=\"list-course\">
                    ";
        // line 40
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["sessions"]) ? $context["sessions"] : null));
        foreach ($context['_seq'] as $context["_key"] => $context["session"]) {
            // line 41
            echo "                    <li><a href=\"";
            echo (($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "self", array()) . "?") . twig_urlencode_filter(array("session_id" => $this->getAttribute($context["session"], "getId", array()))));
            echo "\" class=\"list-course-item ";
            echo ((((isset($context["current_session"]) ? $context["current_session"] : null) && ($this->getAttribute($context["session"], "getId", array()) == $this->getAttribute((isset($context["current_session"]) ? $context["current_session"] : null), "getId", array())))) ? ("active") : (""));
            echo "\">
                            <em class=\"fa fa-chevron-circle-right\"></em> ";
            // line 42
            echo $this->getAttribute($context["session"], "getName", array());
            echo "
                        </a>
                    </li>
                    ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['session'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 46
        echo "                </ul>
            </div>
        </div>
    </div>

    <div class=\"col-md-9\">
        ";
        // line 52
        if ((isset($context["current_session"]) ? $context["current_session"] : null)) {
            // line 53
            echo "
            <div class=\"panel panel-default\">
                <div class=\"panel-heading\"><em class=\"fa fa-book\"></em> ";
            // line 55
            echo $this->getAttribute((isset($context["current_session"]) ? $context["current_session"] : null), "getName", array(), "method");
            echo "</div>
                <div class=\"panel-body\">
                    ";
            // line 57
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable((isset($context["session_data"]) ? $context["session_data"] : null));
            foreach ($context['_seq'] as $context["course_id"] => $context["course"]) {
                // line 58
                echo "                    <h3><img src=\"";
                echo Template::get_icon_path("blackboard_blue.png", 32);
                echo "\"/> ";
                echo $this->getAttribute($context["course"], "title", array());
                echo "</h3>
                    <div class=\"panel-group\" id=\"course-accordion\" role=\"tablist\" aria-multiselectable=\"true\">
                        ";
                // line 60
                $context['_parent'] = $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["course"], "stats", array()));
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
                foreach ($context['_seq'] as $context["_key"] => $context["stats_url"]) {
                    // line 61
                    echo "                        ";
                    $context["panel_id"] = (($context["course_id"] . "-") . $this->getAttribute($context["loop"], "index", array()));
                    // line 62
                    echo "                        <div class=\"panel panel-default\">
                            <div class=\"panel-heading\" role=\"tab\" id=\"heading-";
                    // line 63
                    echo (isset($context["panel_id"]) ? $context["panel_id"] : null);
                    echo "\">
                                <h4 class=\"panel-title\">
                                    <a role=\"button\" data-toggle=\"collapse\" data-parent=\"#course-accordion\" href=\"#collapse-";
                    // line 65
                    echo (isset($context["panel_id"]) ? $context["panel_id"] : null);
                    echo "\" aria-expanded=\"true\" aria-controls=\"collapse-";
                    echo (isset($context["panel_id"]) ? $context["panel_id"] : null);
                    echo "\">
                                        ";
                    // line 66
                    echo $this->getAttribute($context["stats_url"], 0, array());
                    echo "
                                    </a>
                                </h4>
                            </div>
                            <div id=\"collapse-";
                    // line 70
                    echo (isset($context["panel_id"]) ? $context["panel_id"] : null);
                    echo "\" class=\"panel-collapse collapse in\" role=\"tabpanel\" aria-labelledby=\"heading-";
                    echo (isset($context["panel_id"]) ? $context["panel_id"] : null);
                    echo "\">
                                <div class=\"panel-body\">
                                    <div class=\"embed-container\">
                                        <iframe src=\"";
                    // line 73
                    echo ($this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array()) . $this->getAttribute($context["stats_url"], 1, array()));
                    echo "\"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['stats_url'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 79
                echo "                    </div>
                    ";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['course_id'], $context['course'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 81
            echo "                </div>
            </div>


        ";
        }
        // line 86
        echo "    </div>
</div>
";
    }

    public function getTemplateName()
    {
        return "default/gamification/my_progress.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  246 => 86,  239 => 81,  232 => 79,  212 => 73,  204 => 70,  197 => 66,  191 => 65,  186 => 63,  183 => 62,  180 => 61,  163 => 60,  155 => 58,  151 => 57,  146 => 55,  142 => 53,  140 => 52,  132 => 46,  122 => 42,  115 => 41,  111 => 40,  104 => 36,  95 => 30,  88 => 26,  82 => 25,  77 => 22,  74 => 21,  67 => 19,  62 => 18,  60 => 17,  57 => 16,  54 => 15,  47 => 13,  42 => 12,  40 => 11,  35 => 9,  30 => 7,  26 => 6,  19 => 1,);
    }
}
/* <div class="my-progress row">*/
/*     <div class="col-md-3">*/
/*         <div class="panel panel-default">*/
/*             <div class="panel-body">*/
/*                 <div class="profile-user">*/
/*                     {{ user_avatar }}*/
/*                     <div class="username">{{ user.getCompleteName() }}</div>*/
/*                     <div class="star-progress">*/
/*                         <span class="pull-right">{{ 'XPoints'|get_lang|format(gamification_points) }}</span>*/
/* */
/*                         {% if gamification_stars > 0 %}*/
/*                             {% for i in 1..gamification_stars %}*/
/*                                 <em class="fa fa-star"></em>*/
/*                             {% endfor %}*/
/*                         {% endif %}*/
/* */
/*                         {% if 4 - gamification_stars > 0 %}*/
/*                             {% for i in 1..(4 - gamification_stars) %}*/
/*                                 <em class="fa fa-star in"></em>*/
/*                             {% endfor %}*/
/*                         {% endif %}*/
/*                     </div>*/
/* */
/*                     <div class="progress">*/
/*                         <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="{{ gamification_progress }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ gamification_progress }}%">*/
/*                             <span class="sr-only">{{ gamification_progress }} Complete (success)</span>*/
/*                         </div>*/
/*                     </div>*/
/* */
/*                     <div class="progress-percentage text-right">{{ 'XPercent'|get_lang|format(gamification_progress) }}</div>*/
/*                 </div>*/
/*             </div>*/
/*         </div>*/
/*         <div class="panel panel-default">*/
/*             <div class="panel-heading">*/
/*                 {{ 'ShowProgress'|get_lang }}*/
/*             </div>*/
/*             <div class="panel-body">*/
/*                 <ul class="list-course">*/
/*                     {% for session in sessions %}*/
/*                     <li><a href="{{ _p.self ~ '?' ~ {"session_id": session.getId}|url_encode() }}" class="list-course-item {{ current_session and session.getId == current_session.getId ? 'active' }}">*/
/*                             <em class="fa fa-chevron-circle-right"></em> {{ session.getName }}*/
/*                         </a>*/
/*                     </li>*/
/*                     {% endfor %}*/
/*                 </ul>*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/* */
/*     <div class="col-md-9">*/
/*         {% if current_session %}*/
/* */
/*             <div class="panel panel-default">*/
/*                 <div class="panel-heading"><em class="fa fa-book"></em> {{ current_session.getName() }}</div>*/
/*                 <div class="panel-body">*/
/*                     {% for course_id, course in session_data %}*/
/*                     <h3><img src="{{ 'blackboard_blue.png'|icon(32) }}"/> {{ course.title }}</h3>*/
/*                     <div class="panel-group" id="course-accordion" role="tablist" aria-multiselectable="true">*/
/*                         {% for stats_url in course.stats %}*/
/*                         {% set panel_id = course_id ~ '-' ~ loop.index %}*/
/*                         <div class="panel panel-default">*/
/*                             <div class="panel-heading" role="tab" id="heading-{{ panel_id }}">*/
/*                                 <h4 class="panel-title">*/
/*                                     <a role="button" data-toggle="collapse" data-parent="#course-accordion" href="#collapse-{{ panel_id }}" aria-expanded="true" aria-controls="collapse-{{ panel_id }}">*/
/*                                         {{ stats_url.0 }}*/
/*                                     </a>*/
/*                                 </h4>*/
/*                             </div>*/
/*                             <div id="collapse-{{ panel_id }}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-{{ panel_id }}">*/
/*                                 <div class="panel-body">*/
/*                                     <div class="embed-container">*/
/*                                         <iframe src="{{ _p.web_main ~ stats_url.1 }}"></iframe>*/
/*                                     </div>*/
/*                                 </div>*/
/*                             </div>*/
/*                         </div>*/
/*                         {% endfor %}*/
/*                     </div>*/
/*                     {% endfor %}*/
/*                 </div>*/
/*             </div>*/
/* */
/* */
/*         {% endif %}*/
/*     </div>*/
/* </div>*/
/* */
