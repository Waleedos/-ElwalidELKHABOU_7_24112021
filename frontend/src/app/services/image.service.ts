// Déclaration de la Class comme étant un service avec le décorateur { Injectable }. 
import { Injectable } from '@angular/core';


import { ImageCroppedEvent } from 'ngx-image-cropper';

import { MessagesService } from './messages.service';


// Insersion d'un objet de configuration "ProvidedIn 'root'", pour que angular enregistre ce service
// à la racine de l'App afin d'assurer qu'il n'y a qu'une seule instance de ce service pour que toute
// l'App partage les meme données et la meme logique.
@Injectable({
  providedIn: 'root'
})


// Exportation du service qui est en fait une class qui a le nom de "ImageService".
export class ImageService {

  public initialImage: any = ''; // Image avant le crop/resize
  public imageChangedEvent: any = '';
  public croppedImage: any = ''; // Image après le crop/resize (envoyée au backend)

  
  // Injection de Dépendance : Ajout au constructor de l'argument du type de service avec les modificateurs 
  // d'access (private) afin de pouvoir accéder au service depuis les components.
  constructor(
    private messagesService: MessagesService
  ) { }
  

  public fileChangeEvent(event: any): void {
    this.imageChangedEvent = event;
    this.initialImage = event.target.files[0];
  }

  public imageCropped(event: ImageCroppedEvent): void {
    this.croppedImage = event.base64;
  }

  public imageLoaded(): void {
    document.getElementById('cropper').classList.remove('hidden');
  }

  public loadImageFailed(): void {
    this.messagesService.add(`Erreur lors du chargement de l'image`);
  }

  // Transformation de l'image base64 (donnée par "ngx-image-cropper") en fichier exploitable
  public base64ToFile(dataurl: string, filename: string): File {
    const arr = dataurl.split(',');
    const mime = arr[0].match(/:(.*?);/)[1];
    const bstr = atob(arr[1]);
    let n = bstr.length;
    const u8arr = new Uint8Array(n);
    while (n--){
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new File([u8arr], filename, {type: mime});
  }
  
  public onCroppedImageDone(): void {
    document.getElementById('cropper').classList.add('hidden');
  }
}
