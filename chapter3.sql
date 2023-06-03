select * from 気象観測 where 月 = 6;
select * from 気象観測 where 月 <> 6;
select * from 気象観測 where 降水量 < 100;
select * from 気象観測 where 降水量 > 200;
select * from 気象観測 where 最高気温 >= 30;
select * from 気象観測 where 最低気温 <= 0;
select * from 気象観測 where 月 in (3, 5, 7);
select * from 気象観測 where 月 not in (3, 5, 7);
select * from 気象観測 where 降水量 <= 100 and 湿度 < 50;
select * from 気象観測 where 最低気温 < 5 or 最高気温 > 35;
select * from 気象観測 where 湿度 between 60 and 79;
select * from 気象観測 where 月 is null or 降水量 is null or 最高気温 is null or 最低気温 is null or 湿度 is null;

select * from 都道府県 where 都道府県名 like '%川';
select * from 都道府県 where 都道府県名 like '%島%';
select * from 都道府県 where 都道府県名 like '愛%';
select * from 都道府県 where 都道府県名 = 県庁所在地;
select * from 都道府県 where 都道府県名 <> 県庁所在地;

select * from 成績表;
insert into 成績表 values('S001', '織田　信長', 77, 55, 80, 75, 93);
INSERT INTO 成績表 VALUES ('A002', '豊臣　秀吉', 64, 69, 70, 0, 59, NULL);
INSERT INTO 成績表 VALUES ('E003', '徳川　家康', 80, 83, 85, 90, 79, NULL);
update 成績表 set 法学 = 85, 哲学 = 67 where 学籍番号 = 'S001';
update 成績表 set 外国語 = 81 where 学籍番号 = 'A002' or 学籍番号 = 'E003';

update 成績表 set 総合成績 = 'A' where 法学 >= 80 and 経済学 >= 80 and 哲学 >= 80 and 情報理論 >= 80 and 外国語 >= 80;
update 成績表 set 総合成績 = 'B' where 総合成績 is null and ((法学 >= 80 or 外国語 >= 80) and (経済学 >= 80 or 哲学 >= 80));
update 成績表 set 総合成績 = 'D' where 総合成績 is null and (法学 < 50 and 経済学 < 50 and 哲学 < 50 and 情報理論 < 50 and 外国語 < 50);
update 成績表 set 総合成績 = 'C' where 総合成績 is null;

delete from 成績表
  where 法学 = 0 or 経済学 = 0 or 哲学 = 0 or 情報理論 = 0 or 外国語 = 0;