<?php

/* default/create_course/add_course.tpl */
class __TwigTemplate_60c750c905ab8dda592c0de2428333fe655a7b57fa5cafca8f37001a0b4f5890 extends Twig_Template
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
        if (((isset($context["just_created"]) ? $context["just_created"] : null) == 1)) {
            // line 2
            echo (isset($context["just_created_link"]) ? $context["just_created_link"] : null);
            echo "
<h3>";
            // line 3
            echo get_lang("JustCreated");
            echo " ";
            echo (isset($context["course_title"]) ? $context["course_title"] : null);
            echo "</h3>
<hr />
";
        }
        // line 6
        echo "
<h3>";
        // line 7
        echo get_lang("ThingsToDo");
        echo "</h3>
<br />

<div id=\"course_thing_to_do\" class=\"row\">
    <div class=\"col-md-3\">
        <div class=\"thumbnail\">
            ";
        // line 13
        echo Template::get_image("info.png", 64, get_lang("AddCourseDescription"));
        echo "
            <div class=\"caption\">
                <a href=\"";
        // line 15
        echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array());
        echo "course_description/?cidReq=";
        echo (isset($context["course_id"]) ? $context["course_id"] : null);
        echo "\" class=\"btn btn-default\">
                    <em class=\"fa fa-info-circle\"></em> ";
        // line 16
        echo get_lang("AddCourseDescription");
        echo "
                </a>
            </div>
        </div>
    </div>
    <div class=\"col-md-3\">
        <div class=\"thumbnail\">
            ";
        // line 23
        echo Template::get_image("folder_document.png", 64, get_lang("UploadADocument"));
        echo "
            <div class=\"caption\">
                <a href=\"";
        // line 25
        echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array());
        echo "document/document.php?cidReq=";
        echo (isset($context["course_id"]) ? $context["course_id"] : null);
        echo "\" class=\"btn btn-default\">
                    <em class=\"fa fa-paper-plane\"></em> ";
        // line 26
        echo get_lang("UploadADocument");
        echo "
                </a>
            </div>
        </div>
    </div>
    <div class=\"col-md-3\">
        <div class=\"thumbnail\">
            ";
        // line 33
        echo Template::get_image("forum.png", 64, get_lang("AddForum"));
        echo "
            
            <div class=\"caption\">
                <a href=\"";
        // line 36
        echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array());
        echo "forum/index.php?cidReq=";
        echo (isset($context["course_id"]) ? $context["course_id"] : null);
        echo "\" class=\"btn btn-default\">
                    <em class=\"fa fa-users\"></em> ";
        // line 37
        echo get_lang("AddForum");
        echo "
                </a>
            </div>
        </div>
    </div>
    ";
        // line 42
        if (((api_get_setting("allow_user_course_subscription_by_course_admin") == "true") || ($this->getAttribute((isset($context["_u"]) ? $context["_u"] : null), "is_admin", array()) == 1))) {
            // line 43
            echo "    <div class=\"col-md-3\">
        <div class=\"thumbnail\">
        
        ";
            // line 46
            echo Template::get_image("user.png", 64, get_lang("SubscribeUserToCourse"));
            echo "
            <div class=\"caption\">
            <a href=\"";
            // line 48
            echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_main", array());
            echo "user/subscribe_user.php?cidReq=";
            echo (isset($context["course_id"]) ? $context["course_id"] : null);
            echo "\" class=\"btn btn-default\">
                <em class=\"fa fa-user-plus\"></em> ";
            // line 49
            echo get_lang("SubscribeUserToCourse");
            echo "
            </a>
            </div>
        </div>
    </div>
    ";
        }
        // line 55
        echo "

</div>

<div class=\"clear\"></div>
";
    }

    public function getTemplateName()
    {
        return "default/create_course/add_course.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  134 => 55,  125 => 49,  119 => 48,  114 => 46,  109 => 43,  107 => 42,  99 => 37,  93 => 36,  87 => 33,  77 => 26,  71 => 25,  66 => 23,  56 => 16,  50 => 15,  45 => 13,  36 => 7,  33 => 6,  25 => 3,  21 => 2,  19 => 1,);
    }
}
/* {% if just_created == 1%}*/
/* {{ just_created_link }}*/
/* <h3>{{ 'JustCreated'|get_lang }} {{ course_title }}</h3>*/
/* <hr />*/
/* {% endif %}*/
/* */
/* <h3>{{ 'ThingsToDo'|get_lang }}</h3>*/
/* <br />*/
/* */
/* <div id="course_thing_to_do" class="row">*/
/*     <div class="col-md-3">*/
/*         <div class="thumbnail">*/
/*             {{ 'info.png' | img(64, 'AddCourseDescription'|get_lang ) }}*/
/*             <div class="caption">*/
/*                 <a href="{{ _p.web_main }}course_description/?cidReq={{ course_id }}" class="btn btn-default">*/
/*                     <em class="fa fa-info-circle"></em> {{'AddCourseDescription'|get_lang}}*/
/*                 </a>*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/*     <div class="col-md-3">*/
/*         <div class="thumbnail">*/
/*             {{ 'folder_document.png' | img(64, 'UploadADocument'|get_lang ) }}*/
/*             <div class="caption">*/
/*                 <a href="{{ _p.web_main }}document/document.php?cidReq={{ course_id }}" class="btn btn-default">*/
/*                     <em class="fa fa-paper-plane"></em> {{'UploadADocument'|get_lang}}*/
/*                 </a>*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/*     <div class="col-md-3">*/
/*         <div class="thumbnail">*/
/*             {{ 'forum.png' | img(64, 'AddForum'|get_lang ) }}*/
/*             */
/*             <div class="caption">*/
/*                 <a href="{{ _p.web_main }}forum/index.php?cidReq={{ course_id }}" class="btn btn-default">*/
/*                     <em class="fa fa-users"></em> {{ 'AddForum'|get_lang }}*/
/*                 </a>*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/*     {% if ("allow_user_course_subscription_by_course_admin" | get_setting) == 'true' or _u.is_admin == 1 %}*/
/*     <div class="col-md-3">*/
/*         <div class="thumbnail">*/
/*         */
/*         {{ 'user.png' | img(64, 'SubscribeUserToCourse'|get_lang ) }}*/
/*             <div class="caption">*/
/*             <a href="{{ _p.web_main }}user/subscribe_user.php?cidReq={{ course_id }}" class="btn btn-default">*/
/*                 <em class="fa fa-user-plus"></em> {{ 'SubscribeUserToCourse'|get_lang }}*/
/*             </a>*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/*     {% endif %}*/
/* */
/* */
/* </div>*/
/* */
/* <div class="clear"></div>*/
/* */
