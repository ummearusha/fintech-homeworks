-- How can you isolate (or group) the transactions of each cardholder?
create view cardholder_transactions as
select ch.id as id_card_holder, ch.name as name_card_holder, cc.card as card, t.id as transaction_id, t.date as date, t.amount as amount, t.id_merchant as id_merchant 
from card_holder ch, credit_card cc, transaction t
where ch.id = cc.id_card_holder
and   cc.card = t.card order by ch.id asc, cc.card asc, t.date asc ;

select *
from cardholder_transactions;

--Consider the time period 7:00 a.m. to 9:00 a.m.
--What are the 100 highest transactions during this time period?
create or replace view highest_transactions as
select *
from transaction t
where extract('hour' from date) >= 7 and extract('hour' from date) < 9
order by t.amount desc
limit 100;


select *
from highest_transactions

--Do you see any fraudulent or anomalous transactions?
-- Answer in READ.me
--If you answered yes to the previous question, explain why you think there might be
--fraudulent transactions during this time frame.
-- Answer in READ.me
--Finding 1	From the list, 90% of the transactions are valued between 11 and 23 dollars where we have 8% of the transactions above 1000 dollars.
--Finding 2	From the top 8 transactions over 1000 dollars, 4761049645711550000 is a heavy spender.
--From this dataset, it looks like any transaction over 100 dollars is unusual transaction.


--Count the transactions that are less than $2.00 per cardholder
create or replace view least_transactions as
select card, count(*)
from transaction t 
where t.amount <= 2.00
group by(card)
order by count(*) desc;

select *
from least_transactions






--What are the top five merchants prone to being hacked using small transactions?
create or replace view top_merchants as
select m.id, m.name, count(*)
from merchant m, transaction t
where m.id = t.id_merchant
and t.amount <= 2.00
group by(m.id) 
order by count(*) desc
limit 5;

select *
from top_merchants

--Once you have a query that can be reused, create a view for each of the previous
--queries.

select *
from card_holder ch, credit_card cc, transaction t
where cc.card = t.card 
and ch.id = cc.id_card_holder  
and ch.id in (18,2) ;
-- card holder 2
select t.date,t.amount 
from card_holder ch, credit_card cc, transaction t 
where cc.card = t.card and ch.id = cc.id_card_holder  and ch.id = 2
order by date asc;

-- card holder 18
select t.date,t.amount 
from card_holder ch, credit_card cc, transaction t 
where cc.card = t.card and ch.id = cc.id_card_holder  and ch.id = 18
order by date asc;

-- loading data of daily transactions from jan to jun 2018 for card holder 25

select date_trunc('day' , t.date), ch.id, t.amount, t.card 
from  transaction t, card_holder ch, credit_card cc
where cc.card = t.card and ch.id = cc.id_card_holder and ch.id = 25 
and extract('month' from date) >= 1 and extract('month' from date) < 6
order by t.date;

select date_trunc('day', date ) from transaction t

