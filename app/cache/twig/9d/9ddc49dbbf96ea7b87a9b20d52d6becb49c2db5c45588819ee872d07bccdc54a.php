<?php

/* default/mail/mail.tpl */
class __TwigTemplate_122b298d953bdc3c5ca5d229c0d8d736e6dba6d8c9bc48651a8b8e51c6be4a4a extends Twig_Template
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
        echo "<!DOCTYPE html>
<html>
<head>
    <meta charset=\"UTF-8\">
    <title>";
        // line 5
        echo $this->getAttribute((isset($context["_s"]) ? $context["_s"] : null), "institution", array());
        echo "</title>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>
    <script type=\"application/ld+json\">
        {
          \"@context\":       \"http://schema.org\",
          \"@type\":          \"EmailMessage\",
          \"description\":    \"Chamilo Mail Notification\",
          \"potentialAction\": {
            \"@type\": \"ViewAction\",
            \"target\":   \"";
        // line 14
        echo (isset($context["link"]) ? $context["link"] : null);
        echo "\"
          }
        }
    </script>
</head>
<body style=\"margin: 0; padding: 0;\">
    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
        <tr>
            <td>
                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;\">
                    <tr>
                        <td>
                            ";
        // line 26
        $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/mail/header.tpl"), "default/mail/mail.tpl", 26)->display($context);
        // line 27
        echo "                        </td>
                    </tr>
                    <tr>
                        <td cellpadding=\"0\" cellspacing=\"0\" style=\"padding: 40px 10px\">
                            ";
        // line 31
        echo (isset($context["content"]) ? $context["content"] : null);
        echo "
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ";
        // line 36
        $this->loadTemplate(((isset($context["template"]) ? $context["template"] : null) . "/mail/footer.tpl"), "default/mail/mail.tpl", 36)->display($context);
        // line 37
        echo "                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
";
    }

    public function getTemplateName()
    {
        return "default/mail/mail.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  70 => 37,  68 => 36,  60 => 31,  54 => 27,  52 => 26,  37 => 14,  25 => 5,  19 => 1,);
    }
}
/* <!DOCTYPE html>*/
/* <html>*/
/* <head>*/
/*     <meta charset="UTF-8">*/
/*     <title>{{ _s.institution }}</title>*/
/*     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>*/
/*     <script type="application/ld+json">*/
/*         {*/
/*           "@context":       "http://schema.org",*/
/*           "@type":          "EmailMessage",*/
/*           "description":    "Chamilo Mail Notification",*/
/*           "potentialAction": {*/
/*             "@type": "ViewAction",*/
/*             "target":   "{{ link }}"*/
/*           }*/
/*         }*/
/*     </script>*/
/* </head>*/
/* <body style="margin: 0; padding: 0;">*/
/*     <table border="0" cellpadding="0" cellspacing="0" width="100%">*/
/*         <tr>*/
/*             <td>*/
/*                 <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">*/
/*                     <tr>*/
/*                         <td>*/
/*                             {% include template ~ '/mail/header.tpl' %}*/
/*                         </td>*/
/*                     </tr>*/
/*                     <tr>*/
/*                         <td cellpadding="0" cellspacing="0" style="padding: 40px 10px">*/
/*                             {{ content }}*/
/*                         </td>*/
/*                     </tr>*/
/*                     <tr>*/
/*                         <td>*/
/*                             {% include template ~ '/mail/footer.tpl' %}*/
/*                         </td>*/
/*                     </tr>*/
/*                 </table>*/
/*             </td>*/
/*         </tr>*/
/*     </table>*/
/* </body>*/
/* </html>*/
/* */
