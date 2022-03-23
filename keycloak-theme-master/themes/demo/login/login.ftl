<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section = "header">
        <div class="mb-4"> Inicio de sesión </div>
        <#elseif section = "form">
        <div id="kc-form">
        <div id="kc-form-wrapper">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <div class="mb-3">
                           <input class="input-block" tabindex="1" id="username" name="username" placeholder='${msg("loginUsernamePlaceholder")}' value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />

                            <#if messagesPerField.existsError('username','password')>
                                <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>

                        </div>
                    </#if>

                    <div class="mb-3">
                        <input class="input-block" tabindex="2" id="password" name="password" type="password" autocomplete="off" placeholder='${msg("loginPasswordPlaceholder")}'
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="d-flex flex-row-reverse bd-highlight">
                        <div class="p-2 bd-highlight">
                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                <div id="kc-form-options">
                                    <#if realm.rememberMe && !usernameHidden??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                    </div>
                                    <div>
                                        <#if realm.resetPasswordAllowed>
                                            <span class="label-block"><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                        </#if>
                                    </div>
                            </div>
                        </div>
                    </div>    
                    
                    <div class="d-flex flex-row-reverse bd-highlight">
                        <div class="p-2 bd-highlight">
                            <div id="kc-form-buttons">
                                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <input class="btn btn-primary mb-3 btn-sm" tabindex="4" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                            </div>
                        </div>
                    </div>

                </form>
            </#if>
            </div>

            <#if realm.password && social.providers??>
                <div id="kc-social-providers">
                    <hr/>
                    <ul class="ul-order">
                        <#list social.providers as p>
                            <#if p.alias=="google">
                                <a class="link-noStyle" id="social-${p.alias}" href="${p.loginUrl}">
                                    <div id="customBtn" class="customGPlusSignIn">
                                        <span class="icon google"></span>
                                    </div>
                                </a>
                            <#elseif p.alias=="facebook">
                                <a class="link-noStyle" id="social-${p.alias}" href="${p.loginUrl}">
                                    <div id="customBtn" class="customGPlusSignIn">
                                        <span class="icon facebook"></span>
                                    </div>    
                                </a>
                            <#elseif p.alias=="instagram">
                                <a class="link-noStyle" id="social-${p.alias}" href="${p.loginUrl}">
                                    <div id="customBtn" class="customGPlusSignIn">
                                        <span class="icon instagram"></span>
                                    </div>
                                </a>
                            <#else>
                                <a class="link-noStyle" id="social-${p.alias}" href="${p.loginUrl}">
                                    <div id="customBtn" class="customGPlusSignIn">
                                        <span class="icon"></span>
                                    </div>
                                </a>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
        <#elseif section = "info" >
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div>
                    <hr/>
                </div>
                <div id="kc-registration" class="center-text">
                    <span class="label-block">${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
            </#if>
        </#if>

</@layout.registrationLayout>
