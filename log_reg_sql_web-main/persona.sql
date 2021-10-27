CREATE TABLE public."persona"
(
   id serial, 
   nombre character varying(250), 
   correo character varying(250), 
   telefono character varying(10), 
   password character varying(250), 
  direccion character varying(250), 
  genero character varying(1), 
   CONSTRAINT id PRIMARY KEY (id)
) 
WITH (
  OIDS = FALSE
)