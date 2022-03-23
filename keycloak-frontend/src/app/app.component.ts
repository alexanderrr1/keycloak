import { Component } from '@angular/core';
import { AuthConfig, NullValidationHandler, OAuthService } from 'angular-oauth2-oidc';
import { MessageService } from './services/message.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'keycloak-frontend';

  username: string='';
  isLogged: boolean=false;
  isAdmin: boolean=false;

  constructor(private oauthService : OAuthService, private messageService: MessageService){
    this.configure();
  }

  authConfig: AuthConfig = {
   
    issuer: 'http://localhost:8080/auth/realms/demo',
    redirectUri: window.location.origin ,
    clientId: 'gi-auth-webapp',
    responseType: 'code',
    scope: 'openid profile email offline_access',
    strictDiscoveryDocumentValidation: false,
    showDebugInformation: true,
  };

  configure(): void {
    this.oauthService.configure(this.authConfig);
    this.oauthService.tokenValidationHandler = new NullValidationHandler();
    this.oauthService.setupAutomaticSilentRefresh();
    this.oauthService.loadDiscoveryDocument().then(() => this.oauthService.tryLogin()
    .then(() => {
      if(this.oauthService.getIdentityClaims()){
        this.isAdmin = this.getIsAdmin();
        this.isLogged= this.getIsLogged();
        let claims: any = this.oauthService.getIdentityClaims();
        this.username = claims['preferred_username']
        this.messageService.sendMessage(this.username); 
      }
    })
    );
  }
  
  public getIsLogged(): boolean {
    return (this.oauthService.hasValidIdToken() && this.oauthService.hasValidAccessToken());
  }

  public getIsAdmin(): boolean {
    const token = this.oauthService.getAccessToken();
    const payload = token.split('.')[1];
    const payloadDecodedJson = atob(payload);
    const payloadDecoded = JSON.parse(payloadDecodedJson);
    console.log(payloadDecoded)
    return payloadDecoded.realm_access.roles.indexOf('front-admin') !== -1;
  }



}
