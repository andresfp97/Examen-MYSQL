-- Encuentra el cliente que ha realizado la mayor cantidad de alquileres en los últimos 6 meses.
SELECT c.nombre , c.apellidos , COUNT(a.id_alquiler) as cantidad_alquiler
from cliente c 
join alquiler a  on a.id_cliente = c.id_cliente
group by c.nombre, c.apellidos 
ORDER  by cantidad_alquiler DESC  limit 1;

-- Lista las cinco películas más alquiladas durante el último año.

 SELECT p.titulo, count(p.id_pelicula) as cantidad_alquiladas
 from alquiler a 
 join  inventario i  on i.id_inventario  = a.id_inventario 
 join pelicula p  on p.id_pelicula  = i.id_pelicula 
 GROUP by p.titulo 
 having  YEAR (a.fecha_alquiler) > "2025"
  RDER by cantidad_alquiladas DESC limit 5;
  
 -- Obtén el total de ingresos y la cantidad de alquileres realizados
 -- por cada categoría de película.
 
  select  c.id_categoria, COUNT(a.id_alquiler) as cantidad_categoria,  SUM(p2.total) as total_categoria
  from  pelicula_categoria pc 
  join categoria c  on  c.id_categoria  = pc.id_categoria 
  join pelicula p on p.id_pelicula  = pc.id_pelicula 
  join inventario i on i.id_pelicula  = p.id_pelicula
  join  alquiler a on  a.id_inventario = i.id_inventario 
  join  pago p2  on p2.id_alquiler  = a.id_alquiler 
  group by c.id_categoria;
 
 
-- Encuentra a los clientes que han alquilado todas las películas de una misma categoría.
 
  select  c2.id_cliente
  from  pelicula_categoria pc 
  join categoria c  on  c.id_categoria  = pc.id_categoria 
  join pelicula p on p.id_pelicula  = pc.id_pelicula 
  join inventario i on i.id_pelicula  = p.id_pelicula
  join alquiler a on  a.id_inventario = i.id_inventario 
  join cliente c2 on c2.id_cliente = a.id_cliente
  where c.id_categoria  =   (select c.id_categoria  from categoria c)
   and a.id_cliente  = (SELECT id_pelicula from pelicula_categoria);
  
  
 -- Muestra las cinco categorías con menos alquileres registrados en el último año.
  
  select  c.nombre, COUNT(DISTINCT a.id_alquiler) as cantidad_alquiler
  from pelicula_categoria pc 
  join categoria c  on  c.id_categoria  = pc.id_categoria 
  join pelicula p on p.id_pelicula  = pc.id_pelicula 
  join inventario i on i.id_pelicula  = p.id_pelicula
  join alquiler a on  a.id_inventario = i.id_inventario 
  group by c.nombre
  order by cantidad_alquiler   limit 5;
 

 
-- Lista los clientes que no han realizado ningún alquiler en el último año.
 
  select  c2.id_cliente
  from  pelicula_categoria pc 
  join categoria c  on  c.id_categoria  = pc.id_categoria 
  join pelicula p on p.id_pelicula  = pc.id_pelicula 
  join inventario i on i.id_pelicula  = p.id_pelicula
  join alquiler a on  a.id_inventario = i.id_inventario 
  join  cliente c2 on c2.id_cliente = a.id_cliente
  where a.fecha_alquiler < "2024" ;
  
 
 -- Encuentra el cliente que ha realizado el alquiler más caro en el último año.
 
  select  c.nombre, p2.total
  from  pelicula_categoria pc 
  join categoria c  on  c.id_categoria  = pc.id_categoria 
  join pelicula p on p.id_pelicula  = pc.id_pelicula 
  join inventario i on i.id_pelicula  = p.id_pelicula
  join  alquiler a on  a.id_inventario = i.id_inventario 
  join  pago p2  on p2.id_alquiler  = a.id_alquiler 
  ORDER by p2.total DESC limit 1;
  
 
  
  