// Déclaration de la Class comme étant un service avec le décorateur { Injectable }. 
import { Injectable } from '@angular/core';


import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../environments/environment';

import { MessagesService } from './messages.service';
import { Notification } from '../interfaces/Notification.interface';
import { HttpResponse } from '../interfaces/HttpResponse.interface';


// Insersion d'un objet de configuration "ProvidedIn 'root'", pour que angular enregistre ce service
// à la racine de l'App afin d'assurer qu'il n'y a qu'une seule instance de ce service pour que toute
// l'App partage les meme données et la meme logique.
@Injectable({
  providedIn: 'root'
})


// Exportation du service qui est en fait une class qui a le nom de "NotificationsService".
export class NotificationsService {

  public notifications: Notification[];

  private notificationsUrl = `${environment.backendServer}/api/notif`;


  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private httpClient: HttpClient,
    private messagesService: MessagesService,
  ) { }

  /** Log a message with the MessageService */
  private log(message: string): void {
    this.messagesService.add(`Notifications: ${message}`);
  }

  public getNotifications(): void {
    this.httpClient.get(`${this.notificationsUrl}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }))
      .subscribe((response: HttpResponse) => {
        if (response.status === 200) {
          this.notifications = response.body.notifications;
        } else {
          this.log('Impossible de charger les notifications');
        }
      });
  }

  public deleteOneNotification(notificationId: number): Observable<HttpResponse> {
    return this.httpClient.delete(`${this.notificationsUrl}/${notificationId}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }

  public deleteAllNotifications(): Observable<HttpResponse> {
    return this.httpClient.delete(`${this.notificationsUrl}`, { withCredentials: true, observe: 'response' })
      .pipe(catchError(err => {
        this.log(`Erreur: ${err.statusText}`);
        return of(err);
      }));
  }
}
