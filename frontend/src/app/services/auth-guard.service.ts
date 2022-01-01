// Déclaration de la Class comme étant un service avec le décorateur { Injectable }. 
import { Injectable } from '@angular/core';

import { catchError, map } from 'rxjs/operators';
import { CanActivate, Router } from '@angular/router';
import { Observable, of } from 'rxjs';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../environments/environment';
import { AuthService } from './auth.service';


// Insersion d'un objet de configuration "ProvidedIn 'root'", pour que angular enregistre ce service
// à la racine de l'App afin d'assurer qu'il n'y a qu'une seule instance de ce service pour que toute
// l'App partage les meme données et la meme logique.
@Injectable({
  providedIn: 'root'
})


// Implémentation de l'interface "CanActivate" avec l'exportation du service qui est en fait 
// une class qui a le nom de "AuthGuardService".
export class AuthGuardService implements CanActivate {

  private backendServer = environment.backendServer;


  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private router: Router,
    private httpClient: HttpClient,
    private authService: AuthService
    ) { }

    
  public canActivate(): Observable<boolean>|Promise<boolean>|boolean {
    return this.httpClient.get(`${this.backendServer}/api/user/isauth`, { withCredentials: true })
      .pipe(
        catchError(err => {
          this.router.navigate(['/login']);
          this.authService.user = undefined;
          return of(false);
        }),
        map(res => {
          return true;
        })
      );
  }
}
