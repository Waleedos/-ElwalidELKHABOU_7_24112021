// Déclaration de la Class comme étant un service avec le décorateur { Injectable }. 
import { Injectable } from '@angular/core';


// Insersion d'un objet de configuration "ProvidedIn 'root'", pour que angular enregistre ce service
// à la racine de l'App afin d'assurer qu'il n'y a qu'une seule instance de ce service pour que toute
// l'App partage les meme données et la meme logique.
@Injectable({
  providedIn: 'root'
})


// Exportation du service qui est en fait une class qui a le nom de "MessagesService".
export class MessagesService {

  constructor() { }

  public messages: string[] = [];

  public add(message: string): void {
    this.messages.push(message);
  }

  public clear(): void {
    this.messages = [];
  }
}
