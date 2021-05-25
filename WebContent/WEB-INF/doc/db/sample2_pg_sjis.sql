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

INSERT INTO category(name) VALUES('�{');
INSERT INTO category(name) VALUES('DVD');
INSERT INTO category(name) VALUES('�Q�[��');

INSERT INTO item(category_code, name, price, detail) VALUES(1, 'Java�̊�{', 2500, 'Java���S�҂̕��ɍŏ��Ɏ�Ɏ���ė~��������I�I�������炠���Ƃ����Ԃɑ��v10�������B������l�C�V���[�Y�B�u�ǂ�����? �v�u�Ȃ�? �v����΂킩��Java���发�j��ŋ��̒�ԏ�!');
INSERT INTO item(category_code, name, price, detail) VALUES(1, 'MLB Fun', 980, '���W���[���[�O���y���ނ��߂ɍ��I�m���Ă����������ڑI������̈���ɁI�I���ڂ̃g���[�h��񂩂���҂̃��[�L�[�̏��܂ŁB���̈���ō��̃��W���[���[�O�����ׂĂ킩��I�I');
INSERT INTO item(category_code, name, price, detail) VALUES(1, '����BOOK!', 1200, '�j�Ȃ炱�̈���������Ă����I�I�I�V���v���ŊȒP�Ȃ̂ɑ喞���ł��郌�V�s�����̈���ɁI����ł��Ȃ��������j�q�̒��ԓ��肾�I�I�I');

INSERT INTO item(category_code, name, price, detail) VALUES(2, '�Ȃ����̃A�j���V���[�Y', 2000, '���̍��̎v���o����݂�����I��l����q���܂Ŋy���߂閼������ɃV���[�Y���I�I�����̖��삩��t�̈ꕔ�ɂȂ�����l�C�A�j���܂ŁI�������̊����Ə�M��������x�D�D�D');
INSERT INTO item(category_code, name, price, detail) VALUES(2, 'The Racer', 1000, '�������Ȃ����[�X�������ɂ͂���B��l���̃��b�N�Ɛe�F�ł����胉�C�o���ł�����}�C�N�̓�l���J��L�����J�Ə�M�̃J�[���[�X�X�g�[���[�������ɂ͂���B');
INSERT INTO item(category_code, name, price, detail) VALUES(2, 'Space Wars 3', 1800, '��l�C���3��ځI�I�n����ŖS�̊�@����~�����߂Ɏ��͉ΐ��ւ̖`���֏o��s�J�^�B���ԂƋ��ɒn�����~�����Ƃ͂ł���̂��I�H�H�����Ă��ɍ����̐��̂��D�D�D');
INSERT INTO item(category_code, name, price, detail) VALUES(3, '�p�Y���Q�[��', 780, '�݂�ȂŃ��C���C�I��l����q���܂Ŋy���߂�p�Y���Q�[���I�I��؂Ȃ̂͏_�炩���A�^�}�I�L�~�����̓���̃p�Y���Q�[���ɒ������I�I�I');
INSERT INTO item(category_code, name, price, detail) VALUES(3, 'Invader Fighter', 3400, '���̖��삪���ɃQ�[�����I�I�F������̐N���҂���n������낤�I��؂Ȓ��ԒB�ƈꏏ�Ɋ�@�����z����I�I�I�I');
INSERT INTO item(category_code, name, price, detail) VALUES(3, 'Play the BascketBall', 2200, 'NBA�ւ̒���I���E�̋��G�����Ƃ̓����B�`�[�����C�g�Ƌ��ɗD����_���I�I�I�����̌��ƃX�L���𖁂��đ��݉��l���ؖ�����I�I�I');
