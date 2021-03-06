import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

// Import de ce qui est necessaire pour la création de formulaire.
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import { UsersService } from '../../services/users.service';
import { AuthService } from '../../services/auth.service';
import { MessagesService } from '../../services/messages.service';
import { ImageService } from '../../services/image.service';
import { PublicationsService } from 'src/app/services/publications.service';

import { UserDetails } from '../../interfaces/UserDetails.interface';
import { HttpResponse } from '../../interfaces/HttpResponse.interface';
import { Post } from '../../interfaces/Post.interface';
import { LikesService } from 'src/app/services/likes.service';
import { CommentsService } from 'src/app/services/comments.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})


// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class ProfileComponent implements OnInit {

  public userDetails: UserDetails;
  public passwordChangeForm: FormGroup;
  public posts: Post[];

  
  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (public & private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private route: ActivatedRoute,
    private usersService: UsersService,
    public authService: AuthService,
    private router: Router,

    // Injection de l'Outil (formBuilder) pour nous permettre de créer des formulaires 
    // ou des objets de type (formGroup) plus facilement
    private formBuilder: FormBuilder,
    private messagesService: MessagesService,
    public imageService: ImageService,
    private publicationsService: PublicationsService,
    private likesService: LikesService,
    private commentsService: CommentsService
  ) { }

  
  // Initialisation de la propriété déclarée à partir du service.
  public ngOnInit(): void {
    this.getUser();
    this.router.routeReuseStrategy.shouldReuseRoute = () => false;
    // ci dessus force  à récupérer les infos user, même si on on ne change que le paramètre de la route (= id utilisateur).
    this.initForm();
  }

  
  // Initialisation du formulaire de changement du mots de pass avec les deux (Controles) 
  // qui seront présents dans le formulaire et qui sont (l'ancien et le nouveau mots de Passe)
  // avec utilisation du validator required qui va passer ces champs en "Valeur Requise" et le
  // validateur (pattern) des conditions requises pour les mots de pass.
  private initForm(): void {
    this.passwordChangeForm = this.formBuilder.group({
      oldPassword: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{8,}/)]],
      newPassword: ['', [Validators.required, Validators.pattern(/[0-9a-zA-Z]{8,}/)]]
    });
  }

  /**
   * Récupération des informations de l'utilisateur affiché
   */
  private getUser(): void {

    // Utilisation du Type-Cast (+) pour transformer la chaine de caractères qui contients des nombres
    // en (Number).
    const id = +this.route.snapshot.paramMap.get('id');
    this.usersService.getOneUser(id)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 200) {
          this.userDetails = response.body;
          this.getPostsOfUser();
        } else {
          this.messagesService.add('Erreur: Impossible de charger le détail de cet utilisateur');
        }
      });
  }

  /**
   * Mise à jour de la description du profil utilisateur
   */

  /*** Utilisation de la méthode de réaction "onUpdate" à cet evenement ***/ 
  public onUpdateOutline(event: Event): void {
    if (event.target[0] && event.target[0].value !== '') {
      const newOutline: string = event.target[0].value;
      console.log (newOutline);
      this.usersService.updateOutline(this.userDetails.id, newOutline)

      // Suscription pour pouvoir réagir à la réponse du serveur .      
        .subscribe((response: HttpResponse) => {

          if (response.status === 201) {
            this.getUser();
            event.target[0].value = '';
          } else {
            this.messagesService.add(`Erreur: impossible de modifier votre description`);
          }
        });
    }
  }

  /**
   * Changement du mot de passe de l'utilisateur
   */
  
  /*** Utilisation de la méthode de réaction "onChange" à cet evenement ***/  
  public onChangePassword(): void {
    const { oldPassword, newPassword } = this.passwordChangeForm.value;
    if (newPassword && newPassword !== '' && oldPassword && oldPassword !== '') {
      this.usersService.updatePassword(this.userDetails.id, oldPassword, newPassword)

      // Suscription pour pouvoir réagir à la réponse du serveur .      
        .subscribe((response: HttpResponse) => {

          if (response.status === 201) {
            this.passwordChangeForm.reset();
            this.messagesService.add(`Votre mot de passe a bien été modifié`);
          } else {
            this.messagesService.add(`Erreur: ${response.error.error}`);
          }
        });
    }
  }

  /**
   * Suppression du profil, en 2 temps
   * - Click pour la suppression
   * - Click pour confirmer la suppressions
   */
  public onDeleteClicked(): void {
    document.getElementById('delete-confirm').classList.toggle('profile--delete-confirm__hidden');
  }
  
  /*** Utilisation de la méthode de réaction "onDelete" à cet evenement ***/  
  public onDeleteConfirmed(): void {
    this.usersService.deleteUser(this.userDetails.id)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.messagesService.add(`Vous avez bien supprimé votre compte`);
          this.router.navigate(['/login']);
          this.authService.user = null;
        } else {
          this.messagesService.add(`Erreur: ${response.error.error}`);
        }
      });
  }

  /**
   * Donner / Supprimer les droits d'admin
   */

  /*** Utilisation de la méthode de réaction "onChange" à cet evenement ***/ 
  public onChangeAdmin(isAdmin: number): void {
    this.usersService.updateAdminRights(this.userDetails.id, isAdmin)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status !== 201) {
          this.messagesService.add(`Erreur: ${response.error.error}`);
        }
        this.getUser();
      });
  }


  /**
   * Mise à jour de la photo de profil utilisateur
   * Utilisation de la librairie "ngx-image-cropper"
   */

  // à la validation, après le redimensionnement de l'image = envoi du fichier vers le backend
  // Donc la méthode onCroppedImage du service imageService ne sera pas utilisé
  public onCroppedImageDone(): void {
    const base64Image = this.imageService.croppedImage;
    const image = this.imageService.base64ToFile(base64Image, this.imageService.initialImage.name);
    const uploadData = new FormData();
    uploadData.append('image', image);
    this.usersService.updatePicture(this.userDetails.id, uploadData)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.getUser();
          this.authService.getCurrentUserInfo();
        } else {
          this.messagesService.add(`Une erreur s'est produite`);
        }
        document.getElementById('cropper').classList.add('hidden');
        this.imageService.initialImage = '';
        this.imageService.imageChangedEvent = '';
        this.imageService.croppedImage = '';
      });
  }

  /**
   * Récupérer toutes les publications de l'utilisateur
   */
  public getPostsOfUser(): void {
    this.usersService.getAllPublicationsOfUser(this.userDetails.id)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 200) {
          this.posts = response.body.posts;
        } else {
          this.messagesService.add(`Erreur: impossible de récupérer les publications de l'utilisateur`);
        }
      });
  }
  /**
   * Suppression d'une publication
   */

  /*** Utilisation de la méthode de réaction "onDelete" à cet evenement ***/
  public onDeletePublication(event: Event): void {
    const postId: number = parseInt(event.target[0].value, 10);
    this.publicationsService.deletePublication(postId)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.getPostsOfUser();
          this.messagesService.add(`Publication supprimée`);
        } else {
          this.messagesService.add(`Une erreur s'est produite`);
        }
      });
  }

  /**
   * Ajout d'un commentaire
   */

  /*** Utilisation de la méthode de réaction "onAddComment" à cet evenement ***/ 
  public onAddComment(event: Event): void {
    const content: string = event.target[0].value;
    const postId: number = parseInt(event.target[1].value, 10);
    this.commentsService.newComment(postId, content)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.getPostsOfUser();
        } else {
          this.messagesService.add(`Erreur: impossible d'ajouter ce commentaire`);
        }
      });
  }

  /**
   * Suppression d'un commentaire
   */

  /*** Utilisation de la méthode de réaction "onDelete" à cet evenement ***/
  public onDeleteComment(event: Event): void {
    const commentId: number = parseInt(event.target[0].value, 10);
    this.commentsService.deleteComment(commentId)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.getPostsOfUser();
        } else {
          this.messagesService.add(`Erreur: impossible de supprimer ce commentaire`);
        }
      });
  }

  /**
   * Like/dislike/annulation d'une publication
   */
  
  /*** Utilisation de la méthode de réaction "onlike" à cet evenement ***/   
  public onlike(event: Event): void {
    const postId: number = parseInt(event.target[0].value, 10);
    const rate: number = parseInt(event.target[1].value, 10);
    this.likesService.newRatePublication(postId, rate)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {
        
        if (response.status === 201) {
          this.getPostsOfUser();
        } else {
          this.messagesService.add(`Erreur: votre like/dislike n'a pas été pris en compte`);
        }
      });
  }

}
