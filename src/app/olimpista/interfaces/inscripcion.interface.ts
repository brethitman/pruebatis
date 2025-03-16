export interface InscripcionElement {
  id:        number;
  olimpista: Olimpista | null;
  area:      Area;
  tutor:     Tutor;
  estado:    string;
  createdAt: Date;
  updatedAt: Date;
}

export interface Area {
  id:        number;
  nombre:    string;
  costo:     string;
  createdAt: Date;
  updatedAt: Date;
}

export interface Olimpista {
  id:              number;
  nombres:         string;
  apellidos:       string;
  ci:              string;
  fechaNacimiento: Date;
  correo:          string;
  telefono:        string;
  colegio:         string;
  curso:           string;
  departamento:    string;
  provincia:       string;
  createdAt:       Date;
  updatedAt:       Date;
}

export interface Tutor {
  id:        number;
  nombres:   string;
  apellidos: string;
  ci:        string;
  correo:    string;
  telefono:  string;
  createdAt: Date;
  updatedAt: Date;
}
