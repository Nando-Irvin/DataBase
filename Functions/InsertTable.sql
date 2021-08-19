/* You create a function with the instruction*/

Create or replace function insertgps()
Returns trigger as $ingps$
Declare begin
insert into gps (imei_gps, modelo, sim_card, id_carro) values ( 000000, 'ninguno', 000000, new.id_carro);
return null;
end;
$ingps$ language plpgsql;

/* then you create a trigger for when you want to execute the function */

Create trigger function
After insert on carros
for each row
Execute procedure insertgps(); 
