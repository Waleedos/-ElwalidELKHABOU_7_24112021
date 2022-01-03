import { Component, OnInit } from '@angular/core';

// Import de ce qui est necessaire pour la création de formulaire.
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { AuthService } from '../../../services/auth.service';
import { MessagesService } from '../../../services/messages.service';

import { HttpResponse } from '../../../interfaces/HttpResponse.interface';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.scss']
})


// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class SigninComponent implements OnInit {


  // Création de l'objet formulaire (signInForm) de type (FormGroup) qui correspond à l'objet
  // formulaire créé dans le Template.
  public signInForm: FormGroup;


  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private authService: AuthService,
    private messagesService: MessagesService,

    // Injection de l'Outil (formBuilder) pour nous permettre de créer des formulaires 
    // ou des objets de type (formGroup) plus facilement
    private formBuilder: FormBuilder,
  ) { }

  
  // Initialisation de la propriété déclarée à partir du service.
  public ngOnInit(): void {
    this.initForm();
  }

  private initForm(): void {
    this.signInForm = this.formBuilder.group({

      // Initialisation du formulaire avec les 4 (Controles) qui seront présents dans 
      // le formulaire et avec utilisation du validator (required) 
      //qui va passer ces champs en "Valeur Requise", ainsi que le validator 
      // des adresses e-mail et des pattern. 
      name: ['', [Validators.required, Validators.pattern(/[A-Za-zÀ-ÖØ-öø-ÿ ]{3,50}/)]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{8,}/)]],
      passwordConfirmation: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{8,}/)]]
    }, {validator: this.checkIfMatchingPasswords('password', 'passwordConfirmation')});
  }

  private checkIfMatchingPasswords(passwordKey: string, passwordConfirmationKey: string): any {
    return (group: FormGroup) => {
      const passwordInput = group.controls[passwordKey];
      const passwordConfirmationInput = group.controls[passwordConfirmationKey];
      if (passwordInput.value !== passwordConfirmationInput.value) {
        return passwordConfirmationInput.setErrors({notEquivalent: true});
      }
      else {
          return passwordConfirmationInput.setErrors(null);
      }
    };
  }

  /*** Utilisation de la méthode de réaction "onSubmit" à cet evenement ***/
  public onSubmit(): void {
    const name: string = this.signInForm.get('name').value;
    const email: string = this.signInForm.get('email').value;
    const password: string = this.signInForm.get('password').value;
    this.authService.createNewUser(name, email, password)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {
        if (response.status === 201) {
          // utilisateur créé, il faut maintenant se connecter !
          this.authService.loginUser(email, password);
        } else {
          // Problème lors de l'ajout d'utilisateur
          this.messagesService.add(`Erreur: ${response.error.error}`);
        }
      });
  }

}
