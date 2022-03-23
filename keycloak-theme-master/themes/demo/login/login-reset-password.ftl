<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
    <div class="mb-4"> ¿Has olvidado tu contraseña? </div>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="form reset-password ${properties.kcFormClass!}" action="${url.loginAction}" method="post">

            <div class="mb-3 reset-password-field ${properties.kcFormGroupClass!}">
                <input type="text" id="username" name="username" class="input-block" autofocus placeholder='${msg("emailInstruction")}'/>
            </div>

            <div class="d-flex flex-row-reverse bd-highlight">
                <div class="p-2 bd-highlight">
                    <div id="kc-form-options">
                        <span>
                            <a href="${url.loginUrl}">${msg("backToLogin")}</a>
                        </span>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-row-reverse bd-highlight">
                <div class="p-2 bd-highlight">
                    <div id="kc-form-buttons">
                        <input class="btn btn-primary" type="submit" value="${msg("doSubmit")}"/>
                    </div>
                </div>
            </div>

        </form>
    <#elseif section = "info" >
        <!-- <hr />
        ${msg("emailInstruction")} -->
    </#if>
</@layout.registrationLayout>