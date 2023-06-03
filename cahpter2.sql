select コード, 地域, 都道府県名, 県庁所在地, 面積 from 都道府県;
select * from 都道府県;
select 地域 as area, 都道府県名 as prefecture from 都道府県;

insert into 都道府県(コード, 地域, 都道府県名, 県庁所在地, 面積) values ('26', '近畿', '京都', 4613);
insert into 都道府県 values ('37', '四国', '香川', '高松', 1876);
insert into 都道府県(コード, 都道府県名, 県庁所在地) values ('40', '福岡', '福岡');

update 都道府県 set 県庁所在地 = '京都' where コード = '26';
update 都道府県 set 地域 = '九州', 面積 = 4976 where コード = '40';

delete from 都道府県 where コード = '26';
