import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

// Pour l'utilisation de la Methode réactive lors de la création du formulaire 
import { FormsModule, ReactiveFormsModule } from '@angular/forms'; // <-- for NgModel


import { HttpClientModule } from '@angular/common/http';
import { ImageCropperModule } from 'ngx-image-cropper';
import { InfiniteScrollModule } from 'ngx-infinite-scroll';

import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { LoginComponent } from './components/auth/login/login.component';
import { SigninComponent } from './components/auth/signin/signin.component';
import { MessagesComponent } from './components/messages/messages.component';
import { HomeComponent } from './components/home/home.component';
import { UsersComponent } from './components/users/users.component';
import { ProfileComponent } from './components/profile/profile.component';
import { NotificationsComponent } from './components/notifications/notifications.component';
import { PostComponent } from './components/post/post.component';
import { FooterComponent } from './components/footer/footer.component';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    LoginComponent,
    SigninComponent,
    MessagesComponent,
    HomeComponent,
    UsersComponent,
    ProfileComponent,
    NotificationsComponent,
    PostComponent,
    FooterComponent
  ],

  imports: [
    BrowserModule,
    FormsModule,

    // Pour la création réactive de formulaire
    ReactiveFormsModule,
    
    HttpClientModule,
    AppRoutingModule,
    ImageCropperModule,
    InfiniteScrollModule
  ],

  providers: [],
  bootstrap: [AppComponent]
})

export class AppModule { }
