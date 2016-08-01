<?php

/* default/social/form_modals.tpl */
class __TwigTemplate_65551c8636eb8848c7bf3585d1e7fba14baaf9e88a6ca2a0eb43a87a6e4b1270 extends Twig_Template
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
        echo "<div class=\"modal fade\" id=\"send-invitation-modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"send-invitation-modal-title\" aria-hidden=\"true\">
    <div class=\"modal-dialog\">
        <div class=\"modal-content\">
            <div class=\"modal-header\">
                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"";
        // line 5
        echo get_lang("Close");
        echo "\">
                    <span aria-hidden=\"true\">&times;</span>
                </button>
                <h4 class=\"modal-title\" id=\"send-invitation-modal-title\">";
        // line 8
        echo get_lang("SendInvitation");
        echo "</h4>
            </div>
            <div class=\"modal-body\">
                <div id=\"send-invitation-alert\"></div>
                ";
        // line 12
        echo (isset($context["invitation_form"]) ? $context["invitation_form"] : null);
        echo "
            </div>
            <div class=\"modal-footer\">
                <button type=\"button\" id=\"btn-send-invitation\" class=\"btn btn-primary\">
                    <em class=\"fa fa-send\"></em> ";
        // line 16
        echo get_lang("Send");
        echo "
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    \$(document).on('ready', function() {
        var \$sendInvitationModal = \$('#send-invitation-modal');
        var sendToUser = 0;

        \$('.btn-to-send-invitation').on('click', function(e) {
            e.preventDefault();
            sendToUser = \$(this).data('send-to');
            \$sendInvitationModal.modal('show');
        });

        \$('#btn-send-invitation').on('click', function(e) {
            e.preventDefault();

            var \$frmSendInvitation = \$sendInvitationModal.find('.modal-body form'),
                url = '";
        // line 38
        echo $this->getAttribute((isset($context["_p"]) ? $context["_p"] : null), "web_ajax", array());
        echo "message.ajax.php?a=send_invitation&user_id=' + sendToUser;

            \$.get(url, \$frmSendInvitation.serialize(), function() {
                \$frmSendInvitation[0].reset();

                window.location.reload();
            });
        });
    });
</script>
";
    }

    public function getTemplateName()
    {
        return "default/social/form_modals.tpl";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  70 => 38,  45 => 16,  38 => 12,  31 => 8,  25 => 5,  19 => 1,);
    }
}
/* <div class="modal fade" id="send-invitation-modal" tabindex="-1" role="dialog" aria-labelledby="send-invitation-modal-title" aria-hidden="true">*/
/*     <div class="modal-dialog">*/
/*         <div class="modal-content">*/
/*             <div class="modal-header">*/
/*                 <button type="button" class="close" data-dismiss="modal" aria-label="{{ 'Close' | get_lang }}">*/
/*                     <span aria-hidden="true">&times;</span>*/
/*                 </button>*/
/*                 <h4 class="modal-title" id="send-invitation-modal-title">{{ 'SendInvitation' | get_lang }}</h4>*/
/*             </div>*/
/*             <div class="modal-body">*/
/*                 <div id="send-invitation-alert"></div>*/
/*                 {{ invitation_form }}*/
/*             </div>*/
/*             <div class="modal-footer">*/
/*                 <button type="button" id="btn-send-invitation" class="btn btn-primary">*/
/*                     <em class="fa fa-send"></em> {{ 'Send' | get_lang }}*/
/*                 </button>*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/* </div>*/
/* */
/* <script>*/
/*     $(document).on('ready', function() {*/
/*         var $sendInvitationModal = $('#send-invitation-modal');*/
/*         var sendToUser = 0;*/
/* */
/*         $('.btn-to-send-invitation').on('click', function(e) {*/
/*             e.preventDefault();*/
/*             sendToUser = $(this).data('send-to');*/
/*             $sendInvitationModal.modal('show');*/
/*         });*/
/* */
/*         $('#btn-send-invitation').on('click', function(e) {*/
/*             e.preventDefault();*/
/* */
/*             var $frmSendInvitation = $sendInvitationModal.find('.modal-body form'),*/
/*                 url = '{{ _p.web_ajax }}message.ajax.php?a=send_invitation&user_id=' + sendToUser;*/
/* */
/*             $.get(url, $frmSendInvitation.serialize(), function() {*/
/*                 $frmSendInvitation[0].reset();*/
/* */
/*                 window.location.reload();*/
/*             });*/
/*         });*/
/*     });*/
/* </script>*/
/* */
