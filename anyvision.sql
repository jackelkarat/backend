PGDMP     #    	            	    w        	   anyvision    10.10    10.10     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �
           1262    16395 	   anyvision    DATABASE     �   CREATE DATABASE anyvision WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Hebrew_Israel.1255' LC_CTYPE = 'Hebrew_Israel.1255';
    DROP DATABASE anyvision;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    16397    users    SCHEMA        CREATE SCHEMA users;
    DROP SCHEMA users;
             postgres    false                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                        0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16438    links    TABLE     d   CREATE TABLE public.links (
    id integer NOT NULL,
    link character(255),
    userid integer
);
    DROP TABLE public.links;
       public         postgres    false    3            �            1259    16436    links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.links_id_seq;
       public       postgres    false    200    3                       0    0    links_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;
            public       postgres    false    199            �            1259    16419    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    firstname character(255),
    lastname character(255),
    email character(255),
    password character(255)
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    16417    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    198    3                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    197            w
           2604    16441    links id    DEFAULT     d   ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);
 7   ALTER TABLE public.links ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    200    200            v
           2604    16422    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197    198            �
          0    16438    links 
   TABLE DATA               1   COPY public.links (id, link, userid) FROM stdin;
    public       postgres    false    200   �       �
          0    16419    users 
   TABLE DATA               I   COPY public.users (id, firstname, lastname, email, password) FROM stdin;
    public       postgres    false    198   �                  0    0    links_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.links_id_seq', 15, true);
            public       postgres    false    199                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 17, true);
            public       postgres    false    197            {
           2606    16443    links links_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.links DROP CONSTRAINT links_pkey;
       public         postgres    false    200            y
           2606    16427    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    198            �
   �   x���[� �oXE7P,�����A$Qi����N���@ҹ+���u8�{͏,j7��٩ٙQ��2�g���4@��ս�GR��0(���-ug-k�ԅD0h:���\$Z0��=XF��!L�*n���\�����0���V�V3-u�Vq�� �a����_�I���_I�p��X/%�+ʋ]�	Na���m$$u�8�"����'��~ �+@      �
     x��KR�0DףSP�����'�l��-91D��HJRe.�Y��}�֯53�J�]�p�avݩ���!ŭ�q���Ms�/iU��ʪn�;ib���2�eB�0}��*�H�������Z��TM��GZ�$�F3ir�b f�(�^����y/-EՐ3�I@p��!w ��u�5{օ�,����� [bm¯��HA��L_�A �~�����#�aW��4}M�*� ��󴴬C� ��%��>@X�^��d��o�:�H�wVZ�����^m@ZН!���D� �� � �9@��m���p1@� �E��)lh��}�6�R`����-�p��ܤ% ����0`u%�#V�/�e��l��-�"�W^��Z �lt�MJ����:P����:[ ��d��4��x`������uP������V ���US�M]IB�;z<�͸:-��#i�C��V�J.��L4B����1Rp�Px�  &�T@Z��PJ��'b     