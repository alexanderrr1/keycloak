
<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
    <div class="mb-4"> Registrarte </div>
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">

            <div class="mb-3 ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                    <input type="text" id="firstName" class="input-block" name="firstName" value="${(register.formData.firstName!'')}"  placeholder='${msg("register.firstName")}'/>
            </div>

            <div class="mb-3">
                    <input type="text" id="lastName" class="input-block" name="lastName" value="${(register.formData.lastName!'')}" placeholder='${msg("register.lastName")}' />
            </div>

            <div class="mb-3 ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                    <input type="text" id="email" class="input-block" name="email" value="${(register.formData.email!'')}" autocomplete="email" placeholder='${msg("register.email")}'/>
            </div>

          <#if !realm.registrationEmailAsUsername>
            <div class="mb-3 ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <input type="text" id="username" class="input-block" name="username" value="${(register.formData.username!'')}" autocomplete="username" placeholder='${msg("register.username")}'/>
            </div>
          </#if>

            <#if passwordRequired>
            <div class="mb-3 ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                    <input type="password" id="password" class="input-block" name="password" autocomplete="new-password" placeholder='${msg("register.password")}'/>
            </div>

            <div class="mb-3 ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                    <input type="password" id="password-confirm" class="input-block" name="password-confirm" placeholder='${msg("register.passwordConfirm")}'/>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="mb-3 font-sm">
                <input style="margin-bottom: 8px;" type="checkbox" id="exl-agree-tos" name="exl-agree-tos" required/>
                Acepto los <a href="https://exlinc.com/en/legal/#terms-of-service" rel="noopener" target="_blank">Terminos y condiciones.</a>
            </div>

            <div class="d-flex flex-row-reverse bd-highlight">
                <div class="p-2 bd-highlight">
                    <div id="kc-form-options">
                        <span><a href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a></span>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-row-reverse bd-highlight">
                <div class="p-2 bd-highlight">
                    <div id="kc-form-buttons">
                        <input class="btn btn-primary" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </div>
            </div>

        </form>
    </#if>
</@layout.registrationLayout>