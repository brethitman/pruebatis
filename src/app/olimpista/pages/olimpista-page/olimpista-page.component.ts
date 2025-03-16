import { Component, inject, OnInit, signal } from '@angular/core';
import { HeaderPageComponent } from "../../../ui/components/header-page/header-page.component";
import { OlimpistaElement } from '../../interfaces/olimpista-response';
import { GetOlimpistaResponse } from '../../interfaces/get-olimpista-response';
import { OlimpistaService } from '../../service/olimpista.service';
import { OlimpistaListComponent } from '../../components/olimpista-list/olimpista-list.component';
import { InscritosCardComponent } from '../../components/inscritos-card/inscritos-card.component';
import { Inscripcion } from '../../interfaces/get-inscripcion-response';
import { InscripcionService } from '../../service/inscripcion.service';
import { InscripcionElement } from '../../interfaces/inscripcion.interface';
import { InscritosListComponent } from '../../components/inscritos-list/inscritos-list.component';

@Component({
  selector: 'app-olimpista-page',
  standalone: true,
  imports: [HeaderPageComponent, OlimpistaListComponent, InscritosListComponent],
  templateUrl: './olimpista-page.component.html',
})
export class OlimpistaPageComponent implements OnInit {

  private olimpistaService = inject(OlimpistaService);

  public OlimpistaElement = signal<OlimpistaElement[]>([]);  // Cambiado de 'estudiante' a 'olimpista'

  private InscripcionService = inject(InscripcionService);
  public InscripcionElement = signal<InscripcionElement[]>([]);

  ngOnInit(): void {
    this.loadOlimpistas();
    this.loadInscripcion();
  }

  public loadOlimpistas() {
    this.olimpistaService.findAll()
      .subscribe(OlimpistaElement => {  // Cambiado de 'estudiantes' a 'olimpista'
        this.OlimpistaElement.set(OlimpistaElement);
      });
    console.log(this.OlimpistaElement);
  }


  public loadInscripcion() {
    this.InscripcionService.findAll()
      .subscribe((response) => {
        this.InscripcionElement.set(response);  // Se espera que response sea un array de InscripcionElement[]
      });

  }

}
