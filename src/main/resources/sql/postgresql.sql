DROP DATABASE "SSM_db";
CREATE DATABASE "SSM_db"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Chinese (Simplified)_China.936'
       LC_CTYPE = 'Chinese (Simplified)_China.936'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE "SSM_db"
  IS '用于项目kevin。即ssm框架下的数据库';

- Schema: public

-- DROP SCHEMA public;

CREATE SCHEMA public
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public
  IS 'standard public schema';
  CREATE TABLE public.book
(
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(225) NOT NULL,
    typename VARCHAR(255) NOT NULL,
    price NUMERIC,
    state VARCHAR(10) DEFAULT '可借'
);
CREATE UNIQUE INDEX Book_title_uindex ON public.Book (title);
COMMENT ON COLUMN public.Book.id IS '书籍编号';
COMMENT ON COLUMN public.Book.title IS '书名';
COMMENT ON COLUMN public.Book.typename IS '类型';
COMMENT ON COLUMN public.Book.price IS '价格';

INSERT INTO book(
            id, title, typename, price, state)
    VALUES (1, '零基础学Java（全彩版）','计算机', 50.6, '可借'),
    (2, '轻量级Java EE企业应用实战', '软件工程', 85.30, '可借'),
    (3, 'Java并发编程的艺术', '软件工程', 45.40, '可借'),
    (4, '实战Java高并发程序设计', '软件开发', 45.1, '可借'),
    (5, 'Java程序员面试笔试宝典', '神话', 86.3,'借出'),
    (6, 'Java Web从入门到精通', '计算机',71.2, '可借'),
    (7, 'Java编程思想(第4版)', '计算机', 70.10,'借出'),
    (8, '深入理解JAVA虚拟机', '神话', 65.00,'可借'),
    (9, '从零开始写Java Web框架', '计算机', 63.2, '借出');

