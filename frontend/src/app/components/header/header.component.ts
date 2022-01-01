import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { NotificationsService } from '../../services/notifications.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})


// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class HeaderComponent implements OnInit {

  
  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (public) afin de pouvoir accéder au service depuis les components.
  constructor(
    public authService: AuthService,
    public notificationsService: NotificationsService
  ) { }

  // Initialisation de la propriété déclarée à partir du service.
  public ngOnInit(): void {
    this.authService.getCurrentUserInfo();
  }

  /*** Utilisation de la méthode de réaction "onLogout" à cet evenement ***/ 
  public onLogout(): void {
    this.authService.logoutUser();
  }
}
