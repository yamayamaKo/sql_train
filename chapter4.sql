select * from 注文履歴 order by 注文番号, 注文枝番;
select distinct 商品名 from 注文履歴 where 日付 >= '2022-01-01' and 日付 <= '2022-01-31';
select 注文番号, 注文枝番, 注文金額 from 注文履歴 where 分類 = '1'
order by 注文金額 asc limit 3 offset 1;

select 日付, 商品名, 単価, 数量, 注文金額 from 注文履歴
where 分類 = '3' and 数量 >= 2
order by 日付, 数量 desc;

select 分類, 商品名, サイズ, 単価 from 注文履歴
where 分類 = '1' union
select 分類, 商品名, null, 単価 from 注文履歴
where 分類 = '2' union
select 分類, 商品名, null, 単価 from 注文履歴
where 分類 = '3' order by 分類, 商品名;

select * from 奇数 union select * from 偶数 order by 値;
select * from 整数 except select * from 偶数 order by 値;
select * from 整数 INTERSECT select * from 偶数 order by 値;
select * from 奇数 intersect select * from 偶数;
