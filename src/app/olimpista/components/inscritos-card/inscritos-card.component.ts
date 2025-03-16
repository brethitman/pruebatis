import { Component, Input } from '@angular/core';
import { InscripcionElement } from '../../interfaces/inscripcion.interface';

@Component({
  selector: 'app-inscritos-card',
  standalone: true,
  imports: [],
  templateUrl: './inscritos-card.component.html',
})
export class InscritosCardComponent {


    @Input({required:true})
    InscripcionElement!:InscripcionElement;


}
