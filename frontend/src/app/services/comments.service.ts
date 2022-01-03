// Déclaration de la Class comme étant un service avec le décorateur { Injectable }. 
import { Injectable } from '@angular/core';

// Import de "Observable" pour pouvoir l'utiliser.
import { Observable, of } from 'rxjs';

import { catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../environments/environment';

import { MessagesService } from './messages.service';
import { HttpResponse } from '../interfaces/HttpResponse.interface';


// Insersion d'un objet de configuration "ProvidedIn 'root'", pour que angular enregistre ce service
// à la racine de l'App afin d'assurer qu'il n'y a qu'une seule instance de ce service pour que toute
// l'App partage les meme données et la meme logique.
@Injectable({
  providedIn: 'root'
})


// Exportation du service qui est en fait une class qui a le nom de "CommentsService".
export class CommentsService {

  private commentUrl = `${environment.backendServer}/api/comment`;

  
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

  public newComment(postId: number, content: string): Observable<HttpResponse> {
    return this.httpClient.post(`${this.commentUrl}`, {postId, content}, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public deleteComment(commentId: number): Observable<HttpResponse> {
    return this.httpClient.delete(`${this.commentUrl}/${commentId}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }
}
