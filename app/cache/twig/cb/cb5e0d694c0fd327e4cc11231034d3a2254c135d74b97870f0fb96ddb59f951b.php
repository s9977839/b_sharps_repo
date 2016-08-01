<?php

/* default/announcement/slider.tpl */
class __TwigTemplate_363cea4c3b6c856b69b6a19a2c3217814a4395fcbf51dba8e3b6830cef0d463a extends Twig_Template
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
        echo "<h4 class=\"page-header\">";
        echo get_lang("SystemAnnouncements");
        echo "</h4>
   
 <div id=\"carousel-announcement\" class=\"carousel slide\" data-ride=\"carousel\">
  <!-- Indicators -->
  <ol class=\"carousel-indicators\">
      ";
        // line 6
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["announcements"]) ? $context["announcements"] : null));
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
        foreach ($context['_seq'] as $context["_key"] => $context["announcement"]) {
            // line 7
            echo "        <li data-target=\"#carousel-announcement\" data-slide-to=\"";
            echo $this->getAttribute($context["loop"], "index0", array());
            echo "\" ";
            if (($this->getAttribute($context["loop"], "index0", array()) == 0)) {
                echo " class=\"active\" ";
            }
            echo "></li>
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
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['announcement'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 9
        echo "  </ol>

  <!-- Wrapper for slides -->
  <div class=\"carousel-inner\" role=\"listbox\">
      ";
        // line 13
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["announcements"]) ? $context["announcements"] : null));
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
        foreach ($context['_seq'] as $context["_key"] => $context["announcement"]) {
            // line 14
            echo "        <div class=\"item ";
            if (($this->getAttribute($context["loop"], "index0", array()) == 0)) {
                echo " active ";
            }
            echo "\">
          <div class=\"carousel-caption\">
              ";
            // line 16
            echo $this->getAttribute($context["announcement"], "title", array());
            echo "
          </div>
          <div class=\"carousel-content\">
              ";
            // line 19
            echo $this->getAttribute($context["announcement"], "content", array());
            echo "
          </div>
            ";
            // line 21
            if ($this->getAttribute($context["announcement"], "readMore", array())) {
                // line 22
                echo "                <a href=\"";
                echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web", array());
                echo "news_list.php?id=";
                echo $this->getAttribute($context["announcement"], "id", array());
                echo "\">";
                echo get_lang("More");
                echo "</a>
            ";
            }
            // line 24
            echo "        </div>
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
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['announcement'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 26
        echo "  </div>

  <!-- Controls -->
  <a class=\"left carousel-control\" href=\"#carousel-announcement\" role=\"button\" data-slide=\"prev\">
    <span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>
    <span class=\"sr-only\">Previous</span>
  </a>
  <a class=\"right carousel-control\" href=\"#carousel-announcement\" role=\"button\" data-slide=\"next\">
    <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>
    <span class=\"sr-only\">Next</span>
  </a>
</div>";
    }

    public function getTemplateName()
    {
        return "default/announcement/slider.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  135 => 26,  120 => 24,  110 => 22,  108 => 21,  103 => 19,  97 => 16,  89 => 14,  72 => 13,  66 => 9,  45 => 7,  28 => 6,  19 => 1,);
    }
}
/* <h4 class="page-header">{{ "SystemAnnouncements" | get_lang }}</h4>*/
/*    */
/*  <div id="carousel-announcement" class="carousel slide" data-ride="carousel">*/
/*   <!-- Indicators -->*/
/*   <ol class="carousel-indicators">*/
/*       {% for announcement in announcements %}*/
/*         <li data-target="#carousel-announcement" data-slide-to="{{ loop.index0 }}" {% if loop.index0 == 0 %} class="active" {% endif %}></li>*/
/*       {% endfor %}*/
/*   </ol>*/
/* */
/*   <!-- Wrapper for slides -->*/
/*   <div class="carousel-inner" role="listbox">*/
/*       {% for announcement in announcements %}*/
/*         <div class="item {% if loop.index0 == 0 %} active {% endif %}">*/
/*           <div class="carousel-caption">*/
/*               {{ announcement.title }}*/
/*           </div>*/
/*           <div class="carousel-content">*/
/*               {{ announcement.content }}*/
/*           </div>*/
/*             {% if announcement.readMore %}*/
/*                 <a href="{{ _p.web }}news_list.php?id={{ announcement.id }}">{{ "More" | get_lang }}</a>*/
/*             {% endif %}*/
/*         </div>*/
/*     {% endfor %}*/
/*   </div>*/
/* */
/*   <!-- Controls -->*/
/*   <a class="left carousel-control" href="#carousel-announcement" role="button" data-slide="prev">*/
/*     <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>*/
/*     <span class="sr-only">Previous</span>*/
/*   </a>*/
/*   <a class="right carousel-control" href="#carousel-announcement" role="button" data-slide="next">*/
/*     <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>*/
/*     <span class="sr-only">Next</span>*/
/*   </a>*/
/* </div>*/
