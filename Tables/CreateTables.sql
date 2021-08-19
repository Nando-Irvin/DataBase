/*Creating two simple tables in MySQL*/

create table usuarios(
id_usuario serial not null primary key,
usuario character varying not null,
pass_usu character varying  not null,
tipo_usu character varying not null,
nombre character varying not null,
apellido_p character varying not null,
apellido_m character varying not null
);

create table carros(
id_carro serial not null primary key,
placa character varying not null unique,
marca character varying not null,
submarca character varying not null,
modelo character varying not null,
color character varying not null,
no_serie int not null,
adscripcion character varying
);

/*Creating a simple table and adding a timestamp*/

create table movimientos(
id_movimiento serial not null primary key,
tabla character varying not null,
movimiento character varying not null,
dato_original character varying,
nuevo_dato character varying,
fecha_hora TIMESTAMP DEFAULT now()
);

/*Creating a table with a foreign key using the table 'carros' */

create table citas(
id serial not null primary key,
placa character varying,
body text,
url character varying,
clase character varying not null,
start_c character varying not null,
end_c character varying not null,
inicio_normal character varying not null,
final_normal character varying not null,
constraint placafk foreign key(placa)
references carros(placa)
);
