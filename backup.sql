PGDMP         -                w            postgres    10.7    10.7 c    t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            u           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            v           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            w           1262    12938    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
             postgres    false            x           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2935                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            y           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            z           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    41161    dtrfunc(bigint)    FUNCTION     c  CREATE FUNCTION public.dtrfunc(user_idt bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
if  (select timein from dtr where id=(SELECT max(id) FROM dtr where rf_id=user_idt)) IS NULL then insert into dtr (rf_id,timein,transact_date) values (user_idt,now()::time,now()::timestamp::date);
elseif (select timeout from dtr where id=(SELECT max(id) FROM dtr where rf_id=user_idt)) IS NULL then update dtr set timeout=now()::time where id=(SELECT max(id) FROM dtr where rf_id=user_idt);
else insert into dtr (rf_id,timein,transact_date) values (user_idt,now()::time,now()::timestamp::date);  
end if;
END
$$;
 /   DROP FUNCTION public.dtrfunc(user_idt bigint);
       public       postgres    false    3    1            �            1255    41146 !   spcwriteperson(character varying)    FUNCTION     �   CREATE FUNCTION public.spcwriteperson(fname character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO person (firstName) VALUES (fname);
END
$$;
 >   DROP FUNCTION public.spcwriteperson(fname character varying);
       public       postgres    false    3    1            �            1259    16518    consignment    TABLE       CREATE TABLE public.consignment (
    consignment_id integer NOT NULL,
    product_code bigint,
    uom character varying(20),
    consignment_qty integer,
    return_qty integer,
    ending_inventory integer,
    items_sold integer,
    unit_cost money,
    total_cost money
);
    DROP TABLE public.consignment;
       public         postgres    false    3            �            1259    16516    consignment_consignment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.consignment_consignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.consignment_consignment_id_seq;
       public       postgres    false    207    3            {           0    0    consignment_consignment_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.consignment_consignment_id_seq OWNED BY public.consignment.consignment_id;
            public       postgres    false    206            �            1259    41225    course    TABLE     Y   CREATE TABLE public.course (
    id bigint NOT NULL,
    course character varying(50)
);
    DROP TABLE public.course;
       public         postgres    false    3            �            1259    41230 
   department    TABLE     a   CREATE TABLE public.department (
    id bigint NOT NULL,
    department character varying(50)
);
    DROP TABLE public.department;
       public         postgres    false    3            �            1259    41250 	   dormitory    TABLE     �   CREATE TABLE public.dormitory (
    id integer NOT NULL,
    dorm_id character varying(50),
    dormintory character varying(50)
);
    DROP TABLE public.dormitory;
       public         postgres    false    3            �            1259    41137    dtr    TABLE     �   CREATE TABLE public.dtr (
    id bigint NOT NULL,
    rf_id bigint,
    timein time without time zone,
    timeout time without time zone,
    transact_date date,
    period integer
);
    DROP TABLE public.dtr;
       public         postgres    false    3            �            1259    41135 
   dtr_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dtr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.dtr_id_seq;
       public       postgres    false    213    3            |           0    0 
   dtr_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.dtr_id_seq OWNED BY public.dtr.id;
            public       postgres    false    212            �            1259    16462 	   inventory    TABLE     �   CREATE TABLE public.inventory (
    inventory_id integer NOT NULL,
    product_code bigint,
    physical_count integer,
    date_counted date,
    counted_by bigint,
    inventory_tag character varying(50),
    location character varying(50)
);
    DROP TABLE public.inventory;
       public         postgres    false    3            �            1259    16460    inventory_inventory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventory_inventory_id_seq;
       public       postgres    false    202    3            }           0    0    inventory_inventory_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.inventory.inventory_id;
            public       postgres    false    201            �            1259    41212    location    TABLE     Z   CREATE TABLE public.location (
    id integer NOT NULL,
    area character varying(50)
);
    DROP TABLE public.location;
       public         postgres    false    3            �            1259    41210    location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.location_id_seq;
       public       postgres    false    215    3            ~           0    0    location_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;
            public       postgres    false    214            �            1259    16416    product    TABLE     �   CREATE TABLE public.product (
    product_code bigint NOT NULL,
    description character varying(50),
    uom character varying(25),
    unit_cost money,
    selling_price money,
    supplier_id bigint,
    on_hand double precision
);
    DROP TABLE public.product;
       public         postgres    false    3            �            1259    16492    purchase_order    TABLE     �   CREATE TABLE public.purchase_order (
    supplier_id bigint,
    product_code bigint,
    po_quantity integer,
    po_by bigint,
    po_date date
);
 "   DROP TABLE public.purchase_order;
       public         postgres    false    3            �            1259    16478 	   receiving    TABLE     �   CREATE TABLE public.receiving (
    recieving_id integer NOT NULL,
    invoice_number integer,
    supplier_id bigint,
    product_code bigint,
    qty_received integer,
    date_received date,
    received_by bigint
);
    DROP TABLE public.receiving;
       public         postgres    false    3            �            1259    16476    receiving_recieving_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receiving_recieving_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.receiving_recieving_id_seq;
       public       postgres    false    204    3                       0    0    receiving_recieving_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.receiving_recieving_id_seq OWNED BY public.receiving.recieving_id;
            public       postgres    false    203            �            1259    16393    req_prod_encode    TABLE     �   CREATE TABLE public.req_prod_encode (
    prod_code bigint NOT NULL,
    prod_desc character varying(50),
    physical_count bigint,
    request_by integer
);
 #   DROP TABLE public.req_prod_encode;
       public         postgres    false    3            �            1259    16537    return    TABLE     �   CREATE TABLE public.return (
    return_id integer NOT NULL,
    product_code bigint,
    supplier_id bigint,
    return_qty integer,
    returned_by bigint,
    date_returned timestamp without time zone
);
    DROP TABLE public.return;
       public         postgres    false    3            �            1259    16535    return_return_id_seq    SEQUENCE     �   CREATE SEQUENCE public.return_return_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.return_return_id_seq;
       public       postgres    false    3    210            �           0    0    return_return_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.return_return_id_seq OWNED BY public.return.return_id;
            public       postgres    false    209            �            1259    32928    role    TABLE     M   CREATE TABLE public.role (
    id integer,
    role character varying(50)
);
    DROP TABLE public.role;
       public         postgres    false    3            �            1259    16421    supplier    TABLE     �   CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    supplier_name character varying(50),
    contact character varying(25),
    address character varying(25),
    email character varying(50)
);
    DROP TABLE public.supplier;
       public         postgres    false    3            �            1259    16527    supplier_id_seq    SEQUENCE     x   CREATE SEQUENCE public.supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.supplier_id_seq;
       public       postgres    false    200    3            �           0    0    supplier_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.supplier_id_seq OWNED BY public.supplier.supplier_id;
            public       postgres    false    208            �            1259    16410    users    TABLE     �  CREATE TABLE public.users (
    rf_id bigint NOT NULL,
    username character varying(50),
    password character varying(25),
    picture character varying(25),
    role character varying(25),
    deleted integer,
    user_id bigint,
    course bigint,
    department bigint,
    required_hours integer,
    dormitory bigint,
    units integer,
    is_caf integer,
    rate integer
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    16408    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    198    3            �           0    0    users_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.rf_id;
            public       postgres    false    197            �
           2604    16521    consignment consignment_id    DEFAULT     �   ALTER TABLE ONLY public.consignment ALTER COLUMN consignment_id SET DEFAULT nextval('public.consignment_consignment_id_seq'::regclass);
 I   ALTER TABLE public.consignment ALTER COLUMN consignment_id DROP DEFAULT;
       public       postgres    false    207    206    207            �
           2604    41270    dtr id    DEFAULT     `   ALTER TABLE ONLY public.dtr ALTER COLUMN id SET DEFAULT nextval('public.dtr_id_seq'::regclass);
 5   ALTER TABLE public.dtr ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    16465    inventory inventory_id    DEFAULT     �   ALTER TABLE ONLY public.inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);
 E   ALTER TABLE public.inventory ALTER COLUMN inventory_id DROP DEFAULT;
       public       postgres    false    201    202    202            �
           2604    41215    location id    DEFAULT     j   ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);
 :   ALTER TABLE public.location ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214    215            �
           2604    16481    receiving recieving_id    DEFAULT     �   ALTER TABLE ONLY public.receiving ALTER COLUMN recieving_id SET DEFAULT nextval('public.receiving_recieving_id_seq'::regclass);
 E   ALTER TABLE public.receiving ALTER COLUMN recieving_id DROP DEFAULT;
       public       postgres    false    203    204    204            �
           2604    16540    return return_id    DEFAULT     t   ALTER TABLE ONLY public.return ALTER COLUMN return_id SET DEFAULT nextval('public.return_return_id_seq'::regclass);
 ?   ALTER TABLE public.return ALTER COLUMN return_id DROP DEFAULT;
       public       postgres    false    209    210    210            �
           2604    16556    supplier supplier_id    DEFAULT     s   ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_id_seq'::regclass);
 C   ALTER TABLE public.supplier ALTER COLUMN supplier_id DROP DEFAULT;
       public       postgres    false    208    200            �
           2604    41171    users rf_id    DEFAULT     g   ALTER TABLE ONLY public.users ALTER COLUMN rf_id SET DEFAULT nextval('public.users_id_seq'::regclass);
 :   ALTER TABLE public.users ALTER COLUMN rf_id DROP DEFAULT;
       public       postgres    false    198    197    198            f          0    16518    consignment 
   TABLE DATA               �   COPY public.consignment (consignment_id, product_code, uom, consignment_qty, return_qty, ending_inventory, items_sold, unit_cost, total_cost) FROM stdin;
    public       postgres    false    207   u       o          0    41225    course 
   TABLE DATA               ,   COPY public.course (id, course) FROM stdin;
    public       postgres    false    216   u       p          0    41230 
   department 
   TABLE DATA               4   COPY public.department (id, department) FROM stdin;
    public       postgres    false    217   Eu       q          0    41250 	   dormitory 
   TABLE DATA               <   COPY public.dormitory (id, dorm_id, dormintory) FROM stdin;
    public       postgres    false    218   xu       l          0    41137    dtr 
   TABLE DATA               P   COPY public.dtr (id, rf_id, timein, timeout, transact_date, period) FROM stdin;
    public       postgres    false    213   �u       a          0    16462 	   inventory 
   TABLE DATA               �   COPY public.inventory (inventory_id, product_code, physical_count, date_counted, counted_by, inventory_tag, location) FROM stdin;
    public       postgres    false    202   �x       n          0    41212    location 
   TABLE DATA               ,   COPY public.location (id, area) FROM stdin;
    public       postgres    false    215   <�       ^          0    16416    product 
   TABLE DATA               q   COPY public.product (product_code, description, uom, unit_cost, selling_price, supplier_id, on_hand) FROM stdin;
    public       postgres    false    199   ��       d          0    16492    purchase_order 
   TABLE DATA               `   COPY public.purchase_order (supplier_id, product_code, po_quantity, po_by, po_date) FROM stdin;
    public       postgres    false    205   `�      c          0    16478 	   receiving 
   TABLE DATA               �   COPY public.receiving (recieving_id, invoice_number, supplier_id, product_code, qty_received, date_received, received_by) FROM stdin;
    public       postgres    false    204   }�      [          0    16393    req_prod_encode 
   TABLE DATA               [   COPY public.req_prod_encode (prod_code, prod_desc, physical_count, request_by) FROM stdin;
    public       postgres    false    196   ��      i          0    16537    return 
   TABLE DATA               n   COPY public.return (return_id, product_code, supplier_id, return_qty, returned_by, date_returned) FROM stdin;
    public       postgres    false    210   ��      j          0    32928    role 
   TABLE DATA               (   COPY public.role (id, role) FROM stdin;
    public       postgres    false    211   ԓ      _          0    16421    supplier 
   TABLE DATA               W   COPY public.supplier (supplier_id, supplier_name, contact, address, email) FROM stdin;
    public       postgres    false    200   �      ]          0    16410    users 
   TABLE DATA               �   COPY public.users (rf_id, username, password, picture, role, deleted, user_id, course, department, required_hours, dormitory, units, is_caf, rate) FROM stdin;
    public       postgres    false    198   b�      �           0    0    consignment_consignment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.consignment_consignment_id_seq', 1, false);
            public       postgres    false    206            �           0    0 
   dtr_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dtr_id_seq', 144, true);
            public       postgres    false    212            �           0    0    inventory_inventory_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 1450, true);
            public       postgres    false    201            �           0    0    location_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.location_id_seq', 6, true);
            public       postgres    false    214            �           0    0    receiving_recieving_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.receiving_recieving_id_seq', 67, true);
            public       postgres    false    203            �           0    0    return_return_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.return_return_id_seq', 7, true);
            public       postgres    false    209            �           0    0    supplier_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.supplier_id_seq', 2, true);
            public       postgres    false    208            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 43, true);
            public       postgres    false    197            �
           2606    41229    course course_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public         postgres    false    216            �
           2606    41234    department department_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public         postgres    false    217            �
           2606    41254    dormitory dormitory_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.dormitory
    ADD CONSTRAINT dormitory_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.dormitory DROP CONSTRAINT dormitory_pkey;
       public         postgres    false    218            �
           2606    16420    product product_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_code);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public         postgres    false    199            �
           2606    16397 $   req_prod_encode req_prod_encode_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.req_prod_encode
    ADD CONSTRAINT req_prod_encode_pkey PRIMARY KEY (prod_code);
 N   ALTER TABLE ONLY public.req_prod_encode DROP CONSTRAINT req_prod_encode_pkey;
       public         postgres    false    196            �
           2606    16558    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public         postgres    false    200            �
           2606    41163    users unique_user_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_user_id UNIQUE (user_id);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_user_id;
       public         postgres    false    198            �
           2606    41173    users users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (rf_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    198            �
           2606    41170    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public         postgres    false    198            �
           2606    16522 )   consignment consignment_product_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.consignment
    ADD CONSTRAINT consignment_product_code_fkey FOREIGN KEY (product_code) REFERENCES public.product(product_code);
 S   ALTER TABLE ONLY public.consignment DROP CONSTRAINT consignment_product_code_fkey;
       public       postgres    false    2760    199    207            �
           2606    41202    dtr dtr_user_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.dtr
    ADD CONSTRAINT dtr_user_id_fkey FOREIGN KEY (rf_id) REFERENCES public.users(rf_id);
 >   ALTER TABLE ONLY public.dtr DROP CONSTRAINT dtr_user_id_fkey;
       public       postgres    false    213    2756    198            �
           2606    41164 #   inventory inventory_counted_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_counted_by_fkey FOREIGN KEY (counted_by) REFERENCES public.users(user_id);
 M   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_counted_by_fkey;
       public       postgres    false    202    2754    198            �
           2606    16466 %   inventory inventory_product_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_product_code_fkey FOREIGN KEY (product_code) REFERENCES public.product(product_code);
 O   ALTER TABLE ONLY public.inventory DROP CONSTRAINT inventory_product_code_fkey;
       public       postgres    false    199    2760    202            �
           2606    41174 '   purchase_order product_order_po_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT product_order_po_by_fkey FOREIGN KEY (po_by) REFERENCES public.users(rf_id);
 Q   ALTER TABLE ONLY public.purchase_order DROP CONSTRAINT product_order_po_by_fkey;
       public       postgres    false    198    2756    205            �
           2606    16500 .   purchase_order product_order_product_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT product_order_product_code_fkey FOREIGN KEY (product_code) REFERENCES public.product(product_code);
 X   ALTER TABLE ONLY public.purchase_order DROP CONSTRAINT product_order_product_code_fkey;
       public       postgres    false    205    2760    199            �
           2606    16569 -   purchase_order product_order_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT product_order_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 W   ALTER TABLE ONLY public.purchase_order DROP CONSTRAINT product_order_supplier_id_fkey;
       public       postgres    false    2762    200    205            �
           2606    16559     product product_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_supplier_id_fkey;
       public       postgres    false    199    2762    200            �
           2606    16487 %   receiving receiving_product_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receiving
    ADD CONSTRAINT receiving_product_code_fkey FOREIGN KEY (product_code) REFERENCES public.product(product_code);
 O   ALTER TABLE ONLY public.receiving DROP CONSTRAINT receiving_product_code_fkey;
       public       postgres    false    199    204    2760            �
           2606    41179 $   receiving receiving_received_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receiving
    ADD CONSTRAINT receiving_received_by_fkey FOREIGN KEY (received_by) REFERENCES public.users(rf_id);
 N   ALTER TABLE ONLY public.receiving DROP CONSTRAINT receiving_received_by_fkey;
       public       postgres    false    2756    204    198            �
           2606    16564 $   receiving receiving_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.receiving
    ADD CONSTRAINT receiving_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 N   ALTER TABLE ONLY public.receiving DROP CONSTRAINT receiving_supplier_id_fkey;
       public       postgres    false    2762    204    200            �
           2606    16541    return return_product_code_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.return
    ADD CONSTRAINT return_product_code_fkey FOREIGN KEY (product_code) REFERENCES public.product(product_code);
 I   ALTER TABLE ONLY public.return DROP CONSTRAINT return_product_code_fkey;
       public       postgres    false    210    2760    199            �
           2606    41184    return return_returned_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.return
    ADD CONSTRAINT return_returned_by_fkey FOREIGN KEY (returned_by) REFERENCES public.users(rf_id);
 H   ALTER TABLE ONLY public.return DROP CONSTRAINT return_returned_by_fkey;
       public       postgres    false    2756    210    198            �
           2606    16574    return return_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.return
    ADD CONSTRAINT return_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 H   ALTER TABLE ONLY public.return DROP CONSTRAINT return_supplier_id_fkey;
       public       postgres    false    200    2762    210            �
           2606    41235    users users_course_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_course_fkey FOREIGN KEY (course) REFERENCES public.course(id);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_course_fkey;
       public       postgres    false    2764    198    216            �
           2606    41240    users users_department_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_fkey FOREIGN KEY (department) REFERENCES public.department(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_department_fkey;
       public       postgres    false    198    2766    217            �
           2606    41255    users users_dormitory_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_dormitory_fkey FOREIGN KEY (dormitory) REFERENCES public.dormitory(id);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_dormitory_fkey;
       public       postgres    false    218    198    2768            f      x������ � �      o      x�3�tt
�p������ 0�      p   #   x�3�ttvt�tT�p���2�.�/J����� WA      q   B   x�3�vq��50�tuq�S�p���24J�y���e����}B���B>��A\1z\\\ ���      l   �  x�m��u� E���%,�1��:F2�8��+�1�GR:}�>���k1����z�ғ	��@�A����v���@��|:z&/GOG.��ڱc:��9��Ҵk��%/����)�ȔgK^N?�z9�K���N�����i��\D;	�����N����ϼ��}&/�A����A��D��DC�
C%JI!yI<$��8N�$��$/I��7�
5��N���ܔ^ZG�Q�z &/ɆdA�l�*�2 ��ɼY;���9B�o�6��N�$�\����kȍ�N�)��)��-{Ġ����QF����D��Չ�t"�[Bmm��G�&?��vY�a�J6]���g���z{y���13y�����V�3Oً5y������PS��-��J��ZX�0�-5yk|�K��PU$��M7yk|�K����/Y����W��P*�
vL}@K�G��.��;8���������%�|�eo�֌��ܒ�<�E���M��q<�3ur�<F���K�b)[�G�H���-|������~`ʺ��?�P�W��%�x��1np$˓`0��"Y��*���}��t�^���K����7��U���F��ө�[%o��Pm��GQ&od�$ϩ�Y�7�$�[����b��\|Mİ���hK~�Q߲?lM�)c����'2{'��-փOx_�q�o�WdH|��'�Y�;�'o�G��Rr������'�����9�Ih$P9��M�-���?�kރ      a      x��]K�d9nG�ņ$���/�S��Q@���Iݏy/Od��+랠�u�Qm�5X��9[/�U_�T��2����_n�������?�������Wmt"Ji�V�/�EKe�Q; ���I�2M=U'��������������r
1��SH��q�2�"����r�ȼ���kC ���Ƹ�>��Hy�)֤Q�4�c!��K��a҂�R;"�����K&e�R��Z�1bY��Be22���T�@S)k��#�U8�a�5�b�Y��I�.�t?�a=@X�m<"d@R�	�������bs�Me� %�bD^S���w��%B���9�)>.���֦"����F��c�m��@��%v�|ԖR�����DJs)�Qն�C]dR��wS���t"������v@R�ؕ�W���{?Bz�$�^��'1Ш�&i������� d2���v۹W��)���%�<��Dơ�m{�a�1i�Yb�RS�ȜZ��+����7���H�t���#�o�M�cg����(��~����N�/���	�eIi4��$!K��p���ДI_z�S���~i}�ff� ��s��?#"�>�uL�J�Ǿ7�l�>��2B�Z�h�Eȼ��m�'$뾆�����f��sY&RF�R�f��Ȃ����������w� �$�d"�_�X3[Ybc!�1"d�1��#R��GgdVf�Y�'�6�<�#eꞺ)U�Dy=O�I�i���b2?�}Η��#S���0eB��"]�'��j�j����Ǽ�>V��֩���<!Z��$���k�����yh���ߕ报=u}&�B���\#�a��U#Db_�۵�d	��c����:��ok2���}A���P�Cjl�>��G��HX溴Nn# �o��}��a Ǿ ���� ��T&���,��a��7!vci�FneƆ1p�k�z�ר�;X���k���M�޽x9���zd��'�asoV�}l5�fW�{r�&BdaN�V��I�̼u�"�y��8L<�^��4"Dw��C&�� � J������Vdk��(�t��m_�&��uB�&��}�dϽ3�H�.�;Ӟ�>���]�3�9i�)c Rh�䰳0�{�kEN�F��;��k�tD��ܹ�&b#���G4kW�Ę!b��-$!�2!3�H&�<�?�7(.����|�Kv�%R⥫A}a�ge`"��#r�a��=��Ć}&�#d�$&�Ma7�� ��؍�{���K�j4���M���,B����]S���d����]��v�W�n�a�A�f}��&K����S��u0m��r�@F�4�l��;����J�Rat�ɴ�X�C�Wk�->�vL?5E�,{���'2�g�?)��/ϕ'm�I�-eA�}�/��ُ�8P���}�v�AuP�b�I{^T�.8wc�{O�ŧ�Q_�䊰��!@M���wS�`��A�-����C"$�g&w����~��}N���ٟ;?lc�H�/�5%I/����J�S�l�5y��3@=O�v;���G��ET�n���,�}aB�6�����GxD)�C"dF)�M3�}�(�l�����`֮�!NʦuKq��Hi_�E��� }�|�ؗ�#�H��0�^��-��]~����>t)�;r��j��Mu��f�B��M~B�$�څ�)�V�(�wR���9e��¡]O=��K.zܖ'%'oҮ�2�{,��@��0��Ֆ�$=�T�k�	���A�]R��SJ��Ca�6!��]�i�&ݯ���p7GG�#we2�!�Y?ͪ����fRF�0b��"�ԌNS�U��e�}7��X��<�Gzv���ݎ�-���Vo���wd�h��@}>ٱ55��fR�LgE�/�"ڍ��ek#��ԧk/�ˌR�W2NH�D�ɨ�Ⱥ�+���aT��U_�w_(S+	������� ��\����Iap1K9�i���};�~�P 26d(�z�8bIXB�-�9��{���)B6B�-�n H�q��C�M[#A�&ab	�ϩ���t�;K��߷��Y:<�!�
��dg������D��� �	��@�Nn$v���Q����?���Yz7�f�/s�e����I��"������ �pRjb�>����X�˷ݩ��-f�I�u-B,
4�݊�[,9_"��\�[J��D�0r��A}F2	�t����6��-����H��a��J��rC�e�(�s@}��^061�v3��@��4��%�i�8/O�6��^f���xM�f����쏨`�K����O��ur�Hy��d�$�{�hd�x�$�u"�:+'��Dg�X�ֳ��d��[�ڹ��sOe��%)i��{�{x!��������J���P�TP��8Hl�ƾ@օJd(:��o'�@Q��q#g�XҗA2�i�NV}A�.%�vbR%��}r�{��:(~Ѭg'�ϛp�Xʉĭq�;<����+�rL���حl������n�[���mfc -8y�����F�\�c �0�t�A�ڃ �2��*њ��^�"�Ķ`r)J����.ѥ!��Ү�ޡf� ���`�:������u�W� �[�%��	ģ��@nwx�{<��=c��b����r&����E{�k=JAXL��%�h��+,�xpӻa� �L'@�}D���mutEbq��3Џ�rGn�v%~b��[�l�5�5�%���~�WW[��gWA\�l�G�
b�$�)�bG�[����<��=��U	���`�z�K�~�O��d�XzA��']�Ӂ��e���V���|Aqq|fa~ӊV*��ǕA� ��c�<i	��G]	!=H��2�ݑ�B��vBt*K��U�`�:�Uf��F����K��I��#�����ǽ):���ˣ/IU��G�}�{��ː�������Rn�#����9	�|:B�Rg��1a�Й������qV����}i�ȟf�8���+�7H-��/���!��~��X��4|9�Փ0�����tn���:t�OW� ��W~�Z�������o$K���S�g�! l�_N�f�������?���Qw��3S+N�~�C������'#~l^��/����>U
�]������H2_T�7}�7l!����-DRKHl�Ԃ����k
t_J�A��M�X�� ��Y]�"�I(_)w5 [�D��p'H�wt����u��Agp�Ki�ۥ֗(R9Bj��=���^-���~}Z;	�<�ʥ��N�,��mT��W?���N�͙�)'q�l���.%����G����r<��������"�Ң�"aԲ�q��;(-D�t(�HZ H������z�	"�m���,2Ȟ,�oZ�8��a��X�Fb�	���A(�⠑3��=�#�{�@�ߚ�A��B1�u"��Bq�	:o��H�� ��Bo���y
���6��<9�)}�+C)��-4l Y��{�U�!wׂ ar�.;"}���g_�k,��X�4٣�CS��!?'C|����( R�D��J	��	t_�jX,�@��\+�!)'��&�,'/"a*���d*�hc�7zZ���,���E��E��I���\�@�K�>=#���3�u��G��n�##�._��H��t�z��ֽ��	�p�U�̫2�N��Y�G����>��|����Ƙ����˾��w|Y3�W7��)��b�ͭ�R�A[���D�o,���[R��'��h�U-�h�a�҈Ǿ"y�r�sǈ%%;)!���y}I�2۞J���H��m��Q
��+3^�[��_/�y�RX)���q��K���0F��re\~q������y���8Y���NH̉l�x��-��K�����#ɢJ��JR:�CH��$jHN�=$�2��˛��,՝A���m )m����~?b���������^ޮ�H�}?�.�Ӑ"=���|����bzq�!�$�� ��Z/W%;���p�	�^��
Q�*�%��5� ���'�Ba�e��s����SI*&Sy&]�56ɍ�us�f�>9�L�+7��М�����!�����>���[�c�^q?���������HE���d{	 ����1r �H�i��H�!�*�A    ��7��Xc��m����x&Ec��uL��{�v�S�w����6�HP}'�CH�N�G���� r�ɢ�	F�OKO�;�1n}ܪ !���o��D����3���=�sp��	m0���u7������.!r��L�/H�[ggv�9�w�e���8zn�4�l�F� �d�Ù�!�:�mVV7i��|���Ⓥ�a�Y��LJ8���DʮT^�JBf_"ɛ�vO���>�0��ׇYn,az�l�?9���F,�������[�}d��p��:��v�(%��}��^H
�K��;2��$ܦ�}�{� ��{��!�Ab{?���j�
���>���td��2J�ˀ�ŨA�2t���6�}<l�B�AQ�C̸�}�C�y���"[�4����j�/�_�������<Yâ͗J�A)	tC�ѹ+H`T�wc�G�5����af��$�,i�!]WuFd��'25i�M�T/Ȅ(�y��¨H�R��=�rj����z=�^/e�4�������1B�u�a|�!i����\��y~�ُGk>I�� ���(��sQwN�dc8u�н�`�h���vH!����F���gg����P��(���g?߮Nx�$��щQ�I6]�I��L�U�l�jR=�K��0�g\J�B�G���2��X����a���|�2jFk>�t�t�I�s�٤�"���s�m7Nnnu��&�ۃ(�qrs��U!�-�JcKI��Lʡ��(v4Nv�\!H|��ع/�Gke[�ٞv�`�X?��)N�|G)��kD��$mkt��8c�Eʱv���r�ZY�� #b�8�)��qcy�jP��P��A-Jy�ʤP�$��$j������0���"�M˭� |��a!?Hc��pl��η�<�6�+�Ğ	.3y�9����B)H��&pֻ$/l$[���^�Qα��#�.c��uwFB#6w�:f���C
���� k�~	��jR�+������9C����N;��ӎT&g(��}B5��JW�� =&���ُ�d���s��YG�\��3R�v�Ӧ�W9ep���K��w�U;�.�ԈzO�i)�Z�,�s	�`֮9�D�~�վ�HH�8�����f㎠s)I��L���f���'���yY��Zrt'��&; ^��P���	�A�*E<��H�$	�d�t2�Rqj�Aڂ ��߅������ć�\Z3R�	��j� y�c�����i$�h0� v�n�_̼u*�T�v��4���Ãő��qQQZWW�ق4$�}��d�K���s�>[2*�vs�~�PB�g]��I��L�~$�m"c����-F ������0z���Ϩ'A�	d�ڤ Ԃn��?q���-�t���$��gÜ@Z����;�"�x�n"�aK�$&�,��*�q�t�6�=+*�H�!;�;M���VH\�<ؾ��ɍU��|������Ɗ5I�� �!6tP�8@��� � �a�9�x� #B�W�2���.[ي��m�gu�H�R�k-B�l!�췽��������S\���]Rf�7Į��j^<���J�M�r�V�����K��SL:����4T�`RؕuBSIaWJK<�	D��XC#�càC#@�;����K�8IC�+B�#���� �/�����J�|c�6�ݘ��RJVz#��{��)5Y��ҷ�a�<���$`"��L�� ��LHI�����JfI=�H�݀�Ix�7�Τ����$���a�1��Ix�h�ߗ5�D�T^�g<��&$�r�d��7�=!�ŀs/���yē���)���	��,�EA@7���s���{���X�DzC¯f��
2̮2&:G�R���$`�!H��W�"�!U4����HtO$Zs��h�������0�=�4���]�m�X�?��F��y���mHRּ��\�]>��S
��6�ťڿ3�0yy��e	T��.�@*|N� ��rF��YĽ"�߮��_З�m�NH�W������r�dd���zo��u��>n�l+R�zo�2:�:5�"P
������G� �^RK<"�� #�e+g�,EB[�d�H��={�3�H�@Y��T��I'FbBLYސ�P,��?��z(bQ�FHB�<!u�"�A��Z�j��<Zi{Y�$�"�P�d�u�(�*Q
4���C��R�z��{�*T�N����5 ҂a��&�Vc������$�L�[�ɳ���Ӣ�#�Y)+�l_9��4�����"򸱶@���ሔM�O�(��Q
�+�Dߢ�)Q3��-F�zZN)x�]�!�M�ڹ�d�*I���gW�2 �D#6y�Bi�AFR����<�r�Y!Y��g�?��5t�c�;�s��ZP����ă�H��F��ߎ��<Lְ0��F��;)�Ҡ�J^F�t���@����}B�ê�1��?Aaus�Ȯ<H�cĘ�/t2rm�nK����$ܵ�� B�s�)�A���Xo����q�!���̃� �\�U�m��"�>Jc�Y�ʭk������g�/ړg�Wh�^:N��g�{��.��pO)�le&��&��4ll�<x<o�$8�(POƱ���O w�5��w��?�2�	Ѓ#���'+u��h�����Y� �Lӹ�`[�I��Dʝd�N��\��Ά�m-��N����<Z���`U�J�=4L*U�g�dۓ��/�/~ R�Vx苖x:@W<ݳO"ɛ�Ͼh�R�*�#�H�މ�z%�it�
���~7��\�AXի���̖��Y�fP\P8���n��w�Y���W��­��E�m�Id�d�� ��g-�W>IN}tg�5��D�^���LӴafv�����?�(,�#�g#�W��{ybL�a�����a4.$����˩�:�(}�t�-�A�9�1�T݉xb|w#�9�F
��`4̽�<�����bͼF*�Tg�6z��0o� 1c�uжM��W��z�=�Ir�29;���I��c����)&�9w���('q�f�x/�Ϭ�tܢi��������0�ɷ��.w�'�!���$�Or�I1���	�I��cY7��+�,��C�>_)�2��9����*��}v�?�O�*;�B�@y]���F�T� �!�Q���]���D�l�]�{e�$�}	D��#)]�(5zS���-f�䎶�n�|�b���ɍ�E��f���6$(�K�Ƕ%�B��0P�H-�V;b�@=$�4B?��0uc�#ϟ�m$47���pG��F��������N���U�����,��ƭf��cK#7�x��a��T*̃���ɒ\%�V*M�4d�3���gA��Z�ùV�ga�6��Z���s�p��ރ��"���5�YӶ͗"Af��v�Y�0K50�fp ��]�()O^���ڶ��^�8;��Z';��wHk���9�����s]�@�R�0��ғ��t���̤�e���6AZY���co�L��W�����er��m0b�xM�E\�!�Y�؛�ɦnb�fH�@q#�	�=3�b��ANA��=�uu?zϺ�Aa\�,�똹ß[*��m��DYg�������iUH�����1������77�� Y%�	!z���+��C��`&���;�0m�mZb���F9IM&�m-]�$�L�1@<�nm�T����J�R���s��,M��")������<���m.����L�F9��o�]&�j���SN�j���I*��r6��	'<vmwk{�&(+a�ɑ-�B�D����M@HN��3�eG�&�S90�ɛab&1tݭ�F9H��Zk�~*�{�1>���t��A�<�f��N'YC�0<1q�����^� ���N����5�>��d�e��
�g���;qrգ|/~~�Dr&j��-X�:��^�шI�m?�
fVVz�I�39�_GP��9Cx�w����T��=s��z�&hoӮ�U{F�f��O�R��=R�}n�(���^��Wbf�Ҭ��m�h���.��L�!�뤾�[� �ZU/^t�5��޺�9k�f^Y����M�l���R�l�ʻ�W�I�Tή�U�? f  !rtc��
#e��@�G�J�rX�Ppoυ*�Ԇ����m-�W�ڶ�q'�؇_��?w%7S<P��uޘ�%2�@αl���l�}�Kk$foyҿ�p\oH|�aN�Y�Z��Ƴ�މIBy2��3J�}z�ګ~�����Bb��$��ޱ80�5`*eW=���)8{�*�l��+�K�#~Ҭ�s����x�z�f!+�6��3�[��^���8�Pׄ�mH�	�.�wi�abi���b�	��&nY뎷�xl(��_1ټXO��3��bb�`�ofY
�Q��v�����&j&9vϚ� ��`4�U$,������b����s� �();�~�ì잉]��L�	U"�Ϗ�#�HԱ[�ɸ�,+�|W  �
��׊�k�����bj�I��s^�>�-��rJG��2L �vx�@�I��m��_ڑ�����ƙo(�hh[v9H0;p�l 	���I��"��$&��8�mK��3����~@c�'�d�Զ'�8D~�8i���[���q�.׭ށ�^�R�v��s�2ּ���sy~g�b����t���PGR��z~�M�����(�0d�XE?���0o;��Cږ52����>�Hx⺪�ф��00"��a�$�0�����ס�F����~�arf��|= t�����
cZz�eNc!E�sѦ�H�U���П��ɹg�)��:�a8b���v����xR+ԟ�;�@��m�qa�P *��l�E���o�Nl���F�O;�h!�X�B����kT4�r�;'�<���XWl�0���	k_�����4�f3om��6�j;���n�	;a�u�E u�Ǿ�H�a�ƈB4V�%���N�U���4=+��-�ġ[B��)F���Ӟ&7�E�������Zi����c��Q�bUh�'�5:�=�FQps	�wE��Q������6���nWe���8�<�+��G!�����@n�64�9( �M�ƾ���la�d�H�
��A��mF�(xE�1)K`�0�e��������ؙW��و*BUۑ�|��bm�� ��`"Gk��]ᴅ1Ȋmgr(ʁbz�r��I�L�D9�q�=���a�:`��4�Ʈ�w~��d��U<1T�:��1L��Xg���u�a�7k'��`�7{!�����3~�C2����0�=�����'��%��ئV o9��j�g�`��F���e�ۗ����oY�_��=.˱i%<�7:F��U��g�����nL��s{g~�9��w����������?�����?�W�Ux�<B.�cc=�s,r����fR�BJ�WM�\
���ៃ�"D���97Bn'O�����e)�s�H�� �!C7B4v��'@v�ql|��'}54,��z6l���6��k�G.')8�Adg��0H���	�d�]�C�K�l��P��|C�h�}�� ��9��S�R�=	�LJR~H����4+�z}R�6�rϾY��Yt"��i��&�7B�'�'oX�lG�5�xbF���)�8B6�o���q>��f�B[LC����U�#d'SpV5!��$���� ��9]8Bn*a�&�Q���� "䭠��ݘI9f_L)[�?�E�E'y�,��		�4�<���)y�6r��eӔ����W@7+��odd�*4���0;�Ǉ ����|f�����*��l�%�C��7���B���X ���z�0�%�s.�ۧ��[����g�P;����~�l�o�s��fϺ�}l�� N��s�}i��/��������rt��2�s�c�9:�Y#�P�lu9:�5�_���׈�y#fi��-��َ���������5����+^i�F���T�Z�2��m�� 
������(�]s~I���Ϡ����4�$A3���A�է��͓�8#�>��˓ȟAu��EJ��U��^�Q0�&_�x�A1#�L�� �\��3�8��H�q���q�|3t�OGo]��Dߘ��OT6HX��D�rl?���
��K�g� 3|'�5�rQ��@�� � ņ������\�gŨ5��Mx��:FO�M˳�_�b�:�F-���gPݠ�K	�ϠA��aET�s�T���8䌭=��3�3�x	���.azώfn��#��"���Պ��{���[�T���H�D�@Ia=�<a �f��K���4A#�@{��n#�!~}��3��]���҆��+�M�:�
.��������~V�:@�c{�L�;%���A�9��O�ÙKg������V[��C�K���	Hc�@�w����剹Ϡ�W�X�|= 4A{�L��Ū�*��/č�$L�8q5Т�O��(O8��U�۵C���	��*���[gYT��q����4�&�}����#��=j��:C��S�A���2}���wYL?�$��܌�����%��9�D�����!1��#����g�+��Q%y�+u6�P�H��V�A�;Bm��	���P��{=sP�S�ia7i.�b��Ah�I�%�󧶆1ӂ=���Nlw��s,�u�@�ٽ�2�[�b�]��/ik�A��	�G��j�s@�J�v|elK�b�˺��m�~'�?��A3����?�%.el�@�C�3h?47l�O���Hml�E>�2F�����s��p�M�xB�3�>�#�^���.=�x��3��	�R�2�q	���s�|�.�E. 31��lPkؽ�r�3�ep!S��D�ؼ���f�K�z ���A#ɛ\\k	mr��6���d�B���A� l�6�� Fs�{���7�o]U��-� �$��-�_�R]�]�(��,�)�g󰛕����\���|h՝*�7ޜ-����_�?����      n   V   x�3�.-(��L-�2�tN�+IM��2�t��IQ����2��OK�LN�2�t/�ON-)5�.�O�.*0�@p���C�=... ��      ^      x���َ�H�&x-
6�:��I۸\R%1D�J�r�M��0Ә�*���y�9��\��.���m9��Ei��2�,绮�C=&�}h�srj�C�^M���4����a��S�Ӕ~)��b'ԋD/\2���펷��t�k?TݹNd��2�<���*3@yIh��������4L�b���H��t��]2��u��{��0������Kt#s=�b���L�<���rw�?�d�Lcrk�kr��>�l�}��5:���E�����ߔ��:��G5�}5$���.}�0��w�w�$���鮌��Q��2u���RQ/l.��<Դ_<c]=,�D;r�}�~t ��G]4o��_��N�P�D��>C�Rd�n��͡N�����g4�~%ýj��6�f�(S�c�v"�NruRQ/t:������J9md54t �ꑴ�ߏ�d��Y�]�:�,<4�*�o���c2����D�tR��
��	dt�ؓ^�O`��OP��Tfjw�:5�������WQ�ߋ�~�3��L��������������?����������U���= i��2W�WF.�e���������������������_��%���?��?0���w�n�t�0�cD���v]��Ju�����t�@Sg%-����[$�>�J2���ꡮ�IUUDB��y�o�-�����#��G�#�T��@`���'ӥj������=���Ӯ��R������S�iZ�2���p��s]�ۚ>���ø����vtA��L��[�6oi�:��*Z8���O�s�)`�'
���OM@��}{�@�ܢ(����e���*vm=�M��#�_��K��9'��7�!��n��R:�eY%���6'�)�X��o���Qr;�>�J���4���h�~|�����#��If�:7\���:lw���W�Ѷ��Y�Cj��dt��t�hͯ=}F�u7�K7�sZ���d?<��a�H�O�}���������v��:���0�w�#�����?]3;e6>(�W�{r{����u����P�F]���\��x;�HFG���s�2P)�xmu��eӋX��i�WuW��M�}Wov��>If[��EEڵ=�}�e�����Э̤�շ�Z�����N�n*��9Q���:����x����N��x��J�<�ܪi�7����v=���СHΘ*b�k��	(=)Cs0�ï�����||h���l�)�b��]�U��w�V�Rfn�m���r��z�vD��iT�[�Q�"�}�T�T������ڳ�����X}����ƽ�f�Tmw��!!�V�!i��3n \�x@��|�Nt��`~��uG�t��_�O,:vD�5�V�i��@<�Ғ�h�,���䖜=-��8�꯷ �4b��C�r��l�	���r��#����)o���&� B��V����S��iuk�R���97��W�J�5�D�>�UI������v"�;<#=2#`w:%���DЈHnH<�-�����8nU����א>�G�����ǅnT[�#�Z�7�E�I��CCӠr����.���?{��1���hХzÝ�;FgV�x�� Y��tY�ѝ#N�R�"$���O��v����$ܳ�k�f;�q��������ɰh_8/yY�2a����MlEV2N_��N-iEt=�{�9��$iS3�E���]?��wK�fKҾ�_��Ĩ����QN���4bT,3K��l�*V�pʹ�!/�9�h�^ڞ�J�o<?Cdq3F0�k�� %����,�$a���6����Qd��L��<S�*i�;)�}�F���W�2de�%"��O�$j'1��u��z��Ȝ	m�='���r���"���"��t���SC�)���?S9��(�i!j���|����U��/X�Fq����ђ�y����%m�Ì���5��}6Z�U�!Տ�~I�5���qja-�V)En���:����i�]d#Њ�=.<�b��vh�K�A�t?��^�qI��
'�%������z�\������M�mL��B7s�u���c��+� �~<N��pTRs����*�C��&�~�3��;V���=e��E�Ec�K\��n�H7�Ȃ��5��f��B�T �g�ksK��;������7R�ˈ��`9)��4�;E&��H�o��c)ԉ��c�P���^Ή��g°A�od�y��ȳ/�˳I�P�f��lw<t��-�v?|$�T~�,ҫ�R3�Ԋ�V�{�[�A������#᥿$��H��Yb�u��}_�mr/��@r/��Q�v��T�NG*�P���H�:�[w�.,Qd2[����=|��4�B�p7#�h;�і��:ׅ����ʴ$9�1��2{ �C�oo��Y"M�%�F;N�#	z�>*Rd�)b�ۀ�
�
������9H�"�z��n<�}jܞ���a3�?�<�9-h)l����L����t��$X�S���(YpNR�(�f"u�%U�?t�,���dG�V����i���\�rwB��p%BP"�lD�l	�DU��~����]r.��䒫��H&'a��"m��0�8�܍����
E]��'�,+3�HJ�M�E�iUn�Uk%*��.AcPWy^9ޒ�~ֆ��V	���������/
�O�	48�]�I�]����9�#O߃�`	�A�"�-:�㴁&�����:`إa)�]s�����r����$і�8�/�{}L�å;��j��4Zm� U�SZ�8UD#H.<��tx&��-Iɢ�4ǚ��\��؜y,IH�Hl�x���T���>R;؝��{�5�.��aϐ9��gA<'LQ2�5�c�����*��������vN�ӌ��������8��������+ͥT3�� ����Y�����~��9��m�k��:Lou,�-�:�B�ň�C}~�D������D1��<U���	0��8շ[�}�:��� �{�c;5}[ҹ��r�u|K0��7B�LW��d���ܓV�=4�x���ޒ�K���Nh�nխmw;L)'��i���@�o��'���M��U��BЂc�}�k�0�dǾ�Go&��)�e�
�
Uc5�3�K8^+<�T"��a2���H���E�| ��Al���������"B=�h�S�D[L]�Ҫ�u^2��P5#�k��k��<�BXV4ޥ#}�o]h""D�<+Y+�Z�9:ޫ�yE1��0}|�Z�4c���D<|fg����~[�j+	^:b��k4�"��a3�r`�Շ��Æ$H�܁4-WH���I��K�G�)���l9eEL4���4zk~&�aJ�p�][�.�+��a_ǐ��+$��Y���i.�2�}��B�$�= �ʠ�/-�T3(�Eo��Zܾ�d)Ì�*�`|S����%���&ݢ�HZ�wV}�N��Ԛ����(�R�v֦u�Z����e+$��'E�1�:9?nSM�q�.�j�Ȍ��YVn���S��P���m8~$-/��������젤�A�P�z��w��Hl���BfM"[���_J�/M���=<��ML��Q�.����գ�xF�����`�_~���{�wm���J �
��C��ی�� ���J����A��h�Ӷ!-z��WI�X�J� �=��o�Q���ܨ��I "�g�y���e1^��gr=<}_���wt t��g����[4I^���n$�)v���,��ԏδCC�o`'�+�γV�#�Ñ����\������ɺ GWO�f������tc���	�槡�]�o�~���=�L��kr"��ˡ��!�vO�[`X����J���B��M=ÏU[#�0����	������#����hE�aT%E�įq"�W,c��B=3��1:π&�;���;�[<4衉�ܿ<�,�nlX��On���K�f] ��8��8]I�?�Y����9��*�Gw��:&�ο6h!����R*�d[�&r��2ڝÅ�s��DS�Q�b���t�����M}�����<`|y�g�,�oX������Aǔ���#!��8jA*wݷ�z�^�    �5'X������Z�I3�+�aIr�ao�?�Ǡ��r��6tp���@Μ�CՆ-�y��2�d��M8�C��KQ�]�\I��Ww����� �-�$E����������p4�%��m��o�Lv�����9���aS��q(�D<Hj���gk2�0��*�/��d��O�Dh����G�b�:��߿�I�H2�C!!� �z�s9J����5'�F���)bgtU_�VlC��ݙ��nR�3��`����9�,�
Z߮�C�\��zW�-]�yx�.��N^��4����qxh������Nit��j��r��0/��T��f�]����H�S#��;��?���Qe�n�V���G>�c3Ա+���v��E���7B�<)��ļ~�b?H>����3��zp��$1�	1��GWݚC��ܦ/��bQ�vG�z�@I��������p����wءc�u�$��l���ll�ԇ�sx�Y9�'�ǻ�sNJ�,vo�БV�nI�o��!	bЖ��`-�Ŷ��c��_@�L����o�q���2�8��������iu+<Tl��X���h�������'��~���+�ִ�'���@8������x��9�V���<�J���mF(i���@�|��)�?��;v*����H"_�q4���}J��m4�?$�_-�X�H��.֓(�TѨ����j�-	DD�����R� ���ִ}�gz���� Rb"@&��XB�kO�p����q�$�p�6-��uyf<��a�\�����ח��'����X�4�Q���o�z�'7�Cn��z)�ğ�'�i����1���e�>�v5��J��0#e�r�AC�0hZ�z"�Z������b�s��I-��I��a;_���\�׉��V �+^HE��]�}M��В��V���H�N��nb���������-ׅd�17�վ�kl0H,Yd;���i?�ld��ze��XN���Fw���^�W���ŭ!�=x
HKz��D�Ɔ�����үC�'�ǯ<3h���?����w�����9o�يP%	f�ط�;�����4�_������%H|�%��$�L�8b�0'�dO�c`�g@�0�B+���r��
�����:�:U�cz
?��X�YdY΂��}�x����́#�#xN����{��9T�Z�5���0�oj�ɦv"�>��6�A/Zb�;tW���t���������������ȱ}�uB�j�V�5�I��9�O1��$�+��_��"t q��}w$m�:4U��WX��j�h砊�p����DxH��	���M`Q��SG�~7@ߢ�E�l?U� ���M7�������s���� ��<�#�Re5/��gmC��Pb��@O�^;�B(q̋��m� ꙅݞ.���4��Y�}�X�{��v�}W%��}�&�Kk�`e*g�߷�8�7z���w}\�Z9d�,f�h�y�Ͽ_�2DI���C�F֑nj"?a:Wft��~�	&�g�`"�v���n$�]�r��������-��8�q��A���/�[�p���>�[�J�x�q��h{�A^�~�#��J2,�d�:?Y"��ܾ�O_�)!��]���?�g�8tΡ����졣�ޏ��Õt~�L/�M�A��c�з ��੕~����7�|׌=�(�5���j��Y#��آV�@O�#}w�o�}42#ٯ�Nа(�g��ڶ
� ��{{<��e���^��E\[O&���2����-��KY�ǂ9'�!���"�r������|�{��:�pwn�c���T��O��.c%��X-]�I���H�~�$��<r��#bp�e�}�q���z:g��
Gsa��~�h�3!�7>ġ.9դ�g�dBۏX��-�$��?T�}��7	�I`����y�am�22�<r��T{L�
�x�����/Z������8���]:���Ȝ��ta��,TI2jZQ��x�?���G{�p���&�C��I�$�zW$�?ZR�l��"����?�닡\0����wתc�7_���#�RaTd^0���񜻳~���TÌd4IR�e؏����tK+!F7���Һ�-xQ:x�����p�2��^߹Qp�$�_�q:IH���������4aU[S�ߧ���E�#�o�Zę,�� �h��6${|0�-"𴠈���|w��!;6b	Q��0�#bw�&:�G���i�$�]9NYnF�$�bRm�v׊Dp\�������X�]�Z)Q;�����=���yh��;z�6Z�X�������.��1��Ζ�c���z`Yԃ��m?��k�t���/��������)��Tϼ;Ls��Mӡ�2ڸl7��&������yp��òp!
7/�c]�g�M�����ПǄh��O�FF"���Gi�F���*��ތSu�4���f�]"�G2[�u�A���n-�&P�D�%� v#����y�t<�!-ژł��y������}�����K�$E���H�c�7�hUZ�1���}k��*�9��6V� 2B�J���z0�(�J�3sW�|1I�RQ���vh�L�]�>�Z�P<5������,�'֠%gO]�Kn>�< D�G�߫�4l	�&u/��8��[��b�W/" B��~�$Ľ~�7(DH:�.�["F}��ܧ#ͼc~�똬 .e�#�#Bo=��*rw*�K3��.�ܱ�6%����q��e��9�TI��c\�H�t���,���[�E#����8�|��#[�^i��3�I��LR��m��Q���5|�%�Vr�4J�����آ���v������ԑ�$�X�^n@M�)��p����.^ �'���0"ٯ�W�d���"R��ďD�2/�x�h�����p����lfqϖY�PE���7�o)�tzWK<�����W�l}��L��Z���'�>.���L�W�=�<F��֙��V=4:��D<뽎�}:]d��M�d���_[s��KK���ض���܎#Q
$f�^%x�y�y�H���"��������wY��������#� �$�tG�V �������<�2N�'�$�Vp�<�FJ�v���Cs���|[q�M ��5K!1U�Hg{k��Y�磡A�N��P���8�f��e�#x����=�,`IJ%Q�z��vmg6����s���k����;�7:��yc�HIW�#�<)-��$�q<�!�[�i���4��U(D�[���Dh�'<�����"�j�MP,^���VAH�˼3�ֻ����|t*��ly*��I̈�W��Q!�G`oB�I�n��k�C#�Z;8�n��t��w��2���xFj��!*˥Cھ��x˴��j�*���Cu�Q��mˀC	1�Kb�B&^QE�ȩƣmW/4�Y�E;�6E��� ���
�B�P��u���2��R;�4)
c��"y��?P�e^�.�KRw���Ǻ?�!����,�!�w��O����;����h�Iדx��:�ei'|^���^+�\�~��k�6= ���s��C�ȯ`���MW�R<�
~�O8I�An4����4����.g._cf�<��pR�=� y��+�A!��*����q ��e<�V�N��#��j��<�8<�~��[x�l��O���ڗ�L�48�Y�p���M�z��9�y�������Q��b=L^�4�.�	��
�]�D�Ƒ�}��"��(�Đ�=�8篭x
��O_�a�8qC���7!�c�\^i��<1(��R�����T�T�=W+\Q�q��LD$�T��Q�?򴄅U�W�R�W�о�M^'�x�5Hx����X��0�m{'.�����2�)�atE��@~�&#l����é�#1[X����u��$�g��37^���#hNg���X:�m�>�MV�$��֏?b>����G	��e����1��x8$!1�*�A����s,�*s�V�LF�V�U����E%I~�S�s(�1�H�;��
;�r��ᾮ���ϸ����@i�K�}�̷6�q��Q�xh�    �Z�VJ� 'Rm�x���0�rI�I��y�Da�]u�Z���]����H���] -缋w(��/�s�zHu9��&�v�3����P��H]7C���~>��6�h�n��K�:t	w�8�ڸ>�{e�u��e�U�[�+�����x�}��N!��zD$K�5-�g�i $�6�]it�m9h�,��+v��֥�'� �D+�C��V��IX ����ݶLA$��@�>f2�2�9��Q¿�?h)�Z2�jt�������c��&�~�$�}�~�YCP���l�CD�����?	�ye*��Gs�;����W�!|�
��XM��ҫ����������؝�`M�y �y��D����)ΧWc��.���0LY��a�B�_k��>��B�F��a�]�����6�[��'b�솑#�G������T0f��0�-�|���E�r���`���--��T�ݾ�ʺ"x��	��1����~��D@I��9�uv*��=O�`9iR��'&j��^;-d�󛽟�qϑ��[��;�����f%tp�bb�Y�?���.�W��2c���/�a���:H8��i˻�Q�^��	$�O��n�U��f�.R��C�a��;B=�DXha���N~c��2�lz&Ëa�T8n��@�=��k���k�7��̾�!�.�C�5��&�����h���q�I��8x�pE�����!A�=�=J,|櫈r�9	�����2�?�ȳu��濑2�A�b�~ԶD�k�KS�oqb�'X&��	q��0�!��F�V>���K`�28�j��X9g����1�.?`$����5~",�f g	����!v���)�����-ڊ  N O�ݚIK���O&[0o3ڊ�(� ��=.vr��%Ʊ�A�J�̋AJ�Xd3��w�}�ۄ4B��o������� |���R�Z��g��D'�S���<��ө����ɤ^rD�#���Y��>Tݑ.�O��-b�Ȑ���{�<U��۩o=0;0��K0��R�p���X$�H����k]FHb�+������I���OU��`�ğ�ȄI;�Ӯ��tVKT:�&CqȜ�����2���eZ��L�r�����T2d�؍�G[�n����)��kpx�1��_�t�S5]�!�g>�����ps�(ӟ[�Ʋ�S�ƌ�Z9��t3<$d���{�g�i�!�l���~K�~���YbL9�;B�`W�%�b���?Ō!VH�Ij1�)��T�z����A@��hR�<L�J� 3��<p�M��mAl���d���\���1$�d�ZF��:+R�!��`�n��j�A���|Gж2O�`����/�:��vN���	�>
�aIx��a6e\c�j��j��������kR�1.3:�0Eɢ�V�����V�D�!,�fհ�>��ɒ`X�s�L���D�Rܣ�H�q8M+�\���3!r����t��G����ʞ��2e��9��9����5bl	1�E�k<�"+���
�\*!u�3��������][�'�}���s)T!���m�a�_I��x���Hŋ���f5���PY��pɀg�!N�I����'�E�)B�M�&�}���i E6��8$�(������ru{*�ٺj��p:j��Ĳh�6Y�g����8�����䷃q�A���WV�Y]	"We�Es0����"���T�.�[rZ��<n�	���a�U�!E9ۿ�jc3��p��-%�,�[:��7p��q�1�L4XW�h�7����t����mp�����c�3��'�~��0�K<U��9|G��!&+�R�Nr!钚�zN�aȽ���a����ڀ�a�i�^�Z4��7�y���`�7�t�.�F�VSiV����=�Z�	^���8%�`Q���X��(�킖#��.�EǊ�;*
��E\:���(���~���Zf�]Ш��I��\��Itj �,����D_�{h�+���)$��C� 	�m�����Z�wX�rb~݄p��G"D����������A�j?���.�Ξ6�$Yc���nئw�X\��׽�r�Rn����s��SƧQ����C�8F���~���+b��<�n"h��R�>��jO�������ei�,�ȅ�������0}.q� �7��@V���,�y)�B���k8u���~�@��g_X�>E>�sڭ<����M�S���(��N6{f�j�EQ����������� ��J_�~�R�TZ,��+�!�
dR�"������ V���#�s�\t��}J���w��Ϋ��k�Y3[�*�rB��\&|J`T(�gF��+{f)����,�3��@
$��aE���C�� ;+!|2�I1��%�́r�M���|6����ߢ�tp��}���p�c\��k�1�E2`u���b�Nek:���g�ᝧ�7%6�Q��g��,t���a��9������̖酻��Rr�4�N�ۧ�
�r&��G�z)f UF����:c�:j\ڨq�0�����K�T�Ğ+����2O��ǹ��+1h��v[��H���?��m?%���o�u��O��x�l4j<���[J(;]W��o����P�IPЈ����z�

Y�83���T^�#��]F,Lq0iإy���ɛ�6�r�"�G�\a���1��~8ކ�23V���xV.�����v����@�Y
�A~� ��2e7̀��K(T�#�귫_�ড়vy�t��3"d0`1/��q����jփ2�U��q�Et�v��(��t�����8b����u+��2+ �*�ywGt�~|O�-Di/2l�%�9C;�H�*�n�ۯW�}�wkY	��UĄ�T�ڑ,���������<d��s�
��_����'�4 a]\#M
�'h�J�pڒ�J�w�IJ��Dg{
Y�������'����8}$���4>���5��s���K����d�/%Z�p�����}e��n�Ka�9r	��7��Cq�U	*�A�tS��?���?��"'�"������V��ᱏ�ql����c�KF܄�l[	��T���3M����A���{��0\�n���x�$\�u��G�橋�]z�P���)���aV!3�2<@�W�In�<Hz�+y����{uuJw���1�Y�u�!х�]|&��#�^!���@���u<�GS�lg�[F�xx�*1��˯v@�*B�A��&jm�w��@�LHF� &���=�Ӥ�뿗x2<o���%�D~t(Y��o��%K�{zdw�\�9N��#ƔO�c����G��E��o�_ ��8���&Pڳ��$}�.�P�_ߧz8����*�tld��KWn��Rws9^Dp�W6��Q|1z=��B�%��e��I��Uf�R�9�$����Dvo��!�V~�3SO�Ӏ՞c'��u�)��w=��@&2�茷߆V'<Df�*J88˥�`��R5tn{4-x��+%B�:@ilp�j=!��OZ��k}��o���V~("�\B)��5�K=��Ͽ�h%-e��&%$?�����e�C�g�{�(8�	��a���茍��kU�I�<��4�����e�ܷ$�h��e�U�
6���~x�W����a��o&�JR�Mg5w�{����J���)CK�/Bӽ�W��dSoH���>(�)������C���E�����{����o��ߌ��T�~v�5�j�yk�c�E�����J��$�w�O���4	��Q�}��.D��Z�	��!�K? 5%��UR-��(�U��a��~�x?���9[&�b/:���-�X�PH0�*oI�m���=�PK��_E3�:�k���r"���X:G�9s�b���G�\���ׅ�k�/ ������E���G����NQ
Y��R�w�{Y?�ڄ�3<�Q���"���"C��>i.���jF�X��8˅ir��T�y���b�b�N��cV������u���?�K
FT�lu�ߢԞ[��E�iT�3[�N�p{ ��i� _=*��Cq��;���K��>�~4��I�    �W���\W�A��q���il�d
�@d��\�F��<5��s�[���C�P��?��ms���<k�`G�z_aW#�%0t�\���0#����z���2�����}8��,����<�����ϠRx��9���Dn�K̈��t��z�fyK��*K��m>��y�({�+����p��K�$2��E��J�(�_�(�dH�!e���=�3�d�:�J�: $�:]��w`�J&L���'J����G@��٬	K�c�C;���<F�J��(�MҢ]�N3s	�Q�S׽��#})u������K�[�kw�Q'Ly**%'R%t�x�;#T5��FW�����YZ�E<���*E���uՀk3]!U�Y<M�bp�y�|&Y#NE>�v6����4�D�8o�"��p�l�gR��>9�C]��F@,6��+E9B�\�!97S���� �[B�]��1�d|�#�9�f�x�V,3d��]�nD�l���w-~3E���S�쓏Z�_�R��DI&m=BDt���UT~�z�y��V��˖�?�V�I�5{{e�,��u@�i��
�r��l��H�>h����{5Tc3�~Z���^L�gZ�д|��#�;܎p]|�?u��f%����P/Sԇ�a��8E�S[}7���x�;�M�$R��Hx<�&�!�Cp�R����ҪL&oy����89ocj^�'3�D2��2��N:�8�(�HX���v�{�[��	~�C�FE��G�=L�oRE觭�M����XFEz��4n���־�Fߊ�O ���վiꮦ�5z�R?1�xQ�(]����,��L�ќ��E /3z;	T{uMUj�����������7�-gb9�hh=YHI��Y�������X΀��2jt����^]��;h�=�t�9;�r#�#>����96Ü�qf(��;߈x�� 9��kS�I�|�H�O� $��.I��"�=k�?]�\�6�l��k%D��#���$�J�?|�"�H
a���X����
bi��@ktb�h��1�h-�뢔�NӃ�M�zw�?����.�P�������!~?,��5��a��"�x�(3�A=q����+�<�#�t��q�?G������>N�� Q��U@��[�^Q�t�a��S�L�e�vE��^����so	�al6ش?Hbv3��R�kKWN]z�l
�{�#o}Sn��_r��$Q��ÈH��{C�6���ĥ�)3��KVwou���t���edȅ�؛)�/��Щ5R�Y誦��w_���.$��?�#���P�4�G�L��q�s}�+Oݬ����#���X%� ]P����&V�Q��;ǽ7UkV	US[�IR��6L��/�2�ɽ�|�<�\^DL�2R'��:ٗ?t��9�����yN�P�«dƨ�\4��b��eQ��c8\��H��[,��W�_8lT�58��!!.>^���,q�%p�9�`���}Ɉϕ�6����8���>[�)}�<�E._d�v�4���ӆ3�åc�����4�6�ѥԟ6�v���E�V���+��hEW�d�q���[�\��6Ԟ�
� \�l6�B���%�g-I��s��۹�F��T0���2f+�0�
ʣ&#Bީ�;A���,#���.���<�-�����@�"��<(��:�udTm�GQÙ�3��
�s���n�c��	*��y��$��h*s&!�����c��B�~���ZJ��y������X�%�������F�V#_P��r%��g�*�|��P-wgEiT=��~#)�F3�?��,�^�84;@�0��>�HHm3S;uUڑ.��v�9��[Xdw�7�P$9�g�ha�@ư�PHiQک�)*7T����Ki�汀��7�
�ť�i�1s��������E|*�#̡�h� �E<t�:�ɞX#m�׆,B��'��)�{b���9�(ms���q���c�Ҹ�ڈ�O�O�Z��<n�����B;�#@o����0R��T�f��m��Ha.�T�����wT/�C�K�1�8*h�r�Wq�b�D�^��LAm%1��ְ>�'�Z/�g�>͟.A�ʘ�z�kbTg!�\)>/��kF�8m���-	�	�H��+ńv*Z)f��V�	����o=e��B��H��:�j���XF��i���_
Z��i���y_ǩ7���|����Ǖ��s��/�M"�s���iq�/U{�[�uD��9M�;-��|d �wI��EGh��69��������T]�e����\,w��"��ʷ'I�@nۘ�Ј���f�`�O6ۂ�h!әIE�h����\�/ΉCu�����BC��A6״��i��;2�*�&Ԥn}������hA�P
�[�8�_�'�e�c�֙i}~t��̀~��$Dԑ����C�)<��/b��>�v���Դt��X�ϲ��#��F�
�.��ߙ��-3�n�s�귙�O���vK�Rs�����y֫D�e�A�e��������!1�r����r����ᘁ��n�D��,�Z�o���y3I��Iv�Kᱯ&#Fz�_eM^�L�P���e(�>��sv��MW!�����(a��;���[��)b5ݑ���8-1�@(���^���KH�����c��,�dWi�-����dT�UP��4��DI�[VJOe^H�F�;�:��=�>^¦V��"��RBb�S��2�`�����ӡ
�J�V%R3�v }9i��T�[����c5�'����r�~it��x�?��'G�'6 ������}[7��������x��=~�#Q�U�H=,W�q]��z�����)��ǿ��$�#��N?,|@̴�(jN��NS(��}*w�Q-<��HMV]\��OVH�����	�P��!��	.��ї�*�D{>FX�7���O���D�x״��V��=�С4�<���6���<O�q+Ϻ�KF�	���]i��f�tٌIG�^����V)���z����Q��߷�0N׺}�I���m��E�'m�p��ukVZ|���A<Qn)�O�� �U��j��V����q�b{�2�������V���Ը�4�"���K̠�"��m�{OL% ����:�j0	��Bv?#Kn��c�*%�
1���|�P�(�6Z4�Ax{E���{�d��n�fD{'TW�c"���c֐t��k����}�W�`�
�!N�G���H��g�!������y��1���a9�'27��v9���*@��f�D�s[�z�6j��Sl�B��T�d���`�d�+C��R{�ih������Fx߳/�p�9]��O��2��H�y��sm�0i_Ӝߚ�5��Oã����i�R��Z${IYFÅNR����i59�`u�k�ʝDE��d�v0��>%�m��_΀�������F��4vR�Kbk��X��v+��LW"yt�D<��S�HG�ǣ}�2!��(h��o�>�?�.@�쪑#�+oʈ�D�"0�ɞ�Րe�/)�Y})���ŌԹR�e�F_����+d�*���ٍr�.�n�y�@�p(���xMG���Na4G��V��"�mx��x�X��st�9Mu��,�S��+��i�4���(P �gw		��K�
s���=a��n /��BG�F�XD3V�gap<�^B4����2"A�p�����HJ�0�kG���1�7InƥuUD��\Z�1X����/�Z�_��;TsK��$©��!��k��>�DR�%�rv߂G+2��<Z�?+/�ɈY3N�dP0�Ѕ�;i�p�#�etS�P�^���lh_o�o
��hw��bw�6��������ϳ�_1Z���O�%X;���SE�TL*�ʩ��?��$�5�V�0"o\K5ۦ,'���^��P�N@�D�������9%5��j�vu5~�`�/��-��z��������U{�.ۋt
f��\���Gh�5�N¤wh�G+�y0z��+�T�Hc#vvL�W�;�c2�^�����s%���|ݡi-�
r�4�`JHج%D:��؝��7�ouQE    ��QP"G��1y���9D%�Sw�t�b���.s�%��<��cғ,���!�@U�'�6�M#�gL3���I����
��$����r<k�t�Y@�hx���*�,����L��b�"P�<���8�������v>Bʐ�#���C����-���)s&�O�:�����Ϙ�3dw@#�=��)����6S���e�p��z���x�����3,m��o�4���4(�¥+b6� ���e,,),r�,�z�;�ٍ�����m�E2�6�yN ���9�,+�I���6�,L�>a�2s6a��n��_C�b�����R��`��m��b�,e$���c�*-�ȲlE0�j��aq����	z���(�Pȍ������ E�=V˄�Op��L<^2_(��4�1X��[�zoO�3 ���r����R9=��~�r%Q�r�,������\�W�>�o	�~���������s:�t�Ql�f˪����\��3)lkC���|�'�R�T2t�$;�Э�������<�`��k������6��c��\gc�k�"���S{�MђdV3?�"�䚂�nF[��9C"�����VךXig�I����p�7��q[����4�MѦS�.���+���ą�.MEk3�ז�G$y �?Q�aEݱ:�{X���J<��~|�*p��V�x�e���� Hr[������R�a!=qf��ZrcΏ��o���2ڇ"���H��`3cm!���<s� ل��~�76�7���z%��x�D�W�<\���ץ��	��,ȳ3Kv���N�|���c��ΏVۗ�#b+\�8"�FWָ�����P����8l���3�*�f�`��t�WL��%)u(��wn���Q�z��M�*��<n%�ĂԃRSP�cD6��J8�j�	�mV+��T
�\7"��rH��H������h�$��i�=��&m����lZx�g�	�����X��NE�`I>r!���K��o�.s�1e�=ׂ�3m���26C�v��,b��� �$W�T{VL�`97b����l��]�E�x�h]�22!0������.�1�p��+0R��.��Bj8��po?Ū�82IF3�:�lP�prO�����oHګ}��z����Sjj��R�Y�=W��ے!ΝFԃ�i�>�9�F�Jt���C�rc�5��W8���P,���m��a)կ��p�3%��k�c�>.=7T�~CIeI�f�7©��kl����������U=�2����v�e/��h��,1<낸N�R�B��JIj�ь:��Թw��H���n��3��+��t�z�*����J���\��>ĺ�d���#=���%U�p�����[�[�Cҭ��V��/D �~�%�j��_�٫����S�!����9��ܩE�xyq'���jo7I�&�,��y ��m�O�R����]a��~e�p�W{�P�&�P�G��H����u��9�#^�\��E�$LCE=ړ���vЗ���w���&ݒ	�'P��=��p=�ڽ_�i�����!?�jwJ��0t��J����p��@6��v�>���1�L�9\���혏(�.�|��:2x��6~[��潙���&��L��;mG�Fo�q8�\R�s#.���r��x�M��#1�WhY��93>���A�����0�~���r�ZY�b�����
��
�����Y�p=�"�i��Eл�#�����1� �H���S�\�m��nb�o��8L��<i3*|��G\QQ��+mF���$�%֖������
�۾:���B+PgX�o ��ɍ�U@����HY$[(5�+ZBU�X��@�ힽ�A�Q��݉�1��ì]�0.���5%{�qa��	�r�Y&wSs��@�p�prs��)n�c�ȕ�6�����t��yaS�_����ySq��� w�ƷңH~Q%���������Q?�IX]h�Em�6E����6�|"-jbጵ��蹏~���>1:/<.'�锼��L�	V��4������孭�	.v.���b��
����qĚYj��t���� uvF̎P��x7�V�
o���N��VȘ\c���G"tÃV�pv%����ʑ��VN. �ES�y���dl^z���p��C�lG���虄������K5+��*���A�"4��pH�QD���V��W���U􄏔44�U�+_�d(�l�#B*��t�`
Df���}vi=27O�D.���v%n�_Q~3n����8me%BMR�����q�'>��G����L��?���w #��e�bL�&��A��H�"U�~�?ѥ�ç�Hd&ib����2HCR��@<W�"+���\�4���W��aj��f�T�v��$��[Z�i:ҴgQN�ւ����U��=oϳ�w�|2��6L������ bE��x�s�ܑ�#�=%S��u*��ؽߺY��L�E�j\dH��:����QRH+S���X2*�A2��ֻE[7J��d@�{�UC$��/��� ��?�"�� �5]��[D T����
jw�M�v��#����q�4X��u7)����2�wS�Z^ݷ�/��)w�)_�#��&7��Z�pet��t�PY~��1��2�<$-E��/̘gά�%��3.�qu8�\�U���7�Ȑ�o{-�Mbh��5���B�����;m4���{�w�����~pFf�'���w<0�������>���֪j�eF�Y>cmy/�8���<�
!�;MD|v��~`"Ԛ
 sH�[ں�M5B?�_�iT�sΥ#�Y�������J���5O�%��^��5b���,�~҃L#J����=<D-��$��}^�5���Цu�f�"�W�]@/P,��lm�ҵ�9Gc�Ҍ0�X@17s�?����M���Z�AR�H�S3�d�l�7���ĭfz�����0���?$W�zͷ�b�����zg��'zN!�i�jWf۫e��-W���ߺ�ZS��Gkj��T���v��X���4�d�(�c�H0���3a��Q��Mt�^��_��/�Z���W��=�kn�D��ys���%4|�B�)Ҷ$�l{%��h�Uh�ҧm��ֲ���i��Ml���a��o����gˋ,�R̢��W���qCe^?�F稝qFwR#�
�<�iX����9\�b�:˝	Lg0�cg��m��{Q���g����9.>��m�{�����ظ�]yP�k�!�-Ʃ:bQo:���!a�2o��̛+�sI���i9&~����Ev���?Pg�5r���c�|��+�%�~�%Ef3�U&1��/ o�CB���2`��{����$3&.(�*b��Kk̶&���L�=Y$�~�W9�{��k��m"�-����`uE� A�Տ.����f01;c�( Q��l'|A9��F�_��P�_߃,����lQ�կ�ۅ l�}6����O���>=�3��+W��ڏ����g������H'��9��H�e�v�������S��Ѹ*̾vΪ�I�#��@F��!t���oǹ��"�$F��f<��s�p����>�ӯ���a9��I*(�q̆��,+2}�v�jz<��<�sR0"�2������}��U3�����3�X�p��v��geF�b�1���V� W���,,�h	-X�xG��ǜ!)�9�?H*��ʾa�n�E᜹�H,��|FL\��3��T���Ǽ�B(��7�o����W�\��8sP.�ͤ��GW�v��f9_"�',H탭AE�v�v��rYO{��=�&�8&�Y'-Xǻ)��4���1=�&vױ*4[@���*vD��^��0��Q)��N�pP�g�����\��r�5㣚������ݹ$���q�#;҂��ԹU�d�ۆ�b�(H>)��t=
��6K�_�Cm!Ux�`�$�y��70����UP�vE=zpA�a�}��d�L�+x�e|�?to�y��X�!k7�?{�.:��IS/U�ܢBC�    �WN�����p,�����&I�q3�,���3x숄b	�ٱ�-<�g�D��I����+�<=;��в�ܣo#M"�v�Z��h�H����fb�i�<��E?��X�=�`qN><4�)�J{[a��0\hL���Ȫil%|-�h6�H=f�� %l֪�v|�D^���l�z��_����jp^2f�����oIKz/��M��L���[3�,̔�`�dsN�O�t�K�����d3k��iI�y��Cww/���ꡋG|>w�ѭ��:��Ҁ{���<�x�e�ۓ4��#�sx��,���5��ts��=�z����/%��A�L��!�L��@Y����&���S���܊�D=�="�q��%.�J�/<��`����z��q�XXM�L�,�(v	Y�vQS�6�30}S�{�UJk&m�@=�]��^�M�\�7�Hݜ����b#V��ѡrZ$�	���G_a�m��~�W8\��T�
���W�5�f2�a0g�B��y���f:�����N/5�Ӱ�y�ǎ{8 ���[��E*��r>Zu����!���I�����o���BG�"��^��ogMcX��KA���(_Q�wŨ���i��)Q?�tvoAD��[CJPS���yrq�ɕm�y�x�C`�ϐ���p�}���YU�ҕŲ�1	�%��"�����O��T��u�����IM'N��q�o��hF�N����Ux|�o�!3�_�8����#�.��bk0.cH6�+6��@����2u��5�w*�d���
�$;Q��0d��XBҖ�E [(R�r��%���.����$ ��#�	�m�X��"�)�=��=&���	��`�r[x�5>��C��4l�p��8�7< @,�xV-�n�e[�q��w�g��Hl�(��D�E+����D�QtA�F���$3ը�n��.f��c���f����rj�8�c4	mg|�#�� gyp�F�n�>ڪ�QA�9Ծ�)��)³�����Tv�l!.^�˵���8E������[�H���G��誗є�D��>�C��G������w��@d(11d�������.���8o�A:Nn�"���!���W=NH5�[���̅���Q6g���:��?�C�m�[M4�?�Η������s��lV��2'�zk�� �H�����1��"��u�� S�R�,�u�U����|QQY��BW��}n�I���}�	X���x�%7��rh>Jd��D?��Ї� E��l3�&��o�)dށ�7���(o��$�%'�)����b|%�����7��� �Ht5ELM�<�Յ�n��XT(C�++$�<�����$�d�����x��t�R�4"Yn�2 `\/�*V����S����G�{4$,��n�J��KG<r�׷[m
&�Zz��~��0�NAHTn_金�?VDX�@�*-~��A���: 8�Шen��e��/ӸY�凐�s?�|��R8�\��3L.:�T�x��J���tn�|����Vݪ1i�������1Q�SB�~A"&����^^���- �U����\�yoݞ��&]��0:{�w�!�Ok�?L��h4�u�D��TO
۩�S	0��5,�3R� �& �}����x�@�d�/^h��=v覣���n]�R���b3?z$�2���5mC|���D+"�$�
�V�I��-�gi���#� �x�m0�C�ø	/Ǯ�>ώ_�G��(�n܃�闸��B�kuk��%H8a�'9QӔ9gp�̵���߉θk��{�+��oK�e:���^�ru�׺��\��I]��$���QUF�_ۊ7�ɣ�@7 Ǧ��T��n(�M��|+"R�\�����	L�0��4,����$]p"���pԉ���W��R0�8�\�����?��"�b�9��KR��A�s�s�YZ�2���fp�x�Q+�E�$w���Z��`Q���e%R���DK��T��̱ӥ����n�42�r��ݙ[.��n.u��<�I��hw(�rV�|E�eO�	T虻���.��@L[Ą��b�:: u�`۶&�rsp���PRl��)�/_K]��y����D��m��6�朸D�ˁ� ��d{�9{�\	B����r�yD�&u~r|�&���yq����HrcϱQݡ�o/Ћ F��+��_�5C��L~����z�MP�=U7:��wo[fԔ�֯~� �u���O�vE�:�ViO��]�9���-NX���#+�La��U�=Zi�<m��7��9��z'��h4���~2����8�&�TV�(s����aG��[����	F�xM�Il�=U����i��Ή�"N>:,�� ��վI��ťÍ	���C}
�SQ��e�\&2uڊ$H�����@�88�K�+����N�~��b�����aE�1K�aL��jZ��_�l��&�$5���:����%*_�"�`&��W���I���I����BU������6}T�G;%E��Q�N��(Q��~G:f9w����x$������&!~����T�!�]X�Ҩ��XO�a����=��փ��S's����W����e*�8}��!ܧ8���R]
e�>�7�zN��R�ON���k�7-�3��5�������
����c�B�p����
q��¢`�Y��𐜢�b�a>EA<=�j�ʼ��$�Fb1� V�ۅPU�� TY 1��d8gN<�ԋa��"�*r �UqiMtE��׺��O�<�]�"+ɴ�
��Υ��ʌ;�G�S�H�j_u��GvI�H�Yko�ĜIb���9��4/v .�f}�?�%�s%$j������.�q�t\�Q,��Y�$��Mb�N��C$q�T,�����.�*h�ί���� �X���R@�,:�l��c���}=i�d��]=iĒ��غ�{#�L[�GxDq�]a �#�a��Ӹ9�������"�ٖ1Ci�����R�2�)�X<SS��I.bkt܃�U����W�u�{I	ƈp�@',���o��ߚF�P g"����@����C�d�޾�S��Z;����Q-f)�UH|�U#��,5�N+�,��k�r��/�@�h��U֭��}h�Iƍ��y
YP,2��8�l���|
��\�t�3<H|n�v�L����4�DQT'�G� ��Y�Yy�["�G���KJ�T�;6�y����#i�!�D��J�I Y!��և��}�L�q�F]���[H��8$���F#��06�sԃ1v��<!�2ܽI�6�㶄Z��,�������|
ouG���Ye�y)U�c�|�$����F�s6;@q�¥�� noݷ����y��2C�Dn�6D�����r{�,$:@��Jc4"�n�
����"�>9C*��>!o�6y@|������m�p�:��,gį��5�D��ܹ�G9�r��RJ�!$��R��͕��SK_���᥼0e���!��+���i<�Ũ��cF K�	���∧���zM=��;�P�2"�ʎܑ�?��}k6&�3L�V��>v� �@�2RGt��~�:� �ֱ���j��E$��%҄o �G��ABo�J�<�����aff�¾� �0/�ؚ���'�A��!�/e|����lz��1���H��yN��xU5�s�b@d_��I����s.��N-����b�αmݑ@���/]�r�P��%ܙ53�D̆�};�H�6���|Q�f��}C)mI��Q�!�Q<�8�`Ylׄ��C[T`�Pv5��|�(uPI������,��4�����۸�%�[����}�]�����I��SU��t����;0(R���<Ta� �!��NQ �WB,l��;�!�S�`�u@ڢ�q�ϰ�4�kӠV �{�A�_zd���8<`�~ѯ��.A=G�������w�t������2J
gzU��>v㰈Ex<�����e�8���C1�����ޖ��K��>.H!���/��<2�P�Uq��%���GR3+;��#G�8�EX;g�Q��^���P>=z�.�e��Nkҳ+q��IM�؃�*�uP��R`f�    �+ŗU�!���jZ�͒������%+�=�U�.R��2�X��7;Sc)F�O���ڕ��B���m҉����R�����(�s��h� ���^��4���"74�1��s�TފH4��4� T��#l"����h+�;9j���s8��v;·甪�_d�#���ձ1�C����ى���/Y7���_����!?�Q@�Aa��DY���YYbF�8����?V�R9}~&�_�u�X��"	$0���%H�(0Q=<6^�ѽb+�Q{�)�����P=�2��k{�������<.�cut)�(_�k<�j��{D����ܠ�BRn�wd��}���d���<:@�^/�ŕ�ͭ{z�Y�vC]�H�:��y���z�]!
��$lE�J�����{���VZB\W9ګ�Ш���ɓ�H��3�λ:|��1����Wu�+�J�vg-.#�g2B8��>�k��,��6s{�eq:�H�"��Q,��(��|=�pT=�y,j���y�ݥ�R��.F(7�����sv�8j%���%A���{<xqC��aS"	�měA��}�EQz�5�ƍ��?C��?�Z�T_L.W-���ņ(I�NLzqwbº��5i��>���v�f��t'����e��G#��
H:k���a0'@ݜ��q�C󐚨��'�&f�xٌR{mUfh�{��IzS�W[�Py�i����$�]v�/�����a����\S`�)�_�e󑉠Y�V�$bQU�hhGK���Crm�`p�D�}��BҀ>⼴��v�x���k��k��.G��~��t�E�e�3۔Y�ŉa����M��s�k+ ]��.P�)I�# ��y���^�(Ò�D�[�?��,U�%�38���KiV�aD�P`Ꮐu�_>�]����P�?aNA����@�����ؔօ���{���4���ǹ�v���!J������Έ�{���M<������qt$�z�>�j��ј �n��u����ęe�SK�w��X���a��nR�"��{h���KӆM�E�+���G���;3 ���r5�xGv_`���'����r�}4�RSm�i��zf����2o�rE��&򦦦�D�� ��t�9s��ʓ1�ji��}�-�[�r��,ܙ��Rt�6� ��O_:����#.[P[Ϳ��D���0WFG�Z�>9�Qv(����F��t�ups(�Ц�j$k"���y�v�;��F��֢J����E[���K���lv������e��b��f��4R��,�SU.�_1��w)|za�T��{��.�8NtK*���W�3�"��,7�����cg'����A*����x����H��4�:xH������.�g�3Qo��z&g��^����ѧ%(�Uv���lsQZO�
en�jW2+����~��gA�
~�"�t���q�����L� ���LB�\3�<�4t͌�����(�\L��ۃ9κ�5�ҧ"�>]fg�]Ւ�+:?���)k/C��|�n��!<_��v�'��H��$�U�D�h1��ʅ��/)�eJW�H�YW�D�U����(j�}� v��P��a:��y��y��v<lc轪���:pTu��{��x��47�Y!��N��W�JS������%mg��:ƻ�ix�}'��s�_8=vn��Bz{x~7�ЧS%�c��Fk��H88i���~�l������:��6��ϗ4TvC9Bh�����oQ8�4����H:��=	��ң��=��bhkZ��Q4�~�z��B�M����Ӫx���	]�m�����f��O������XE��$��0�U_����;P�Cӱv��ʌ%NJK�i [�v�3xAC��u �}�ãs4�UC����y�})����/{L
��	��m[6��+�}�~�C��f˵�;:�O��p�S����S%�N���N�h���@��7��E��Ls��1V�w���\��y�Ll���`�<|/�f�f�V�� �>�������Y��hXRm݅�lH�e�Xj���6��fAƚ��"�w=p�Dr�*��v8�/֤/bә�)-!��Hv<��ir�����Z�n�L��8��&:ma4k�i��]$4��d�T�awH��<7ڶ5����Zx����������/�7lj��rH���#���@�Ğ�n�9���n�����������E5S��Q�D����j8~.��@ozyE��3!)i��:@��x���Ku�ͣj+Q���;=�R,⬖�*�G4�y�b�l�����D�~?/��Ê�ٸl��o�������8��M+>dpk3!�-V�q$I�g�{q�W������T���mk�v?�vv>�v���������mݔv&�Y�ps���$���"�#���9�����c�y*!P+�P4][����B�?{AD�.-^M�D�v9�j<��o���Z�e@�H���D��
<�og����ʹOE`R�[���2A~�~;<��M�j\�"��y���>v�:��c�q8��H郩�t�=�-�
]еP��Ԫ�-	c�=�]�ȭ���� ��V����,��yfU��ZǶ���P��@��&��aS��fE�2���M�|S��-����B!�h%����ж+���d�2�cKB��^-5�MU�=\Uj	m�(9����`m�k���Öe�`�މ����v�;�}�l
G�ܑ�����ʿi���V��q0�"y����q\���������'���-� ��|�ҋ�
l��~+��.���ʐᛆEjf�".���	�a��u�6��p֐�x�2J 9�_T����1��)i{	�>��6����d~��}@+�DϠK+�D9��)��݋����W=�Z'h`� ������5��L�(�i~@�����λVf���nS|�2.�^��t����W���&�Sjv�s��;Eotr�*;o�̪p��^��ϖUU.��郃��0�y��Q�Y�BtED6��HW$�	�y]+CB�B�>'ȅ���k���:��j]�J<��0�yҌa/�L{�0]y�c$A�5��G%��N�LQ>eI0�1m��zebJ��X���y�2;b�O�q�N*�^ц0<�N�g?�#�?�#�%37^��+ܬ�Zw5����q�4��=�ȶR�sM�N�OM�Ņ��}%g�*YU|Xi:Ψ��A�_��Gt��$�5Js�������5J��w�(^������?ir8�M�����EG�y�Z4�Q�K+�#�mjݐd�������U�PMx@����5I������c�x-�ץE*x����%�:����l۟[q|*w;=�ZF]�G_���Y�Iv΁�	4_Г�k���Oڹ�W�:��lN�5�m��FY���~)��Z�}�C��l��ҴZ����&��`�)����֎uq���^Ӭn����������RǨ�����c��{�ǽ�h��|3�[�nz���B%Wפz�(8��������.��?��Kmi�[���&���"Bd�}10Տ_G0�b���G�n�KϠK�~ϧ��oT�ZM3�cސ>�>?m��3X������;}���;�s��ޥ��L�� -�*�8���ei:jj꿊w�مN+��l�.�$�M:��兊O�}��cq����4��HҸ�cm:��Kg��Q�����>�-�E�+��T�+W��F��2���_���Ik"9�Tn�C�;0i@"=NO���� ��7�B[\�ׅw��Edk���K߰��4e��HU���֓.<���h�,6�	qsX�QJ��m�����S�vq�$O̼l�� ^��d�n���
�A��{�����8�]|C8����%�����y6�o�!�*����6s�*�Rjeeb��<�q}����)�]�� } t�7Re@����_s��	U��)�1��;�n�ZC�KF��tZ�W�ڳ5Q����ǆ�IO[}^��qw��6:FI8F��+��P�~�6�uQ�r�0kN�։�L�Y�c���ѹ�sx�l�9�:Z�j<��    �����U9��Ȱ-��5]�y4]OH$h��U%�8��\�E�ϑH�N#��(����X�k,�w�Y1��j59"!��ȕ�хh���Z�d�
���[)}"Xk	�ʔ���4\r%)/�����s�i93�V9�� �"	�jm��v���!d�H�M:Lk��Қ'��0���w����]a��c��Z��63�����!�S<,U�9ӎ���˧�Q�Gp���X�q�״��I���� �Q~�:.��ZHWt^�ƙ�Gg�s��)�Yk:[s��9l�����ږ���5،��z��!|�6e�.BWQ�Y@�Z�����ݼ_7Ƿ������'���5��_Ù��� J����ze��'��3�����
�_���b3I�ٲ����<�8��*|<��&��N!��Q����|�ѫ�S	��L�^m*�@�wHT]�G��P�H}N_3`^�.�z����o�|<->W�\]��Z5���3�2�q����m��a�C�pI'�@�ߟ��U	��9]��Y��Q6>ބ$�Y]#�`@,(����P2�+������>EFU���+���n�סr4n�Vm)��3�"�4`��ΛEV���B�v�[��{;�ET�� ��J]�l���t`i�Fu6|���.��as��Vy�/AGA������p���#Ե�䟴���C*����Wt@��uiO3��h�oH�B�2���(���L�P�*0���Ǟ/���Y�Y���R�Ň`���
���`=]�����T�u�t�g��=�J��JB��oP�Bn�� ���i��<8X�jTA����ܧ��.�Έ�W����^�B�߷��cV����9a3��,�PP�DO�3i[gm��\!�uRZ�?�����HF�5�������J� 	�����Ot�I[�(�XO��{u69���Ȋʁ�I���^g,n���͗�_�R.�XU9�1�(u=�Z�⬬�±�;+��j������W��b*�Gպ)�H��y�z�b`U�N0O�p�E���>�}�`p�LxV�Ͽ���yS2D���ۿ�4^�$�׬q*�ҡ|b`�4�&�y"N�� D�v�������_:���,�;�O��3��̃]�Y�ǹ����B*ll�B\�߸d���x�p�*�8���N�y�x�mL'���L����	��Yu:"߇@-����f@�j��]�78l�	���6���8I߿�1!G�P`���A-ߝ�⼞�I�8|p�*3��I_���a� �.���:�Jx�Bd~���9.�gWU#�txy���-I�q�u	���	�w��{�/����b����o�U$�B֙�S�4�U!��l��J�Ҍ
`��8���i[)�'�U��d/j����!Y����m|�͕%�O�N�r-�N��j~:���k��s%��
�:+:�������I���;B�u�K[����P��m��2J�S;{@8�bM2<�Ea䨢��u8�RT��SQ+���4y�ae��C���zzp]�L��c��ů�b�r�H݊��zHuz����T[B�H|7��%�����F�}����qJ�����Y�:)Ԃ2�}Nc,���9�.#���<sӟ��Y֎k:�Z�튜#Rt���t����,PV/�7��хl���B�-��߈1�x(M����\��E���W���Vmצ�I`��e�����w-��	�R9������?�)#��-�;,�ѷ�A����'n�@�B��N�����H��{:�G�=��-hM�V�����qd�q<	��vq=�*�;���!	̏�����ѦC~e<w/��X�K��7^^I��^�I�uR�G�U��'0� ���y����c��	��e��O�g��]ė��ߨ!%����^�ꔜȺ��g$���n�Z)�r\N����@�B�y#M�;��7s0E_"�wh&����U�(���d���Z��ʑeq�isE^󕟮O���,�?��/x�]�h�-��$q��	�/ �U�觱$��Տ�3,�_fyl;q���c'�_�ߝCcu��%U��!�U{o��y�eO��d�N����`oC���#��k��4�i�/���Np<q��T2h#Q(ZJ��&/�)ԝ��|��U���$�f�|6teU����z;�$�s-�d:���\��A\��?�K0iX؞W�]�'0  �v'R�j:�zA��ˑ<�d�Ἃ����ݘ�k�S�k��3�]�����ڳ���1L(:�ZG�X7u
���t�]�6J����n<�\�|k&>j�Ց�����7�Ů�մ���D�\}4o�2��Ƴ�C�9�7�q���0�O]�k�����ߤ���G#��]�� 聄�o���2Z�'(��F�**?y�u`=#���N��KA�4΁+eI۝��ٯ_�*oϿidM5�^N��v(��>]c���$��t�Q]9�>��>������qfT�/�g`g��D!D�5�������GnL�9n)A����~e�������b��	Q,�ٕ�le�ڗgq��<����LC[�[���B��N���IR[�!arzȉn��ە���A�x��f�rF�L�Iv��=sV�V��̑r�u��"P���ƈ�,ͷ�"�q�ud p�w���j}ë���wvUP���'\<Q*`U\���&�xUIu�$���g�щ��A��3/��/�ϞO��Gn��ymbu.j���r�<�0�Z�B�2%�j�S�T�qL��Z���#Ϛ�F����Op_��6 �	������"[�u$X����A]���/`�N�=)���!-\��w���D?������T?ȷ��<�-A�s����Ar��#��@eƱ!���2���c�d�L��-'�!u�%פ�d�Ն,�k\ƌ�o���F�FޒKl��դQ�ՠ\C")�1��On�� �!�ƞ������RB�����}��y�,GiY�]���>�,�+��k�V���H�հԭ ���[:���'�#Ӵ5)d�
ep�hysH���x���Z�}g�+�A���������#��#���]ᮏ{�I���J4}-���VƷ�������Q�NR�?Ѕ|�O�@���w��+z������|&�k�L\��\��91߮��5�";œ���B'�.w�\���뷯�#����4�A�\���V��N�t�a[�	lQUӉ+�t���/��Z�c���s�i��Ġ�kЎ8���y�p�1�9e����u%���3p�"���Q��"��2��<�U?B�&��+�`��=n��z�|T�Px��#��]��ݝ�Hi%��eq�����H	çJM���%�E�8�EƗ�oQK���I{A�V������� ��}{�?�l�&RKt4*��/w�r]�n�o����M><�+CxR��&�]�M
�Ձe�H�jY]��v�����#*I��$4*|�lj�	���������ˆ�J�'��x;��"N��FR0l�q:����W؈����3؀{�;���@/4��a�N��U���W�	20�rm�~������'>(_���M��:\޿���J�umx$H7�}�
*.po��[���k�hV�~^�mA�I;��3(��U�ޓ�A�r��T�d͕ x�-��Uh�t~l����2�0ga����~av�����_�pP*���~�M��/t�p�|Z{�X2����}�ڼJ��pE?�%x��?R&ͺ�W�V8-�J�t���d`�ۼe��xi*m�@��Y�f������� z3��T`��H�2�+��k�a���[�yNf��
l���}҈v;G\�=}�_�}�<$X5�r��?xD^ԓ���n[֬��{�9�@;YMqf^+XX�`a��g5A��5z}�����$,]������T$�nA��v��Z84�۵ؾ��^-�6.��Y����+�����-�'n>��y���7tN��u��Q����p�oʹ���"te	�i{0���)S�B�H��{�b�p��7����Y�2��^g��NW0y�w��n�D��I��qҰA��B�zq��g �^,2-��]f�Ӣ4H    "_���4�m��V�2(��ri2�#G⹐�&'S��C�P۴m�F$5���ڗ��O�i��l��SQC��yȯ�:/��<��隘V6	 �LJ��Z=����U�xO��Y1�������w����9��lѮV���o�O���7V��ՙL	}�U�Y[�|��>8Oy�p���ٓL-c��A��nO7(�X�b\[	n[���ߢ�WG]I�Jg%��T�(��<n��Z���%���h��#Q����N��cY��q�C�����q�d��efOcS�Rpp����PN|N��T�ҍ	yn)WkڰDZ�Zy��D���N�lʒNL�M�$��\�|n���&�C
2���s֌��ѡ�5b�i���{�3ð_��n�^HϦ-�6�C.�6����Dv�(_H l*c��d�Ù�m�G@N[Ί�n�"�������ל��T�R�;�Xu�t.no�}�$�f��ב���\��I[�������?s�=�X��p���Y��׮��kX�|y�����᜾�K6ҭ��q��bWί����^+�-��B~O��J�9U��6�㣪�_��-W��o�'7|���"}1;�IB�K��p'��A���	�B�PvR[��sAĐ_�����ί
	qY�H��Ji�!���y��k�Ž�a_��
�#I�]�6޲�:�7"�ˍR�T�d?�vhG����6�lSQM��	E?zYߏt�{��K0[f�K�+���4G(}?n�(u=}y�.{��%�'SY��%� _�L.��i:V�@Iq}�^e�\I�I�R��X*��<�ͻK9�)� ���)j?��0�#�u'�N7P��
(#@����A��j������T4�3�Pkna��sh&yH!9e���#�ݯ�GJs�sw,ԥ����M��B>PM�n<�����>�N�/�>���4"�d���nFn�䡪\�>[v6'v[g��K�d2iih�@Bo�������V���A�4٭��eС�tP���8����Ùt��M�jqV�]�ٸ��R�4�5�g!��,qǗ1�v;��������Џ�a������w��!-�2
����$iT��^�<y�+-)g��b�6&TɵpLhW%������Y^�ٍDӗ�pR�Lc\8����D	MgN��p���	�Myc�z��,TM�J�~���4\�r?����/��0�P ;W�N\֝/�w�A�LB��#�,���e�0��r?��sN�B�r/v�;�9jE��F��х~�E�/D�;�u�("U�jՓ�1~n����+��1E�S��}�٭IU�$�ܙϿ
����B"7Đ����l�c*���\ǂx��
(}:A.���#�|O�^�p1�v[��i���~mǙ��$%��7�4��V�n%���;.�_~qeh��='�ib=�m~�i̡[�W3:q�����w���
m�,��J�ܖ�����	vd�q��`w8o�3h�M*�@j���r�����2f��	�H�F�r�z�����&���ïó�V�Sb���d��gH��fc��"ϱ{��k@Z�FYD��:���Ev����9���Vt�s���2��M1�/Yy$���ƹ5*�Y��4Լ��)���ӕܬL�IC1`��6������V�G#��`M�����?���i�=����LWp�ѥ���n_\�ŚN�#H�X蕼�C}��Dx�rK��떽<go�����W�[����,��>�ʅ`q-�9g�唯4}U
ҫHܬK&���g����p]3��O��ݨx�k�
�����2�4�w����M�{�^�����\�\8�����%��$QV��w��c:��K˶��ڥS�	\����^�m���X��\bӢ
����<F�5�]R�!:���;�T�m�y�ǅNJh��j�L��U*H�u�� ��_p�wx*s����_��D:�h�jt�_�@�UM(=�������GM1x	Z�r����� +١���*�Y��֤��'TM�zr���O�i籦����:�)�5nd�M�����g�$�|���cuDqB����me'�\'�'�?颉��5;���n{;�v�<6r��D�����N"��N�,ta�S��z���d?c[�I�2�p�WFb����dؖ���w�wdڇu�W�v���`�'8C\���L�3����1����it��Ԟd�j�~���|hM#���y2�g�rIk�w1����V��	�UB�g�q0��f�r�z)#��Mr&�����,	��m�D�c-��c��N�_Uy��:c�C���
N	G�0>���	�ͳ���3��*ʶ�3_zA���O+mn�8aF���N���xqaV��/U&��	>BH�Y.��i_CJȮyO#�3�[�?o>r	������26�tM���=�-PJ
=��� 	�^H���P(����,�|�] �_�]& H�fU���e��D����K*�8j_�V�'Oec�|돭x~/]�A��bb%��Vwm�?����?��9�v�\��	���E8'�y��{G����N"Q,("��s��o�\r�:��d}!�9��Δ�>9�ȲNA�
�����)X���cHv�*g��5�fa�wSK���z�㸗�M'��rHg`^D)��W�ӌQ�+S�/>,;բ %�B&؟�Z�iު��2ݗq��)�a]�ps1�dgi�#���`I풵�+3[��wh���ޥxg}�x�j�� �׎Cv�Զ)� �(L�D �I	j%�㥸]w(��<�-!eGYg������m\ 3�oC����r�jh�n=ˠ �ʨ�$���Z�r�Px�lh��$8����G�e:J�&�BL�J�nc���p�9U��x޶![Z��r�~)�s�������\(��ѧab�;��.�A���xL฿���O��@h�`MZ館���j%��8���6��+�n�:P�)��Y9�6�f�6yah߲�I�w����\�k�'Y��֊v�ʼߢ�\vƱ���+f񾑤�ϷR�m�hE�?tB!�M��N�Ѩg�B�D�I{�UwZ9F����p�oW!�W�D_��F�3}�<�w�)�K�� B踊F�7�N��}����`�~r��ƍ3���V��դhw�AI$C̻ȲΞ�E����9*�A���'��|�(22cZ�Y{��`,2��<��S���Йx��O=�8:]��ɮ��;!��:B@�[�5��;�_�y+�t���<��!u+t:��ُMP
%I�rZ��{�hT���������"'@�w�[�eQ���GJ�@��.�=���Z~������U/�n[X���8
����1�p�
d5�!}�z����"%��~���q&�J֝c:O]#��Q��mNǑ��6ד�!+%z�aĵ��O�h�yR[<ps)�_���o��me��*vL:�+���b:�״��}n[�	(/�嬙��Y��;2}`�1#S�=��ۻ.��]�ev���+_�k�m�>��ϰ���>ܾq����ϭ����1b���ٟ��ZC`
m��J$"S��!����VP��Hr���n����M_L��]^�`��x�-��Ul̊�Iy�6UU8����P�q��d�'q�k�����5���@��v�V1�akH(��yK"�ǆj�u��
�
�n�H_�8F��U\<�1ɡ��y�N�t't]��49�V��8��6ͅ�ef{n��g��B��j{�m�OL��Z�6�*�%������ ����$  �l� yU �W,|�:�Q�-Y�}�\$)��qF�x���zG*��aȂ-U~�6%9V���}�K�!ǂ�����Z="}��x���w��6�½�^��cl*~��%��kJ����x�>�[~,-� ��#����X����OWҟ?Xkv�����q�Sv�Z՗�Vb�R��&�DO��I�䄍t��߆ h@��~Z� ��w��8�E����.l�r���
�E�f��BV���B�T���mp��`y���@���r�ݹ|�;mW��r��Io&�88���
��2�2    �����CZ���e�n�A�޼���K���WlT)��LR4�۔��@�2����.>���3����-F�;s^HP�@���}�g�� S;s:���Yߦ��K-�q�K6B�h7l� ��1���	�	��"����A���)�X�+J[��O��c��i��2���)�~��!"�o�p��5��ZM��S/6�R�р���Y���V��+%q��;��U�>��!�v��s��3%��]�%�-��I�ڼ�1ú���:��u���\��6�jo����$N�n+X@`�q!ʮdI �jݑ��@^��k3C��l^�v�\�)�=�gT<\�(U�V���T�1P��������I�&4Rˍ�
��'�tHM�m�'mM޶)���ڤ�c>PN�},��:άF� =�ߓ�HB���D��q�!�AY�Nf�-�&���Z�@�o��W��Ͽ9 L���}�
C�6�/�G�оa+��9���I�]�"�2�*c�K�9�M�P¿�Y�O��$�{F>"��J2>�����O�%���%�P䟈��#B��Pm�+P��ۼӧ��l��N�W�X�.Sj�ĸ�ǹÀ����Ӓ�1-����*�%��y����-�oLw@�/-��4-�̌�$e��p�k��A�@�vG�,�Ѵ�Y,ʑqajW�����aqE����3���<�Cˢ�Q���71Vjs���)���#B�Jc�4(��/��勞%�g?�)�)fpUXF�����-�Y�MiJTʢUr8�������o� -�T�}��UΗ+��3��vt<]?���:R�y�M���a��{���N��yb��s|��?�L��1|�3�UO�;tf��[�6.T�nH� Y9݁�w�X��[�A75{�QK� (M3R�س?�o}�8b��N�N'^�'ň�G	$�~��I���թ�һ4��ˏ<�����Ir�
�!����c%,W����(q���Z�<8	����LW�&҃��[�/�s�#�.�.L QJ�U��P�����9��n7f���Q����TE�_#��L=�2��?r~����x�1~#��I�vd�)8�et�^�*o���u�����a ���N�Ehg3,IAa��E���I�!����i��+#��с����D�8w��_�����P�g����P�6tQ�n��ԧx��S3�R?[{�����I���0	�y�_�7��Bd�Uۑ_۱�lP�}��1��5�Ơ��T�y�W�ﺸe'��e7�v�gM	����������XwD2�&�@'�{����O�i�u���/��uF���4�Eۅ'wPel�K=4ԃ`�|0x)(�Cw��Ë�O��IAlk�����7�bW���f��̐�o�[}i���W( a Ȱ���Çu�*ׯ��iU�1EJU��f5�H_�՟��kY&qK%9I�BwEB��r9�`x��-�oBto�i�ഊ�r�1N���;����jC�6�C�r�0n>V�)\�ko��[�4�T�V�"+�Qp��MN����� D��Q4�W�H�k��To��:+��1I�l�ڮ�mAD*<S��t��LEK���I3�~Њ�	�_)��1z�*�j]���� ���)��L6��+Tc[-�������J��v��h8wG�2�5x������<|,��O�R>O���,���JA]��n�~ �`G�����>������N:έ�(�0���5�R��Q�c����M�bТ��xC�����L�I�$��냮���I��$��.E������e���:ң��P�~?8��@uފW���f�+;�㰡$?e�&�K��c�#�Qs�y�¤���!���Fgǳ���<)9r�u��s�!��?�řE�������oH�A�:����hמeM�Rxy���1����`=���}-C
������.�8�#��$%,i�_�2�L�j����1�b�#�t�a���@�0S�j5!�C5!̣��W�����i����{�q<��o�3��$����8�h��t?�u{�k�
\�.h7�4#�r�Z
��NW�<k����~�u����b���a8�H�ݩ�n8UY���R@��;\��H�E	
I!P���ێ9�������*��]�/K���$�VH
��^�nd�l����˴��z���k��\�����~![���s*�+���������d&�9MX��N�t&C�ӱ����0f����"��&ç�/(�A{�Ί���Ge��6R�ɞ�]���}���|��망�8г� j�-�E=�B��e�W���=���Q�kK/�x�����_����a$)�G�4W(�R��|"]S�5�<�l��l�h�T��$g��|�ɟn�lR�&�J�@�i�LЕ��*ape'7�,�+�H��r���\/�:��.��h�n���*��^�2TJ��E5���f�;I�
�z��
���[ 	6o�F^���.ΐ ���]TѓϝЩ�:9�c�9l���SNf�@���)�B���G���8�`.��e��֦���h�I�x�X�Y驕8Uj%����D���R�t��R`U��Ӹ�%$�F`=�b�����N���^�?U� 
��r���g��o	L����迆�L+w� �4�Re���1'��@����@!�O�J"9�3G:���M�u��<��Xhh,Gv�Ck���4�J���S���C{=K·�#���^��	��>.	a�s�56�����ظ�'���6�j�$���v�?�v>Cٹlݰκ���S������qi�R,��N;��������%=s\��T_ՠ���F���$��v�()��,��\��A�GPV����L�x
�,Q���Nx�ٞd+C�R�2Hh��|�����%:��4�Z A۴i�$�����r;����S�X'������2�H���IMu���:�#�{�m@�q����Ɯ�l�6�'Z�4�!�]"�2Ry�D	G0�j'"% d�����\���j*����q�7H�!�lY!��y]w���փog�US�U+4�1_�^�O`�%I����B�$ū5%,۞��2V����Cz��C� !A�9߁������1ڮ�{έA]D�t�[����j��"�2g����uf��iܙ��Q�~�9�!<.�Ctx�p�wQ�O�t$2g&O樋�7ϮZҜb��;i�=�T#�PcX]�4�1R��O��.�)t����,��m���Sq6B̻Ι�+�$<l��0E���u�g):l�mw��:aݍ�mu���P�s�����ߎwCݵy�t����#^A͍�4/��[پ� �	�X}ñ�!a���wy�c��й���s#.gy�:��O�(I0��D�_��y���a�l��{f'�i�Qgk��P��
5f2���뚎�$����d��(�d�i[����&�2I�⑂�ԄKcE�g<�j����5��K�Q��	׷��Δ1�}$a㸋�H��a�" IWB����z߯�[Xh5����[&���oɛN�#G��wE���]j_���$�l]ݑT�̵��"�����x^�^I��,6S<i�Sv����{!0�v��'=k%c�
5.4�����{�y\% d��|�|C�h�lh���W��U��j�-���bC��ޮ=��c����	�r�"lO��/��ŅC�`�Xdqa���i*�8��a�� [����RC��4��c,@N�^X,�j�����@X���ϯ�6�8���GS�w�d`n?�/��"IՆ�K��X��\3ߋ-�pB��s^Z�3w�y-��Q[�C��E�0�]� �[W+Ԗ�K�����d$T�*�������GG6��>T�5�C��F�����������јk*]�,�I\2�^{�o�:��|���І�\�E�������M�������e�d����V�W��	gx�P���V������ =M],�h�g^B���4Pa�
��sD|� �[*���E�ٟ�;����XZ��/e ����7���[�|"�.��{ؼo�?��E�ߧ�r�d���oӰ��O�s?P    ��m������H�� ����#�Ǘ>H�E�p��3����	�]݀1���װ�oI,��u@
��P��39�7��}P�$[�!*�����@�A�u��tZ��1���<��z�a׸Wgo?�l6�s����\��q>��m��С@K��9�օmM*����뗦�$D��#q+��|�J�4�OB"���xN�"�����>dBt����B�0�M�+A�9��\;U�b@���p����.��=*2�Ҍ�v����Gh���`=U�ѣ�K6LH��
���TS�Lд�=ݧ�N������%���bX3�|� �w��.˕�M�u���C�V���ZwVإ��VǪ�$?
��-���-�ڑ1}��z_�׀||��w��Eq�d�i����@���<��A��/Zs��Q+�D���K�,~�z�4Hv.L��M���"��jK:�^��=��3<���)�Uh1��&���c_�Nˌ�(ޜ�I�\��� ����6��pʼ�pҭ�gC� �v~M�d&�@0xx��)*�_��}��xU�wĩ\�Ò��r蟃�{W�
l���Υ0�O���Xs�5⠆�Xd�g���U�$rw:P����}�N��&bw�i��@�
0��������5��*�ȫ��fU��P�S�ڪ��|x�@�r��xnB�Tj%�OPG'�75~�	���/_ŗG؀�gNd�1���v�g�;��g��PP7��)�G� ���q?ސ����ғ��H9G�����a�ja~���m%�qק�����`�M�*<�}g�e�@ɐ�x�"$#TU��L��6�!l�>�����aڸ*C�p�36�;��o.�N�܅>�]����"Fw>q��R����)0���6�r�I��3�֏�v�k�T1�zi��3�:�	�a:�Yls�	��J��},b�5��S~|,K����?Ӑ~qXÿ�����o��ʞx$z�A��P��DD<<h�k����&8���3����t	�ʦ�v���t1����,*qZ��Z�,�
T�!,�/MلJ���Y�&~�fu{��J_�c��*�y��X��	3W����ϱ�A����Pk$������c���|�a����P��T%�z^z*�}�`,����=��3m�IU�:�|�e<�0+�������'�M��*%ܻ���EYx@Z�B���BS|J@�A	�4����P��I���Ϛ�W����V��b�ڗ��"����(Y0�-<��X?�L_&R��}���lt\����X��t*}�L����._��*.[��b��8�2���iY�7���y?��"���5��C�>���t<3k���u;E��5�����ժ?�ن�K\��b)(���p������Ga�أ#���\�B�P~��_�����Q\H�)TdtBM���5S6(9��B����[�:AYdp�/c}O�T�����'�Qg�qt��I����Bc#)�e#�{�������Q[�AىH��С>��L�P�
�o��3"�Z�z�|h�>��S������\�݆hG�&r��m����i�ļd�Y��,raE~���x�]�$0��}�s�dK7���_A|}�G�hD4�iA�П�kA,������o0���u9���7���m|U:ǜ���P T���_}��Y�%N��rݤ��u�)�o�z��ֶ�M�L$���
0b���q���(�J��"b���������_�(Ԕ� [�&��6ru�gS���ɽ�O�T0�9��ˋ���藎&Y�{3Ւ�e��įP��U!W����~3�A�^�3�I��^��<�U����@�V��esR�|���j�4!���݉�ɭ�ɩ��I��-��Qp"O=���#�wq�����h[w��F�Y\�7v��tҝ]Y��Gg�T&�@q�2�C��*�ڥ�%��t�.U�rA6�+����q�J�>�%v_�c%D�b-�O�O���X�%��ɽ�c��(��r��ƴ�W��+�q��0; ����trk���;RoWhD��^pl�s�3o���K��^~W�b���.�l'�%!����	;t%����@o3pmQh���m~��N+�TW��p�|�i˙���$<�W:�E*����\xO���\Ҍ*W$o5$��`�0���r{�Y6��f�ώ�&�\�בN�lbb�w�p��/
���z���w�ac���C�8GI��}�rx��M`W�Ӌ��Cs��C�}Z�/�R�U!<��⍫G�թ~�b㖫1&ʛ7o,�\<W�����W=NO����CqV�ڏ)d߉B�}�K ;�O��G7��x$&���ǳ�4Ǖ�Ŗ��I�Bx�K#;i��N��ܳ.��v����I��p5R@������H�	}���7t�?}X��)��q�.fBC���٭�+���� U�*�������R��Dؼ��� ;@�EtV��� ��8t�B�bп�p�����)�Sٹ����#VV�;W�5�(�pC4c�Mv]���+��5	 �����[Ү<������i���kS'��>���T7_����k%�؊��
����>c%!E���\���O�Ցr:^�'�;�B�"�H����$��B�Ia4��,���>Wd��Bxym@�����o��Nx�Bt|z�� w��ṱR����1��~S:�!H�����4�t�-g@��������ؖYE�A�ę_{Z)�7��L'�[��Œw����-�4*��t���K�u�_��@��FNܢ]Dd��ޝdH��(�oIâ�����*�ڄZ�P�O`�tc�8*��u����=�H�C���̃})S?�:s���Qs��e���\&&���
=�p�BC�>�w~!ݮÅ)��0����-�ė%y=B%8o�_��&N�=�4����T���M�Q&hz8���%����cq�	특0����r~?����5&�R���
��T,�7�~<���纬s��<�֨F��Ю��j�?�ׂ�[��Գs�S�W[U5����k�Ja��gW�H��jy�Y׋a���"[Ƕ����6���C������|�8q<�;�|�`�|������EWv�`6�8y��q<=��\��C����ܯ����lt��I4e�h�k�+y��xc6V2G��D6���y{�F[q�Du�|Qn
�\��EZ�������x��؉Ф32�݂��ᕺHD��x��F�p���wo��*%�ϙS�A�
��B7����P�|�A%g���I/T˸�*�t$���U]��u�4�ϕ ��S�
^�SO�T���><��~����p]�HPe�r
u{H��m�G�\0�Q�Q���"M˿�t��f:x���o.�ɰ.�Q	a����%�ڶ$嚳�N�_�Xv>a�:"�4S ���k�؃!��m}�C=5:��I>d���%�[F�Mz�O��R���m�p�	�&,�s������[v'	1u�]�8j�Z�Y@g�{VJ��CL<���U^ǫt����S8*Ppo f�/�.�*b��.ʞ�X#&�k!ض �srW���bq��H,0��'�����"Vl];��::Oz�ĭnu�(h�ώ���	g��.;�X��e-���}9_ �`���I�"��A�I>�+0J��`B�8UWѧ�U70i�o;�dha~2$�W:=�`�������(q�w�$�3�&v{��NN��-�qS>Z��0�	XYY͑qnv?�1|���ű���)����d;���P�k1�j�A�Z�h1Gr�}�!X�"n���P�ou>�I��7g.�n������������Ů����᯷\���M&�|�N༪j��AGT��O�����������%��XC��X�sO��\Җz�����ar����"����s�Wq]���Mq���a�ΐ_wIwrK���ǡxG��p��N3��d��Ă$�X�%a���M�]����:�5�0�څ���w-mFU���
n��+�G����%�5��ӝ�+�?��    ɣ�Z*���p빀���V,�Z��`vh�`���D��J~md@����9����Ӿ��oЛ7�=�R�w�=�5*Ǯ����3����EFg�"�� +���0lw�S�_�񦛅���h_wt�<ɘ�d��2Ԙ�J<���o[,�v���X�����~�g�kPp+`/P��U]�6.�Z5�jr}�]�	��pD���$W���4����E:�ys�۽��Lk$�����(~���ֳ�O�Q"���a5�i��JeAU���4���)��r�x�6դ�����_��|�|Ѕ(l�(3x�>0Y|����[�h3}L�o�������`6)�؄��3�Ɯء����M!�0>���H���}�
H�ŕ�@'�/5�*$H��iH�t��	����qt�|0�@}�EJ
/�k��l��W���4���:��!��C�7�zDV��x�$nqGj�2�)Z�G�1�F��qs29L����(- o�, ������)���m|�`��Ft��7$����ù�up�(���������q�����r��������V���؊ۊ��A;�������p�z�> ����'��hSw���+]>{~�E���b\y�67O���-_�4Po]ξpc�,�j���E��;��0����}��e��+L��T��F/lB��6�N��_7����D��<QO6Q(��0��,�X����Isnxs�.H�
�I�W؆���Ms��?y�	'X�p�����[�\�9�����\�f��@�kGGɆu�o���$qϽO�Y�ANDw����_3`��&�瀁lhy��m��&qkK^,g����/i��4�7V�ւ8q���~��$V�%��G�����d�S�W���d�^c��6p:.v�uiM]��fcR��0�.L����'`d>��b�c��2�1n����_��<9�!��Y�^�'p}�l����>kY-E}�s/�L�z��g�y�%֋m�vt���n��\~obd�L�zE��G��p���Ae���k;���*����q\�wHpgr�e>�1&[6on6�)v��YjKG�њ$d�HI5����;]��w�4�G��7���j˹:�H�t�m|�s�=����0���R	#Jn{���7p0d�	ƅe,	(�d�Q�3���F��Qh6=s���!d6*�7ڕ(ۻ<�	�l-b���8n2��"�.Q���n��2o�#�����{x�T"�{�N�&��Q7nږ����[�͜�v�P�4�B���f�5O��KXBH=�(RKZ'^3�r�����H20	K�cF�F:q��m@ť���E'��(4���uǷ�V�[ʷEt�aC,}l�s�]��?U!6eક`O���hp�%�3���\b���#{6����y���@��w��I�$��Ա��+Z�E��a��,�f6�Č&�&�8�2�avWCݐ�� ���F-���D��F����V	�� 3���!� �R%���~�I�d��1\^h�rh�OĀwD�2��7Rg�W�.f����N�8k��1�{"ڧ�r�B���#-�ݯ��J#C�-��1u�T�o:.�@�,�����S(�$OXZ:��8�Ӷ`B9���#NEX�����9t,~�F� xK�H;���H�]y���}�����f���t8��/�Qi�����Ƹ�L0J�_݆��lQ:�+dm|��xM]�I*�=Y75W��e=�4ܮw:ӿ�,���uĺ����U�Uη����HH�]����-�.9xS
iѶ��	�a�0�l×��a�
&�*YPd#:����Z���-AT ~�l�1Z��2�Mq�z`KT��`��$�T��:�v�2�W����(��&��XωP�p7�Z�(N�u|w]<��"'�W��pz�i�M�+�Ё�5O��.��z���y��|���Bg��4��Fe_�/B����q�}��B��$���W�z"d�Դ[]V��Y�v������X2�@q�`�9�aK�AS���o��7�f0��Z�]�AW�������L��2/�+�����_�=��3��PX�3�:�2D�W��vt��u�<}���2U�3%G.�t�!#)��V��J�+�������$�ng-wѵ�:�`/�����xyA����{P%#��<>}�g�4�J�
�k��g,�˪��q͇}I��ۮ�����(�tP��a�F�be��Y�Qi4��{�
Қ���:Q��!c5���K�9�H� N�6�yz���e��<}��۷��*�:R���rF-�:_Z�V���8�R�d���ɤ�	�bz挢�ݧ��7��	(�$�xl
Y��x�2�H"���4�D��\��4�)���%
��
I�w��� ��$s�N;��<��^?C׵&�����gA�{�=J'k��з7�����-�k	� �n$H���ђ :iLgi	h�Y���ULZ���kMG^�2I3m^�y#���x���zr�� J��!븛��b��~COA��|Ӫ�_:�D���x����3^�ɋ��l%[kmf���Z��Ou�*0#~��R=����+V��vn�T���5Źn��C�G��|���F/g�Q��zǪ�����̒�L�t��OwZ�7������eJ�D5'Z���0lދ��4�-<��~;^Q-�΅�"ᰴ�� ~��i
��[�O��|K�#2_P�.���2bZ�S���;��-.�~�3qO�k��N #.�p�¸K&�ElU�_/��ZF�U>kKo�U�<��1ZRv�|BB�O��*�l��
Y���P��[��xiZhSt߁��gc�\�, =,O�^W�����տ�����
���[�)��pΤw"����}<E�N�s4�a�]�zU}��.��b}6�gd����>�5��=�k�3�����A(�X� �U����ׯ�%��=����W@3h B����2B&�� [�úmP3o+���pM�T�?��Y�s,FZ	<e,Nu��j ���F�	��L'�M垔�@@�}��Ʒ�n���js�N���s���:�c����p��p�d�C��nO�H����ӕ�l�n���n$�7�y3}�#��O�V�u�"{K�o��c���=î�� 7c�����xd�Ej���/�A��>
͢:���в[�p�I4������k(ǒ�t�6���J\������O��R �E^�9����#�|3��di ��Uc@]aV�����с=j�g`��-R'\I�0���}V�r�.cl�Qq��K�_?Τ�OB`�p�N�W+�˳MY��-��~=�gej0�6$΢Z�z�� �>a�����H(0�
!���v�샑2�pɱ ձ���:w�����N��� �z!�ؕ�t��9�LV���$���/e��l�������ښk������O(/�+'kƶu:��P@�=Uq���c��q��Cx|��%簟����8�����:����.?\ך�;�oh��D�p��-))��("�(7f�C�5$�!����9=k� �=v������S�}��U����k{H�A%P�rN��iq����7Hz�yѪ�L��-������r�X)�0ͬ�ީL�j�^ͱ�.������ ��_�G��8R5xA�����+Gz�d�0\�1��|�"���Y_&�G�Y�\Ln��:�UJI!a�U�f�C�������%vQEO��A~��l��MQ�v�����A�q��Pq��m����utw��]b��%�j�o�����Ƀ��ݿ��#{��<V!�����l��Ūhnc'V�G��8���.`�:�H�J�N�8l�z]U��q�m�"v|�Y;�Yk�^ӫqw��[��������U��7Α��<h5����P��oAVȅ���#����ʲ:B����.�F�5�Ǚ�m�C�I��>�v�c����|ǘ �^�zޅV����i���N~4��BT�I�7�5�Ţ��B��G!�������q�~>��8�twlِ��Ȝ��L-!7^���;�� R;|r�a_����m��Xh�݃�S    }�3Ule'��cl��,_$$m��]�ǏED�����)�{'P�BSނ��^Jt?��1�>%=����S�>���ޯ�;}�#Bj����ە�ӡ��D����>�1���f��΁m^��-���H<���M�#�BF�qdm޲�[��0���p������_f'o�=RUg��TH�_]'���0��Ũ+.�I��R�����F+&/�%��W�ֶ�c�����N'���3��d`��k�:+�a3���p����r��'G�4��s������������m�̱Q:,�N��S���I7����G�'��#[��Ơ4:)h�%y؞t �{t���:p�`�|�*�@7^+{��]�v�'�PYT���Ƿ�农,�$`9��O~pܻp��C c�ISBlF#�9r�·�J�r���xFAGz���x�
�u�^�Fp�E��I4��{k}����5SB�}s<�c���Z�CS�����%�X�5+�+K�3����]�>�u�����as�O{�c�O�;x���߄mp$I����������s��ޮ��٨e'�򝜾�ː�H�����o�pnn�.��}w�y�	��Ŕ��a���I	�+����wI>�̐�іl�Dz��Vr�FIY%�K�<��L˫.1R�%sAڐbqI"G����*'���������k�&���\D�	��~�VС8���y�2��M�_;]�<UW �H�F�+�,�°�w�I0�t*j\u�d��i=\���?{�Ƌ�c��ka�xX�>����J�8�� ڼ��9�I��T5�0�?^`*\�	J��*ybf���}�$%(	v��{i��,*ޣ������̸���m�.uj�����W��������8lc��pAM�nA�ئ�k��Z�BHU*R�۝N���k�@G;C�,�Ҫ�D!�1D�<%�����D�ő���ћ���>��:��P����k� U/́ڿpk^pR�#Oz$��P��5o�E����{���F�(D�'Wd��xd�<�J�$��������Y@(�Z4�"[�'+,��&�� �˽%��-
|�q�pQi]9�#xazhTp�T�I��Ft�{8o���|!r%g���Թ�� ����~joҡ��}F�|7�{�HHxb�0pu����rM��C���n`���r���4�*�J����#�dx0z�z�����|��z�[1%��
8�,%\H�S`�I̀��Y�fCF]-	�γD�.� ��V\f�̡0�7�Vt����� �l�D;�5�OЮ~AF�4]FA5J��)�@���K�R\�CB=���}���#�__ȥ:�S�m2� l�G]�=�!`ԫ��ޚN����b8g���x�W�:M���ﰱ�Hm:�O�Jl�Ш�R�xwfs9��v��M��9��]�q��ߟ�Ǌ�@�U����9�!�~����@�zP`�u=lgZۋבle��D�ÑiKb#{H7�$��QU�`�_��� r�4f�5�V�OZ��X�\:��{;Ǚh�� \W~��f�%�u�~܊+ u���֕\Z,�4Kl��\�T~�}����(=�ԃ/~{�Փ~Ӄ���l��t�em�PO��ⷝ�TN�*�g2[U�7}�rY�"֯��z�V���6r�:���Ă�)o�D޸�m��	� �����~�\Q�!�q'����1dI�%�(bS��et���Ӗ�F<��V8W�o"�5e����mC�ok�?����᪶��n�ܱa%����;i��bǭ��tpȒ��EG��t���Ц�Y�A2zn֓b���F��Uŉ&����~��I����l�q��V<�j�z�f"���n�%��H5)Œ6����0~�C"#��۬���� E��/�ϩ����"@zȱ�;by�����Ȧ�¸EՉ����gS(9Eٺ)l�#l9���	�p���ꛔk�/b\�gIw��S)0��0�������8%��5+�O��U\���q���������,��Ke�-����	���R�s��kV�5�r=eA[�NU�m3y*&f�>�Y����sݬ�W+L!�^/��+�]��s.����lL��&����7�n���]l^+���W��Qo����]�q#_�Ƣ���UE%�{ЊZӪN��0���7ZG7�D/��J��m�C=�?W�����|[Q��ۃ�>��M�:���K��]��q&1��%�� �}<K�~����nbt����6i�&�4mwfv�b��hۆ;��=���J�q����k⥶�����h=\H��p?�(T��s ����B7.gХ��g;�ѯ�-�{&�l���ir�0䓎"�l$ /u�rP�Fٹ�
,���E�T�
鬵ᱡ��	���(���F���b��!��9��ύ��]��>�o�4���]��LX|7Qk�*�=�f�������)���z�O���$��M��ȏhII��n�Y���V)��2�@�C�k�2��}?��c/���z�I=�Bl���J��|�q��=�˫Jp�L���o�Ԣ%� Խ��%�n´wm|�7��l���Vf!���,�L�=����
,�;Ȥ"(.��`T٦���wÊ�L�n�֝��a0RW�_?�ȃn�[J������ƛ�����gC���r-��uAa�����kw�[}��@$���:8�v=AC�<fe�a�O��+��Q8B�������d�L�l?FE��M�!��j��>ڇuI{�.bgD�N}+�Z	�#�b:��!�s7C.' �<A-'����p�V���GJ�C(��K�alqND� �"�N~�s��vѾ�O�*?v-���NGrq�)�P�Ev��6Z@�_3�F��⹓S�C�t�����G����'��[ޝ���m�o����L	��Za�r�J��֙�1����Y�W�i'�]6n�hI�P�3p�h�Nc:�
D A��
�h��Ɠ�Fh�������j��gO>j��-�?�r����>3������&a�]Vݠ��)��=��n�i.@c��<�L��T�s��.��S���.,��3��A3T���[��b�?Na�¢ݼRZ]}�i_��2�k'X�����X4F��le����Zo=8�ˡC<+���bk^��h����w��z�?.S�2\��XK�bK����;��㢱IқyT�5G��a.V,�ޟ�E�/�k2֟�
�� ��|@?9\O��!_&��g+��{`�bn).�5=�i���*y;U ��1�Z�;�S��!�|�:�m[V�c��k�DW�/@O����l#�,		
9C~B���{���z��>3��wAg��v��2��:>�2���`mm
G)(������������V�
Z��~[�1�4���h�4U ���9�,w�AfT�y�!��ߝ/�����O��Mx��,$����@�	�&�Ar"<3ՈjV����}f;��r'� �r+��7�WA�cYѓ�ҍ〺v�v����=C��H~K�S�Zq��N]"@�=-�ÅŹ�2P���щ|Uc���O(��;ަ���JW�FB�ZAt�dy	�)�9��Ri�%��V�����cۏM��J\	E�?A��㮐�q3彛�j$���ٶ�?X�Yn�f]8�`Ajw��8Z8e�B���2t���4����������&�Ul--���݊T]8�p��N�9��~gd��3j���-��:�n^�-�X������V:Xsn�_]Y��H�U���Mǋ�^0k�ͳ��¢j���P��YG����v��>.�P�KsUs����)22��5�Z�חs�S7���g����|wFZ�RȰ;�x���	rۜ�4�k����"�_'h��'9d��0�8`,"��.�֦i���(f^�Ȼ9N
��ވ���g�����m��������;�<]����gk�{VR��@��i�G���؝u�~q��nK�� D1�^,Ȣ���f�Ҕ��ue�.[�z�Wx@�I���{Y�im�v�N.��B!� �>+    J��_�f!R��|�{Z{���kjNￕ�/���+����;Ό]FT�5c2��kk�3�Z[^ڟ�+a�ږ4������"����"~4�ީ��6�
L8����KW�`k����ӂ��1@7�X�@�O@N~��ֺ���붦���(�z�׺u��#>���Vv�ms2kEU5���������:��C,1B�Κ�����ʺi#L�u��~[�UK��*r���퍶��ڭ�;�?p6�7_9�4Ƃ�sx�~�J7�����'���~�v)�h���x%76F��Y��J� \����mI���p�}�85甊e�AR����b��#�1лq�+�MGWnt]=�=8<>܌�t�K�%`����C����+ Uĩ��Ul��?8�4������	����~�u89U�]n���dM�T���pj��x�5����V�p
r��#Q.r6h[U�X�7�%T���Ҳ-��\�f�ø�˴�c����C�kד�i�|~y����2^.8�u�;/��~`\tDM�ʋ��0v(������y���|gc|
���*
y{:";�xu��R��eVa���c�����qXZ��]�XU��VG"�d�(P���X�"9����́lζdj^��5lJ�F��Pw�U�����.D�Bd�ϖ�RmA ��E����
� �U�6h�R<�p�O�C��F���S�H�-J��� ֡UVU�K_��T�SE�+-DP�}ұ����t���`QA�.r9�����:5T8B|K��G/��{���" 9�y��{�|Q)��Scr{����p����|�݇����PE�+}�t���	�1��[�'K���7���k�m���{�鰇��O����%<G����Pn�u���c�NK��?��f0J=i�"�\z��s�ɳ���@���w�~�Lk��&!�ɝ㎆^7K��Aԛ��Ԛ��WM�w�0����J�ǒ;CAR!�f���#���+�Ѳn���aṲ������B%'��
�G�3��Y-|Y+���(���Q$&�����E)�n�!`D��/���fwL)hT�?A)��o�ĝZnb�w�&j^��t�|i�}�5m�v�d!�+��t�g�͞�a}�Rh�q����Hn�9�]�bnR<�q:v����+����z�q`q�fc)I�����C��y����[Ad	��33�-|����
^e���ܯyi��yor�}0��B�m�0�'��9uR�;�]Ԫa�V�	1�]�.;Xr����B���6}=tbK_b�;�ߏ����1m*��l����%���O�i����Y�n��y{��Ė��9��`�t=9�y�NK^�0mi�Օb���8ղ�9i���.ښ�5����W>��j��4�O�_�[7�e�޺k��� �� <}(�����������i��>l�,%�.��=�����Љ��ϔ]Qβj���3*��l T4��]��D��J�Ị/�H=yOp>��n|��ψ>e�\���ymp�p�L8(3��q�߲��#��t��XIF+���;�*��Ѓ�d�w�;�ݧI����""[a�VXs��g�h�;�\�k}o~��ktI���-c@���$���-z~�P�p8Ț�����v�Q�{�[8u��L:,4�[�%4�­���� V�\�J|����Q��{�~��y�#Q�%�B滈�o@Ö�H�����ND���Y�O�r�꼭7c�};0�D����$�ވߟ��-�:�Js��#�9Tm��I�E@�q�����dLg�E� �� [٣6.���ǫ�XW��r�uE߇��zb��j�.`N�v�*o~�1\��U?�kW�(���"���;�yܛ�zYP�E��#���U�wS$�*�뇴>��*4B�wT�Mé���a�X�$�֗Gdd;���N�,������3��h�N��/�	��.�Յ��萵�Y�`�zP��F6������5���5�*5���P48��R��v�>Ï���� f�<�~�I�k���{�u��|, ��������������3מ�6e�\���������j}v��(��[�)_i,�JmGv�h��:'�>�X4�kM�;]ۀ�a�h�@�ʂ&gu�u���aYT:B�4c��?��`]E۬ێ�.]6���.�V�ꗏ�6��FC�Q�}���T`H�5��l��β�n�L�vh!�m亞Z$r���F���!�Xj�hHzc]D���ĉ�pS�ș�FB�8}��H��u�{�X=r
�K��8lA���r�$�E8�f��-ޮ���1a{��y.m���x�]'��OgW�'O[WY�T�����gh�~�����=���tId.1]��ƴg�{����"G��O!�u�`݆��*2Wt�Ic' �����3P�m#C[�^@��h���p*�p� A~���:�.YY��"�ki9�/����x���1�ǃ�A[q�U��)��T��u!>�F�h���P�2�ވ���*F�&��"uS���	���p�m��%Q��֥=~�:hq���嵣��;;�cd�i�:(����[�Ro���L�M��4�nl�|�e��-B�h-��>31�O�>����_ŶK�@�����S0]�8���[<���=6<�˙��.�cH��<�:�1h<�#�L��i���3m��_��%�.��m�'�m��{+�s��_l3��{��fVC[�Ϡ�}C^p
�}���خ���Cߜvo���mf7�-���@*����7����Ca+��:�ZF���N A��(X�M
ޖ��lI��6*<%m����4E�jbSr��@�KK��}�� ̟&i�$�/z��C��-�~��6�y�;�@D+�3�ߡ�Kɗ���l'�M��X��t���� �gR-��tm�֎zҚ܉m?��x�Cf�B��x�u����b�b�����1v�Ȕ�%}���3��Hɧ	%rgh-�b[	w�u�t\РhiGѨ�V�Ѽ�y�iK/_,8����{+i{�@3A�-��i:��è�̥mv�ڜ���GlC��!�F��u�[�7di�>{T$~�}.}�@����$��>N�K��/�Mϯ�`Vf�q��/��7��t<�m��,�6����A%#y��+~1r��&_ ��A����6{��~�.��g�R��Op�3p�=�jp��n{ʘ#d�}ɫ�����|�|��=��勫��,)Rm.Yr�e�+����]���1��.%����&c�a���8Tˡ�oz�.���el����xi��kL��X��6����m�����������4�8���3�5��z�T9��W��`�Н�%��נ��sp��cvl݄u���C�H]�;fb��K��`X���6;��S�IQ̰���'�>ɥлA[&�Tl��8uo�9��(���=�9����uf�ae.~]��������O,J�ď�D����f�jS�E_�3�K�[
��O��d[�7�I�_⍸��~:[����:��F>or~��Z�I��Sl~�����-�ڄk���zt��䴻\w}6�/���!��,�_\��[�Ք��.tj$o����Dd�V�5�<}�lð_��Ͱ@3�k�9����ը���jc{�iᡟ��N��r=�ݦ��F�A5U���BB{ @�*6-W��ss�3"��V��|]���N7��,����á��$�;hSq��`
����G�톾����{�������5m�!�[m�d�#�-65Zs����xr�43Ƞ�K�=�/l����q�j� ���</��x��e:ӗ?L_-�N��`��*[d?�Ƈ�|�Fq�M�k�����G��"<\`^[=(��i\dd�]�;��	�a���W��$�f�_�=�����i��)�����^�s�0��߁�BZ-䛘�&�tL��`Ai�5�}�̵)��d�E�%�Ȩ�֛�<��׉v��9��(��4�`�h+ȭk΍����y�Ǜ��Z�N1ժۺʑ��&B\���ds�m+�K��ν��M��O/��p,���j��������"�D�X�!�    )x��f�Io���M��գ�n������k~~b��d���OB���kҹ5�&4ǓwW��������q��U��Z����ޤe+�iS�ZH�X	���4�`�/��k8�-A��L���р�l�U��VѨ�[����t����Y��LNlO�w�*�v���NNVr�ʚ�E��;+<Sr/iQ�t�})�o-�2�NL��u�uY�OL˧��8�1����02:=V��������{&k�Ţ���;!�������v=:g�V��is�|rei��{r;�G��J.�ΑȐ/c�	Z��L�=��ťy�v1I:i2���@y^�@�^�+�.бDYN���wLm�^}*
I�<随
8Ǵ�������3��k��M惞CK��5=�͌�fv��v�N!�d�d���^�N�UCk�����nc=�O���S�R��`xf��E������V��S�U�7/�@��\�&~2wvE�"���vTJ�9��ZPO�� �׉N4D}	������WG�
��`��g�ć���ڮ��~p����OTQ�����3��8��Ϊ}��#n��YAB��P�`}��� z]X��ͻ-NI�Pq��5�G��1��p���b�b�������Iy�sN��64R��j��� ���Ra
��)��������j&W+|''}���I8|����$��^P]�Y.hKܮcƜ��O���U�q0H����^Z��C �Ln#� &���M*�������E��QZ4�' |�)2���P�@$WD�Or�����)<���9�4�q��@+40�?�!~�.T�0Ǯ��L���BY��c�����N�K�̼��ؤ�x��&�4t��b`Kn�;���%��i�{W~��q�B[g�kO1j}?�f�^�]�+<��\��O�p��s�:L�	W�Y�A�����w���O�6/���gU�Q0�|;��o_�÷�#$4CS���)O9�e�s��v0m�)�^��{}� M�B�qV��xv�Bcd�l��a�P	��5���&����ȅ;�N7w�Ck����a��r8�ye(D =�o���xWnA��`;l�������s��z�莇F*�̖�> rDl^드�+��ޏ냭�%��E�K��%�a��i�@�V���t��t��g�ojupYp�4s�t�W\�b�X��vK����J�z#t��E;R��#d�)� �\{E�ސo��ɱ��Ս�͎�ԭ�}���0����H��"!��-�������3[`�(�۽ᔟ�qw��C�9J����C �d"؍uے3C�B�Ue*��7Boi{�;��5O���q�����կ�_k�
.��Y.���l�.��H���>$(Ӂ��=wF�0[�b��L�<��K!(_~5������=ϒ*�� �.s&3���e�D��4�ָ6H���X`���ʒ�{���K��޾�67�[�:2!'�:V�Ү��ZE�(Bw�H��9�m��8��\U�����@j����]�'���	i��u�*�mU��G.W�_�Dc���xۃ�凫V�P!�/ _ ޹nkU�h%�VC�w�?�aΞ#�e}M��Q�>+�ns0!3�H7�-�H�DR[0���V,�>^iS_�>/l��F?�4�G ��*s �,��/��Yќ�+������ݳB��DI�'WrZ1�*�M[���������ل������'f?��噾����^����Z�~@ԫ?���iS+4�i�t�Z����c>$���|�����&�Rh�y�v��Wˇ��fK�l>i_�����+{�b���p���΅%���Z�@	Y�#����N��C��g���y�x���蒐q�e�?�iу�P��s��?�(�E��� ��Z?��С6́�h�:ES���ن�秡M���x@-��
ʴ����/p}V�fը-զ�4.6ZaA[�Y�T9�ͼuX�}�����͊�	���.�S$j�,��i��iy�\�6?u���ڥ��,�t�@�j����*�^�ʆ�K��UX��bU�A��%��v7�p~�J�꒳�@ ��D	z7~ wP������̪6�
F&i���z�TܚQA��0�~G2��ֿ�`���G6����sS���:.
������xfT��^σL ��Z�vȀ8 �>���4�
^��Bb�6E�V5��~1�|��F�{�@R���>ȋ:!�����`� 7F��۠��I��S^1i�:��$ױ�Ʀ�Azk����8�JT���&�Z���wHoxul�6�A�0
�hǥ�0��E#�t���D\�*c��~��'���Fh���X|�^������Ea�|mϊ3'L����Cc�w�?2��6��&ȃ0�E�/�*������ҥ���h:K+���p�?OQ�) ��/ޏ�����ߒv�|s����ݷ+yXű�W���aS�y����L�A��Ϥ�F�c0R��H�L`�8!_X	�V��$u� �	�2f��T�r��M�%(�i
�"�/G֟��_���i`�S������
�B�o�m�#u���t�x`;Jv����`[ZM(oˬ��v|F�����er�L��YO���:������z��[������x�~4�#9%y�EB��=���d���}>����˚ל�	Xj�l	��[%�Z�Dq{I��"��i³��`Rlrq�p�Б,�'�	nüu�>���	�C�e��aD����ށWgzg|������af�`G���c��<i���X�O��lk]!O>�p�M��{��3�,' ��޵�����ÿ�(~�,*��p�|ji�]����Ty��|�-|�*�y�X��VZ��?w+�̚O��+��g&�� ev �(��H�5�"�<1��d'�+w^hrTA�c�|�.��UaM7�&���	d�(2�n:�������l�>�v��F_ƵF��|薡� ����4���شP^�KʫK�Ť�ڽ${��n/����Ci�T^���sk{e������;�߮��SCN��X[�ɉ����ZF�|���.�fQ0��?1��|@L���ho�lP -|���0:9mG"f�e'��ʢ�d�bwW(NZ���$��b����VQ���V谽q�n�©~$?�W�R :$m&3&��3�Ʀ����0��>9�V��^�!,J���܊k<��f(��h�MHM�d	�!]��Mo�uw�n�Ŧ��z������f5�h���Q�����U$(�1q��V�[%�T%k���EN5�$�<%��ފuݳ)��=�5��)�P�v��ON�i�l.-	z�S��9�i��J)�=��C��8F�~ ;@�T�kqJ�ג�#��#���G7�J;ª<�`ȑ/�����)�-�n�ZM�7g��%wr�F~|��3��7�V�M
������|��]�=-Gew��.A@Nv�3���ȹ?�����ˮ���	HC����L��ēF��|�u�4���V��^K��ͩ%g�Rr�]���l�*F��R�Wע�`�����?�w�J�4	���T�$��o����gڎ '�WO���IkiSfϱraD>P�yR�9*H�K�?io��^���J�A~anx՘�ƚ����΃m�Ж(� ���7^�AI��O��~��HᏦ�8�N�`��� ��q�^�4��o�p((�{F+r�k$E�w][R�g���v��C$;ِ���}j$�jma$/Q��o㋋?�>D���%PC��g��uh��#mMr]`M���w�^�jt�%V�׈��w
ZT��П)*8>w��"�U��ɩ]��f��gu�c��������x���Zk;~2gZ��>GO�֡?a�������+q>��\��=��N�I]���0۹��F[�<�-�Q��_��]�[^�v����`��d�}-!�k��lMm�����:5��2���gt@dF����	r&����Rȍ��A������v�L���:����Y2+�PSk+��EDh    ����N]�Y~mPes a��G���i��<�^�3����	D@Q�{��y<�51Y���{-D�8�t��	�	�&[Ռ���	�����U����6F
�?�B�)����hM۩ؔ�F-n�g�h}`�i�ִ�v�����k���46B�7N@"��q"(	j�~��������;�^,t�z�oO�93Zŋ�F��Ҟ\eg�H�n��o�sU#9tE�%��^�W[)\�Y��C��l��h+pkq��j���n��S)l;cg3������a����[��r����
kq�jDZ�ب�_���-y�ߓ{O;y׋'0G�6.�b�c�#�����͉I)� h�\�a(�V�[ �f��\һ$���IR66�䍖M�g t]�Kˠk��fA�f9���G�y�iB �����mL���g��֠���4ܵ@�ۖ�����;J�?_��	�D���R? ��/�0JESѢ�p�N���|�B��w?_PzOk�r���������H�d䪪�e�TV�>D?�	]溺�m��5e$\n��kO�Ii�|�[=}.tD��}���$��?%�|��@F�Y���wF�Wj|�W�&�����9���9�:�����@����%r���I� dTF�ue�ENG�lE���A���M�������KaJ�'4L����w��U�nis:�����L���=�N67T������w3�=�rO�ik�a��M�&M�@���؟KK�<*Ou$� �MI��%R&��K���o����z��gL�rN?{R���`kd���dB~���P���6WI	%�x=N����!�~�ec�R3 �ڷyH�Y�ul���nuD��A�x��,2��q\�U��m�υ2���;|ޮ��Ttڝ�W-��̕v۟�3�� B4�]_���Â�^qXt�e:��=�${�S	�)@�/�4�$���)��>)���O|X���7o�5�wEA��t�"�ѿ�V�o+䁲9�����10��A�eA����׉��,�|�?�>�������0o�\E�!k|!q�<�R��]bM�D���g�~�E�GSl�p����[�s縁9���sk��,�[�p��Kӽ��p�"P�6"U�T���]�{�q��s����P�aw�2�F-�{��|�g@Fy��2"��
�
����U^�e�n�{h�r�z1Y�FP'a���]�����;Lݙv׷��	$���VJS�uU)�4SLm%��������$_����tes�@�)S������e��5��4�#����o�1�,��S�����ъ���@�0�~���61Nl���-~<X�f�8�W���rݪ,7�e�^�w����<�o���\����b�F8u��!��?��,��^u�b��m5�l�g���������J)�y8k h[����,�R̝�Q�!}u����S��?]��̫s�"�5	ˬKP(��q����nA�ab������'&��u���u�!�NYp��A�� d�k����>�Sfmw�%�o]���lA����� 5�4e�@�ړ2n:� Ue�	�~;=�66Hp�i� ��Ř�32�
�W���]�P(���x����؊c����h�0�����&��hp;q�!^[��F��u�9x��k3$�1�s���~�p���D��D�>ǢQ�KY>���@�� ��>� ����6��<_Z�w�w�5XMS��A9�O:H����H�&l�tP$��Nm� ̚y-���&ơb�V��\���E��k���>N�K4�:�l膋��H�����4�7>h;��$P���8O�����p��=�+2	r�P=�.���yE2����^��I�^��E��ɨ��g=�J�:��a~;�}���=�oS��k�� i-G���Y�I��{����t=�����ķ�]���d�h4���5^�P��!��}F��	30&���D��A�>U&`"'���u���v�t��?�?�p�"~ � IX-܄��Je�f��J���I{�Hd��qα�N��xWG�����y����Wzl �C�b��ݏ��1��V��io�0?����F84��������IZ�3
9���#����"���h͡�h�Mtg�,9����JF���\<Uh6���4�3�o��A����"cd��Kzfy�J��/tm�h)yef�v��-غ��M?SZ v[�{ZiQ�,.㕾��a��!��{������o�����?��h�������rH���� ��P�Ϸ��luS����~�>[\��麴���pb��㣓�l΍%��7��.���Jqmx��6�?B��E7	�YAVn���޶~QUW��A\�uKw�~�� j[�1�ݩ�0��Jl�)�mK�ă�U,��s<�
�� ��5�b&y����)W~��ץ�Q!��Ə��������i���>���2��R]�aN�my(Er����A��L�4v+�n�f�'o�\�lh���\3��]Y���
��v�R��YU��=��Cf���b���O����-T7K�7���AM�v���	�bi�������WH��	�~YQ���dU�}0�0O��e ��p��,�����l������߬VȊ9:��Q�CQ�ؼ��w�-���?ָ48��l��I��>'ƫ���jd�����p�J
5����%�����Un{�vN.qa��w@҇�bay�||g�{�Ϯ_���A��I�����VNn+yRp� 98�]F��l��@9�Ϥ&�tcMɐx�%�Y9��	�֊3DǤɞY�d7m�a�r�S�N��Y_K%Hi�5��KJt��X�Wy�k��s��Ty[%l�7�c��st���iW[7K�&��nZ���gP܎�7AH�`Ž�֬i@!�fra�9����~2W`�'�=	�O������V���<�z"L	�����́��i��S�C�����r���Z�<V��ܝ��2��S.@���S�E-l�D-�ß5$^���-.h��W�SUb��r�����Ʈ���Hh��5�';�'�
����^���+�6��k?�q�u��6����`0�>Ȁ	�'X�p�2є��V���%6�,2�����<�W�V59���9�'H�h �g�I�ZZ�m�,mm!�{p��^��z1���+=!5Ҁ-R���Y���y⮍�#�K��g�R��[G����/�B�>zge��kNX!C��ni�|w���ru_�	]�s�lCni��b*����&>�*�fk�2�I.M��r��p1$��~=���I�82<�PN(���1�
L��y��c�a]�����v���8�����^`��*�G�	������qgo���Lq�p�X����`jP� �|��Z4l���_��Ž����ĐG�A�ZXp�7����g�N.ŋ\��t���e���K��Q���A���W��"܃r�<T��t�"I�ϕ���;.#g��Rp�r�Wv��ܦT�D�0�� Uu�z�m"��p������Gy�Ķn-����ꩰŎ�`i����J'��޽�֯Z2o?9�ݞo��K��E����aI�ʮ��=��{�%����2��i�jbG�=���^�tYQ�
�������W/�V��V�C�202����q`%%!������ж�@1���6��ز���X���S[��N.Y������Zq�-7��⨠IQ��ѫ�G�!�\�	�*��+�Z���>^i1�#�/nn�� ���0G>�F���(�)�Đ���t�_n��R�~���C�@���[Gט޴���0��;�v�W���y���*�GY{(�E��=�[7�B��<6�0��v��ղ�����7_����ީz�������'�2p�MYԳ��[U5Hį�����i�F.Ϻ�+���Y�%<�PhZ&C�bK�sqV�R��{K�|�\��G8C=� pF�1�����p}�(!L ���,��U@�����~�����}����F.{�7��Z����l�oGѷf�!q��@�!R�K�9$�����\�H� Z$Z�    "v?0_N�~t'P�`�;�������:^��4�A��/��H�x����8ӂD%�;�=�7��nX������V�K���k�'@^�_�T�/P�������;�4G��YK�sjtϴ��h_@f�N��[Ȉ�� ���
6���]�2�NR'$���	��8s��tf��_��%'��a�x\���^��Uz����?�<Ц8��u��Z+�\��|���x�z����	?iH�G}�o��(f�q+BC2�uTK�{�1�� �#�Ջ�˵��`����}�Ɔ:�P�%�z�?S嫦�?���F^�E�Z�5b�Zr^k��;��3��h��{��!r�8	xnC_/�ӈ+�
 Lo¡�C�������C�7��([�&�_E���m�%�f����JÚ��g��H��*�V��+�i����i�8ъ�0�	�)�dY��7�ȣp�c��8_�$��x FE�0�y�}�OjI�L��6b��.�C�������P�ǚ�Z����eD��B��9�2���{{��=�u�s�j�Vt��3�m��{����*�����?5uQW��H�iȍ��ZX��V��t|oh;��s�wHW�3=��7t��X��:Va
�1��������6��L.�V{CxE�Q��v������:z�7�_ߊ��P��L���Ɗ=�����ٗlEt��N�B��}��դ��Y���J@��y�S�E����.��8�O�!�qw]p����C���Ւ�NJ|��h�<�Gd��ܞߟ��/lP��#ZnP���F�n���1sN��W����U��-��j��7��!�T\;V[(.�:� 5�P���Q��/�e�� �=ST]�Y�p�g �ִ 5:l�͉�^����´+���bZ�<:��M�Q�1�"&�Lq ��xN����!�`��O�R�q$O�(�lh�.���R�8]�/�S�	L3�%����Ԅ��E1�U�ĩϬ|��K�߃��C��S|bn��X<���*Z�����m8}��
\�,�#�����|��5��i�D��f'/�
���V�ӜnƢ��p+O�u����|�2k�]�I��om#7r:&6���]��a�b��j�6�ת]�-�@Z~�����d���|?""a�׵:�.JR(�_�CO&(��.0��{ߩk�-26���M&����@b�v�����K#U�*4Z�(������%�I�Ҋ��dݚ�Yi�o�]���h�>���m�dt4ޝNA��v�+�h��+N���gYR|���ƍ�hg�'yQS��i����c���PO-R��.7����X2:1��9�"��r	�B�Or�#�pI��]OG��.6�A2k7gѱ��B��i����y�0�G����~w�����u7���(�5�5������5x��w�u�#�͖i<���%cO�Rx�U^7�����������6�<�VbU�Q��8�=�o�鮭��T%���ܢ���a{��tqܻ�#c�'���@�� �]�n��u:=[��������������	�q˦1@�G,�cK6���}[W��CO����S��_�)�}��������t
�/��	?��R?�8�Q$��S=D���Qh��K��,�d|b�k��1�L�f`,��q��/�22"�p?�����u�A��!1
����t[�oT���ybW�vMYy)5�7e�������n�I�oi���uv���9ϢQ�X���s�h�3�˦���L�S��5m�5���Sʡ��d��^���;^Xs>g�{q>/L�Z(3����jDh���m�;n%8��!�ӻ� f�@����6gm(k�;�srL�S���51����n�Ѓ�CK7T��F�Q�s
�s]xX%��)��m�uX�}w���u�hcK��~'��Z��g�˃	�Z��C=A�v~u�..�$ڸ=����g��:I[-*�M!�&�i|�����]�'@������I	�p&��oEh�ж_���(`����Ռ����y�T`���NT���>�{���n�����sS���4�Yj¤���ؼ��C��)������t�(�L��3�y8g����$�F>��Oi�D�
G�h;[�,���ps���q�P㯅+"?K{?
L�G��0�yr(���6t3�kg���e�4�Dp>�_S Ap`�/�,�7/�%R�iڪn5Z��y|�;��x@>�_�o���B
�ܼm?����~��"�/�.Nˇ�b��}�ԝ�*rB�!v�Z�/7��tx�����p]p�k�Y��m�]�����i��z�(D<�l����g7��T�?�Թ��l�3�wn>7tޯ>2���ꟈ��'�Rdϧ����1����k�� ���t��
o+v�=���쨥}����Y��g/�n��h�Nw���+�� 6֪�֞�~�W~����Rpp͡Ez��wni, ��q�{�k����A7&d�� L�t�U7��ұ[�� ��v]��(W����Z���Αo�ǩ�ew	�Ҧ�jV�d�8�@�F�bQNZ��~����6j� �G�)����M�TԐh�=��?Ma#���q3��FW��9;�'���_0�}z٣m��,�qC[��(U������;�R����ȹ���=�$N�
�\�F�� ��;p<p��7�B��j?W �C��c��[�_���BE������1S:�S^�E�h�6�V�X�!#�*7o|�w����mA�O�|dP6�	� Ce'�U7���5X��:��M/}��o����fY�����,C ��p��/
�d�E�����"�����|(���ؾ���7��ɞWlV������ *W*Z�������A��efy���D��RS�c%2YN��VɟX�Je�wц�v��DF��d�򘹈��^y�Xwt6A�I�ڥ���U���|J����S[D-������=(QE�[l�\C���0���@���>Y�m.7�Hb�V@~�����Xg��'s 7<�G�`�m�u��1��ظ-
���S�P��5H�qM��h�8A�n�oQ�=#	�ek�nW�-�hl��5�Ʒ��{��ң��Y��_�(�F�d����]���,Od�D^Uđwc�{j���;��!8��'
�)������Ġ�=r�Z�z�Zͻ�t��l��n��"���B�Ԙ��TY���2^#Եv<<i�=��/����j���=j;���Rў�!]u��hD&��L�(@T&H�eGcbY?2)<�0/&�&\����T�	gZ:D(�K`H{�g�o�\�JM��><��o�끅�����!��%F�h5uj`��t�p8���Ԯ$:�y˸u�Z�l�������~;�c�E��Xi�yF�j������k�^X���L���%�ܜ|?}F�9yA�8�	�4��.�E�0cf���=�B���_6� �w���_�3�9�v���B�`j}��Q��e_����K�� ���Y$�B|�5�%tm��t���BU=�Z�x�@���Yp�̭��@k�D��e�I�Ĥ��\�͡p�/�<ѕg9��<�!>���PW$n�2S�ˮ�]+���z��9ӛ<��:���B,*��kzaP6.U�R>�ة �@�.*��>�|eQY��V#}B»���.0mL����gK�3�y,Hc�����uy%o�@�?gs��!�!��Ҝ���1��9��M���� �..�QH�4
��b�|}���%������f��K0�3�	�����_L�p�R��AB����8�>{�ǃخ��}�����8{Ǧ�%�ukp1Js�8s$�,rz��?���!;��?Ѳ���KI�V�5��$�ߊ�_����R�e�����&����|�M]��Z� �'��VH��WA�ث�����V���^����7k��TQzt��"	���[N��^~>���ҋ����SS!!J�N��pߴ�u�g�\���t�8Px�z��Ph��c��i���۴	a0��?b�h剒t}!d/�q8��
2�q�ケ��iK1�,(ӱ�~���TY�I�N�v�8�z2�J���}��>A��    ���|�i�:��,(#��|-d���i$|&�*4��1ybE`�*��{�(C���H�4�{�'?	4:*l�4��q���hYI(?���nEzj	���֛�¦WW�&��(T�*rnOt���|s��>wxxr>��&�5��]d&�XRU�n�9`���џ.W�
4y΀��3���^�8�����Ua	���Ҟ�Z>(s��6o7�n��}v��]yH^IhE �r$�Y/9�F��#���=�Y}U����a\�����W�"σ_?�Z� �OKmeN��'�CDn�Wv��t�k[�o}v�V���;D&�H��p�P[�� �O*��Nq�z�=�r���/rh[qI$t���)E �t�[J{;��/|by�<u��������f-�����ֈ��4�#�l�� '��ۆG�a��n�F�&t���da�t����6�ڶNW���xS3���+��э�D��g�yt`�d�U��/6�	�� ��p`���yB��*�-���pLh
)�~�4-���Qb�:�Pz��s����g5���Eu���y�l۹4/U0?����?AK�Z�f���ݟ�f0��i+�Pvu�H���� ��(%�_��'�S(˥g��������nl��5V���P�vx�)�b�}�{0S9{fn���/
9������.�5s�$�����O%�f�j(��l������O����c>g&���P�L��3 ��-=E��jn�5��7݄����h;�EM#��S�8#鄻�c�� �{�ƺh�f,7�n�!�8z:nY�V�v�܁����h�OV�upw��⋈B����^j�)��76�#eo�_�ރp٦���*k�_�~�����\,"Ե����a�(�o�ṁ�#��	���L���˷��Nۯt=�K��2#)l����ܹ��\���U�d��0�e0���+��������PP���>���^޺��Dy����T@�m�4��W�	,����	��|���8CU/̀S�G��U�\���������<+ř�q�ش��Xz��}��~�F��.�������z.�6
���Z�u�Y%:��
؞X��9�Ԛ-��59�'tV���e����H�X�) @]��Ǆ�ǂ�꣑d1��(����
�O.�$���>�j�w�Y+����R�64hF��ܽ�8|=p?R�|�t8[]�30�.h*�X�p�˥]���")r�6�j��O���n+t��R�U��b��x�28���U�B��3ܷkv���=��ٳ�`��76�W�����۷�O����f��f����]R�+�̽�. �M���>�HS��n#lur����n\	��H��u~?��?L��R܈gq ���k�����W&�u�LF��HN�~��N:�����Mx����9Hc�2"C&��
�����̥��.o?L�$@�đ	�����ޓω͋���|�uSWm3�`P*��90���`g�eğ��f��Ԯ�*�zӍ�a����u�g��7�����}������p� �Km��UPq�B?s���h�抂Rڴm��<��R>�2�sP�zHP|� m����YI���8���Q�8gR��7S�A7�x�� ;N�%+��OS�m��^�u�ز�]��������kY�9�^r��\��B�Ll#��|L5��t��F(�owδZ��w9"tڇ"��g.���|ݫ��`�{}ꐥԂ����� �9�COLP�	��eD0���\4.M��!���܈)���Ǒtg3�eNc�%k�AMېנ�Ǐ�891�\�z4O47�ۆ4��^º�G+XGƿ-S�¿j����{H��V��)*: �N���C�l�S��P�ƅ��(k�7�d��L�1��e���xU��'�!�=�fG��D��<�׏�{YZ�}5��4ɺ�p��X�ne�h.���4�DQ"1v�%]KM[#7X��e�9��㳳*�.��]q=��>���;��>��I_2CG��e�w��O������.�C��`�^��c��f~� ?�}�/���s�~�6�#��������5j��yU����w�Z�l ��8L|Z����'=��[��~�6�c������	��ǐ��4��bd%��������PG�)�Xu��	�c� i��Պ�q���ՌJ2��'�ɟ��\3���������Wbp�'�1�*�,#Wr�e��@E,!�����O��F�Qx���\��ٯxe�E>��$�����b!,T���r��T��7"���79^ ���6�\?�D�K!YI���Օ�%ol���[Y��z�ܵK��yS�ys>/@yU�z�I;*�ݠ�0�F��`N����C�8�^��$Ƞ�\c�k�0
LY�˦�P��G�dI���<�Gh ��S���e5���Xg3�h6o ����o��^�y���@پT�MUŦ�֨M��9�^iY3LD���h��߸*w�\i"�!W�-SNM'�9ޮ���qSa|]��rO ~�����ٞ�~��i^��E�~��4~�;���f�mS�5QU��L�5�r��t��H�]�*Q���W|ŕj���w�hK#t���Hkϭ��̽�uN�H���<�D���"B�6�������,�L��g�P���3z��n��yi��R��EG[���}f e���<7�*�C0�v�n{4�����}�w��y@ao�#�L�2����X��^�M�m�k��6Z��gi�tm`#��������p���.�������ߵ��}/�(-Tb;~-�nSE;f,SR���vSm66Ej�]�,T���?��L�~w�B?)r ��`�������sϯ�\�N?,8n����T�i؀՝7�t�m�|�DW���7�ǹHܯ�	��eq��gG;X�/O�\��R�z3�����0�����W( �ro6E�HVԮ�G>Y���3��K��O����0Ҹ���G� Xu�����u�n��T����κ|���e�-��	����%�ց.��Þb�yypQ��:��>J:٫���m{��K�u��Pn8�/�N���9fu�Ӗx<̋+F��Jo<�?n�1H3\�V�iZ�Te��=:�v��Ƚ*����C���K��9.{A:�#�<��[%I�d�m�q��
-��p��L�f;���Lzd.H(�h�C?�_cm_�ޔ�K�$tU�,�������¾���z�`���ZEM�=J�¡}^�O{�lk��f;�|W� uHnLC���%. O]<u������>��V��D $�P9DvAr�3�d
\x��a�{�������t=�Z\mp�`C ��㴻��8B�K4�ҋ�v�"��}o��?�^ʝ��p���������ҁA�������(�Y��HXaNgmm���i��bh�j�)A��B��G�,�T��GD���S2Ƨ��+Pc��/a� ��Ä�A@̗�p{ќ���2��۶Vw�_:b_��麰XY�:h����LB��`�PY��-�Z���p����5`�|����[yr�~R�����1���c��Gb� :�q�0,l�N�ƀ�	�_ǾV_��m���
�����%���g
�W����?�c�@U#Tb�8�����#ڱ��Z�����'��ڌ��{�о��*�5g�ðܱ��{�%��*˦�\�-k����;���@����6��{C��Br.�ͬ�v��KУ5s�Ji�[r��5�-����'kK�����{'��$���Q�Vb�(�CI�Z:f��ُ�{��Q�ؽ����e�q�5}�A�����'�7;���lt�8E�is%�� ����ٷC��J�O��~��Z 5f��WE��\� 90�%����t�Ï�Ǟ�
��r�4����I��Ⱥ��8UAŦ��/��^�rl�zb������V�X�bA4��yŪ`���M3P/�r�*�[�1�x���P�l���K���*aLPs���9P��u��t����P�	�?Z��s�3c����X�r����+�H���ܭ���b�g�    >�^)���vP�����|�ή69ÕI��CS�Afa
n�]�,�a)��8zͮ�v�����3�o�_��Mdk�甋�ף@Aêi��)�pJV�hzc�N\�n�N}����|������?��̠�h��A��!�dA�W�n׿i�!1�h��}d�hr��~�����.��Tb)x�4������@gy���+��2,#��u�I����߾��;Ŷ=9���}﹠��IF�&���yF�|պ7�x�Z[qo�����
N�2_�²`�ʖgp2�3*���@J��P����0w	��G���rs�7EA�7r��ց*�xw�����8:�Gr��m�;B����H�
5J�e8d���I�#�4:�}���s
MWz�x�P�d�U�X%�~K����{;��4��-ZQ�Mb��	�vhb�\�lb����w���w��!|n�O�h���A��_t��k<���#^!�,^<�}!T�\ߖ��Ѿ��	.۸��S�S�r�SX�NbS?N`v�.��&���	��*QiCm{n������X��yi������А_�It��3�V�";"�sb����@#���֔]fH���m7މY�s�p�����ù+�̋�[��������ʈf�}�4�,gr�]#S �%�U�d�N(Cǝ�`P�XTx���a�7�ƈ1Z���ϕ�ۻ$�[�rxO���F�1W���g~;�_�ہk��������[���dZ�Zl*-��(��ֽb �X���5��u���3��y?&l_w׬�aՆ�%���ٯ_�e�d=/1ҖG����u񊂱��=5N�,=/���dy�ߧ��CJM!?a[�U@��+��x�� S#߫������ɼAU�D��� �]�X�_�����]!%g�����?���l�ص�_A���}��c:L���+}��l�7- ����ޤ\���+HaD;���h�ݭ[>�"B��F��g]l�������}��A����������;x)�������]�%=V�T�y�G�'J�g#�Т$�%�+�����H��Hvk�g�'�ո���:���=��hz� �ޡ_d��Y�m��*�t+Ϟ���AIϖ��
73n�l[�_�!|�@�C&u��OC�.���~p3`K�,�J+[�Φ�*��W?���g���W��pd���q|�u�����iq�e����4U!E��t2����8Ih�
G�0�E��=�>{����6��kV����R����%ݰ�F�a�˞�qO�q8%���X>K��N�����$G.��s$�q���p�f��9���C:�ׄ��:R�����c����O��6�u�������Z��L<w9�d��MJ�����( ���ܽ/ԟ�������֢�N����Ol`L�QD�$?���x�7T�E�]��v�B[6V�����K/.�����.��ҹ=��MC1�cW}�@B����"�"-^릒 ���id�>� a[�������c���e�%�uB7�3�	�����C-�-�#C_.�e�SJY����0����Q����Za��y�ۆw �=~�p����_��є���0�*�/��U�Rx��.�M!z?4�����H3����O�@�ZP��B�W��sy�J_gd.�ml[�nSq����ʵ=s;��\�u�2�޼ʔ^��KBΞ���K�Ś�nl��i؟:WOvۺ~)�����R!�,�~������H.�z�6�`i=�9�o%P}�˖��@X�[���x�B�MP���`�ƔR��;���HT�S �wP���L2�X�I�(bK�D�pM�.j%��:O��]'�W��>�i"ߙA��;�U=+y�<�&�A��2�hC؝3Z��<\��
��w��dڼ��w�(ݿ3#�Pƴ���jq�Ğ�!}P+���䏵rP�X��d%<] f��9'o0U:����\��۟��H֎}N>n�,��X����M����+5�P����y�:.ԚܟJWEe�#Vb�CX�?X+#ͫƚ�+�nT���i?B�3����H.����h���\����Ԟ����A�'�Es<UJ�؂�0?]G�?���+��]]��sM��v�4�@�t��8� >;��R�%��a����kR�]���'	�x�Hhiq7�����]7mǡ�����Yt���r߅�\�.tz��0mX���Zv2@ߏ/�p�N|��첽��p��"��e+H�[Z�vFm�gS�w��l<KYv(��@&A�֪kS{�\]�96f�;_�r���Ϸ������3Q�C¶�>X�휝�w!�VZ%��t�U����ܾlM�1�4�y��T��W�¶�>�eT��VA�|
:��)9Ql�hWG;� W��~>h'���.����`چK�d|^�/p��%��}MN8@F8��M('����R���L�:^�����Ъ��z�����z���$Sя҅"���\ ��3-���W7g˔�*6�B�.��R��~c�@����+�mb]Ul��S}�\w�̩Ň�е���{��	ksI���35��K�;��E"V~�ݢi�y�I1��n��{���>:���A���v������Y9.l��g��z����69D������t���[/ס��z�zr}���z����끦Tq��	;S�*@�z�g�d6��EE��[5U��+�Fj$i1u����^��5��e����Ud׏���iZd���7�fۯ����]��<�=�m��ꮕ�wϻV~Lш���h����K�����I?������.���:�����Р�+�n;��lAu b����:�1?Al�I�Bm�ܛħ�:�ޟ+߸ pf�����Y[�6QR�g��[���#d�o_��^����#����Mo0vÁ��z�L��YBG��㚈Թ�����.;����7'�d*���J��x�j3_(��!���ƞ�M8�iǇ6�������ug�W���-�w��ܫ��4������65�~�B:sV����ȩ��X�'*Y�C6���;�H�]/�r+DꚀKZ�t������� ���dfJg����m��N�}�ˡ��G;v̀�˵��9NNZC��^�+�k��b�ϥ�mKHcFd���vܲ�iX?vt�� ����UQ�m��۰O����*�ʂ`�BTeEQ�n���d.\H���;��K��2�Qz�^\�Ų�ǉ�5�A���]҉v��ӏ�NA�^m�;
ړ����y��]�M��<%T8v8CVu��j"��F{�CvY`W�W�b�����Tm�TM�W�����m���cV��,ڒZ����;�.M�����Pm��Xʼ�_�+'?�`:����2*���0�C�,j�!�2k@(�����;�� ܆�j�bb���&���K��_f7.���L'y`���|+,��d�+G�j�܃O�N�swn������F�n���R�TM����K��m�a0�:�z�����a�'v4�X��Ǖѥ�b��#t�Z�q���|'\!��Z�}kH
6wJu���ǆd~2���#{����� ��3+�t>�5�˔���܆���)��`�{3��k3�n����|�-�H֐N��݆�H�����IL��旭���R��40<����Ӟy��{C1r>�V���` v׹�:{���}�ٝO��c�
�X+gO�@�c{ۡ?p�ǡ��e4�R[��mAX�H���v�,�5�'`�50ٮo����-t��y�ᶓ������+�{���Ə~qc��>�E�����s3������~!��N�3�9�8���'Cڏ�$��e/\�e�R�0�G??\EPܖyW��A|��պ�Mr��Y�8
nsU�Pr����rPZ�}Ն\�::PZim(���zT��7�Z�T��_P@���C�ME����lO����7������o3�C�f�i�����!'F�o���$E&��վOC�[�/��	�)��.���e�xx�y�����$dŃ�|���ƅ�P�^�	��O�4����}ے�Ȓ���+0�sj�؜�""�>"	    It"��YY���;�/�;B��c3ݵ�PD�e�Zt��R���#�%2R�
�m�FJ��)�.�|x���q9�-�/���/�-8
�U��I�*�����.���m-1KC�rqw(��s����M��L�$$<�����@(�O\/h�����7�����t���<��ܕʪO�yj�d��\@̨�{VW߁=�K�=�[J�����0�E�6��m??�sd
~���L;
��O�[�U�����R 87CN���"D�~=�sK��0�2�'[��o����j[�ce�zϭN|�C��%mc��x��-cɗ:+�D���y��E�S�����8�&�߻D���+�G��@d16-�^,9���ecb����SU��M�_Yd컖��-���������4�\����y��_A�o��X����Z�w�,��b ����ǟ����7|�38(8G�hX� �n&j2&��h�6�jmׯ${������{L8#����j�����f:4zw"���d��&�I�B[.[h����'���a��Ub�c�2:��4E���F)Q\�K+M��,�0R��e0��4?EY��`��� {f_�嵝$U(����<��mֲD	�n���q�ܐo:��]����U���Mԙ
rm!"͛u^��/!�g(r?��7�*
��x ���ؓ���(���P$�������(�#=+iI����p�_�L}UIMp�e�C�2vR�.c7�t=�=~�*�c�Ma+�Aا����D��5*V�?�%Py�Qd�h�����D��;�c��F
)C`$��>^r�wr����gHv�܀0��ǭ��Q�_�s�� ��Ֆ�ܱ�/�r< ��oDkC��
�W����>>#�q���3����E��-ڼ� ӂ���.:���=���iڏ	j-	g*�#�E
�| ��K�[
���H=���.�೦(�n��TZ��,�)6���T�A�+.��Kѩ-
/d�"E�ag �P�����2�-�����Rc����7JԏMú#}�K����x4@���g�p�t��q<�Gj1�
�]Qd�6�޿@��a���,C��C�[�ێ!Z��r��x�Q�u]/��������ZDmQt邒�����G�O����4���5�(�lchD���}3]4|�C�d"x�,�R�$v\��~o2�-� �F�h�t��lT"�jż�8�Y_�	��ր�gSÑgzL�GzR�Ȟ7hhj���z恾rT�Y	���A%��H��F�
���1�mo�r���U1�c3�O�U�6�����B;�<����s�1�#����@��z��~9^���?���qh��l.\�Y��&!���mg���T.�X4 /р&R�^�ͽl���A�h�k�pn ���Z������u�|{~w��+�c
�
���P�J�7,��_��ڂsZ�ۆ���+���	YiXhi����4�f��|.V�[��0P�K��v/����̐E�)/��2�� р������C�O��AJ	.�o�i^��M�cZ��w�u��Q���&����;�=W�粂���H�YZ�h|DXa<_�E�Uyp3v#����$�������ڷ���d�}����I��e�V���A��P̹�%
Ē���� �h���3%�m��sG�K;f����I�/���)��GR�}*��G^l�ԯ�-u�w��3+ᛤ5�E��O~S���ǔ6��^��A<���t$һ>�=��A�R8�-��g' _�@)gz�XIF�֫/�E5@��5�O�1V�9.VY�@��
2�6�H������
��`���&i���d�<���:��U�rS�7U����Ph6_�׃33����+)+�=��bb�S;޶��j%� 렭K�8a�a� ���f��h��y�����r���)n
�̦�Qx6M��R����lC��:UI�V��s.ǿ�sߚ~h�eV�$th`(�3VeM�i㎛@{yf.��K~�A��ʱE	��o���z|9�=���ן�������ߍR�2PM�bЖ����GJ!�@�+�o:TJ�Ri�b�щ�/�"��2�	a5N���Ai�X�+�o�r]�rZz#��{��*���I�p��=�'�{kH9��yoҊ��+m)����S��HY���Ϫ�Ӡ�='+�/��I�--���2�|��s����x�~n
��<&�<����`^�H%��q+v�DU+.r4;(�%�	P�I�q�ӂI���_�{G+�����h2��G���t�m~5��l$��{�x���*��d9E?�f��JK�k�a����_j���D�p_l 	Fӿr�B�,�UY�+�k���h�[��� �3�q
k��ZE_�m�ڠ�G$0� d:ps����!��+�tW�\0�AN���J���W�#�v1 �C��n:�zt\S���8�[e�aS�D����^Bd�v9�kV�0�"�*��A�0@m��&��xWK^@!Sk�V�����ư��;���|9�n��V_i����3��
��kZ�Tɉ;����E����k��j/^�8@���v9r6~��V��Լ������z��c��젏����B�є��O����m�*�����It��oS��>GÓ(0��+0���7Ȕyf����:�0<3)�wp@�u�2���E�,.�,��"��<zl���ڼ�9���A��\�0�S�hI�"V(3��u�U��$���-i��P�-BVy� ɽ9ߌ���ۈ�6%y�}��OBI��@Ase�w���pb"���VQ�^ii��{���m��bT�JGL�S�xa}b!��ɡ9E�������b�q����K�����6׌-���_��:�/�*�ߏ'ܐk�ᚥ�ƔQSB;�#~������QW5Ry&�C��>a�\���� ��m2a�gϤ���D�:�����kL�/�6�8?"��2�+�V�s>_z�,4�Dq�+������7+��"`8�~�FC�pj֯��C����e�>0̙��c����<�	yǥH�<����.� �⦫w���m�ś�q�I�
+�dV5�Q��������2�M��8�*k�ZNM�h9Vu�Yu�VaZmZ�"�yY�}����B�j�Uy0�mLd�M��]+���pa��G���/S箤�e����ޤOB�O�eQ����.LCa��gsJI���i�Oக�g�{�� 1(�*����<P�e�W�Ma�a|9p��]3E#��GP�u(��2��4?PUҸ^*���j&�*	��7"*"2W�����%:ٴyK��^��6l�}0F��QtHQ,�@�e����v�2��]�J78%kY���N���G(�D��k_�H��
�<�^�x���֚Q�LB�J�x(^@ٗ���dO�K��C���� �B�q�&�3�w����Ь6&}W�ǡ��˒6d�5��id@��~����'�{r�������5[�*6R�\FZСf�o�Y� ᦯���,\�~ NV5`%zp�Kl'�/����]��e\,��M>�/洲c���EhO��?�}n)#J�qV�2B�����p������ڏ��,_�`e���Q�1�̴}c ���>3��i�|����޸5}��]�e�m�1k@��6�]�_�灚���^�W�)Cg�� ��]�iMeX����g׿��~������i�8��;|}�~��_��4���֙��s�pq'�ʅ���rF��I���6�YTc �1j!s:r�h��=�(���=�i��u8�oNm7�����U죉��$W�3�z�����ix�I��!Kw�rZ�3X�!J䔽~^�S"����+;3ejj�`�6Ȣ�G
�ʰO��,E�6&\S���A��6�}���^�ّsQL�5��N�A����A��3��K�Z�zh�q���\�Uu���M��5�+V!��J�m�ʺ�N_xv�z�a�e�0���Z��`.�\�$~^�8��p�KTp�m���K��C�����c��0%CL u)%��Ӆ&�5ŏQ�ρ�ֈ�����]�5��    �����P-�ͦ��103���!{?i%�:Ro��]�F8Fs�1R�OC��c���#�͚��Sk0��p������A��h��-@���r|OQ�D/LJ�k�\���7�Nr��EWq��A�ɫ.e���j�a
t��>������a#HN^(�A~3$�z�*9�;�w�a�����T/Ӵ���k; }h&:P��9+�kp����w�d%U������+�%mKW
��+2����ц�TB �N��6�g+AB���(j�AZ�����)UA_�M͗%֭˖�x�y{��j�3T(��dS.ס�F�F�d�(H�2e��|�/��˭���]f��.��3�J���� \(�!ء-p�V��5��$���Bؚy$���v�0����o&�L_��t)Y�	�(h��y�{Ƽ�4��+���^]��p3�z4O�(�����SEpb�}r5��zz�� ��2����|�����=���~]��<��)�'WG'��6-)��k�+<P�X1�~f1�ي��ˣ^b��I{��� �5���9K���;2�����rұ�6]0��6�GOy_8c?�r��*�C+�傂�al Y�CֶSLj[��`,M�Z��?���fn�6 A7_��eFi\=)�z�g���sv|~B���������䐚!�'����5�]C�#[���=��#c%�yS��|"��Cc��B��i��v�295��)� 3N�V��1}}���#�������?�?�!+0����������Ǘٚ�(@@����E�[�̉(k���O�ЈJ؍~"��_��`����v�ܩ~@:�R�K���h���h����謐vB��E��ĞP�*+���������[�LE��5Q3�N�Q3�cw�) c���w����y�o�`�"���k�v-��"���l�49���ݞ����8\M�r�~��S�{�]�*��O�?&�aw�����2�l�jV��2���0�ܺ�`�� �` ��YSrƗ������3� �*��2������#���9�]h2v�4�T��ygk�㭫��\�
�'��c�xؿ��� /hl�K7i�:�.�mS�-����_�X�@��s;���Q���ƪ��amȭ�ժ��P*<�Ɖ3T���
�R��d4���W{��!э�b7�䁉Q*���?�U�Ԓֹ+7R0���9��~�{��Emv��n���k~�/�_�ܝ~�?_VO���%�mM�|��19ݶ�>�/����}�;�����u��NN�{t&�Z���t�_���s�&�J��L�輦-���-M�#]��9�O'5m�(v���T�*~w�|�C�8���j�w�����v�a�p�e!�B���.!�TP�7UG߀
��s���	hv��Ʃ��;� ��$	�0M�� ���̨�(�%�o	K��F�pߗ9��(�@YXn޻�NSٙ��+����V6#T.�E�"%M�_N�$��K�	z=��̍��L���/�?:��M'��@��>Q�;U+��Q"����M8����Dd�A��67��>������Ӷ��!��"�����51WE���ì�ב�P�I@w�
��l�;����֋���ض=!O��|��F��y��}�r�g��t*��x&��-(5S@WR���7��R�q�2������R��|�ϗ�{fJ[��>�9v��]Yn򡏝�9�m���J������(�B�J�Z��G&\��� �ԝ���p��Pv�t��r'��#۫ ~[��V_f�22�X�ӊiHΗ	���o8{�	`ut�]�O�Ӷ+ݫ,�#[��O'~�������kѭt��h*/x�˺����k��G=Iu0w(3U(�x2� 6�dj��U���Ko�iT��e�Nq&ma�`�t�WXv��q4��(�)Z8��n�p���J��[=���k�:H]�/�~�z�_գ�5.i]�K�b�4)�<���x��:6�i��Y|���4��������wq�ׯ�k�\�����Xڀ�a��^��\�9}0u)r(آ:��_�/�w�B%}��� ���F!��kd�4S?H^�������{e���ԧ�F;���Ρ�;Øꃓ��"���8�DWZB���:��-��2�=�x,C}���4��E}�ӯ��"h0BBpG��m���DXݭtV��K;�5����mxqieߔ�>%\5�ޛr�<g^��ͽg� Sf�~�Zc�X��{P��1�����/n�f&b3xm�P�J�fSw�k��_�2�V����{f�7_ �]54��*b�&C� n���Cd���8g��$����(�1�c���o��al_o �+Ϟ����$�.*���ײ����*3LrX��=g�@ܬ���aގ
�-TB�*�ɂw�R��
��t~v�gu�S��O�<ʢ~���%���FB��_��i��64���#[B��ELeu0��J��٭��v�L�Q��cMg.)"�ȸg�q��y�R��(��v+#�9� 䕣=�tt���$gor� V0B���3�h��or����!�lՙ{v� ���Z��7�J��י	��
$f�����9�[|�vV�hH�*��E�F�,dkQ	i�<l3;3X��Lr}
�jf�=��W�l ԡ<��2wHq��Clxv��ed(��l�y�C迼�C}�*i.�}�6�O�<\�>@�}�B�:+n��.����n�u��i������' ;G�x�9g3���w�,�2
,���6_ n:�������BZ��-�8`�Lh��X�	�_tƁS�zj��S3&�~J�F��t�0�Ż	���)���������jE`�Ƀ0����,�.\�ks� ����Xq����~��n��Mo�QF�b7���(�DoĞ�̶�2!z�+6�T��6::�׾���UUo�ۈ6���:�L:4�z?Ew�r	�]}�W-��B���zK���C��J�Ҙ�o[���{F��n�+�U�;-h=}z�z �ˬFny�a��g�n��_��6F�ջ[�M6��	���-D�}�ѽыLU�V�3p�J��j۱�j�C��K�V������q����7{�r�<�orђ�u�����W��2�� ~:\�� (�����ɴoە=�5ܨ��}n`z��V:�w���;�N�����x]�U���q3�S���!r�h)�����hw���!<I��'͒�|m��59`L����o�M��
�t���wX���8y��M�/��_:_�8����ۯL��ʁu$��*���skQ��I:�v�eꖻhxwZ��)�<����tV���������ؔk���V4�1��I�tQ�ldeA+ݴvXb��f��R.RH\�����M�=ww���LyLo~;pe��C�;�	�-wt�é)}��l;�1ȁz�1�gdY˼��$�8�b����l����)�TO©Vn�$_V�J�'qf/�� }�h�1Z���GW�y�;(��^6|!�F5Ջ)"j<9+�ؚ�Hv�Aɗ$;W��)}T���i�(�=����u���4sᝃ�q���XW�p�,I�{�̽kƍ�X�;f��>�EW.�$�Dgs5�Ɔ���~o��,>���^�X�h���{�N�F���w.�_��LA��_��>�7� t/��ʲ4b���нy:���;�S���u����a̫�Bi��k?%8�"�Zg����Kv���5߬�K����+N���ђK�&kO% �&G��2�#z�Y˘˥@Y9�R�2�׏��Z�Q�#��jz/��圬z��dyǅ}�U¿�p'�¥J���o_�vb��)�A��d��&ݓ�3� �ƭ��kg��H3z�T��ȋ �""�2���h	��i]F�� �~b��:AIA�-���t�����0�~1Y+�Ժ4�gRF%7ӂ�� ��h���A��,�E'S�@w�M~×��|j�����p�C���;3M���P8:�(��z�Л�(�pF&�����F:� 
��X�S Q��S�C���|�+�7'親"    ̽�
�O�0Y�U@��,+A!�߷�ki��h�?��:�����@�1��I���"-$n�����w��bcR��2���aji�>�^��Nk+ז�3��i����H>��l����-E�}�������K���$�@�z��lk�ɖ~*�'$o<�$�!ޔk�&�l�.���5��Ye���
;_G�Rl���+2�Q6=��B���5^��#7�ڢ���q ��՘�N)S��?g{�	�y�a�Z
ִ�Jû]��F��8g�v�ڕ��</�����j.cs���#f�-!O�7�>��b�QL ��x��ʎ&z:���"x��y2\޻f�V�B�(iI�TI{CIn�h���K2�)�Xc�y���UҞ��,K_����K�����RaeFⳳn�(E��U�~���S�N���&�f���0%�d��J����8�j��U�*� �������̂�	��CoL>vg�Tkd`�>�N�r��w� ��1ۃ�'K��{*ܔ�3d�h�dn�i�>��,{d+��ֻ[��YwK����ʸ]�y[AN>/8�sXʂ9ʸء�4#��
�N��r��������{`Q�������s��椕��n����u��2����{�r�C|��:�9�;�:]n�>�<���,ٶ,���)��&�v��a�^XV�H(��M
�Q�~hk(L���`]1G��k�X���7�fSt�[��KI��':���^��e$��bh8��\κ���\���EE
��^c5�a�؇&eQo�!�X�j���J:DV���2�.�i? ��$$�-�.�.`7�慮'��qD�*~��ʐ7z�C�0-
�G���\����+&��J����O��|V�Dr)�a郂�!G;,T:�JʘCn]hp�k���%��v׽~���H�Ѿ�t�	�ԧ
H6�]B�yw{C���6�wHY,$�ع:��_�b�%C��zb>���V����3�ٴV/�Yn���,�Y<�5����4Fh��D��md��5����s)��I����$�8����THV��֬1�O���z��b|�ݪ���(�{�iSZ�����	�YƢ�&�<�qxv-�Ĭ��;�3���4�M�}�#��q�~\Y�ڀ��,�d�,����%i'�}��}�O
,IHDPq�F�]zm3���S�[i�����DhԵ��>��е jJfYM��V��P��1DRf� Z�B�l�(V��[��]H'u��Y����oѫ�X�ʧJҜ|a�*�r��q��
�$d��/�+�&�|�|J���f�6d�Y҄P�^��$;`l�ܤ5��i)�υ֬*UA�h)TT����Ԡ���M@F��{EJ�Rg�0�Jjjj���7��X�p��� �"�ߺ�ط��)�j�9�E���������7ÄZ�V��\�p5��^�\\h���Koh:���\�u�r��y UTQ��4��,]r���c��>F&/�mm~�R�5̠�LѬ��bk�H��f �~xj-���RkZ#P0}�lw�i�݆+o[��3a؏؝�I��J�����v�X��҄��� ��� ��MSaL���雿T��R�ߜ �Q$�7c�-HA��]����]�d��۞W�������/X���M%�ݪOs�z���8�_�eRa�\ �}P^"�rA9��Ί���ɕ�����G3��wt�2lPp��@�tMxqLŒ	����L���������^�8`�:�U;S�B�s�\���2�����U��A��l�~���&U%h�7h���ë�)�l�\�=��!~)+��@��i��������XY���BS�h�_�ݾv4Щ޳�*�¤Cd��9۵�a�D�����R��h������FX
�m��K�"�l�1��|
6�����_A]iu�y-�쓃d�_�.U��pA:�G�ɩ��2o��|VC�m��#.�d�)�����k�}dYGܢb-x���>|�sӤ�}P�7�1��$L�c�	S�Is��P��s��BS���\� 
�+�d�ɊdEŦ���2��p9�ߢ���O��9*�r*�a��B�6 �����.7��4|����jDa���D6��R:F��n��@�g�6bV�4a�h�3��QQR�自�p(pp<g��~�]Гj%pzW�����&w���G�̡b&B?)/C?�z���򎒆%׶|[����e:�s�K�̧���)|s�N��G箠��ܕ��e����8^B��h �W�� P�&�&�{�(o"��p�����_�����ٛ�r��b���7>�dL�wڨjl�E�};�NM"��N*_�م\���p7�����4���ة-�S1�[��Ñ�"g�������<E';����/��O��|�z�r%ӧO���v����2�L5���Y校sэ���G��[W�� ,�:xZ�2ۄ>��q�dg� ��k�!mw�u_@mS����ӷ�G#���h�B/`�*&'[����Y3�^�N�
W�T`�WɁ�B�n�iu���Ȧ��z篑|�!���B��[�/�%���Km�������������"�Ki���? E��r���@0����� �J���R����u�V�;�� �2E[
ח����-��^6���ؒ��מ�> کjiwک"-tN�S�}K�dK���0�5%B�V?!�n��]�I��e�i���qOX5~������� je��v�������=<�0�6�UG0s����(2=�t��\3�r��i�8��kkl�F#A�8�ur�b�*�� �jg�>���(wF����=#(� �:u ��j�h���.{��f���P�؍{f��,����X�E�=�D����aB��N:v��dPi�ݰ��hҍ����/)�r򓘝%�{��0���u"��w�l��WO�M��c�_���`���/U�O-j+6���MY�Vl���OLkLoп'/J"<����q ��|���)�`�-%emԇ�ʙU��b3`����tiD�ѥ�z| ,`�]�M}��6�U�����<�����}��ѡ�錷�x�ϲb-��Ϋ�1hX�O��S+�㮔��(�kP��WO�H;-���'��$�>�Q&���������=J'&�o֭-t�C0�l�5�\O�<W �!9�$WaT����k�FPp�b�*0#x�s�#�jhe�#d�b4�. ��c(_�'(�}�݅���_�˸;AcH~�(#]�,�Ɔ���U�J��Ej!Q��Ig`��ծ��~謁����"^�@��'p���&�٠��?�ʼum�{�ZD`����d��݈�$̪���!�%Pd 
��Z�Pݚ�Z�'��AW�K{�
��u��x�,}6}1!}��s�:�O���k����r񿊯w�nA*GA�և�� �fs� �Rڛ�i�A�Q��)������!�f�H�R�����i��4ݍ��Z�,X�������7-&­��:�A3��7p��,�s��q>H�s��������Pc���k�:�t8?v��3Zg���w^�7�B���~l>�g�]F{���3S�K�F.���.F&4������h�|���)'�)�����5�s��^�O�9�o���'iXCi�7�D&U��B]�f�`��I�C�d������Ld�p� �Q"F����K��eQ`= ��-'ZP����'�w�-�~3��f����в�A���F��&ߴ����Z�<l�8m��2;��8�`j*v���;���3���*r9�[m�m��<���4w,��9��fu�22_�`�b_�ض��;��(3�#�f�D_�R}*��ZD�Vo:�3��^p�^�Q�}6[:vx#������?ű���B���_��FG��씟|%lˋ���;껴%想�>�#����n�B�E�Ԍ�0����i�nz5o��)P1Һ��q�C���9��?!�:�|�BX;�ܮLĆt� /�\�<d���it�Z|Xxi��\J���ޙe{��o"�ƒZ�@��؏�y� ���3Y��d��y:��/�w�uc&o�@W[���6ja� ����{e��B�N;۫$/�v9��`���{׾9�.��    �+�� r8�8�GFt%?�A�tD�ow��&%RͶ�,%���7R���If�Ia։_`�#�b㩇ĸ����zb����u��\�����v?XWpB�n����,�ʏ��"���s �����ضW�� `z�?�٥�2ny2ע�	zI 2m�N��j��\ӏpR����	�Ï�q)@FNUBÍigKf��i��7�k�Ss����g�!���%��w�����N$�xq6�_���K�ˑu�D�����2�=��êpV�Jg*3�����;0��t��s8z�x��E
J4��+��8������Kc)KK�ï�!�O':�Д�9��K�6Z]�����V!f�,\d�ߜ\X
��7��ss|c&�I�b�u�+̑�R��X<����Lw�g�q8��x��QU���69��LrfwFP�?&�Níg�m��0V�'pjhi�g�5�n���|ej�g7B� Ŷ�XN+���H���E�KS'�'�܅�G�Ц���m���ˎ`���٘�Xr�n���@�q[<��X,��#M��e�o���73b*���),u������U�5�z�P0������MB��[n�Q$T((��OS�EY��5���b�J�	xx9H`�����dt��,̰�0�]���~�'өd�Y �lj"�9�ɺ��qgکAAI&U��/sgNGqԋ��G\�c�+��s'�6qA���D�%�.��:���еMUKrO�B�$#�m2k�/c]i�]>fׄ%�m�Cw��b���-�,
�JC5բ�Ӡ�2�@�4];<-Ol�:�LE������)�Q���%	�p��6ATf��=���H����#�1���T� ��>������ϴ�uhG����qXv+�f Z��i{$j��j�_����I������2`�b����Q
��\��.�H҄�Dq��d��q��O`-Rgm�����T���An�����X����?΀.�m��z$@����B?1�	9m�Rc���r���όWh +��; ׯ��S��+L�a�NXE{Y��N�1n.��["��{��@�Ɩh�f��K��,%����B�����M9�"j`�a������v�9v{�V}�s�7�h�=�,�I_��2�� &�Jr����j�J����F��c����M�� `�4SJLӄ��u<�X@� *Wm.M��B{<,(K+T��j��#E�;
���n�|{:!Y����_������yb^TX��|�=ݟ�M�f����픳�-�(�H$����4�:+�K�����CE�g;�$^Y��-��J���J���͕�_�U�ch��M4�yf$�<�/K�M04�����#pU<B][u@����?6W6;lr�#A�$�K�QM�	�i[���.�šML��<�ҙ)���4��lf�z P�^�`�ӊ��KM�J>@� Z��K�X�ӝ�Ece�]��Zd�-ù�c�e�N��6!�A�([�R�h!�Y��>�T��+3��L�6�g* �
���h��R2x;m���|��@�������y���A�4T�teH2J���q*�2���x�w�����G'q&��e���ia��+�����/W�5ܼ�0�Da/�f:�( i���{?�ȼ������{q�g�y`��a�gv*��­�����\&���om��>*6S�]�5�eaCS�-�脦����� qD�Wu�S�,+�.u�W��DdL�H����ȇ#��i?Z��%��0��%�j͜�o!�T7�T
����k"X�&��7-�^d�K��[s�������r�g��U���4X�եY�"]�ұH7���x�Òj��@%�R�*�TM����� ��]s��yd�#���+c�B%K�;t�,Z�S�-�=�{�V�H���}^��9\��Y�Ҭ��X�$ރ����$L4��I��(�/.<�cE��7�����
�Vj)�z�[��KWAef���yK���&�"����lm0=�:���.#[2d��g���sL��8��oo@Ց�y @�ك(�K�A,lMw^�B\@�/���`���h�mŵ����������
�񝀾�_J � �r�uG�O�V�2�\pii�`8��bb�=Κ����&~��<�]�{,��RZj���P�^UܨL��]���i��M��Dʵ�W�k�f&As��<O�;�I�.چaW
&K7�/��3�����F��\vd�'�7�3 S�QnF���}�?/��F/�Ǡ}Џ��,(�OH����Fo���r�!(��0�":��)�TlP%���[3���#�*j���M?Wo�o�,��WG�7Ӹ%�}�V^!ߘ��ł[&V0��!�0�|S�m�*��Á�D�cf�	� _��\��U�$�U����C-���J�@�
��yt�p�%�7�����j�����	�)R��4́�NNn��mUE`���̳J��]���t��nG�ƴ�����g�uC�p���zp���G�l�%�-s���5b��m��qo:�5\(�1Pw[HŁ6�z/��WA�P2C�oQ�v�W��psaR�<�-d���������,�ym/�����@��W��"8?x����Pw�T��m(.�)��?r��u?4�Vø�����>�*�����ow\�k���BL{�oJˁE�l2A��v�����^�Ke ���f�N�)���GF�O�c�������0�@���(�x<��~�g>dP':�X'�v�H^���Q�I�\	h%VJ�ˇ�p�Twˑ���J4�[$���c��	�p#�2o�gz��A�v�d�ׯY��|UlZ��-�sSK��v�uf����'�G~��s>94����k�PH�1��ڙ���،��,E�:0�5��ݾ���Q�Z�Q��,X.�j(�ٮ������g�+������E��i�p����`���t"/��բ�[��L�V'��+���5܂�Dm0��B'�H'��4���ђ�*����7.{�"�.�R��#�	��r �C�j�CVL�v P?���)���㛛�Bx���怅yI�ABeZ�-����h6]��d��f���D>��@C���+��@�?�d��
*é��)�Q
�{��[�;�Q�U?��$1��9���LA�{ߏ!�C������l!]�8�\��z������=S�:����g�nr�"�a��L�2�ɠY)�N-h�ތ����GD�&�a�ch���ͬư��z&����1m���K�w�S�$�m��DV��Xfm
����̺����	�4��^�� �Z����lw�:�pzf����Vh��#������Nk/s��r�ҏ�W��i~&roh�>y�"4�el|J�Oƺ "ɛ���)���bs+ŧ3@�^��|�X��U{{���iZ��M��@�7��y�t#�X�XmQ_��q>S���ķ�� ���a���x]	�]���C��bPŦ@���}��P]�Ȟ'��*�(萾���ܜ�3I
��и�`Ȃ���Y�p� 9�n�B����>W�j5����e\Z0�1�g@QE�XM�Q��J�\�F�}t�9 
��e��jѓy���#�%����$�M�仙͂�'�.�k�T:)p%A�=w{}���# ��5�7N�<�_�m�榛]��7��_"]���k��^��99\����a_������-���k0-[h_���
4`���϶ߝ�l �Ea����3`@�̡+`1@�}��AN��$h�<M�?���:�L�ݢo�f^V�t�C�zt6W���Ì.� ���gTJ����\+�����
sN��L��C8p�i�La*3p(��M��k�0[��	L�@O��9a+�)M�RaΩ/ј��<G!���i� gWv�-�u�6z:B�PeuT�s�oڃn��k�˿ ��#�Ǉ�M'�;|{�"X+e<�?Qا���ؠ��7-m�1L���֬9�*f��3p>���5��/6\� gG�A��@�'�����X��ђ�r��I[
.    @�@$��X�fF4�&7B]�J�4�cc-��/�$k���<Z�m3�Xs�tܮ�e���\,e7�`��N����1�XZĄ*�����l�m���>�.A�`�,����zӿ��������'�콕1�P����g��c��Te���e���ͱ�o��l���I���ɺ� �����qX{l(({��Z� �����j�4��E�b����������k�--��7m�	�oN|CȾ=k�� �ݻr�
z�:8S���=[p�x��m<j��'�"���_yΞت�T�����Oo[�H͕�aH۟G8����+6DpT�"-r\��ڌ��� -Z��X?1�B)� aX��;�qBs����W���܊��k����ip�����
���k��(\�
}�ܔ�M�暝F��ܺ��c,�3ʻX��w�t�t	��C��1v�q74�W�> ���h���3sޝ�a���`��n���4��z���;��K�"3�m�-1�T�7FO�
m�{�7|�[hv�8Q�՞��$��F"��D��+�5Z���i
�,����8\ڇ��ZQ�"+��_��0jo���6�j�f0WZ=c
���3�<}ͭ��tSˇ(����T� �1����!���u�p(V�ӱ6})-Pr�`⛢�Ғ3��j��!H%.m��n}���}��ѩT��
đ5�|�=��#w���T�,[�V+ws�!	��}�8:��r�8K���LωH�����R����v�W�6F���52�B���AWp!'�U�f���G���40�y�G\�隑)�!���W��.��y��%�;�/T9J�[}����N0��H��1���0!"��4�q_hx2D�7:��.���x�n�(��-	]�)t��`��F][G#Hl8��T��`خt�d� Ep��|f[���6�l����-�D#�U�oK?w$�� 
�gcxF����|�~�<��t|�Y���>�n��$U��k^��8�O���D����L���x^u����w�sw�VSUnGB��p�"M�X�Jw4�WAM��5s��:�05	5��ڤJ���EPj���>��;�!���n� �t�� �3��U���_w~����
��zǵ�����uCj~��U�����4�2�P������TM��Z�y.�O|�5I�B������}��"G��=E�{`)7u��B��	5��=�� ��S���[�?o�623�`V��)K<��l.�����=�ţZ�Y�qUV!�Lw+���Y+���kb&ə)�S���=8�`�N#�˾��]ksm��_i�A��9��F��3G��v�	���&������E��l��=`$\�E	�Ŷɬܗ|��h�1�˹*̓�rO|@�'��i���Ae���@�D��x&���qw�eA}��A�n�;�%r��SK#,��6}ֆe�:^l���\�SK����]��N����e�71�bE��LQm��x`Tm�倽���KV�j����D��f�{�M��%
 ��D���4 ��O�қX�3���MU������7_�9-.�1��f:+-������Ҝ1�?D��!�FU��C�;����]#� N���:�:�R������6ةʜ\cڢ�h�bB̅�Go��Ґ���$Ԗ#��	�ȫP�r�Aw��^D��
yR6Nn��6����<$CK 땁5��@3�f���;����Od����}�^���*l�w�ub��t�}�d�$�Ui��烏�P�W��W��d�ckkw���(e�r���I�5��4������T�,,򎷠���t���&�#���D��F��q��	m):=wFi�v}r-ڦ�kC:�ue-ft1��{����j$2����B��Gwb�K��%OY1 Og�^v�� -�ȝY߶̭ʒ�+:���5���k���nW��z���Ga��Q�#jZ��f��B>�"}-�?:U�}j�%-�&��ɲ.�-Y�鏆+�dã�
bM��4���y�.�{<C�33� *R����-�WfՓ���J����61������J+@cx1�x�~Ѧ���"��dz���@+�Mhj@������Ng����t@I�:rn�&������5����.>�Y�鬒���g�OY�0];�e�Z "�r3^��I��܌뛫�7��F��m�b[�4�~�
�5; ��tEE���<�Q�|�#�V�h�`�`n��'ȾZ냥�jx��V].�>�l�S���P6�]��qi�&�f�i��!�ɷ]6u��p���&MQ�m#m��'d�3�.��D�8��k�c���TdtQ0����z'��)C����@0*&��>�>�l�}v�K&
�P�xv�Y�@:W���<��z) �h��w���	�[�t���b���?$!���E��4l�}�'��?�c�dz#���3��<��y�� �=Y�l��-Ì6\�*M�N�b�?�pO)i��K��gZ����1�t.	��4n{^���D��!@_(��7���pR�C�i�ώ�d�PU4�F�O�G��5�jv9��;���BB]L��|����P�YE^��.Q{R�8$�����d���/r�k�`��5<�զ*C�,�zf�r�G\�����������݌GU@����iw�@G���
g�ÚJ��ܼ�~:/ɁA�5iɺ���r�%MN?��|_�R��]o(x��{��Îa���Y� ���$&�3�a�vDZ[��	j����o��!����_c��'Wۉ��L��S�H<�U���=�z%��=�>����t&<�IXT���������
?-�%��*!׫̩�ܼ~�b(�u��_��_�6-�2V+@fc��YZs�q��1躜 q��|n�`;��̣�dԠ�=���2H���Ϝn��R>�tɺ%�s�m��X`��s�(95��_�b�53��e��qb��1�~mߑ�c�Ŷ�j�����+18+?��rȤ�( .�9K>*�c0�Y�*J�tEW���l�=��A�I2뮔�|�tZ]i�T�U�y'��U��pQ����s3EZe�K���Y�K�����f"H��Af��x�f�wz,�H�����]r��f�/�:�t��흝:DKX��������Z6h|�6�㻠8��c�;:<~�)�-W�7tL��Z�!���ڗ?��u�Қ���U.�m��z7�fe��9��k���`�E��[��`]x����`7 S���w7�$��i�f<�8@���L4��9�㈙�iw7e_��K�x�*c�o� K�.�t�,�N�}�E�BY�5��+��dI���Ȕ2=	��DSV�r�r���Yf�P�A]u����t�@d ��t4�%[�Կ=@����������^~\������a�x����f����8b��q�~%�I3Z�vs���QJ�G=
@����x�o�Q��`z�7���}�~}Ӽ��ۘ7�����{�5́4����� ����4˻P2�1�E�R��9i !A��v-�W��������3tT�'�m�N)a�>֍ASD_ۭ��]n�vaWĭ��QlYB��+ۺ��N�A"{���tB ��*���X�ޣ�lA�D��fw��D;���N�&r�+�)�w`!�*�vUo�M�j�3��h҄C��F�pC"_��:�U�|��R��H��M�E\�kR��潹&S3C�S�[���Fa�P�|��5����vtJ#J�`�&�sLh
{�Ɔ+QD�0��c��MY�Z՛��)�ٟt�4%�ԃ�E!������\Xy��z���}t4��oT`���q�ܹGe��!u�����k�^;��'�R���.������*�b!�?D+���NiՄ�x���}¦*��i`Q���"�0�K�J��&S~?�@�o�.�V�Nם�+�t�|�)�^��3-Q��s�@V��=M�X	�>>��F�g�BeT����=������3��*h�^P��PH}��d���8,Mx�I�l����x�v�Qsz�u�U; ���e���k͊^x����Ihrۋ��[�̈�\B�)��홞��m�    ���j��������<W��Է��!��ҧV0����s���^m9,��=�0+NK�^��w���hG��T���ad4La���:Om�Ōr�iD^[�F�-!s}����g�c��^��TN�m^g����)2J�tNݏ��WM�ð_p]��Fn^;u�g�kܧd{��!h��i�n��v"��y;�c�<P6����LR����L��/�j��r�,)�|4Sa'l�����g�K�xk��|����8����:��]Q. O� wl�C#ˬ�}^[8D��-|w�=���M�$_�3d��\�4������f�̽��f��
*�!��&�\m��c�ۅ�! "�=�Q�4�~�S%��x�f�	�+>�&9��˛�UD����� ������KH�����O.Vj�� IC�7a�Hs��;PB�������b鬙�4���o�$��.� ��< LT8�߿���nlv��8%�H�@g)�3��+�I��V���|�,���X�ْ�E�FۉF�s8�R��>m):]I�j�I��|>��di�ś�h�m�0�K���i����3��?owK��[KӘc�Ӏ"��|�w�7��)W�Q�1b�B�ݧ]�8�珿�; Mfn8�ы�-\�1r1kA�A�EȊ��ۈ�훃�n��]�N���8�ȥ���h���d�&����Xҫ����|�V��s��t���{&�"+CՃ�L�#�|�'T��;��C������t��\�J�\�h�d�J�e�x�і�0@�!�Y�v�r�nj �v&mL���%H]~ҿۖ%ز,@���� �V��ʐu����lQ' ����2@/�B�22?ൿ����pp�AZ������]��ئ&��g�n�_�����ȒNF�6]������'W$�̧�u�IX(*��&����N.򲈌�F2E��@%ʛ��������v'�љe-��.��6���-�p�}��8c��mGgt��A����S@��� 6��L�~O�Z��#&�� Lơ)t���
�r�{���/�C�.4�
?I9j���3��\�E�&�"�#U�S�AO2��q>].��+fO������_r��"`�ca� �sX�!h˥e��@���aw��z)A�A�'�z���1i�Wn��X�$��ڃ��S�浰֊N�����(�q���ҿռJ�m�#e$�����9��i��Ԃ��r�Dal�*�aӿ$��7��f2L�y��:�0�_ioR�r�"
zj_{�\U�J,y���on��`J������90����UǷ��̲�xF�ϞvF�':eh��1=��L�q��AE��������8F	Ćȯ7O1�o���w<Ƣ
�K��|wQ�_�#�Y��;�Q����� �&��}(|��_gϯ�·[�G��q���;pH?}��L�i�vx/�m�|
P��'�����7���(}�5*�{�������z:(��u��h~b���G����*Y[űi X�&elG��<T��3���:o�9�eޘ#Bo�K�h�y�Mӷ�f�WN�"�>9=C�bD�|�
$ Z�o���k�h|�	��\��x�ʶR��N���q�3�C�F���� =z��VȪж
 h�j DYW�C�L�:��ˣ���,@@X�-p���C������F�X���g���ꉭ�#�Og��؇`9��w�:�c�ʊ���מ��#*�ؼ��W�l�)���"jh�>�����W.�r^�Ĭ𐀚�@��;&J�թ�w��<w���Q_-!��g��o�Ŀ�Iv��B�D%��B��mXgA/9�,T/��n��&��so2Lff�l�ED"Vyl*���L�f8/���-X����66x|uaTk��tWZ\O�xF�f׀=�J*��\�<�	(�$ߍ.
��a���TO��V���pC �������$CS^5�����{��=�z+�������+��7c����re܏�F�:�R��[�}t9V}�h���O��TlZr��m�	]Ͻz��t@��<�,��-����kP�����'=��n=����؎�@'����ѵ����*��@K��h���qi�
 KԱ��ͻ{��L)���uJ�X5��-�,�?z>���ʂ�w�N��c%	���Ϭ�=-/U�z�� �A�a��ʬ�v:�wB͏N���=����t�ܭ�t���
���^����O�6��T�U�A����C������W�%�/T!��q��ޖ�+�J�:�|E����X�f���`��Tji������w�^��x��I!ມ ���ٳ9����D~��6�_<A)��_2}��U�f��4ύ�g�K�Fle��[����,E��C��j���_�=�ٝ�i�dj��T��in,nT3|��%�dw
Zp��}�Kx��4�Z���JϰzФ��U�T)yW��$d%�KT�?��)S�d�i�I~$���c���
(v^�ە1gʪYI�-� L�0;r��˵6rl�����`��Ӧ��� Pĕu'V��V��Jl:ڀS���쫶�J����Cbe1L툴��?݄���J��ɋL��r!�Q'��,�̊�k
uN�5��1�K<��H!�Z�6"�Dd�?Z�����+V��J�A&w͠��\�v7 �d:��!�T~��`�y;��%�95���$ӠߝwK;�/)w_-\��U�p�X���4�\i~<3���m1�C.2̆��JpW��)�c���~�Gۣ���k�s3�B�-�
^fsn���U��}E_��LkA��b�5���^�w��Y�C <�38�e��#�A�\>A"K��x3WK&G2�=k��}5�n�"�,�v�MJ�m��4s	����r]��a+�c\��ޟ�X����Vg"H��E�K��:�6@��i)�:m�傸pX���c!'�yo�����׃5=ϩ����V�PȈ�CTkO�݇@*�i� D���h�~Ռ�>��o�t�¦�t���&��/2.�4�����2��+�"���kP $K�y�z#)�� �� }��3Ǣ���}i�����0�&Y���6�V��}r��sk����U�-�5�!���Dҡ�p�N��̓!4�PU����Oe��L��EȲ��1�ې|;�r�NY3���"����
��a[�2mt���d[��/��k��L#�n~���$��8N��E����3�!�E̹=�U}��\$2[>}a!�"����5���~}���!_��z�-2��C�8�AH�O�.9��r1:"s�1سb�Ѵ�-s�
(&w:ߎ��2�xM�#�Dd�B��j�=' 8�
~R� 3�o���Z�+ �0&ׂ��|�yt��pg�ޡb��a;����p.��09�|�.5O��C�}�s�����0쿦R'EV��;�g_�i�oK�9yN�]I'�Dy�ʉ*������F�2�z�l��c��*��Tq*֖��S�I�D�G�
ށ���<>*�5+M�L^�#U��Gp���ύ��OF	e��S�r�r�<�k
�Wf��:�$��r��.mS}R�/k9J����Ϗ.U2�?.���{>��R�ݦ�hOK���p3-�J6��f��~HԂ��'j4��!�R�*���65�[e�w�~�t���b�o�{\�n3��Ԕ�d��zX:O�E������8��P��S�!G]Ŧ�9p-W�B�-Y����UZkrDB������Z��\�l>}��n7ҍ����t�=,z�]�PL�1�l�Z�=����?[���&��ڬ$�m��˼��Tё�;���T�N� Ǽj��&�X��<�ao����z��1�aL<�̴<Wޔ]�B���a�m3�Bw���(����s)(!S�!� SF,�~>B�&lJv�7�G7��^���Y�A\�����4�Ͳ;�µ�	�<4&׶��f��(|o� �]�+�T����L���ryf�A�$�ݩ�����²��HW��SwF���ft;���xiˊ̬C.�������{;r
;@)�����M���$����˦Co�n����1��z���6JV/����~AѨ�.Gq9\�    ��ݟ������w,�}�,u�J�'Z���j@+�a�Z성�L�
y� �����ҍ�����A�v>��<w�q8t[����^���\�i�ɮ�Ū���pYJ��Զ�C�ֻ��P�N���S�n�
>��
�<��0�'p���>���|��3L�;��]OU�WY��K0�H5�y�>�+��g��kn}�;חW[-r��HT�`;B��{t�oE�;!}|R�ց͉v�B��Q�HP`��5*�7k/�0��jN���|`��v��3v�����**��g��^{��Wt#?B��^��4�Da�iՎi�e�Zpj��j�R�|o_�!�M���� JE�zߵ�}�:��~��$����ͧ5�}}�ٯ?X��tz/�QЂro�S�SP׎4	�mF��aҺ���L'.G;���x��|%qPv�K��ur�)^�ۙ��D�b���#�%�L:4S�=1�osi������5��~�3����r�5t�'Gp<�qƭ�xYUuU��M]�������o�iH���E!꺒UE1�8�i3�����!5�@M2��n�;�)�T5�P�of���>�|�Da��M��Rg`���t#���'Ϟ9h�X9��sT����d�i�U�T��B�w�4(��8�������0bw�0�j �F.��g��K�ԓ���<�]�ڼ]��ǳV����WY�#�4a_G��k��qB�� ݃�^��
pt��o�\�͍z��*������~�����϶���\�B3{�m4����O�|�6U�����.���n��M�4�C*2�mHC4�C�N�Mghkl���ݲ�S��if�6��(x���h����=��h�9�|����VvԿE��t�2�m���^���̴ �C� {�u�EYK��=�y�f~���O��4!�h����C�I��J�;4���'v�{�����r�S�������3���96	lI�|�+gn�NFM���u��}�K� �9�>1cI��i��kݜK��|�[s���ۅ՝-��B�yӍ��g] �tq9&7ej�G�)lW��\٩�w�r`���:�)^�Cp�׉aԞ)���n����%_��x8�>[^���;�yn�6os^ �m���w��}[~¢��z��{4�Ƀ(ǹݰ&W���ts5���g ��ya���u�η��9���2����m�t0\��O�廜��w��Rվ�ۡ^�@�c�p�M����
iy���qf�4�%>�c@D�p�N��|�G*r�5�������e	S����:5���ƫ�l���@��[��_G�������nw�m�k���ai�N3�7�'[�|x� R�#���#��K�OC�φ�C�*~��vh����)\�mߨ���-�����~�Cif�7�)���ί�wc��v��w�iPL(jڞ�ڷ`+�9�mXi�ʮ���c;8��V86��J�M�օ��ޠ���� {v�#߷�����h.r�6�}��B_����s�ˬ\4ݛ���e��^��p��Q�;bӣL@P�*���6N�l�5ʶL�s�H|�'-u���}�^Ê�4r@uҒ0����$�KeΠ���J�'=��ЎDP
�/��Vff���9p�����Mͱ�s�$��5M�v���A���h��y��h��: y +��g��G*���BE� +aCf�{n��%<Uo.x���}H�J�_�����AVܝ���]2㟗�)�E��d��������g��b}kQٶo�(�"�4-r��&j~$�F�܆��
�"�۞�B��I#
{9n�y�Z������2�\Dz�!Z%6�/Ej�f7���Z��X7�4��t8TU�Uj��V��8�:��_H��2B�|CAmׯZ�H;>�(��dy�]i(��2�(���[`jh����+/���~�<[�F��Q+���Un������iR}�[r�������������ȋ�t�E^e�1/�G�0�YY�#.�q��W���r�n<v�Qt�,�.$�����K�E��+��n����̂�`����$*��R6��=���c!ev_�]53�
b���g������0���Q�
K�}dܴuWk.�I��w�0ё�@� ��x}(;P#��<@.�}j������$Z��PXŔ� z
,`�R6��x9�4�3TB�Z��)s� "]�|��Q�^`��W~��s�0wu��� -� r��a����G���C�B&� ���>�j#�W��+�X��~�x ��<�/C�@*�|#��:�y�ӛ}�ל�
^Ⱦ�5w��.R�థo���CY���&H`
1�gē4/C:�f��R��$�D���K�<��L}�JN� �l9 ���
@g��(�	��� �~i�A�?��8�i�9�|�B<4d�gq(���>j��_��2tN�D��υm�Mi�
�4hO7ޗ�:�釢#�QVG� ���! T,~A����[�P)D��Q�=U�y(���r,<1gz�2ƿ��
��1*�>�L��N��b�s�9:(_��	��eFSQ�;���n�n�@�"6�M�����4�uwF��_�v�,�@N︼��9CssD��G����W�F��>١�^�e��R�]����T��[���%���8��{�}������K��	I�81�"���I+���c��B�[HB�L5m���hg}(�P�P�9}[��ڦ���!��v�09-
t���.B�Jz��k%Y�e�g�BdXu�x�QON�o�^�K��U{l���㖷̲����*��MSN�\̱����	'ܢ�ڇ�gF����k�|��c���×�V?G���sd�@p_Ǝ�A&��=H�|�P�r��.1z��&�*I��0r��`tF$@;�b}��F=��AC��e���Nt�1�d9��a�$	�07F~�������i�+�A��WA5��Q}p�+����?Mi֪^S�L��T�-
��h�t=���j%|�q
�WV��#y Î΍���+@��V�
.pt�� y�]躮@/���z!���'��r{`�u{�b��e:0�Ŝ�Q�����([�N7�����UZ��\�!�C�B��>e��4�^l"��-���h[����*e��'w��3���+k�@^�|�U�����Q�+����ZpPض�������n��������2�J������s�ӛ�ۗc��.|}�r[ؽ�1� �0���& �9t�h��n�֥k�}�oѪ��K�	��؍��N���G�_>�Q�G��#�B��:O_-�bb`h��m��Vq+`f)-o"���Es2�Y��o`y�d�7V_N �ә 2i~�Y�s�D
��T
1����vtd�-Y��:��\�Gr),�z��ܧ�R�`�����j����TS��nneRA��r�͊�n��xS��7S��}�U�tvv~	���]kjc��a��y�'L�L�r��!���9yn2�.5����r�A��s��!��E���G�fM4k��ߘB����YXH��]Y��� ����HaټF��xO�Y�Tl������@��zb�x��K��|�~����WY�r�=�6EJG	� �t���}�|�ս���
.y�1�N����͈�9d�/�Og����~8GJ�ѠPLX�|�
t��#C��/�k1�j��u���/����.\&0C߮۵��'�M�`�$,������o��G̒��	ЋyT���c�	����s����w���� p9�����\ 0����Փ"_-����Ḭ�1:��$B/�⧅I��%.��.�¢��1fe'mD������4|v�����׺�1/7K�g��ƀ�iQ�xOG��sP�n�$]n�tI>�1Kw׻�Bw�?�w�LV�wU�ag��p֚��7�EvÆ�EqS-П��&ɒl��w�L�HW����[lSP`����:@��`N�W�;[�>*�
p�z��L��a�_��4�lWh.�{�i��s�[ֶ�U�dO��L�>�4A09�w�EM�\l���dk�K�Ag[��U��9��:�3�d����mw|:�n��gj�bb-    \���>��Wƕ�8�+��-���0���x�Ĕ��u!��{�4�&&n�q�W�,�K�n=[��O�ϧ�M�nƮ�P���H���e�:9���u�۩%�L��z^���ml~���R���υ�>���t����P/��d���|<���7j�1j�b�d�"Trz���L�4؆t�Z�!\�$�b�K��Qx������R�i������Li^�i�8����NWd�8�`�U	�)ʞcp,�:d����Z1����՚%�M� �.�Kl	�yA�Ą��!( Yq�I"H����ז̙�^���<�4׷���8	3ԛ�d((��b��iص�7�j�R�t��,&�,����7+�t�@)͇d�S���j���)�Ae ce�6�+���H��K�Y��?I��'�	w=眳_��;H�6���Z�^>�_�{'��`����yF��o@���yM��I�dZ���W�	�h?|X�Jg/I�f%���̬���{�����9��������R�3����Z�|kQ��w�O�Ӭ��K�\^�B��:��;�CE�17E^c ��X<�e�S���1Cي��HkM(����6�U����w��*���NL���<��4����T�CYɽG�3\�~]�\�*d�A��c���4�I� �>j�u�+���m�$sh��8��LN��J7eZg��?.�H6C��0oH��҃��)��(}IO��E֣Ϋ�PB��9����h(nt���l��Ɛ�4�Y��0�*��l����8~N�'��x뮗��J�`E�
0�D�`�w�qv�.,�����@�,P�Pc������t,���C�	��N�����(	1Ӌ<[�~It�U�58�Z9 �Cɴ3ä%ϕ|ˊ{��4����S��wjĦ�1�z@i��q3k�),7i�$
���Ł����ɓ��-�r_(��ZY��3-ϣ���K����q2�������4�b���M@4�����4L��f�P�)���� Ȥ�Ǿ�\�6�v��/�=��H��Y�t1T�.��13�|�5�i.6ભ�\KtǦCZ </n�O��aG��3�s��}2����O�f��`Nm��@�J\v�����	Ã�хA�8�6@o'�/��~�N� � �>oA���Bv������t�yi�V���q(/������c�p��ưC6L\����v�jJ"DsM��HԙKu�f������i2^WAw�K~��C����;����m%Ƶ���ĕNCD��u:!
���A�R(���� �����Y�#!��C���"�9Y��37���&���������4����1F]�Td. C����k�7�wn*�-�0�4���^fX����7,�Bm3V�P��i4z�'mr�!��m���Ƀ!��"�d��� o�5���'��z& �|!s��8��s�I#Nȅj�2������{��m���PE�9K���`�\����_ܪ Y�nk�t�Q���2]s��Xlw]�l�%��$m	 ���o�	�#�[cMb��VO���f����9��ε%+�7CZ�=�א*� ��y!{�s,�a��#���h�g��g��p$���`�3�S�1�xs��<t`�R�J{�_�3��5���/"�*����,�`߫�\��>%y�x��l����y��&3f�5$�iI��o��޷'�d
*{���g�+�H�}Y#ǐrd*�	�8팲���o#����K!Gܿ��V�܁W�_��%�s&y��B�������+$Vj�7A�͕[d��O�(�
��@�r�V1^�'���釡;�����+`ڿ��.v�)�Ձ�o��Lv1��W:S�W��q����^Af���=��ʊTy��%|!���
�\��%�k��t�0�.ꑽЪ��L�#�*[8t��,"�h�MU^f��*��ݻU�B���"�,A���k�+�H������0Ib�	MÌ"�,�O���s��n�z,�\�b�<-~4\���� ��i���В?Л�PA����[�:ο���-�r�L���w�/�/G˥��}��c���.�}<�>��� ��Ϯ�$k�Y��N�N���a����H:Nݠ[��z� �
RE.+p��n$_��������ǹ�Yڛ�"�^�����䝽�M��4́W���?�GA;Vu�	Q.Z����@N�����?�u�9����Qmq1�`-��٧���};5XJ���C7U�'��k0`3q�Z���x��c�0��da�\���-�?�j��d���L'��C.͒�ɼ��=�������`���ĘK䉵�5�,�\P�DZ��烗�S�'&K���ds�*5��]J�q!i"0�k�����n��2�l)!l�yʵ���н����G�-v��`h��{��Lҧ	�rQ�J���o\��0���'��<�p �R�d�l���z&�E�ao.Ls)�8�q�S���Ut��(�X�ԕ�:q�S`���לiM̈W_��Mȓ�*��A��k��b����iu�8x��|V�Ya�u��oս:��9r�v�M8�lJ��h�o؋�nք���&��Ѽ23	�-z��O����l�57>U�1�������a
%+�$M���f�Yyi�a��|(/Ӵ߮���G
l�.��q���f��$ݛ4�l��x��  e�~���7�6I��`PϤ��J�����+9h`x�K��Wj�8нU�:�\W q	��r��Z�~�uR$+�
����8���@�X��y�� 	��`G>���p�&ۖ�gHE�C(�MV�!�!'��w��C~�KZ�&��[G�T���L!���l4��p�3X��0�3-f d?��-��=�"[����ֽ��e���&s����Q(�H"�D��Z�|UjUA���8�6�����P1cG�Sse�+E�������i�c���;0�ǎ�m.�2/��"�.������c�5ަp/gL�h�Si{l�P@���هrY(Gו����Xhp��Ҏ�P�@xߘ0,�1��Z�v�#Ol��=�q6�1֛��:��<v�&��6�F,n��X���/���D����^��BI��Xn��-4�1��q �9L)(��[������d�uǖ>�1�L�c��-��~F���X2�|uh���E0r�_|���M��w��\E>3�إ��/���J�d"�WR ��:�\3˒�`k�gs;�Z�����b> ��I7�����-ύ��+}��j���P�Ts'�Ư�
�!z֨S-nb]�-&I���\�,O������7X���ě,��#�I��T���c��v����Ȗ.�-5��c%�EX�q�%�]�/�p������z1�a�
�\�fK*�z@�2h7����.�cEcכ°b�£�,�1�očz�9�D�P4�D7���gPǨs^�\�$ ,s�<ϊE��'��%	%��:�ݶd��Շu���"�w�0[��LXD�2����������D>�VB��Nb���j��vf����n*��MV�ܥ�vh4�+��b"Cb���]$�_�s�h >��Gq�
0�Z��-D�����8)ˍ�T�\~��=	d�T�`�xI�O����L����W^�����!�{��?]���N�۲ F�[�u܍*e��u��8 �Q� �=����ژ��zo?GhwC��7R� u��9��*I�d}W��$�eO��[_
�d=��C�_.R�	���\�`���<�#"��Jkhw���к��[nN*sn����ٖ�;�1q?΃�����S�2�u��.�����=*%Ώ&@e�6�|]h�@$`����<~��Y������(!�N����"V߄x�����v(�����S����V��5����D~o�j?"����1���z���$��P�O�WT��q���L˒���k�+����ʯd�	�Z�'hx $U:c����s�c\-�!ŕG��!��b���6�(Џ_D6��եo��c��q*'̆M�q�d�ϗY���    ���-�\�S�§渹�k�"�d2���1�&��h�/����W��_.=b�j���,�r6
ab�tN[�ܠc�-LD�0N�!��-s�����&���E2�YI���Q�|*翂���.����jJ%5��� 諙}�j�˹90@7h�  �n �G{w�ޣ����.�B�	 �� �Կ�1ݍtb ���/"ɜy`�����9~��{��Q�� �����s$����RR�_��Y�|\f��x���Bq0�S	���g�ťw�����t���x���4ps�z|E���g�jd�X{�� &�����>�C�2pq H���
�hs�!hF
�L��9(��qۗ�c�ٷ�/� ǟH��Z�.�	���j�t�~j�VJ���C�`Δ ���Z���C�q5����g��'�<Z�p�包ˤ5IQ�Hų
;)�v�:)v� !n���;q��So�6ɑ�<�6�Z!�j"�tΙK�E��p�a�.������h>���-:����
��4ݸ�t8�&�1W��p�Or����a��7�Zm7T�x �3S�s�R�5�>,�<th<^���w�?�h�\4�r�W�dS�LK�m��q3���*�X(����s4P���2�u���V��<>�L�c��}�����e���8�zc�wdܝs����q�g�|�����A �PN&��d��?�����_�u-nM��Nᄦ��$��h�!Q^��*�{��BHm3��wX�v�U�1��m��`>�Ǯ�"�$���7�u��+��3K�:_����7��8d6f��h�r�?�57s�:cQKJ������Cw���X���R;v�B���c�8�zZl>ߪ��Uא��iJ��|չ4](F}M�+�'EAu�::�����܍�^����L�́,�Sb�7�P��9n-mG��E�%-.�P_�f0���s*T�f.(�g��S4����;�y���CM�T��E�)�ZC�����c�������Ci��R��L��.
��f�HIn"dKrD#�H��1Tǣ=����#D�ri��Ҥ��ח&�F�nt��׎QhiLI+��Q$�[V�ɴc���2MV�?�B@Ay�b�.�(r��H���V�:����ҧ����VJ}+�,zM�R������Cun��F:�\��x��v�sa���ȽIs��4�J��
��Ja+G+X�΃�쯏%��X
�r��#l�,�U��/��+�.v���95�$:�u�:�W�S=M����oW�d4� `,�m4��_H=Fq!r2��0��U#ө�<�䭆8TP�V�T��ǂ��������/ĳ|.~S�{G^�ʘ9�M2���^�u;�$�$/R'o�^Mf"� b���:;Px�4i@eavE
��F8�fn��P8�ኋ����`|�X���Mͺ!�V�� �ODA�R�|̃�8':����0���9C��,QjnNs�PD���=��+K�	��TQ̞U�gc����&ҝ��y\�LN����U�~.l�����	s���>�C{��s���(%����5���\Fu�݋�Z���tz��Ġ�vRp�ga���,���`}f������)-"�V�d�xe�-��$L]�`-dB2�!K�ȋ4.�rʲ�m�u!��|a�r:�:�,��t7������l�C	�Ȁ�r!�S!��\��S���m�i#ne�/d��R����V�4���R�m��`!����ȸ�6���b?0U�G������SY<��_�Ѭ�T�p��[�^OP,#�@Ĭ��:1�Q{]�Bz��
N�����fH��(�@$��i wX\4��~�CiA&-�@�W����`�.�Uq+�__���v#���f�V��h�`Bd�!f����6w�4�y���q��եv�LZJ́H �b�
�*�Ll�*=NS �tw/�v`J�(K Y�i$��C\�Ή��w]�7v�=�˦Sy�it��y���vOtߝ6+!�ĵ%��@}���S��&_?���O�s|��ӗB��Ҿ����<2h� ��R�4R-���������sƑK���I�̅a1�|�~�K��&J���e�7*����FW=~�n���~��Len%����5�����|��l�{濐�_�&o��e?{ݽ}~c�����zQ��/E�ْ��q�Ձ
��/�?_����g��8��~C�~y��w��>���gtl���^�;����g�������K��-�,������zп��
C�r���t�U�w�ȗ(J�7��XE�t���b1����Ǽ����Џ�y�Vy��O4�G��(��������f��k] ��}x��B%�)��];��X�b�]u�S�D�TdѮn�����'	4=����x���s�q�i+Z|�8f��_$��M�t� ��X�A3:0�L���p���?�k�Ŭ��|��5eoi�E�����%c�ծz��^�6�����TO��0}Qb����ч��B�hDd�fe	�}��Q�H�\��.����=S���<�w\n���K�e���R~��A�P�Lf٦nt��84�iյ�Ew˗�?���n����}�l̊t�F�%y�A���R�	Gm5���z�‌��0��o5>�V�� �>Z9�R�ʾ�j[�@1օj_,��Ѝ>\ n!=�n�t����i�1�"�ur������҉K4U�"����&�XmX�j]=�^�+G8��=i����������x=���}i�S�}�x�p����\��i\$P@��c!,@s��t%7p����཈
x:S�� ���&ܿO't5y_}�	��x�<O���2@dul+Z=�+�!�?SAE� ��c��@�!q0i*�a`��xc��d�8]�z�p�ȿ�I��6�ޘ���� ��?�)+
���>�&rA�����0�qA�
�& 7j�MQd  T�yߌ�\�h�j�E�kѿH�9����~�c{%K��Ѥ^/t&]D���OT�	w2pJ�"��`2�n�2J�Au0P�h[�/�>�˾g*���a�M��A�3��@ӄ������]=_
�*J�";�0��@����Q��~�U�&�G�hB�.ځ�i�n[�$�n�`�S�#��XYɪ����L�������d�qe�.���t{W��7X�)w��D�ә*��#27�7~���jihU�Z46�E��@�L��$�Y�ƂϚ�.�n/\��V"�b8��N���CP�̙���d;%��h�QR���:*��Q�U�s��?V�t�Ƕ��g��m&`+8���׬Lm��'Z`�'���`�K�m7�PB�Tv8�u׌��� ��LRp&F�p�j�C[	��]�[/#nP�8�@�:ʅ��=P�
�V`�M�l���X��J�1 �3���K��&C<��9�Z�+ow(�C�+ Qb�1eGp���X*�!ډ����
�/N����i���1>Z�s�~FI*�ڡ��eS�"��-;��p��x�kd�x9n.k�&���m��. r��}2��a��m��F{�h,d�����}� $���l��]��!(7�����r��0=4�a$�)���k�.���4�a�~hz���D��l[�A�?@K�a�F��NN��4}Jx���`�4��_WF�{)�@8s/�5��L �U6��p�J�i�\\��@��C�5����Zب����,F_R���PK*�ݱ�����x ! TJ'�-�iha�8�8�h#Ť�ѱ�lN?F����̧��s<���0 �U����ѩ��췄����F�¹'5��L�_�s�u$��Vh�%6�-�0y:d�2�	�"��7c���(�eKB#Ƥ.#�-�E��窢��mŕ�)�~�<w��ۺ��*k<Q:�m�vԦ0ȼ eJ��h��� �s��9�R���P�1'_��d)3Y*���c��lϕ����́�u���e�e�0)�h�_�qU�T�4�-���Rݗ�/}Z-�B��PO�A�/����T�i5��-���@�P�����i��]\���p���Ѵ�    �J�]{��=���g@�\h��v=��6F:�UE�/E����]�������@_h�����o$�+o&J6.�3^ַ���Z<���Ǝ��(`I�\�j���u�܈�L9 o�"BX�D8}l�B����LPk`$!��)�o��u���*��Rr�$
ך��S��6�'�Gea����AxԖ@��[���ܲ���W��)�T�ZR��BT�̵X�o+ km�`�Ld���q�/�M;�C��簻[X#�vF+���<�&��P=x4�[ɓ�������(p>#�"z��T犽�jO�U� �}d�"E�D�͡���t��;'��a�	M�}5p����2�O;$*X.� �8���V8	�i;`�Vѯ~����M�vfX���T�+�tXY��WB�"y��x������Ñ^�Z'�`[B�2�ﴒd�$�y�o�)��*�a����tA\~%��6�Zg�
|��/&��)Z��t[�8Z�dKG���'�J��C��>m'���_��+�%b����,5F�&;(a
�c�o{���2�8���g�뻻bX��)��n����>�OA��S�n��!e�ҵ�+��>���,%
�K�ȧ=�F �i�>��X�`�W�=� Caʕ���_dK�VK�)U;������ߖ�@�(����0����(�,l��a�ŗ��{(TY�*ܯ��1�c�]�. ���)-0F��vhs��l�i�P�����'�<D�w*���C�ʀ�H���Aύ\���#,��� 4������4���N�[��JY�D��i�C�{%J��l��.PF ��7/X}�`���̶�B�Y�K#�ڮ� ���rAc�^Aq]���?�ͅ{si�����.��&=^6<%&�a�iLN����FX�ΒLxaF}�O��n3�$؉��ȯL��_�*y^�BG�7�E�^�_��y[�hAM�������=_�B���ܭ���>ڟ�y����3��x�L�`��'~���7$I�$�?Bbw�wö��{m�[���ђ�JJ;(��{�	����DV�@�?�V��>~ὒ�) Ms�������K|�X	QҲ�!�w2�IC��\X�� ]�{��LЅ�`9�p�U<N�R�q���3>��u�Y��oL�J���?�쁦��b�/�"ԑf��N���S��|;�����^H(�8���I�#@y�lq����y�U�P�̝
��#�T�Q}<~{d�>.o��#�[����ٔ
e�f+���d�����(���3��M=P0�@�� ~���ߑ��
&s��_�)i�)��Oܱ���]i����h2c�R\�(��;�8	�e(�sGw��{,rt�硸;L�\�Ҡ��Ҽ�6���I>��r��~�S���}��<��ܡ���k��?��˽9p`�v��6�rޝ�8	���"�B�y����}�A�Tj�A��Pz�ҩ5�B��՛��g~���ƮA.sD>>t�l})��,�~'�8�}aNkf�YF�b%Ix?�d�d�K��ץ�lv��L�Hy3�
�*T�kt+$��4j�����Ww��}���UK�a�i���k[;��@�(]ܱQOE��5�2�\z������"���d3!5ù��U�L�A�;{� ��5�$�jh��3����2���GQ�8׹I��\�|���Jd^�H6Nכ[z� �
J%�ԡ_[Gi�S	��d��nw�iH�W��$ͩЗ��w,�Q���t9}i1C�J��������W��������8|OC�\I��
�Z�aBc��i�w���\��\N�����߃YL�j*��o8�.]����� I��an��P��I���PO� a�`?`�85-W�b��ꡚ`U�4�Jux9M僓
�~��J�rUN��DGC��eA�ц��;�S������l��1�<��C[�>٭� �7��x�S���824ە��
��ZSm�	�Β
�Q�.�*4�0 ��tQ� ^:��� {*]���ad���FwCX\�K:��'9RrA!Ѐ�rH �����t�[����.��9x/'�����{1r�0Kf�����4c[q<��O�Р}�1���������ו,�o�6��e�u�*�-�
����jz� My1��*�\�^'�c���L�k�1�����}$>H�sU�r��ЀNȄ�IF��ŗ�e%��⬜���\��1� �w���D1jz��Up�PK�Oi�g�#:\���IsT]|��{�j����1u��PW�A�>,_m�[���ҋ���7:��
0^h�td����G,ɤ�����V&X���TWg��26������e�L��}%�� �ыK?6�M�R�,�o��k^K�d1�Z�58\��O[qIK���U쑒J4^R1����j�(�
e���w,�U����n��~�*�l�ZA�BW��y��� ��t:��մ��=8R�p�H]c_�4��ȏ��N�{Y<�$UJ�����XO�B�4��D�fW��c�5�$�B�� E3����h�t�6[o��m��9��{��jZu��2�\`y03�"�c�)A��\?�͹�S��֥%Prb���+��2(�'=(�?�(���u�+E�>Q��F��8P��dA���=A�Q��V����x�?wՀ�E�q���	߲�n�]R��Q1r�tu���U����#�N����'������2^�����$j�i����p,�d]V�J�����h��W:�g��}y��m���ö�;4Ϥ��)-26�����?�)g�"vg��|��KL��)������Km=/2w�I��|,R:��2��׮_�6�(�Z�t'ԟ�0J3�UJ�[�䝶�GG~�x%��S��N����y��@���X#[Mw��TtX}E��^	(�?�y+j�������~�gز Z�����x�!��#,�@���B��X� ��3O�ڋL�5?�
��!zI:6��g��ȍ\���Z,t�A���~���OҦK�� ���E��(��&�.����>A�{*(��3 [�K�W�����#A��$h���L0Kr-������aJF�Fr�]ӸR/t�ѣڕ�'e�"D`,���KT�ugx�����	�&�qM\ڮ����Ӷu���x���f��x�Z/J[ξ���2I�@Z�&�"��a
�%�H����dɪ�0! ���ݧ ��×�"a�\*'�ޠ�W�P�`F�YPZ\&�}Н=t�#�<{�.H�E8�6�:HZ��?2 ���+ܺ�ii�;�h7F-���(WKM�ڶz>Ts3�`P��|�O��m�O냠˧�ٛ,�^w����xN�_t������Q�ؚ~���/s��f��dke�M5��*��9��� ͦh8X�;c�����L��>T9��$�O�굆����r�a�8�f���s]��L��E>'��4&�y4p�-q�YF�Hs~vdd X���= C���83l5�O�o� U�h�?�Ji.�ݴ�\��8���j�oL@[~�*��/��N�O��>-�������/l���w�>V�!�����@]���3�R/Q.�Iǅ���kV`*n_�	���g	=��0m�[x��7F�7ܾ��XPgWء� �W2\�N�����yK�ў�)������e� .9�����C�!	��`�Q����Cq���Nq��;ٚ�����N>+� �o$S*IXVܑ�F�7�����|��v\3?V�hˊ�>r�r�@!Y���?'"���HO6 ���6�E�T��.m�����v n�n�_;�G���ad���f�����4ɩ(�B�T�A����%�H��Ƀ����+(�4�<�̅� K3&Y���UXE! =��4_�k��d��9����K�����̤�̴�i
E�FSc���RX�����F$_C�b�����FI()Ȕ�
z���VR��c.�(g����^yk����E[�3�Mz���M���m��w�l�t�3�+V�o�Q�m��и�`�E���8�#��۶H\�N��l�$oوCS��>rE    ��v��Jq�~$�/y�l�h`=i�k���Ƶjo0<`qP�K��n��f�"M������Om��!�p�5_��m��K;�^K�����Բ�rM���P�>ۛ��x�%�s�빘�^c\�CMFǢ+~��7�|�]웖J�J6�}L��gt��6�����_�:B4tvK�?��75��]	�: o������a#Ώ�.�s�>M��3�.��_�Y��#/QN�/�>����J}��F��tZ�*:;�%A��F<��gY��O���?��
lp^\��t�"�#�J>$Y�d�,���o��jQ��N$#�9���"��l�A*���n�$�`i�>{��p6	�J�O��e�S�MQ���{ܗ��j|7����F�dW3�����R���̀�N]H�m���py����:\��CY3���k��3��|v&sA�Җti��~ZY�Oͅ#C海b��F>���X���Z~�9��:��x��4��,d#����|_��A�G��M�Yp�ຕ�d_ѭ��:��\{�V��D��.yJ �>X:�?���@���J地8����q+P���U�Y}"0�\I����.���&y�3[�u�%	.�{͚��"՝^�/�ذ������ѨsO��C����.vaSjv.$�/
 #����ö+5�zikz��p�wW�H4	DUx�?~c(��w�� ��<�/������f:m�z|�����4�r�E�p�r�a,�9��ƒ.hYM�6�i��?ky�oԦ(ْ~ZiM�i��ľ��4Ϋ"��v�f�<�m;I(��M�<�-���-�M��#a�դvm+ߕ��մZ��"�韖���������&�# �|�h꒱�k��������+Ħ��1�>�w%RH�m���������+}�`z��(�Ǳ^�n9�Ϣ;�,D��١5���)����6���d�ъ�B�v���R�M��D"y�����
ɑ��L�%:T8>�C����M x#�k�'��� �|S�HwĲ��m�<��R�0��4r�MK��ΓY�� �)�#�p���epu6����)���-�Q�{��PE�� ��F8e��a.�V�{�"��Ԋ����Ȧ�,��/d��xW4aEI�(T�{�I�V�w��fKˬ\�]���ݳ?Bcаݙ?�1������Gt��/t�s��H�I�4��@ �o�C��k5K�t�,ElXʤ��pG�r�>����%��E����j)D��&rþ�t�F<��]��EvER���5�g�� �"�n�����/�1?�ȊCͱ�ތPH����2�eC��c=��~����:��=P��DH/K2�e�{H��Y9'."�!�����8C *�u��*����@j-r�%�uoW�th.q(�	#�B�	e7B�*J�}�ʹ�h\><�� ��<E�kT�J���};K�׊�< ��z�+ #���~��v�K@�Ĵ�}�*U.|�w]�|��IT�p_�&�	���29B^" ��Xa�Y�����ؓ?F�_�#GU�i�9��G���&#�2���Lٌ���(�=	yr�/5`�ӊ�<��c;~�ַh�o�\Κѐ�oW�ʴ��G����X�l6�_�����%��Yp�;�t�s�����舝
�S�@�J�=��BS���n;��S���M�	��	Ћ�k��v��9[h���`}=p;�n{ȹ�{K�M�N���k��U��}c�=l�=]-|��\�����Vs�ۡ�	�hӾ>x�  �zC����ꂦ'K��*�09lu��ؤ{P��&5��1WtJ�gQ����1�]�� ���"��i�i��Ӧ��}���ɞg����}�M9 4� �e��aT�ͼ:E ������"����6��^N|fbE<K��4tb]'�+#��=������ >���m��w�i�#R(��ɏ+"��	�A��[`}ɑ9�Pu����WCE��FA%�bχ���눅0��+�8�tL"ܝ���x��t�k�ᦠ{�tE��0;�4Oѡ�@F���M�d�W�+SӍd0ė�ߙ$X��3�o�\qL��;`���Y2��-��<ʊ)�5���x[���H(�~�������e�1�4�2�sIW"J��j�V��p��!���["�K# &Lr��s��w�Gƍ[�:�(6�gƍ}rf�h�I.*���0U,������4~�2�bo���Ub��6��@.J��$fQ"{ဘ�^8܂ҙ{'Nb�g�Z��;�{Z���ǲՕ�������U1ФԦ����p-|����|��w��Ę}n�.;c�㥺н�YWGk�!C,Ŝ���訳�%D�<�^����)$�Bn�;��-~�"����9q�+5����� �u����?���U:��9��-l�R�CO��ۯ ��{u�qd{E����;b5&)�IK�P�"K&y��@�u�"��e8�dn�������3w��^2�DoX��s�|l��|�ai���W��*좹��������=���	ڀ������j7S~��W�4�5��ШY�h֚E�J�� e�)<�g�Т}�=pt�L�Y%��
dZ�tBt��_�s�3M)�r���s�`t'�uW�`���&!����i?rG]�����h��dX�OM(\�9`O�A;CNwq��
tR�,HjG@�s9'���g��-<���`jt�$��G�t�`�D�K4�Yl��y�B�	�.Շ�},�3I!YP�#�%V�r��R�W��5y����O��k�Ixׂ�X�;���=��>�9���Ut�<w�en1<S���t^;X��u�
�k�
W�H�[�'ͺ�x@	0�>�:��֟�|v0��ʾ#Ul�K]���γ%���c�x���ѯ��wHm���M5�����&#�^.��F
�I�B���u�I��~���ކ=��G����BN���4�Kӡxu�-~��l����ś���8��B&Y@��
�Y�(�5��ڿ��\d)w��7�9��l�	O'g4��p�������nh�/���GFk��^���F�I���{-)
�������5t䜣��_�_�h�R�~�N*a
$��y��{�6#���2��=�Q�i���i�mƾ����<v��bJ.e��q���w���R��z���VIE��T��PU���AO|B�D�>�&p,���ܗW�JO�o�{v\�YvɑC5�]�Y��9���]s�����c��b4U �� ?
���[������Ҟ2z���{G � 
߿b8�E�#�o~]i�m�̽�
����x��Ɋ�w�LH?���LPg����1��>r�#�>�"�F��|��q��nm�p���Yٓ��t�&oq�6��*�eR���BJ�岾��L�[���6��t��� .�r�Bq���WU���ɠ8�~�cP����a��{d�y��#C+T�+P�d�3�oW��ͩ]�Jq�X�"�S{%��ZG�~�@����~�)��r)Kpݔb庙L+�4���;�n����ݾ�\�cT��h�uǹ��3�Y5ʣ��x��'C�E�A������y3�HV��fs�P���}+*YTw��+�Pa�+0�������
LW��&���ʊy^�,Y@��k�M�W)i�A�;�B���. �x}������b�tPڐ��,dl�5�׽�+箏�2YL�:���#�ǉ��OS��l@�T�j��\�4�4�pp����8Y���9Mt�6Z;��k���%G	�?��x���N�m� -ί�%w�F���N��y]�랼�w��v �z� g�����c�lk����>:t{>������d	��ˇ�&�� I���q\�����D���\���!2��%���e����4q�4p�L�y��|rU���jR��dWF���b�Fo���xIJg������>�c��<D�n��s���~��C!�2՗��b�V�̮�����r�YJh[>8K�KP��tت��x߅7���k�[���ͩz��Iw�@�_�F)- ���(}{���d��Sie`���a����5r#�H�{�z�1��H�[]�����hQ��1�����9/�   �Ê�֯b3'Z�r.���W$�P�����+a�̅�R�U���vm�y�B)���pM�h�ٽ��x�X���!�9�é�>�̟�i�S:��e�#e�y��-�c�.�qE��a�rD��L�b$S��>#�h2���g����:/%��h�A�K[m�}��q���R
B0��6jΖq!�f���dȢ����HݠS*��2g�IW��tz�.l�5ّG�G+ �>��a9nΊ���		o�7I�,�e��~�d���f6�Sa{5cIWWnz5(X[�\/��7Y���?�|�1&��+��<���@��눢����v.�B���f[���PX����!��-c����h<5k�f.o���7�A�&�I��(ȤͲ�D�ms�Թ�"�d�V��M���6��鹞��,��2䲼ɐ��u�֐�;��<߂��_�~p��K�P�(F�=8��@Z0@��N�K���>�	s��@S������.S�^�Fx�UF�D���7�Y^<�UHWN�6���x�KT�XR���â\|V�[׌�[��\���dA�%��N�^/�p�2,*�W|��4��.G�;��!E����lZM�'W�qq�3��h.����D�WNꇘ�[C"Á��82�p�Fo�5#,}kl
�@�ok&�F������2���y�v:_�#l?N�T�}3ᮨEl�Y����/�����g���k�T�W�k�@u�����D����h;���J)2���7b�t)iЦ]G�v�/ĤX���[��&�,-����:s\��2�.в�b����	�`�
�m��m��4ҵq�m�mZ����_h	��|r2�
�m@�C��	�^66x�4i	V4<c$&��j�I�]®`5�gǁ�е*�*��Zc�$�������Ѕ!D��?�;o���ڎ\��S����OT,�;_ؙH�U\�Y��@�?"���K4U[8��h�9g������$����4��_5.�&�>�̷h��g¹���BΣ-���'���::���>^���pt���x���F��:�]E۝1fdgӵ�R,�,$a���j�P�w��;]�PAo7J��~�Ж�7��`��U0��0�`�/t�~�D�
U�y�9h`�0�餖1#�� #�9ΛEtGPd%u��?�$Ö$�A諁�]�B��l���Tc��U�B\����RI�﵀�u�e�V��4��@���Bw����*�4���M7�}���j��c���Sa�B�
��G��@I<��`N:v�rf�N���qW��ߖ��.��ϙ,�Ӵb:A���Su�u�]l�Ĝ��D�s.&�i�Şĳ6�Ժ���D;Z\�y{i���n�3͟��@FN�T����Wc!R�+�S`X�l��h�
��dWv���e �@-U�;;���aJL�Kѹ��1���`��������1���yO����N����o�lm�\�������F}2�=ɻ:�����K��א)��?�%��.Ċ�7���i��~#�RX8 ��P:�7����w�hбZޘ��̮^6=�m��}�K����z�.��e톑��>����K�_
��xù>���ݬ��X�F�D��Bw������Q��|��������R
�Q�)L��%yA�hg�����̲�M��F�)�`Nd��r��[E`:$菄<���pV��'l���4fi[ѐ�Kl�}�ym��9���y�Ym�w���g��c	�o(�FGH��Ϯ	��g3���}��ܧ_��/w�{�~���}�Tؿ�wW��G��2"Zij�Yf�+n�`��_�����,���{rN�߿-y$�'�B�ܨ��2Y������Z̉S��e���q��-��qX�f�A�[��O>B�7�K��U~�+�	 X�XqvBf��<�f��s��
�4�,��n]o��\&����(��_z����7��
������ʴӝ�&���B�7���`l�W�Y�����|���	�Q��~!Ql���t���nf�.�D�d��Z>�Γ�$իOKE7�pݢ�z��2�	�T ��I;��կ� �  ]w�n�y>]���Y�
�B��8� �3���$���Fj���W��)����NW	�x�L_K�oA�V�n l��Y�(��9<���i@������KNj�SoA}d�u���P)]��5��t�ǿ��k�j���i�g�W��Z1-���&e��g|x��;��x���Le�>߱q����~��0�UPf�⨝3�(��ZV
�D���t��n��ܥ���<��
�:Ĳ�CXy�$ѳ%2�.c[��,�|Y��%�G��ї[t�۽{:;��M�B�%�L��,����X1�i/�����\��b�����S�!5���']dtF�.���f��L�i�m���E�ֻ+01F�)��Z�\�� #ts���t+-1���5�ȀC��S�4q�E��{Z8Kq�`���6�+�'W��D�ն�*��e�MK���޾3�̣}��c��C�˜	��h���B;�� MnriZ&H���� �����ΐ�C5Ai�$#||�v�-Cb�g��f*`�?F�]���O��:�}kzXK2��Mo�wp�2s�m��qS�1��x�u�FI��L��8h� mnDd�2}N�E�p��M��&���<��18����?W����-r�"�h��#Nkg|,�%�	U�6㞾�+or���EIP-d-	hy��]D�� "��h��O8�ua���.������ArD�[��h��j�d�uX��8p�}��}���+/��-?�"<������gU.!Á:��>�j=��2Q�~�����9���Ǽ6| '�n~J�`��#�zf�����������'��}!M_���,��{O��_���#{���@�[;����^�72�-�Ź��I�/Q��A���
0��[�����`�_��v���EڭbN���>������%_:��;���Z�H��� W��If�K�
�72�P�Hi(!b'�������?_��S�x��K�=u�gN{��C�,�����H�*w"���2p0@����2޽���[3�ol�J�:�7��ݑ/	ᝓq�o`��L��F٧K7���\�~�C8	7[�l���l��ݮ63O�S��i`>�'���F�͡1��,�pf�z���B~�kxwP��i2	oP��1�������T��8W#��wt��+e������|s��B�ߡe�����A/GWQ�l��6'�Y�~��Pt^Z�o�>��i�;�D��6��H�^���u�������A��-�������R�I���~�f�j���k�����)7G*�59��!+\fg��M�$Y_pZ�ͯ��k ��Εs$�ۗr�rԾmtj.|��#�߰�$9��j[{�'v�-�Ƌ�1�-E9� �7:�K�3d,|�}�����oH���00w�M�������X1�S�F;1с<�I�Щ"=����%+�U�yc�Μ�w� �@߰y�Wr��c�q�S��πҎLQd��� r��/U{�`��H^2��:XHo}V�������F29��Or�Qg�^���Г����?X�>�<K���������s      d      x������ � �      c      x������ � �      [      x������ � �      i      x������ � �      j   7   x�3�t�K�OI-�2��M-J�H�K�,r�9=��R�J�*��K�J�b1z\\\ �#�      _   7  x��XM��=s~��I�ގe[�|,Q�D�"�$���S�_�Gyz\R{��O,���W����$���K�i��*i������N4C'���V[s����텺y����}�R(�H*oI6>%�C�co�c�A��FEi��*h�J��dkb
�����a�E�m��T8��!\R�����c�[d4�}�a�w98��؈sw��.�0�M3c!|0�� �H��߰V84�6�Ұ<��L�/q}�N.7d%�Aˆ.����c2�i��p������y`y.J1NA�l�Ń��2��^�#%{M6�����R���YY���y�9���䋌dY��^MD����q��-2}�0��������<"��9Y�"Pj�t����<9�e�+�yf)�i:_�< �3D�y��L��Қwr��N�,O�P���4��,�="����_��vq��d��=f���uu֮}NӅ-mEҪw����� /#���˃V	��t��'�u'Foo)P�*�ۋ֣#�gʻ��}X6,�� s�7ZqK% re>=����Q��z�%x��ҍ���!ؕ줗��7�8d��U��Bէ~���$$4��b��sP����3 �o�'C�~�Rw�p�ߋ���J	�ms]��rq��5[C��`\�x��Z(r������O�O b/��EYN��i�����2�n��N�լ,��$�H���jCH�}��L�r�tyr��O����������L1j7��39�q]�h���
^a��������G;��q@�|�a��e�M.���ϫZ�Ss{���Q��5+�A�4��8�W
�pVB��~�\T����󎢤H��`��Q�C�����,{�v֧�l�Q�8�1L�t��9A��!W	%`)=T�����/�^��k��� �95p��������x��V��4��������>�$�Dό��ډx�A%�7���"O�_~aK���0[es�1�ҝR�=�� j�=����Yu\� -o�9��z�iY��8c�>R�խ!C����nk��<k�`9�Y��V��M��_�)��1�M��E^��>���t�*���"����ݺ̩U J���3������sޞ0D]��l(�-'��F'��}�R�>�A����+���4K�D���Oܫc!ξw/և�A���?��.
VW�⌳悆I]�3�f�q�V����S�h%u9_�O�s�9Ӈ&��00(�ܪDP�Y������%��[z��e<!�ݻq����TYou��Ϛ�}�x1������3Y;Tl�����d� �8%��q&l�ΫY|~�؛r!�~^��\�9ei�m�����A $n�E�l�٦�EzL`��<�>�(̯����	
<;����էP��Y��:���;7b`ĴؾJ�$;��7�]y�gZ^�QIP���@�P�<({�B�%��㒯V�+�ū�����x�V9N��:�X5h���L=��=�u����-��8� �l󫌙��l��D�3����:`�7t¯���F�vsjD
��Hף��P��r3���z�&Kv���t�ә�z-i���>��'r�K�	ff����Tܳ��~�G��WK����,�^���������-O��������ܼz�U��>#�	��Ժ<��+����\AAɝ#�L�^'�
���0���-�6�G&o�����^I�]Nڟm�� ����g���;,l��[|G��Q&���銇| ��JrL�8�㘥�|��W3���<�r��Q|�\� ����,�
��a쥆�� su�%u�"����������ۗ/_�GR�      ]   �  x�u��n�0�ϫ��E� N� .�\2Q��I����we�4, ��o8�YJ��S�n�ѵc9w�ŕe�R��	�8P����ԍ�=c�sma�f���v�cn�3����
�L��귯Q^�>��	c���2|���aE��*�7+��/e#{ؔ��T�������L���W��FV
	c~O��'<7�7�>�k��s�g�I�������'�r���
�ٕ�������X��e5��΁Bߧܵ�.c�Wy΄���1��ĩ����5Z���m�	C��v���*.\"���W��"2����cXSإ�*R>mL-yF�f�K������W<�L���Ou�B��Z�0��a�\v��!�J�ͽ�ُ�s<ݼ�5M���     