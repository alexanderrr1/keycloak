import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { HttpClientModule } from '@angular/common/http';
import { OAuthModule } from 'angular-oauth2-oidc';
import { FormsModule } from '@angular/forms';
import { HomeComponent } from './home/home.component';
import { MenuComponent } from './menu/menu.component';
import { ListaComponent } from './foo/lista/lista.component';
import { DetailComponent } from './foo/detail/detail.component';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    MenuComponent,
    ListaComponent,
    DetailComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    OAuthModule.forRoot({
      resourceServer: {
          allowedUrls: ['http://localhost:8090/foo'],
          sendAccessToken: true
      }
  })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
