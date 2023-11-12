/*-----1-----*/
With trans as(
select t.* , case when t.currency='USD' then 
t.sales_amount*75 else t.sales_amount end AS 'Normalised_amount'  from transactions t
where t.sales_amount > 0 and t.currency in ('USD','INR'))
select * from trans;

/*-----2-----*/
With trans as(
select t.* , case when t.currency='USD' then 
t.sales_amount*75 else t.sales_amount end AS 'Normalised_amount'  from transactions t
where t.sales_amount > 0 and t.currency in ('USD','INR'))
select SUM(a.Normalised_amount*a.sales_qty) as 'Total_Revenue' from trans a;


/*-----3-----*/
With trans as(
select t.* , case when t.currency='USD' then 
t.sales_amount*75 else t.sales_amount end AS 'Normalised_amount'  from transactions t
where t.sales_amount > 0 and t.currency in ('USD','INR'))
select SUM(a.sales_qty) as 'Total_Revenue' from trans a;

/*-----4-----*/
With trans as(
select t.* , case when t.currency='USD' then 
t.sales_amount*75 else t.sales_amount end AS 'Normalised_amount'  from transactions t
where t.sales_amount > 0 and t.currency in ('USD','INR'))
select m.zone,SUM(a.Normalised_amount*a.sales_qty) as 'Total_Revenue' from trans a,
markets m where m.markets_code=a.market_code
group by m.zone;

/*-----5-----*/
With trans as(
select t.* , case when t.currency='USD' then 
t.sales_amount*75 else t.sales_amount end AS 'Normalised_amount'  from transactions t
where t.sales_amount > 0 and t.currency in ('USD','INR'))
select a.product_code,a.Normalised_amount*a.sales_qty as 'Total_Revenue' from trans a
order by Total_revenue desc limit 50;

/*-----6-----*/
With trans as(
select t.* , case when t.currency='USD' then 
t.sales_amount*75 else t.sales_amount end AS 'Normalised_amount'  from transactions t
where t.sales_amount > 0 and t.currency in ('USD','INR'))
select a.product_code,a.Normalised_amount*a.sales_qty as 'Total_Revenue' from trans a
order by Total_revenue desc limit 50;



