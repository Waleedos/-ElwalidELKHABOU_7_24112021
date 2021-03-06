import { Component, OnInit } from '@angular/core';

import { PublicationsService } from '../../services/publications.service';
import { AuthService } from '../../services/auth.service';
import { MessagesService } from '../../services/messages.service';
import { CommentsService } from '../../services/comments.service';
import { LikesService } from '../../services/likes.service';
import { ImageService } from '../../services/image.service';

import { Post } from '../../interfaces/Post.interface';
import { HttpResponse } from '../../interfaces/HttpResponse.interface';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})


// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class HomeComponent implements OnInit {

  public posts: Post[]; // Posts affichés actuellement
  // NB: this.posts.length = nombre de posts actuellement affichés
  private postsBatch = 2; // Nombre de post supplémentaires qui seront chargés lorsqu'on arrive en bas de page (infinite scroll)



  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (public & private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private publicationsService: PublicationsService,
    public authService: AuthService,
    private messagesService: MessagesService,
    private commentsService: CommentsService,
    private likesService: LikesService,
    public imageService: ImageService
  ) { }
  

  // Initialisation de la propriété déclarée à partir du service.
  public ngOnInit(): void {
    this.getPostsFromStart(this.postsBatch);
  }

  /*** Récupérer tous les posts, avec leurs commentaires et leur likes/dislikes  */
  // Récupérer tous les posts depuis le début jusqu'au chargement actuel
  private getPostsFromStart(numberOfPosts: number): void {
    this.publicationsService.getPublications(numberOfPosts, 0)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {
        if (response.status === 200) {
          this.posts = response.body.posts;
        } else {
          this.messagesService.add('Erreur: Impossible de récupérer les publications');
        }
      });
  }
  // charger de nouveaux posts petit à petit
  private getOtherPosts(limit: number, offset: number): void {
    this.publicationsService.getPublications(limit, offset)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {
        if (response.status === 200) {
          const oldPosts: Post[] = this.posts;
          const newPosts: Post[] = response.body.posts;
          this.posts = oldPosts.concat(newPosts);
        } else {
          this.messagesService.add('Erreur: Impossible de récupérer les publications');
        }
      });
  }

  /**
   * Récupération des posts au scroll de la page (pour infinite scroll)
   */
  public onScroll(): void {
    this.getOtherPosts(this.postsBatch, this.posts.length);
  }

  /**
   * Publication d'un nouveau post
   */

  /*** Utilisation de la méthode de réaction "onSubmit" à cet evenement ***/  
  public onSubmitNewPost(event: Event): void {
    const content: string = event.target[0].value;
    const base64Image = this.imageService.croppedImage;
    const formData = new FormData();
    if (!content && !base64Image) {
      return this.messagesService.add(`Vous devez publier un texte ou une image, ou les 2!`);
    }
    if (base64Image) {
      const image = this.imageService.base64ToFile(base64Image, this.imageService.initialImage.name);
      formData.append('image', image);
    }
    formData.append('content', content);

    this.publicationsService.newPublication(formData)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {
        if (response.status === 201) {
          this.getPostsFromStart(this.posts.length);
          this.messagesService.add(`Publication ajoutée`);
          // reset du formulaire
          event.target[0].value = '';
          this.imageService.initialImage = '';
          this.imageService.imageChangedEvent = '';
          this.imageService.croppedImage = '';
        } else {
          this.messagesService.add(`Une erreur s'est produite`);
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
          this.getPostsFromStart(this.posts.length);
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
          this.getPostsFromStart(this.posts.length);
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
          this.getPostsFromStart(this.posts.length);
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
          this.getPostsFromStart(this.posts.length);
        } else {
          this.messagesService.add(`Erreur: votre like/dislike n'a pas été pris en compte`);
        }
      });
  }

}
