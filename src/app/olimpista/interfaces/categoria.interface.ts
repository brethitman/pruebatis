
export interface NivelCategoria {
  id:          number;
  nombre:      string;
  descripcion: string;
  area:        Area;
  createdAt:   Date;
  updatedAt:   Date;
}

export interface Area {
  id:        number;
  nombre:    string;
  costo:     string;
  createdAt: Date;
  updatedAt: Date;
}
