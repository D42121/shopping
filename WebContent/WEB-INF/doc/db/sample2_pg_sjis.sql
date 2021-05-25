DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS ordered;
DROP TABLE IF EXISTS ordered_detail;

CREATE TABLE item
(
  code SERIAL PRIMARY KEY,
  category_code INTEGER,
  name TEXT,
  price INTEGER,
  detail TEXT
);
CREATE TABLE category
(
  code SERIAL PRIMARY KEY,
  name TEXT
);
CREATE TABLE customer
(
  code SERIAL PRIMARY KEY,
  name TEXT,
  address TEXT,
  tel TEXT,
  email TEXT
);
CREATE TABLE ordered
(
  code SERIAL PRIMARY KEY,
  customer_code INTEGER,
  ordered_date DATE,
  total_price INTEGER,
  delivery_date TEXT
);
CREATE TABLE ordered_detail
(
  ordered_code INTEGER,
  item_code INTEGER,
  num INTEGER
); 

INSERT INTO category(name) VALUES('本');
INSERT INTO category(name) VALUES('DVD');
INSERT INTO category(name) VALUES('ゲーム');

INSERT INTO item(category_code, name, price, detail) VALUES(1, 'Javaの基本', 2500, 'Java初心者の方に最初に手に取って欲しい一冊！！発売からあっという間に総計10万部到達した大人気シリーズ。「どうして? 」「なぜ? 」が絶対わかるJava入門書史上最強の定番書!');
INSERT INTO item(category_code, name, price, detail) VALUES(1, 'MLB Fun', 980, 'メジャーリーグを楽しむために今！知っておきたい注目選手をこの一冊に！！注目のトレード情報から期待のルーキーの情報まで。この一冊で今のメジャーリーグがすべてわかる！！');
INSERT INTO item(category_code, name, price, detail) VALUES(1, '料理BOOK!', 1200, '男ならこの一冊を持っておけ！！！シンプルで簡単なのに大満足できるレシピをこの一冊に！これであなたも料理男子の仲間入りだ！！！');

INSERT INTO item(category_code, name, price, detail) VALUES(2, 'なつかしのアニメシリーズ', 2000, 'あの頃の思い出がよみがえる！大人から子供まで楽しめる名作をついにシリーズ化！！感動の名作から青春の一部になった大人気アニメまで！懐かしの感動と情熱をもう一度．．．');
INSERT INTO item(category_code, name, price, detail) VALUES(2, 'The Racer', 1000, '負けられないレースがそこにはある。主人公のロックと親友でもありライバルでもあるマイクの二人が繰り広げる絆と情熱のカーレースストーリーがここにはある。');
INSERT INTO item(category_code, name, price, detail) VALUES(2, 'Space Wars 3', 1800, '大人気作の3作目！！地球を滅亡の危機から救うために次は火星への冒険へ出るピカタ。仲間と共に地球を救うことはできるのか！？？そしてついに黒幕の正体が．．．');
INSERT INTO item(category_code, name, price, detail) VALUES(3, 'パズルゲーム', 780, 'みんなでワイワイ！大人から子供まで楽しめるパズルゲーム！！大切なのは柔らかいアタマ！キミもこの難解のパズルゲームに挑もう！！！');
INSERT INTO item(category_code, name, price, detail) VALUES(3, 'Invader Fighter', 3400, 'あの名作がついにゲーム化！！宇宙からの侵略者から地球を守ろう！大切な仲間達と一緒に危機を乗り越えろ！！！！');
INSERT INTO item(category_code, name, price, detail) VALUES(3, 'Play the BascketBall', 2200, 'NBAへの挑戦！世界の強敵たちとの闘い。チームメイトと共に優勝を狙え！！！自分の個性とスキルを磨いて存在価値を証明しろ！！！');
