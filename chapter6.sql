select sum(降水量), avg(最高気温), avg(最低気温) from 都市別気象観測;

select sum(降水量), avg(最高気温), avg(最低気温)
from 都市別気象観測
where 都市名 = '東京';

select 都市名, avg(降水量), min(最高気温), max(最低気温)
from 都市別気象観測
group by 都市名;

select 月, avg(降水量) as 平均降水量,
avg(最高気温) as 平均最高気温, avg(最低気温) as 平均最低気温
from 都市別気象観測
group by 月
order by 月;

select 都市名, max(最高気温) as 最高気温
from 都市別気象観測
group by 都市名
having max(最高気温) >= 38;

select 都市名, min(最低気温) as 最低気温
from 都市別気象観測
group by 都市名
having min(最低気温) <= -10;

select count(社員名) from 入退室管理
where 退室 is null;

select 社員名, count(社員名) from 入退室管理
group by 社員名
order by count(社員名) desc;

select
case 事由区分 when '1' then 'メンテナンス'
when '2' then 'リリース作業'
when '3' then '障害対応'
else 'その他' end as 事由区分,
count(事由区分) from 入退室管理
group by 事由区分;

select 社員名, count(社員名) as 入室回数 from 入退室管理
group by 社員名 having count(社員名) > 10
-- 社員名じゃなくて退室の方が良いかもしれない

select 日付, count(社員名) from 入退室管理
where 事由区分 = '3'
group by 日付;
