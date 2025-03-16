import { Component, Input } from '@angular/core';

import { OlimpistaElement } from '../../interfaces/olimpista-response';

@Component({
  selector: 'app-olimpista-card',
  standalone:true,
  imports: [],
  templateUrl: './olimpista-card.component.html',
})

export class OlimpistaCardComponent {

  @Input({required:true})
    OlimpistaElement!:OlimpistaElement;
}
