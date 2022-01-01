import { Component, OnInit } from '@angular/core';
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

  public signInForm: FormGroup;

  
  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private authService: AuthService,
    private formBuilder: FormBuilder,
  ) { }
  

  // Initialisation de la propriété déclarée à partir du service
  public ngOnInit(): void {
    this.initForm();
  }

  private initForm(): void {
    this.signInForm = this.formBuilder.group({
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
