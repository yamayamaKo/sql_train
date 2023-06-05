select a1, a2, b1, b2 from a join b on a.a1 = b.b1;

select * from b join a on b.b2 = a.a1;

select * from b left join a on b.b2 = a.a1;

select a.a1, c.a2, b1, b2 from a join b on a.a1 = b.b1 join a as c on b.b1 = c.a1;

select 社員番号, 社員.名前, 部署.名前 from 社員 join 部署 on 社員.部署id = 部署.部署id;

select a.社員番号, a.名前, b.名前
from 社員 as a left join 社員 as b on
a.上司id = b.社員番号;

select 社員番号, 社員.名前, 部署.名前, 支店.名前
from 社員 join 部署 on 社員.部署id = 部署.部署id
join 支店 on 社員.勤務地id = 支店.支店id;

select 支店.支店ID, 支店.名前 as 支店名, 社員.名前 as 支店長名, 社員数
from 支店 join 社員 on 支店.支店長ID = 社員.社員番号
join (
  select 勤務地ID, count(*) as 社員数 from 社員 group by 勤務地ID
) as 勤務地ごとの社員数 on 社員.勤務地ID = 勤務地ごとの社員数.勤務地ID

-- 勤務地IDだけど
select 従業員.社員番号, 従業員.名前,
従業員.勤務地ID as 本人勤務地, 上司.勤務地ID as 上司勤務地 from
社員 as 従業員 join 社員 as 上司 on
従業員.上司ID = 上司.社員番号 and 従業員.勤務地ID <> 上司.勤務地ID

-- 勤務地名。汚え。
select 従業員.社員番号, 従業員.名前,
従業員.支店名 as 本人勤務地, 上司.支店名 as 上司勤務地 from
(select 社員.社員番号, 社員.名前, 社員.上司ID,
社員.勤務地ID, 支店.名前 as 支店名
from 社員 join 支店 on 社員.勤務地ID = 支店.支店ID)
as 従業員 join
(select 社員.社員番号, 社員.名前, 社員.上司ID,
社員.勤務地ID, 支店.名前 as 支店名
from 社員 join 支店 on 社員.勤務地ID = 支店.支店ID) as 上司 on
従業員.上司ID = 上司.社員番号 and 従業員.勤務地ID <> 上司.勤務地ID

-- 回答の書き方
-- joinを複数している。こっちの方が理解しやすいかも？？
select 従業員.社員番号, 従業員.名前 as 社員名,
従業員支店.名前 as 従業員勤務地, 上司支店.名前 as 上司勤務地
from 社員 as 従業員
join 社員 as 上司
  on 従業員.上司ID = 上司.社員番号
  and 従業員.勤務地ID <> 上司.勤務地ID
join 支店 as 従業員支店
  on 従業員.勤務地ID = 従業員支店.支店ID
join 支店 as 上司支店
  on 上司.勤務地ID = 上司支店.支店ID
