// Déclaration de la Class comme étant un service avec le décorateur { Injectable }. 
import { Injectable } from '@angular/core';

// Import de "Observable" pour pouvoir l'utiliser.
import { Observable, of } from 'rxjs';

import { catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../environments/environment';

import { MessagesService } from './messages.service';
import { HttpResponse } from '../interfaces/HttpResponse.interface';

interface User {
  id: number;
  name: string;
  pictureurl: string;
}


// Insersion d'un objet de configuration "ProvidedIn 'root'", pour que angular enregistre ce service
// à la racine de l'App afin d'assurer qu'il n'y a qu'une seule instance de ce service pour que toute
// l'App partage les meme données et la meme logique.
@Injectable({
  providedIn: 'root'
})


// Exportation du service qui est en fait une class qui a le nom de "UserService".
export class UsersService {
  public users: User[];
  private userUrl = `${environment.backendServer}/api/user`;


  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (public & private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private httpClient: HttpClient,
    private messagesService: MessagesService,
  ) { }
  

  /** Log a message with the MessageService */
  private log(message: string): void {
    this.messagesService.add(message);
  }

  public getAllUsers(): void {
    this.httpClient.get(`${this.userUrl}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }))

      // Suscription pour pouvoir réagir à la réponse du serveur .      
      .subscribe((response: HttpResponse) => {
        
        if (response.status === 200) {
          this.users = response.body.users;
        } else {
          this.messagesService.add('Erreur: Impossible d\'afficher les utilisateurs');
        }
      });
  }

  public searchUsers(term: string): Observable<HttpResponse> {
    if (!term.trim()) {
      // Si la recherche est vide, recherche la totalité des utilisateurs
      return this.httpClient.get(`${this.userUrl}`, { withCredentials: true, observe: 'response' })
        .pipe(catchError(err => {
          this.log(`Erreur: ${err.statusText}`);
          return of(err);
        }));
    } else {
      return this.httpClient.get(`${this.userUrl}/search?name=${term}`, { withCredentials: true, observe: 'response' })
        .pipe(catchError(err => {
          this.log(`Erreur: ${err.statusText}`);
          return of(err);
        }));
    }
  }

  public getOneUser(id: number): Observable<HttpResponse> {
    return this.httpClient.get(`${this.userUrl}/${id}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public getAllPublicationsOfUser(id: number): Observable<HttpResponse> {
    return this.httpClient.get(`${this.userUrl}/${id}/posts`, { withCredentials: true, observe: 'response' })
    .pipe(catchError(err => {
      this.log(`Erreur: ${err.statusText}`);
      return of(err);
    }));
  }

  public updateOutline(id: number, outline: string): Observable<HttpResponse> {
    return this.httpClient.put(`${this.userUrl}/${id}/outline`, {outline}, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public updatePassword(id: number, oldPassword: string, newPassword: string): Observable<HttpResponse> {
    return this.httpClient.put(`${this.userUrl}/${id}/password`, {oldPassword, newPassword}, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public updateAdminRights(id: number, isadmin: number): Observable<HttpResponse> {
    return this.httpClient.put(`${this.userUrl}/${id}/admin`, {isadmin}, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public updatePicture(id: number, uploadData: FormData): Observable<HttpResponse> {
    return this.httpClient.put(`${this.userUrl}/${id}/picture`, uploadData, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public deleteUser(id: number): Observable<HttpResponse> {
    return this.httpClient.delete(`${this.userUrl}/${id}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }
}
