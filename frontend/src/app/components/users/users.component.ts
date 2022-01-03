import { Component, OnInit } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { debounceTime, distinctUntilChanged, switchMap } from 'rxjs/operators';
import { HttpResponse } from 'src/app/interfaces/HttpResponse.interface';
import { MessagesService } from 'src/app/services/messages.service';


import { UsersService } from '../../services/users.service';


@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})


// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class UsersComponent implements OnInit {

  private searchTerms = new Subject<string>();


  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (public & private) afin de pouvoir accéder au service depuis les components.
  constructor(
    public usersService: UsersService,
    private messagesService: MessagesService
  ) { }

  
  // Initialisation et utilisation de la propriété déclarée à partir du service.
  public ngOnInit(): void {
    this.usersService.getAllUsers();

    this.searchTerms.pipe(

      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),
      
      // switch to new search observable each time the term changes avec la souscription
      // au service afin de pouvoir interagir avec la réponse du serveur
      switchMap((term: string) => this.usersService.searchUsers(term)),
    ).subscribe((response: HttpResponse) => {
      if (response.status === 200) {
        this.usersService.users = response.body.users;
      } else {
        this.messagesService.add('Erreur: Recherche impossible');
      }
    });
  }

  public searchUser(term: string): void {
    this.searchTerms.next(term);
  }

}
