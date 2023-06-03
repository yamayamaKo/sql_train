update 試験結果 set 午後1 = 平均点 * 4 - 86 - 68 - 91 where 受験者id = 'SW1046';
update 試験結果 set 論述 = 平均点 * 4 - 65 - 53 - 70 where 受験者id = 'SW1350';
update 試験結果 set 午前 = 平均点 * 4 - 59 - 56 - 36 where 受験者id = 'SW1877';

select 受験者id as 合格者ID from 試験結果
where
午前 >= 60 and
午後1 + 午後2 >= 120 and
論述 >= (午前 + 午後1 + 午後2) * 0.3;

update 回答者
set 国名 = case
when substring(メールアドレス, length(メールアドレス)-1, 2) = 'jp' then '日本'
when substring(メールアドレス, length(メールアドレス)-1, 2) = 'uk' then 'イギリス'
when substring(メールアドレス, length(メールアドレス)-1, 2) = 'cn' then '中国'
when substring(メールアドレス, length(メールアドレス)-1, 2) = 'fr' then 'フランス'
else 'ベトナム'
end

-- ちょい汚い
select trim(メールアドレス) as メールアドレス,
concat(
  substring(cast(年齢 as VARCHAR(30)), 1, 1)  || '0代',
  ':' ||
    case when 住居 = 'C' then '集合住宅' else '戸建て' end
) as 属性
from 回答者;

update 受注 set 文字数 = length(trim(文字));

select 受注日, 受注id, 文字数,
case 書体コード when '1' then 'ブロック体'
when '2' then '書記体'
when '3' then '草書体'
else '書体なし' end as 書体名,
case 書体コード when '1' then 100
when '2' then 150
when '3' then 200
else 100 end as 単価,
case when 文字数 >= 10 then 500 else 0 end
特別加工料 from 受注;
