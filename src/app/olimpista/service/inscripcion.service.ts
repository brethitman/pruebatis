import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { environment } from '../../../environments/environment.development';
import { map, Observable } from 'rxjs';
import { InscripcionElement } from '../interfaces/inscripcion.interface';

@Injectable({
  providedIn: 'root'
})
export class InscripcionService {

  private http = inject(HttpClient);

  // Método para obtener todas las inscripciones
  public findAll(): Observable<InscripcionElement[]> {
    return this.http.get<{ InscripcionElement: InscripcionElement[] }>(`${environment.apiUrl}/inscripcion`)
      .pipe(
        map((resp) => resp.InscripcionElement) // Accede al array de 'inscripcion' dentro de la respuesta
      );
  }
}
