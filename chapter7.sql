insert into 頭数集計
(
  select 飼育県, count(個体識別番号) from 個体識別
  group by 飼育県
)

select 飼育県, 個体識別番号,
case 雌雄コード when '1' then '雄' else '雌' end
from 個体識別 
where 飼育県 in (
select 飼育県 from 頭数集計
order by 頭数 desc limit(3)
);

select * from 個体識別
where 母牛番号 in
(
  -- 乳牛の母牛の個体識別番号一覧
  select 個体識別番号 from 個体識別
  where 個体識別番号 in (
    select 母牛番号 from 個体識別
  ) and 品種コード = '01'
)

-- こっちで問題ない
select * from 個体識別
where 母牛番号 in
(
  -- 乳牛の個体識別番号一覧
  select 個体識別番号 from 個体識別
  where 品種コード = '01'
)
