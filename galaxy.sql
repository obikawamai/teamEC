set names utf8;
set foreign_key_checks=0;

drop database if exists galaxy;
create database if not exists galaxy;

use galaxy;

create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint default 0 comment "性別",
email varchar(32) comment "メールアドレス",
status tinyint default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
)
default charset=utf8
comment="会員情報テーブル"
;

create table product_info(
id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) unique not null comment "商品名かな",
product_description varchar(255) comment "商品詳細",
category_id int not null comment "カテゴリID",
price int not null comment "値段",
image_file_path varchar(100) not null comment "画像ファイルパス",
image_file_name varchar(50) not null comment "画像ファイル名",
release_date datetime comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint default 1 comment "ステータス",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル";

create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="カート情報テーブル"
;

create table purchase_history_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "値段",
destination_id int not null comment "宛先情報ID",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;

create table destination_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) comment "メールアドレス",
tel_number varchar(13) comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id)
)
default charset=utf8
comment="宛先情報テーブル"
;

create table m_category(
id int primary key not null auto_increment comment "ID",
category_id int not null unique comment "カテゴリID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
)
default charset=utf8
comment="カテゴリマスタテーブル"
;
set foreign_key_checks=1;

insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",1,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());


INSERT INTO m_category (id,category_id,category_name,category_description,regist_date,update_date) VALUES
(1,1,"全てのカテゴリー","全てのカテゴリー",now(),now()),
(2,2,"本","本",now(),now()),
(3,3,"家電・PC","家電・PC",now(),now()),
(4,4,"おもちゃ","おもちゃ",now(),now()),
(5,5,"CD","CD",now(),now());


INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(1,1,'自己啓発本','じこけいはつぼん','人生のヒントを得られる本',2,1500,'./images/2_books/','book_keihatsu_jiko.jpg','2020/3/3','株式会社銀河',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(2,2,'英会話入門','えいかいわにゅうもん','初めての海外旅行におすすめ',2,1000,'./images/2_books/','study_english_ondoku.jpg','2020/3/4','株式会社銀河',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(3,3,'雑誌','ざっし','今春イチオシのコーディネート特集',2,690,'./images/2_books/','omake_zasshi_otona.jpg','2020/3/5','株式会社銀河',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(4,4,'六法全書','ろっぽうぜんしょ','令和２年版 六法全書',2,13000,'./images/2_books/','book_law_roppouzensyo.jpg','2020/3/6','株式会社銀河',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(5,5,'コミック','こみっく','メディアで話題の人気漫画・最新刊です',2,400,'./images/2_books/','entertainment_comic.jpg','2020/3/7','株式会社銀河',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(6,6,'ドライヤー','どらいやー','風量2㎥/分のパワフル仕様',3,3000,'./images/3_kaden_pc/','hair_drier.jpg','2020/03/03','ギャラクシー株式会社',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(7,7,'冷蔵庫','れいぞうこ','容量たっぷり120L',3,50000,'./images/3_kaden_pc/','kaden_reizouko.jpg','2020/02/03','マイナテック',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(8,8,'ドラム式洗濯機','どらむしきせんたくき','家族の洗濯をまとめてできる容量８kg	',3,120000,'./images/3_kaden_pc/','kaden_sentakuki.jpg','2020/01/03','マイナテック',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(9,9,'自動掃除ロボット','じどうそうじろぼっと','便利でかわいい掃除ロボット',3,80000,'./images/3_kaden_pc/','robot_soujiki.jpg','2019/12/03','日パナ',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(10,10,'ノートPC','のーとぱそこん','持ち運びに便利な14インチ',3,130000,'./images/3_kaden_pc/','kaden_laptop.jpg','2019/11/03','アノポ',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(11,11,'けん玉','けんだま','長さ（本体）16cm、大皿～子皿７cm、110ｇ',4,4000,'./images/4_toys_games/','omocha_kendama.jpg','2020/3/3','おもちゃカンパニー',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(12,12,'積み木','つみき','角が丸まってて危なくないです',4,600,'./images/4_toys_games/','omocha_tumiki.jpg','2020/3/4','おもちゃカンパニー',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(13,13,'ブロック','ぶろっく','小さいお子様でもつなげて遊べます！',4,1500,'./images/4_toys_games/','lego_block.jpg','2020/3/5','おもちゃカンパニー',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(14,14,'お手玉','おてだま','昔懐かしいお手玉です',4,300,'./images/4_toys_games/','omocha_otedama.jpg','2020/3/6','おもちゃカンパニー',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(15,15,'おもちゃのラッパ','おもちゃのらっぱ','お子様用のラッパ、黄色',4,2000,'./images/4_toys_games/','omocha_rappa.jpg','2020/3/7','おもちゃカンパニー',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(16,16,'MyBest CDアルバム','まいべすとしーでぃあるばむ','人気曲を集めたCDリラクゼーション',5,3000,'./images/5_CD/','cd_my_best_album.jpg','2020/3/3','株式会社A',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(17,17,'雨音CD リラクゼーション','あまねしーでぃりらくぜーしょん','気持ちを静めるリラクゼーションCD',5,3200,'./images/5_CD/','cd_amane.jpg','2020/3/4','株式会社B',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(18,18,'音楽用CD リラクゼーション','おんがくようしーでぃりらくぜーしょん','1回記録用CD-R',5,2800,'./images/5_CD/','cd_ongaku.jpg','2020/3/5','株式会社C',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(19,19,'オレンジCD アルバム','おれんじしーでぃあるばむ','甘酸っぱさを感じることのできる青春アルバム',5,2980,'./images/5_CD/','cd_orange.jpg','2020/3/6','株式会社D',1,now(),now());
INSERT INTO product_info (id,product_id,product_name,product_name_kana,product_description,category_id,price,image_file_path,image_file_name,release_date,release_company,status,regist_date,update_date) values(20,20,'紅葉CD アルバム','こうようしーでぃあるばむ','物悲しさを感じさせる心に語りかける曲を記録',5,3280,'./images/5_CD/','cd_kouyou.jpg','2020/3/7','株式会社E',1,now(),now());