import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import { PublicationsService } from 'src/app/services/publications.service';
import { Post } from 'src/app/interfaces/Post.interface';
import { AuthService } from 'src/app/services/auth.service';
import { MessagesService } from 'src/app/services/messages.service';
import { LikesService } from 'src/app/services/likes.service';
import { CommentsService } from 'src/app/services/comments.service';

import { HttpResponse } from '../../interfaces/HttpResponse.interface';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.scss']
})


// Déclaration des propriétés avec implémentation de l'interface "ngOnInit" du component
// pour respecter les methodes utilisées.
export class PostComponent implements OnInit {

  private postId: number;
  public post: Post;


  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (public & private) afin de pouvoir accéder au service depuis les components et récupérer les
  // informations requis.
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private publicationsService: PublicationsService,
    public authService: AuthService,
    private messagesService: MessagesService,
    private likesService: LikesService,
    private commentsService: CommentsService
  ) { }

  
  // Initialisation de la propriété déclarée à partir du service.
  public ngOnInit(): void {

    // Utilisation du Type-Cast (+) pour transformer la chaine de caractères qui contients des nombres
    // en (Number).
    this.postId = +this.route.snapshot.paramMap.get('id');
    this.getPublication();
  }

  private getPublication(): void {
    this.publicationsService.getOnePublication(this.postId)
      .subscribe((response: HttpResponse) => {
        if (response.status === 200) {
          this.post = response.body.post[0];
        } else {
          this.messagesService.add(`Erreur: Impossible de récupérer la publication`);
        }
      });
  }

  /*** Utilisation de la méthode de réaction "onDelete" à cet evenement ***/  
  public onDeletePublication(): void {
    this.publicationsService.deletePublication(this.postId)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.messagesService.add(`Publication supprimée`);
          this.router.navigate(['/home']);
        } else {
          this.messagesService.add(`Une erreur s'est produite`);
        }
      });
  }

  /*** Utilisation de la méthode de réaction "onlike" à cet evenement ***/   
  public onlike(event: Event): void {
    const postId = this.postId;
    const rate: number = parseInt(event.target[1].value, 10);
    this.likesService.newRatePublication(postId, rate)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.getPublication();
        } else {
          this.messagesService.add(`Erreur: votre like/dislike n'a pas été pris en compte`);
        }
      });
  }

  /*** Utilisation de la méthode de réaction "onAddComment" à cet evenement ***/ 
  public onAddComment(event): void {
    const content: string = event.target[0].value;
    const postId: number = parseInt(event.target[1].value, 10);
    this.commentsService.newComment(postId, content)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {

        if (response.status === 201) {
          this.getPublication();
        } else {
          this.messagesService.add(`Erreur: impossible d'ajouter ce commentaire`);
        }
      });
  }

  /*** Utilisation de la méthode de réaction "onDelete" à cet evenement ***/
  public onDeleteComment(event): void {
    const commentId: number = parseInt(event.target[0].value, 10);
    this.commentsService.deleteComment(commentId)

      // Suscription pour pouvoir réagir à la réponse du serveur .    
      .subscribe((response: HttpResponse) => {
        
        if (response.status === 201) {
          this.getPublication();
        } else {
          this.messagesService.add(`Erreur: impossible de supprimer ce commentaire`);
        }
      });
  }

}
