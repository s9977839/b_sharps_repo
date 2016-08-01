<?php

/* default/layout/hot_course_item.tpl */
class __TwigTemplate_4ae25cd5341d66eb4747a7bcacd7f79602c5380ccf11617183a99d87be3cb686 extends Twig_Template
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
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["hot_courses"]) ? $context["hot_courses"] : null));
        foreach ($context['_seq'] as $context["_key"] => $context["hot_course"]) {
            // line 2
            echo "    ";
            if ($this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "title", array())) {
                // line 3
                echo "                    <div class=\"col-md-4\">
                        <div class=\"items-course\">
                            <div class=\"items-course-image\">
                                <a href=\"";
                // line 6
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "course_public_url", array());
                echo "\"><img class=\"img-responsive\" src=\"";
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "course_image_large", array());
                echo "\" alt=\"";
                echo twig_escape_filter($this->env, $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "title", array()));
                echo "\"/></a>
                            </div>
                            <div class=\"items-course-info\">
                                <h4 class=\"title\">
                                    <a title=\"";
                // line 10
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "title", array());
                echo "\" href=\"";
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "course_public_url", array());
                echo "\">";
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "title", array());
                echo "</a>
                                </h4>
                                <div class=\"teachers\">";
                // line 12
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "teachers", array());
                echo "</div>
                                <div class=\"ranking\">
                                    ";
                // line 14
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "rating_html", array());
                echo "
                                </div>
                                <div class=\"toolbar\">
                                    <div class=\"btn-group\" role=\"group\">
                                    ";
                // line 18
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "description_button", array());
                echo "
                                    ";
                // line 19
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "register_button", array());
                echo "
                                    ";
                // line 20
                echo $this->getAttribute($this->getAttribute($context["hot_course"], "extra_info", array()), "unsubscribe_button", array());
                echo "
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    ";
            }
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['hot_course'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
    }

    public function getTemplateName()
    {
        return "default/layout/hot_course_item.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  71 => 20,  67 => 19,  63 => 18,  56 => 14,  51 => 12,  42 => 10,  31 => 6,  26 => 3,  23 => 2,  19 => 1,);
    }
}
/* {% for hot_course in hot_courses %}*/
/*     {% if hot_course.extra_info.title %}*/
/*                     <div class="col-md-4">*/
/*                         <div class="items-course">*/
/*                             <div class="items-course-image">*/
/*                                 <a href="{{ hot_course.extra_info.course_public_url }}"><img class="img-responsive" src="{{ hot_course.extra_info.course_image_large }}" alt="{{ hot_course.extra_info.title|e }}"/></a>*/
/*                             </div>*/
/*                             <div class="items-course-info">*/
/*                                 <h4 class="title">*/
/*                                     <a title="{{ hot_course.extra_info.title}}" href="{{ hot_course.extra_info.course_public_url }}">{{ hot_course.extra_info.title}}</a>*/
/*                                 </h4>*/
/*                                 <div class="teachers">{{ hot_course.extra_info.teachers }}</div>*/
/*                                 <div class="ranking">*/
/*                                     {{ hot_course.extra_info.rating_html }}*/
/*                                 </div>*/
/*                                 <div class="toolbar">*/
/*                                     <div class="btn-group" role="group">*/
/*                                     {{ hot_course.extra_info.description_button }}*/
/*                                     {{ hot_course.extra_info.register_button }}*/
/*                                     {{ hot_course.extra_info.unsubscribe_button }}*/
/*                                     </div>*/
/*                                 </div>*/
/*                             </div>*/
/*                         </div>*/
/*                     </div>*/
/*     {% endif %}*/
/* {% endfor %}*/
/* */
