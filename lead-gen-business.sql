# 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?

select monthname(billing.charged_datetime) as month, sum(billing.amount) as revenue
from billing
where charged_datetime between '2012-03-01' and '2012-03-31'
group by month;

# 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?

select billing.client_id, sum(billing.amount) as revenue
from billing
where billing.client_id = 2;

# 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?

select sites.client_id, sites.site_id, sites.domain_name 
from sites
where sites.client_id = 10;

# 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? 
# ¿Qué pasa con el cliente = 20?

select sites.client_id, count(sites.site_id) as 'number_of_websites', 
monthname(billing.charged_datetime) as 'month_created', year(billing.charged_datetime) as 'year_created'
from sites join billing on sites.client_id = billing.client_id
where sites.client_id = 1
group by billing.charged_datetime;

# 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de
# enero de 2011 y el 15 de febrero de 2011?

select leads.site_id, count(leads.leads_id) as 'leads', leads.registered_datetime from leads
where leads.registered_datetime between '2011-01-01' and '2011-02-15'
group by leads.site_id;

# 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado 
# para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?

select concat_ws(' ', clients.first_name, clients.last_name) as 'full_name', count(leads.leads_id) as num_leads, 
monthname(leads.registered_datetime) as 'month_created', year(leads.registered_datetime) as 'year_created'
from clients join sites on clients.client_id = sites.client_id
join leads on leads.site_id = sites.site_id
where leads.registered_datetime between '2011-01-01' and '2011-12-31'
group by clients.client_id;

# 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos 
# generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?

select concat_ws(' ', clients.first_name, clients.last_name) as 'full_name', count(leads.leads_id) as num_leads, 
monthname(leads.registered_datetime) as 'month_created', year(leads.registered_datetime) as 'year_created'
from clients join sites on clients.client_id = sites.client_id
join leads on leads.site_id = sites.site_id
where (month(leads.registered_datetime) between 01 and 06) and year(leads.registered_datetime) = 2011
group by leads.site_id;

# 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos 
# generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite 
# esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número
# total de clientes potenciales generados en cada sitio en todo momento.

select concat_ws(' ', clients.first_name, clients.last_name) as 'full_name', sites.domain_name as 'web_site',
count(leads.leads_id) as num_leads, monthname(leads.registered_datetime) as 'month_created', 
year(leads.registered_datetime) as 'year_created'
from clients join sites on clients.client_id = sites.client_id
join leads on leads.site_id = sites.site_id
where leads.registered_datetime between '2011-01-01' and '2011-12-31'
group by sites.domain_name;

select concat_ws(' ', clients.first_name, clients.last_name) as 'full_name', count(leads.leads_id) as num_leads, 
monthname(leads.registered_datetime) as 'month_created', year(leads.registered_datetime) as 'year_created',
sites.site_id, sites.domain_name
from clients join sites on clients.client_id = sites.client_id
join leads on leads.site_id = sites.site_id
group by sites.site_id;

# 9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de 
# cliente.

select clients.client_id, concat_ws(' ', clients.first_name, clients.last_name) as 'full_name', sum(billing.amount) as client_amount,
monthname(billing.charged_datetime) as 'month_created', year(billing.charged_datetime) as 'year_created'
from clients join billing on clients.client_id = billing.client_id
group by clients.client_id;

# 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila 
# muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee
# el cliente. (SUGERENCIA: use GROUP_CONCAT)

select clients.client_id, concat_ws(' ', clients.first_name, clients.last_name) as 'full_name', 
group_concat(sites.site_id separator ' / '), group_concat(sites.domain_name separator ' / ') as web_site
from clients join sites on clients.client_id = sites.client_id
group by clients.client_id;