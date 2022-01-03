import { Component, OnInit } from '@angular/core';

// Import de ce qui est necessaire pour la création de formulaire.
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { AuthService } from '../../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class LoginComponent implements OnInit {

  // Création de l'objet formulaire (signInForm) de type (FormGroup) qui correspond à l'objet
  // formulaire créé dans le Template.
  public signInForm: FormGroup;

  
  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private authService: AuthService,

    // Injection de l'Outil (formBuilder) pour nous permettre de créer des formulaires 
    // ou des objets de type (formGroup) plus facilement
    private formBuilder: FormBuilder,
  ) { }
  

  // Initialisation de la propriété déclarée à partir du service
  public ngOnInit(): void {
    this.initForm();
  }

  // Initialisation du formulaire avec les deux (Controles) qui seront présents dans le formulaire
  // et qui sont (E-mail) et (Mots de Passe) avec utilisation du validator required qui va passer
  // ce champs en "Valeur Requise".
  private initForm(): void {
    this.signInForm = this.formBuilder.group({

      // utilisation du validator (required) qui va passer ces deux champs en "Valeur Requise" 
      // ainsi que le validator des adresses e-mail et des pattern.
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{8,}/)]]
    });
  }

  /*** Utilisation de la méthode de réaction "onSubmit" à cet evenement ***/ 
  public onSubmit(): void {
    const { email, password } = this.signInForm.value;
    this.authService.loginUser(email, password);
  }

}
