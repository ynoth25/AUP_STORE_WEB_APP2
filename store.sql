PGDMP                         w            postgres    10.7    10.7 c    t           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    on_hand bigint
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
    public       postgres    false    207   �t       o          0    41225    course 
   TABLE DATA               ,   COPY public.course (id, course) FROM stdin;
    public       postgres    false    216   u       p          0    41230 
   department 
   TABLE DATA               4   COPY public.department (id, department) FROM stdin;
    public       postgres    false    217   9u       q          0    41250 	   dormitory 
   TABLE DATA               <   COPY public.dormitory (id, dorm_id, dormintory) FROM stdin;
    public       postgres    false    218   lu       l          0    41137    dtr 
   TABLE DATA               P   COPY public.dtr (id, rf_id, timein, timeout, transact_date, period) FROM stdin;
    public       postgres    false    213   �u       a          0    16462 	   inventory 
   TABLE DATA               �   COPY public.inventory (inventory_id, product_code, physical_count, date_counted, counted_by, inventory_tag, location) FROM stdin;
    public       postgres    false    202   �x       n          0    41212    location 
   TABLE DATA               ,   COPY public.location (id, area) FROM stdin;
    public       postgres    false    215   �x       ^          0    16416    product 
   TABLE DATA               q   COPY public.product (product_code, description, uom, unit_cost, selling_price, supplier_id, on_hand) FROM stdin;
    public       postgres    false    199   Uy       d          0    16492    purchase_order 
   TABLE DATA               `   COPY public.purchase_order (supplier_id, product_code, po_quantity, po_by, po_date) FROM stdin;
    public       postgres    false    205   P      c          0    16478 	   receiving 
   TABLE DATA               �   COPY public.receiving (recieving_id, invoice_number, supplier_id, product_code, qty_received, date_received, received_by) FROM stdin;
    public       postgres    false    204   m      [          0    16393    req_prod_encode 
   TABLE DATA               [   COPY public.req_prod_encode (prod_code, prod_desc, physical_count, request_by) FROM stdin;
    public       postgres    false    196   �      i          0    16537    return 
   TABLE DATA               n   COPY public.return (return_id, product_code, supplier_id, return_qty, returned_by, date_returned) FROM stdin;
    public       postgres    false    210   �      j          0    32928    role 
   TABLE DATA               (   COPY public.role (id, role) FROM stdin;
    public       postgres    false    211   �      _          0    16421    supplier 
   TABLE DATA               W   COPY public.supplier (supplier_id, supplier_name, contact, address, email) FROM stdin;
    public       postgres    false    200         ]          0    16410    users 
   TABLE DATA               �   COPY public.users (rf_id, username, password, picture, role, deleted, user_id, course, department, required_hours, dormitory, units, is_caf, rate) FROM stdin;
    public       postgres    false    198   }      �           0    0    consignment_consignment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.consignment_consignment_id_seq', 1, false);
            public       postgres    false    206            �           0    0 
   dtr_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dtr_id_seq', 142, true);
            public       postgres    false    212            �           0    0    inventory_inventory_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 36, true);
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
�p������ 0�      p   #   x�3�ttvt�tT�p���2�.�/J����� WA      q   B   x�3�vq��50�tuq�S�p���24J�y���e����}B���B>��A\1z\\\ ���      l   �  x�m��q� F�w{	��E�
�W�$og�g�I�҇�xa�8'�l,̗�%5� �����o��\PT�ʷ�a�t�v�q�S�+���ӑ���aHE��P�t���ˑČL�7�����ɏ�5U�j�v�B�N��^�I��P8���������X;���`s�%q�(��h�K��Jb�D!)O��D�ԶS2	�$�S�.�K�D�)�SNE�"/��RQ��!_��S�.�G�2����@�`2NV.��5G���c��!���E(�L^C.dy�L�k����){� �Ķ��(#�){*�w�pu��ND<U� �RFzj+��i��}LYɆ���&�O�ۛ�����[���N�&̞g�k�y��Cn�B�!K�}<��&V%�mK�Z �tIk:T����òG��5���)K��x�K.�$�`w���O����t���ŭ��}�k�oa�r��){��b�ڱ�%x�=_D��+)���s���C�0�?d�]"ق��F��m�㥄����C�]n~�M
Ŷ�i<�O�o�ܒ�I0�+����{��K����p�^���G�����+2p�(�K�E��N�*�����h}�ڊ2x� �#yN���z�K�U��;k��b�ş�6�[��h^W�S���(@�el�m�"�Df����'�?�m�oߟ�&�}&��f�����Ο���~��#�      a   Z   x�u�;
�0E�zf/����on�NRX	q�`� ���=��bf���,#�fysIЊ ���Z�۫!�T�B�Y��*��E�B�I���~*�"�      n   K   x�3�.-(��L-�2�.�O�.����2�tN�+IM��2�t��IQ��q���e&�rr��'�����qqq !�R      ^      x��}[��ʮ�3�+��k��U��m0�l�1x.�;�����0R��(q��{���U�K�$/J]?�i|���w�p.�����(
�Jb�GE���gy,S=������.�W�t�`���YfX�B�LSdM��
vݩ[��8���-cx��Ӟ�i�Rz[���e�^�cMkRʁ��̢(��4�~4����ô��=�|WY�W�h��aI3ˢ��9��� �4}�H�8B���q�5�a܇��b���.��|E�DY�q32ՇCX_.}6{��ϡ=LaZ$�⸊��$����<�RIeqU��4t�p��C7�0�8�5,��2	��r�H3&q��ߞC}���^�As�qҜV��*���ٍ�V�z�[����O�h��+�a�Y.��wͳ���Y�'+�q\��Ks��9�,����[같��+3�����'�=��ͶsX�46��eڇ��w����=�aV��>��L�y�{8�C8��}}jgx�i��(:�*�M��`Ya�m߭b��X�;|�����T� |s^�ovx�B� �->�צ��ȥ82i������ 9֗��K'5��CK�+�3`LK�/�=X$�op��pw};���y�S�@���i�W��d��eY�D����~���z	�v��˼
F[���I.y��*�`�Nᮞ`�����y�!l
�n��+wLUs�Q��v���2.5Ȥ��]fx9MY��V��+/6�I�2�e�	��)\F-/u7,�|�Ogq�PZh9�8�,ˣ�Ri����w���*�}�g��H	�W��bR�*���۹��!��=J��=����]�i�<N�:�g�+Hޛ/4r"�m����2��vH����yw>уJ�
�3�.A"K�>�97��p�n��k+��|7�ɂO8��v��pZ��f��hi_�\_���x�yЌH�]_��f�X�EQ�5��\$�c����b��G���gN�CZ=�x��i5�3��
n�.�sןB���&�*:��%�+�\�����{���*���?��7������/c��xG�E�_�^-=�
v��p�K;���y�����$�]���=�;4�tk�<�M�0�n���s7��!�f���q�%��d�'�7
j�g@Oh�h���U3!������yn"GQ:���l�S⢌+9՟�,����gP�p���1G"�LK}��|l�L���_���"�4���A���{s�ß`�;g1AB����VO��tS�R�����D�fK"���Sw�!�����*}�2�Hpy�����'��C$2@�)i��=hIJ�D	����}­5.-��*�K-0��魩��]?�KW(���̛�v���&Y0�f8�"�í�DR���p�\j����.a���|�j�d�"-��λ.�#_Sf/�YM��wM�7+褻�Ŝjj~��_I|LKx�a{��~p��D�R���öA��<ڻǜӿ!�Aj�����l_�#>���\����
�(<@q`mp�H�
��i0x��f�$z�EDO"�%�X%�ސ���"%����<������ ��|�Ñ����	,��2i�������&U��[j=�=ݎ�|xt�F}j$�^�4�a���D�%-@U�q����+tO�b��$��-�(��y��B����S!�2,�xMj&�0$�S#|2!{�d%��iہ� ���vƔji��"�`+,opn'VPʔ��hZY������Ȣ���R%���|���>����
�z�^���`o5ڽ�d��ݏ��*s�'��`���sQƬ����+u��'8X���&Ɲ��'*�JxЊ���X`�<�I~�]h�aj�-�Ȯ��Q`���*%m*A�3HA��G����-��4z� `�2y�n�틔�Cn)wp�����w,���+�,�e�Ż(1�p*�l����G{V��$a��UZm�9�pa�:c܍����v�qF��-bX�3���<e_��Tpقj�Lݥ�Ja���;0$k�쒈"���(*@3 ˫�������$[��������1d��j,�cn(|�=��>��w|i��5J�!.��߼��� R���λ��iXزb�E�/�ì��;��t��n�w�=��5;;[IE�T ���v���1@�N&v�]Ӛ��.���)��A�uNY�:�`�z�y����
U�fw�r��1���		�\��2`�bz��X���p��h`	~��Re����9zWV�
UˏNةs�q��ыuY�DS�VXz���.���9�C;�L"�;�X��r���o��q�̆cwU�Vʺa�f��nc�ڛA�]�Ե�9vpt�q�+Ai>�P!@��7 O���85��z�Ab���G��L��~}��}}�݃�<Q{-S-�n��jvd=�(��&��U�nW�O���L>4%�k�}�1��rsl�:��;�]ƾ�ꕹ���������z���t�'��g�Y�F�N�kY�Ē�n�`=t��3�xC����?;�5i@�Y/��-��'U�86˵�+�����"��B�/��+���y�7���u��q��X�Er��z_�gt���_��	?�lҳz"g%6+�����Yv�T��ܞO�9���qA�=��q�i��J�����E�q�������+Ft������h|}ǖ�r��#J3�3�7й���Q���}�Z��ryh���,����̨���Է�F�*k�9*h)�v*U"UX"#혵ט)�v+�<��҂�Q�p-|�詠���#�
qL��xd;��(1:n,�:�r��t5�}���F���w��`�ȩLRMx���	�����ؽ��;|{��r�5���O2�P_�j0��Ϥ4t���G���T�4�x����̺��K#A�~tm>-�����{k���L�a[[\b��T����o��`���e���)��"�q�tux�mQ*	3$l�a �2�{�4�Hޣ3�؂�~��W9�(��};�k�D�M.骕�����a���
�`�t� ���&O���2~\��t��R���W���&�ڈV�Lo���m؏���s���Հu��7�����8��>�;�\��� +��cK�"�6v��7ڌ\��t��4�~0C\Ib�n3,�N�u�}��;����>:��╡a��!W+����d%iX�po�R�g+����0�S�y-�mF�$�%2��էYa��چ$��*c�Ȅ`�wM~�o?��pX�i��5� ��,Ͼ����+9��M`�k��Fw�5�x��0&T��0��wT�P(�A�3�Sߝ��c��<�ǔ09Z�����HG��+@g�o���c�Y���փg�ѭ6���3�p*rÅ�\��L�������@h����lB$r��93��jg���4l�k׻������-4-`�/��2����Â���Ҡ֭iUp�G�X��K���7�����@�*`&>n��dC������1rC�	ZxA3�M>�V�޼Cr傫����ґ�niᒺw���5n���{�˿�V�8 ��K�Ѓa��a{�S���=�4�ŀ>א��}.�b�2Z��h�>��2J9<����Y웓�@E�i��d��y)�����p�U����wd�Z��Cg�<�y1�R�ek�'y�Ӎ�^UA9��,�.����]��������0XI��}��+��cM�_�x�iO���Ɠ����=���gǎY}�M�d|g��y)�R�8�k��C�%�,���}`#N���Jf�LE���-J��;�Yd�rD����Wnc~,�����W<�Eo�6q`ҝ�X�S@�si��r�0~���|�2rw�5����U
B�a�V��@���q"ߥc>-~9*4"EK������rW�ʚ�3���~�;���%-���!_mm�Ӓ9y�DZ��Fw}�	�Xk��0��s���RdRg�K:��S>UEBo�i��0Q*&չ���q<u�/&��DhF��eCN�Ng4�5h4S�6���J��n�N����e��y�˺aca��j��@��S�9<t    בf�~�����17O{��cr�r(U`��̧n��Y28�^��	��T���UD�\o�yr�
Jq�=�k���8�@��a0�|з����`��yȿzϞ%z0��\f�2yL�NƜ�)^�����y�H��ɓ`�`�r������O]�2q���g��K�`>�(@����g��w�Q{��T
b�\��G�;К�q:�L\�b_���ݔVA���pG|�ڽ�97>��!�u�/��L��Z�7��̋X��	,SfP���s�9j�ĴON9mA~?��|W4��3Dؙ�`5nt��X�[z�?Z����j�u#��.�-�}Oj�В.��>�����2�
~���y�F�� �\s:
�9L0�º'=���W�Qڅo�ͩ79I����z�=�Ϯ<J!k?up��a�M���laqˠ8^��k��_��8	�q�����u/�	���5�1-k�Q���9Ʀ��4+>���	:������pD��'MZ���w�xj���K�����cBK���n�.h�5�&ً\��9F��o`M����8�V�����ot,)��ԏ�YR+I����CAl-�69�w78���}��p;g��FS.b�,!=^R�!���g���j�P�q��a�H��T*�-"��%$�<��~�3�\_g��/梐������Ø+F����K���QI�dc0g�4�9�p*e�跐��ޒJ��A+	�A��Sf�?ލz�k�����z߈-d�*�w|E����3���VH���'��ڼr�$�A{�N�j�±�$��=	N�$��b�@��&��
X�5����6�!j�k�$�F�L�6�,I�ޥtr,��b2ǚ4�4�����I��뗉�I����/��I�[��Vrt�R�>�\NQL#�4�7i�m��n%���?��''����
�+�Lᏼr<�ʡC]3�6�a��Eѽ�@_6v������ºkJ���Y���	��v	Ϙ_�7���ai1be�O�f�������c#/,�u�:1�22���\f$��,ØB�ÿA:km��l��/k$����+j�X�G�c�֗������*���G0�zb)�,�=��>�,�5Z���8@;�T]-.�"r�I�#]it�T�a|���Hc{�)�� 0���h����I�c�|*�kk1qr=k�们�HLJ�~��b�����I�$�Mn|,�\��Fs����u�� /_��By4��7��{PR�g�,�Kr��g�q)�(��h�v�����ϊ}J�[i2�1�����<��C�H��ۧ��<��}|�>>sY��ҧ}��g�>���C��ݱЖ]#!N��~^7��@��m�[�EGe�:������H����P
� ځ�ᮓֱ/
���.���;MK��!x���;[�R�i���/��e8��@�I��^��uXtC&�%�`#1��\[쿧 �9.����K��[��)JI�dg��hK������2��G�'h�%ȹ����Z&,ڳɝen(U0�����N�˼��Os����{%|~���F�cVV	5�t��q5�헮g����)����?0���pNm�^�k��ۤ�8�_�>�	�p�西��ty�l�)�v짲� 3����*���Tf���-�3h��Jo�(���n�
dڗ�P;9�7,�tv�sT%�����`UT�`½N�zR�9�s[�}~Y#A�<9wU��ftu���OiBR�A�w�l2����x�u���-����PT�W�0�qs	TF�g�����`
��]��|3:��R�f��mSh�r��&�+;�Cǋ΢F��4J�������Q�Q�!���־ƺs0���$qs֗cg��r�0�P��\phA�Z6����,�a�	��罿���,�b{���iDhuy�/1���39�<��1�l�g3��Bx�K���rJ%q�'V�4��f��Co����5L���'��N-(4��o�Ԥ"���:LL��e��S�0����0i���v�������l�ঘ�
�0Ơ���>��Ɋ�F-�H��E��p�;ܿ���k��y���>�fK�l�8���#��)��6�_r����|��ǣ�k��&,4_��Tc_�`\q�O��~(.���4��� �� �[�$�78kp��8�-�r"��4�ئ�k=C	=�g����%��	ׄ���*��2SY�A�������p��t�Jܑ���݉�P��3BKjO�Y���J��@�t%&�a��#K��%M�Fq��/hL���:3�� "����̆4}d%ǔt��ɘ��W���S��HXUY�STA_�)��pAc�Z#R� �:-l�����j���֥���>]�%,�Y�X���M���I�aК���������2�r:���[���	+&�*W#�X�������zv_P�"�Y���*M�+-�П	]��K��  �Su���
@�N�qo��U�l6�����(�D�li9�Y�I�8�n�J.Zŉ~���-=g�l�a�n%<&L�o��8q�Rl�ׂP=�+�-q�Ȃ�)���ĹC,m�47�
�MEg�PXt)��HS�s��
��Q�Y��H���w�옡r���ý�i���S�/eCg�X���Yз�� ��c��r��8i?�.[��9�1y�i�zõ]�c:39���(�.��0��\�&畆Z��p;SUk�)֮jW���'"-� nx����zB~&f�"b��|<�`'b����a�s��Z�*Lq\��zcw��8P��~�<M|[�!L$�'� u,l���b�;8�FN}Q n��n<�C��_�~��I�7W������z�ma0͜�ni���o��,M!�R����gNH!3EX�:u3|���4��*�,�).�%6PZ*?�F���7y����=o������; �e��(I���U+� ��/�����+������H�.ɓ~�'K�yJɓ}�����,sUƏR����zu��9��s�(8����_�0&�3��
���CI���[�xy�[�4�p@������"zu�A�6���in.�k(Q��\�TUt�x�?	ت�M9�S�w��2��ڱt�M�7ɪ�)��RcF�jS����冦Y|r$��Y����Rn��ߓµ��L�:ʐ�Ę�2.����Cݿ7d�h�G�r�J���l�+�Ҭ��qmJ�0�䓨Z����E�KM�V}� ��!��`*�7;[�N��A�@������/ ��tx��,��D�a+��yg0�~ww�N��n�ŝ��,*]������Ϣ*����A�2����Հ�fއN�!�DW�ĝƟ �Ģ�t����I��$��;FYd�ypH��I�qf����(��\�á��P��u�Y�K��g�MBE���Թ�R��?W��0�;,D���4�� .���G�� �����]��H	z/g*)���<�j~������T:g��d��\[ަ�C��7n���e������@�G�|~��7�usF�dY=8��2S`A�;�>d!�/Ƒ)��Y���E�	�X@�e9�d��U��5��\�}��H��5#'n\�c��Զ�S��_�%��x���U�7��<���ӥ4��z��ޝ,1�u�A'�y�i�&I $`ٸ�Ƌ��!p!6br|}ː�s��?>�`��?z|�Ihs��0����5��nɒ
ӱ5(�a\�6��Kb3�-MqFO2~-C�0���u~H'p�f,��n@�1"�μS:aia���0E씓W�ٙ�a����x�K�t1���E�3ʅ�+C�*ب�?:	��>�U-Ҙ��~Is�{<���GD}h��\�YZ�<�f�����$&��،��94lt_��}tŏ>��9/&�`Q_��?�t{��Y,hw��k�2-���q�Ns�ȅ�Ƒn�`=4N���f��j�h|�ѥ���LScf�(q�Xp�t��mp�ic�XC�bF�Q��ѥ3�]��+M?�x7� ;L��:��Ϙ��Z���`㚽�r.�XX.����t��!�2�"���=�y����^)��"[O��    w�׷c�e�g��F�h\n�)L�p��Xe�@"�X���];�<Ū�n70��_C�e^y�W���S�HJ���h1�g�	��#�[�Ǝ8g}s
	�F� ��1G
~�P��1)} Mz���Z&�fw	�\{�v
���=���cs���:c�q�Mp�)��KN,�gt�r�?xQ�\����%�w���a����}�V[��a�=اĠ3�Q��SLL�����y�/c?������3%���k?�`����W�ֶ�?����d]��t�{|�ƫ���<7�}^���#��?�5� `����T���[����	���׿P�������mY��Aݜ/�t����� :����y,��|���X�	��Q�e�������:�s|�Q��[:GI��@Lo�Y�'��!Q8#^�����G�GJC��R8z�0��	�2O�t��kA�5�'36\i�_�X�{�j}��C��uB��)N\��:x@9�k]_K�ك��w���,+���񶗨��T̝t܃��-㭵ʗ�C�Ysy����~�3��0��1'z�w�x��a���yU�.vm��]�����!B����AnD�8O��d�qb���73���qљ/�҇Y��^+*t��X��pt��8���},v�8V�Q���aU�=�i�`��s0L��+��<SdF�(P�`����I7�	�(z��{��b�u��M<���	�u@ud���,v�G)�k�a��z1M�Z��\.��K)j�G�yng=����p�5��(��Ʈ�_�fi[��X]��ժ�Α5aɴ2L+D0h�g��_4Wh$�d]�3������p�9���j)ɓ�[��F|��Ey����zn#�g�i���Z��Y/9"����Ξ �ۛ�x�I��������5> ��OG?�ȹ�A ��?O��R#�N��� ;G�}����M�e��N���4�(��{{�W
��<r�=�4���h+�+g�������+�����if��E��A��/��:��p&���y�9���E?����`�,��a�\1�S[3~I��<k&OL;<P�[���x����Bb/�+?_�l�Xxes�N([��b^��VV�҃AF���N6"���|/ep��:ɰ��	���s��m�J�%."{�A&�B��&���-|���d#�L��� �3tOw��=T:_���✓����x�#(���m �L{
;г;SH���j� ��2?�w�U�� �h8m�.yAM��8@��C�u���*u�Ń�4N��ޜ�#�)�<0���8���x���G�2o�@('�Aa
Q.��q3���`^_\6�o���5�h��o��L���]�y��cf�j!
���۽�Q�*s�}\<��U�I���E&��a�pG���|^��'��P�E��i�]X:�.3�.+�@�~h�t��е�U�ݍRQ�ܫ�]t��՚����K�w�\ @��%�{�R#�&e�q��N^�.�.y��@7����f��$��jXQC4a���P߹ԙܲ� @�M����%���?���ժ �RG^ź��bjY���c8�0��mM�s��������4��%���
����`W��ħ�k�܏હqfR6�5�nv����4���Y��MΆ�Q�2`} �P����DU�Ê�[/�KiO�vFM���AԹ�m����đ�����*	��{bf�H3=E"������ZΑ��Q���QG.l?� ETp��G��n8�A��L��-t�rrW`���:<����NPN��#SƬ{�%��i��%��[���^�g�1���8�,��j�����\��Ք�A.��b�]m5?-�{�ǭ��u��|7 Cv���0�l�c�j��$����]3Ocx�At��*i����".,BM�w$)���\D�ԂS��_��#�^l�ز�BY�3�6�=ލ'1�HSѨ��?���rhU�3X�"m��*Ї���(�p̗�p���$7�������t�h�4�W�r��_˵����>�ĥ�w��� ׿�p?�5 $~�U�,9��L�W�����6��
��B��u5���1-��UF�`҂��
��C7��rG�t|�����SɈd�!�ma��?�w�ft6��b���[��'�rũ�&���ĥ$�GV
Yk���yw�,�l�P�f:�A_�r�a��3�k�qn#a寣�:���S��F��w�t�.�E�۹r�o�X
��v�AG����w�$���?~�F��!_�"zL���ҴOu��P��.#���њ�Ef���V��K�W�>�ly!^��x�����4n6�;�)a'.�X���X�U~�:[<��u���4��E�t�j�[$�0v=�u��j��78�27lf5,�r5n���ޜ�N��&Ҏ�u���eK%#��8�B�Ib��a5J�okG��	3���>����ߓ����J��.!�bf�t���8�kgs��@�Y���}�ц���̣3�Y�r�3��̭w��O7��Ȋ ��7a;������\���]C��;�*V8r�2���z�Nև�h!��_�u�&7|ġ��s�M�4fL��L彟�nn��A$��99˹����"�B�����VL�ZL�
��Q��@6��6�Y�L&)Ԥ���˜��"�E�H��D:�+�����δ��Z��G%!5��C�~�+C��
�dtĿ�c���,����W������p�آPA�s��W&M�;,ⰹZ�ӄ�)
�fE�!��f�_
�j=bgL/�**��������b����Y"�`c�f����e$�N��^*@����<7r��գ�ɮwvK!	f1ޜ㨽��p��r�0JM�:zn�h
��c�i��
}V����#B�E�>P��M�$u�7�ĺ�;0,B�7��(�s4	!l�]�7�	g��6�E�������ڑ�g��YL\�TV�G7��\�vn�ZPϻY~�-��z��I�]?��_]ac��<�_aܿ�!�¸{�R�0�L����;��d����a����s��]�h��dF8AS{i��y�q���z���[�pE|�ɸ��������tv�у \{��š���6Q���d=?n:M�j�B��1=��+�U�pI�QbY5|��fc�d]D�䄥��d8�Kd�{&\;���!�X"y0KP&P�O�p�;r�e�`�#yq�ۣ�	���D�ӷD?�l�Vr3A��T����ˌ����R�K��L�R$���M�x��n[J������8J,G�}S�5�Ul���������ͣ��7�kFR�>YO�K���L���ܶ5o�T�}|��t�x��Kio)��^�*�)���ia4��M�f���<��)>/����z�=L�e���S�^�a�ǌl>L��[�
���ۖ��<�Č��&S{����J����xu�TR>�椹��O-(r�N�s3ba���XG�\,SU11h��H��.�T�ic��`x&��ׅ�������϶�^Ҵ�|`�1KS/6bE%�l]����pr�_X���`�;c̉�`���1���ԞbY|.u���݋t�E[��w��sj��&<y�N�G�(}O���Pb����#asX�?�e��1%�Of�:pTB�roM��5-�xI��u����]"-�)����+�^%��C���&��k��k�CX��K?;�j��SVk�3�r922.]�ஹ�nJ�J���Ѓ���j sS�E��
~[�%����֨����S}�Y�XQQ\�2@�^��1���{�'������0R��/����ͩ`y��i]���x���� t�R�=��E���[�|�3<�u���^��ۉ�[e<����V���[��W��&���=������|�
s2	��X�=R���x��Ɵ���6�Q����s}F\G����mZ�ؖ�m:t|vCw�Y}�m74j`�ԠR��L���n�*����`��
d=�!Q),���N��!b��G����[�آ�y��|%j�B��{;hԶa�ñ{Q�V��X`�&D{o�JeAw1x�}�b    ��.D#��6M����]�O��d,��Y�s�oC��f-q��E�gl9�b:�j�Qu�p�I9�����~��c���1	�n��ێ���
v��y��w��n���^�����0�0���z��1G���m�F�g���!�:J�*�L9�BE3�ǔ�*u��`���{
U�S��o�=�1@�&k ��W���n��	cFңs�&�&&�\B:U��0jh,#ˀ\�b�0���R�t�L_!��Ud��]�������Ay�P�,��xށ�?3|�()$ul���[�u��x߸N�!��K��4h2W���Z�Z-� 6�b����y���"�pܰ�
��\_->{R��[�M5�О��
0�Q7m��j�H<� �@7VǶ��e��g��:A��*܏���+��΂����<��E�B�;~~�D�8>�-@�#���$���W�m����i�@K77��G�9 �����="�q�Pnt���l��|,��8��޻��~���TkS�XX�WG��&�ICM���?yV�.o�RX�xW��~�.��&�&S��?V�`��V*lF:��:L�~r�!�h�D�U��R]�mb��ǩ�塑 � �ݖ��l�QP�>�Y~%Q�ǡNo�(B�HP�gs�EA&�����VCoNC�(�i�e�%k��+Xm2ґ�%��̮6�sHG�����ܗUӱ�1w�L�<~�Vb�+��c�Z?��)�zc��ό�]�I^�T��5^,`X{U9J�e0�7�W�����D������Gh������G�
��H�+7\����?�l��#�3���`�hL���b
�|��13��,�c3$�vQ�>�2�N���t��ԥOuG(: �-�E���J�9��z���ԑ�hmbƺ5�r��Z��+n���C�h'!i�tLM�������fCâ�Q�jX�����iU�d��ov��'�*&��k�_��}p�԰��nE�����`�!�z����X���Xr�br"�x��Dj�؇�8���Y�N{W�{���v�vn[bH"u0(��D�����
����t¿1�}�иR�U��˹d�Y/�N�/\�40��f�Pi~K8�ʓ^䛶���M��yM����ɇ�`��`��d�W�c�+�\>}˧ 9���?�]��������JZQ��=<���*"�g��#���:��%xf%xEݸSb����0��P[�W����&XA���~��G�D�{�Ό�BAX�-��/����)]۾�{�r�:wJw����i�<�Pi 9�-�~Ăd�)P/���
��l���5�Gi8�r�����ڵ$XS��d�Z�
��3��u�
�wЩ.잤�Ŵ���D�k�ӀX�H��!��fNZ3a%�]W�5�����'���R4��f"�O�]���d�\���h��lS�i�sjP�wڡv��*�u)�B��l���5�I)]j�ǜe[A��R�b�Ǻ��R�-�>;%�&G�����H�M���\�ء��5����3��d�+a�C
��)G�o8ٰ��^�F�\'����*[4}a�,p�Dc�z�K����Yjn���K^�<Z�[��@�aJ�V��*7�N�0��+���l�;o(�oߞׂ/��	?�@��k���i/�7:cU7�,������0]f�\�%6�؂�|����{`��g��aN�E�~�&�c�n"�=vhYD+/�j;� ������,�|�Mh���قO��/����P��9�������d��p�-�7���,�w�ډ����sSO|��Y霓R��ty\b��>��&����J����G�z�D.����k�UG_�3V��`��>��T
�CCΧĽ4�X��6�l�ϵY�&��M�$ؿ��8�f����l�r_Z�'�J��;���Fh����]�ᘻ7�v"�w�/_�o�����-g�rz�}\`�(��#�]E���
��^���c:P����0Z��t�l��꺭���{��Ҋ���B]rm�N</:Ø�O�f��@�����(㴇O|�B7w��ÃI�kƣ(��d�ń�]&�}�w���Γ��<��WS\2��?W��b*�n<�8���*�c�5F@��E��;��G'����c%�@ "a��\�6��p�.S�a���6?�smk�P!E5G��n*�����p������F�:ll{m��md.W����>4��������M3�<��sXX��簩(0���zn+!3�Ǽs�;Gq&@^����kJK)�%���SS�/A�ի�g.1������Q��,U|}�Zt������|\��|\��Ň��p<���NC�:��84��Մ�jFw���2�)�>.����C*�@��N��PeF��¼-�:���d�����9q�N���؟	�$�[p�{�8^rxqc5�|1!�xq��RK�/������#xԠT�Ϊ��e��&��{�����ưU�/�ܸ4%.0�KS{a��S}q\ep��I�_�[(BA��]����+��w��Q"P?�&a���或$DS*���ߟnL���y��|�����c�o��,���0d���\��>b��A�+�p�iJ*k@X��^o⅙C[��	�|[P����
r��#Y���t`���_��|0'���%z�!V��C2��C�\xvEm�ӥ|Sp��3�t�:{���M��!u9\ذ�#ݾ#[s=0��%۾D�x�eW�f�����(��d���Dn-�vO*�R�%]9`w�{�����cwjŨL��eIԒ�#��������CG/_�0����_��_��Rr�(�D�,2"e����9i��RY���š��O��BKu\��������$p�0A����zE1\ �L���\��-�:Ѱ=<�c��'�)��ܤ��n�PLc[n�)��dLSɵȅ�ԭ��oH�����
ָn��r﹩,u�R�ˈ!�2q݇��S�f�?��q�a�u�����W����ͺW���l�� +_�7]	��7yQ�e&�t7�v�������%�>��l�����Y�i�% �Z�({|�0���S^Q8o��.+(���է�Ǒ�M+��l%�IR��������L�7�w��L�S�B�a�[�i-�]%M[fY&,�qx|%�1�`jψ~3h�E:��ɭ5�mc#!��g׏і���B��o�Y�=8<��b���ջ;灾�+��T����<��	���*�5�Ӯ[���lk6��nG�b�:�z�#8:6#�>���Z��Km�I4U01��-z�W~:���;.��Rea���ry��cD�|H��X�|Y8�d��N�����"�^t4^�1n=�p{�4�l��ʨ�1��")lVFЏjD,>4`t`S��i�Ep�{j�A�v��_.��^2�[U|65(�3�k̾�,%�t[7�i^���,�n@Z؜�Q*�<t�\:����h#����i��8����cŻ�Y�IJ�����pm+��n�1�\Vȹ����A晜��$�X7-'gÖr2sؔ�8r�2�-��vI��+.vx�s��1U�q�{VBV>�˂.fKX��On���e��(KA)L�Ĥ���WA�tp� Ĵ��;��t_������4���gݷn����©��瀠K�8���t�M�]R��X_�&dw�SB0{0�;��O��\�o�ͅ�����<���ퟍ8n��������>�q�fb�=;�0�U�
ҡ��;䶥p�>�
������U."�<T�+H����;O���
x;��`�����uݏ���U�*YgT��!��פvB�o!s3K#�-p��^��8)Jwj��[�z��T�s=�Fh��zcRG�c��J*Z5☾[f^��/`���x�K���&�y;3�O�;���R���!gB_�����57�;��s���*v�303ǽ|�7��Yt}��B2-�SD�a�f�<]�2 ����gG#Eд	c�&��>��iz�n���\��dde?�qYu:w�UP_�p�}L�}@��Ê���g��&]�}�)'�g�`Mz�׃�z��6�������n�|��ɺe���    �M�-���Ҷ{wT�_����J_��83΢>cp��ME� ����ie��|`��9��I�e��u��?�r�Z�_Q�Yk2\�H˔=&� �M�x�I9V]��B����,]/
q���/9��T��"���ۚD_,A�0���ng_�H�7�Qj(�/���Əl��{�5~6Gn�9��{����6P��̞io��T�_!��3�(:�l*#$챫.~�vM�s�G�?�p�Ζ����ҁ�DXS��>����zv��]_V�ѫg*y����&CĤ�e��}��js�p��� S����eD��[���ϑ^g����Ds섢�^#Mנ�Jw3�v��G����>@��Ѧ���eQ�2������Rv��Q��?�b��DR`\��N����r�~��ƻ�CQ�d\9p�_*B�����[����#�d��!(��Ή�=/
�iAw᠋i������f�H�D8�� s�qc&��2�lܯ�O_Ļ���k[Ǖ!�N�2A��� ��P�56ޘ��$	����	b:A���a�%���)`��lE��hA�iJDi��ঠ�M>V����_e��A]�X/t�~#p�{�)��EY�Y���ÿ�~�>k��O�\�3�f!���H�Z"��*F)f^����*tM�Mw�g%y,��eL���4��L�n?���-�2���w�ux>����K�6Ne/���O,'\��kc�����-"�b���� ���v��v|��W�GD��3_���e�1��r�c�3��Ag�
�~2�Rs�?��<r���5����Dz#�^�BXO�T���0Uk�8�2��aނ��2x"����9�w�b����R��+t1�~���q����nN#V��`G��e�OD7֠~���v[����ܥk�įR`U�qn0��{V�uz�y!%!�J*Υ�y+����.ވj�?PU����>�QA�����9`;�)��a�b�p��K���xSgD��� s+���Rm�,_U<N��S�������z ���P��U���/=�&S�t��f�����R��y��-ĮW�R�fC,��� ����l1��E���PAw�\{��o���AC��!	g.��$̟�R]����]��|-�r{+,�u��B�[�}�	��U�/:�ˌ��@~�6�"uG�)�M�C'�&)$v^��u�єa̶�\�y*[ߑ��o�����jO��b�l0ĕ��pD��5r��U�r9v9���m�	�K 8���a}8��ՠƶ|��#2�4�ŰZ-�\��, }��"��88w���p�d>Kt#�"��X���/1p�_1��ikWv������I��@R�}-B޾�H�����K/����b��Aې�����&���1�w6:���,��U�Y��,�`^��A
+uW�K}�a���@)���8nM��U��q��T���/w[��Ѧ3W$*�����M"_��&����E"���*��m��YJ7;�@�1�x6�<���+~��KZy�q�ft�w�2��iZaͯe��ʗ=X���.�y�ut$q�|�
��ApbWq��;�i���:�_�]T�}��؎�X�2��ۗAa-�e2q>������c�u(mq�;Ma=�wd��N�b����D���L.��v�ʅ���(��\�uՇ5����2�l�[[d���s�V��)�ll����D{ۂ*�A��e���� ۻ�;0�4yx�8Hj��������3��r~�EY�cy��"�1��(����&|#zX�\�o�>�-s�۹�A�JQ��9� jq#r%��=/�T��yd�ul4�Z�-�fq9^:[L��\���2�����I�g?��G������-%��R��F�0��2��k�.}�q�X}��6֌����?ٜ9���������Ej �?V� �Ƃp� ��p�����dz�k �f ��s�M��ƻ���m��ѹ��H�[�N#�46��b�G���h��(�ӝ��mpr�7>l˔<�HdҰ�Y�L�μ�`Y>��R�0�g���2���e��\d����F�Ϩ�t/I8GG����b�L�v�\Q�sw�ru7h|�p6�e�����C�ϴ�)��}V2�m�0�ؒ^_�\ư��G.��3�d��O�\�㰺B���d�:��`+w}#��_dy��k�%����5;x�$��E�".����.4R�j�^��D�V�Ԉ��a�=��l��6G�Fѩz���+�uэ��YF{�ilL��?�/�� ���꒢��b�
��n��?���#L�¦��n�a����,��ʿQK�j�����͊FL0ڇǋ����ܡ�n�|H�?��������D�����)���	���7�c�5̸<t�Do���'c$Ht�z���e��:PF�ߜ�Y�dk	�����Q�tմ�#o���%��xU7��]V9l-�?���b��TzN7�d�T}d�O�5���I��,J�|�����X�XOg4�ѓs�GS,NG���|Q��A�����SfD�pS��x������S�'�d���n��K�������z)ipi�N:ࢰo���AÓZ�9��3}FiY��:��B��`@�#e��{&&��XƆ��6��K��ɼf�ʲ<^���d�?���4L�����;pp{���	�E��֒�M�)STXa�H1~/@���V�ЫM_��S�[�,Y����z�1��_��a���fWd��%,�1����.b꒗�?W�%�o�ΰ����0ៅY��6��d�hq���Mj[������m`R�K0�z)lˑu_�,%za�5�_��x���l+�\jL1�B���R,3&\��ܽlu�p��O����Nu?3�~���@��Z60�L=�2��Y3����U�2_����)<1���MQ?1���x�Fj4_l~�-�ar/��.�v��(U��2�T�Ȓg�8�eii$.� ������ի;(A����9�N:�ŕ	u��(	z�����M�Gn���s��3l����ks%�r�Fc�48�=�>�����J��P��K�x5�Ø�4�Dw���[1�8�Ԏz����{@�k��}Z�i�hC��N�q�ύ��cq�Zb�zǋ޶J�o�2u��y:b,`�b0q������Z$������;�e���6��Ç�����0h�8E��^i��m�y���[�����Of��c�)->�YA�8 #~�UYO�J�]f�\�(>�\�AA��A�{9�ٝ��-�r*�y�z��~����qhI�	���a�ĺ1��Q��� �6
*K����Fq'X�$ڲ�O��VQo��rYs�J*���|�?�A?���"mҨ�<D:9��ϥ�� �vt�c�h�E����	b�h�{��B��NꫦK��w����� U�{v�^Rl�`��܄���O^S{%a�Tw5���o2?٭p��3���"�^P?@���ҟ��ɭ�ଃ=��`��(��Z�����>�N�
�ߓ�&���L�>5��C;���$���m�PR��1��$���R����j� �nCD��!O\�Ϸ,n�V�W��#���b��7ۄ�XJP�m��~A�-ucK"&#O��nW�W�ܟ��Сs���T�� ���I?ug�}AO�Cþ"�)u5�_A$��s���4��a�Y�W������P�@��S�^������Y�$������#J�n�Z&��S�[�p�CY#�WRl��lg8T.�x���bx^LL�)��=S`���@n������>�QX����~�����t�tg�y�����p9�ZtuZ���x���T�k�p��aI�?�g�8[������g���x榌/_�� � �f��~�*6�Z�3(��Ý��T� q
DsO�E���ey�@�4��rTJ�aD�c�	g1�����Ӳ�W��e�1�:iK�Mi�o���@<
r>
L�Δ�t�|��:b����',�+��[@2yڡS��+�B��~|�_���oZV�%��-���Y}F�羽L��'��3���Ԟ�"ӻ0���XQ�<    hm�8������bi�ά�%6�Q���XB�S<q� PKO�>�]:f�Tة�ي)^͈��}��S�o~�n��8im��~h�D�{T�RCn��t���"
?6�}�Dl
x�S�I����Q9�tE8/Kl{M+��K��N����Ad�	�u�r���K��a�2�ƶ�h�p/���~{�p���~j0��E����r
��q��d=��[s�KtSE���Łh���y,��T�{ ā��i���mp��g�ٓ�hl��/D�p��R�EC�j�c���ծ��/,�s�:�GY��2x-�՜�J�)�1{��T�f^<j����4�XTӰp��O�Qm-���ZI^��1ί�T��a��������E��O'��l�D)�W;*Dɟa��N��=��*�A}L��P��)R�ZJ,Ƥ2��mT��B �[�;��`���h�&�t�	��:]Ӭ)6w�i�сU��4��ݵg���CJ���L��Ĺ�
w,�S^VA���%�D�7˄}r�F���s���Pv�A|O�[�!�Կ&x5����o:�7_e����E�-o�A���_�?aO6�GLj� ��x,j�#f��ʞ�`O *#�V�lî����l26��E>����>���o�w�9,��^�4q��]"�y�\�wx����H+O�y��:���(B���7��"OW��v#�i��a���u�|Gku]ƻJ�Й��N��)��ɋ@3��BC�RL��3w�s�d`�񋟫.ي���ΌJ��X�c��GGGf?��%1ס*V*�U�K���P띰W�P��ҍ'D��,��7���8r�;�|�������)w҆/��]�M�00O�W��ɜe"�z�npRۆYĔG"�I�7e�p�q�?!�8�N����M�"{l�)��-��l���S�7
���9���9<w_0zM�orca�x._�����ce�V�q�̉�&�.y�	����r���+�z�i�[28�bd�,W3�zmDW,����ʺ�Y��Z��ًi�̛~P�97��}(Z�"*�Ι�|maX������KX��05��j���A��յ�+�Xvؽ� h"�f�#C��!�0���m�,��0$��G��p,�|t�z��zC�y�����e�=o`!O���a(<o(_}C�a�۲��e�4�Y����t�\Y�IyV�C�1?,�^�e\\�iK��Y������Uz���Yg&�_��`�&KrN)�3]9]Ʀg��j�*�1��a��!�iY�g�8Xn�BI��;������K���bùrx���⳩"���w%��0�m���yE�!�{��o(&_\��Sf�&�;d�w3�N��w �0�YH��(��Ò'�R���4瀹g'IMN�x�� �G{����Swk'���A�B�Ӳ���3&��`��([�Y6��� ��'���֠�����v�9�jDU{�@����xd?a�*��K�f����[@zwBy؄w�KV.����),p⪖Ro�C;�s7���mJ�2?-W��ڱ|����iM���\Isܒ����]ٝ�͡��c���K6��WR�G��:�vgί�]���cs=����1Д��Mm?�$�*5��i��G��X��,1���v�ӊ��""��2&�3�b0�ڰIUrѰeS�m��+_r���^����e!L'N�3˛�(�
zS��9V�>1V����:w��2N��#�㴊�'<&�40��mn� �� ��G��me��LP��s	�ǘTq�T�J�%ʔ+,@s%.@n!"cV%��@`�(D]umA=T�;P�YĮ�:W�-ιV6�_�"���2�ű���Y �	�Ä{S���TK�Y�Ѩ1!p��*�#���ث��C�fi/�x�Z4���ǘA�U5:U�^k���q|&[�e4��x�C��uI�����M�]�=��>[:@�0r���R��5a�*�ԮZ�n��y��.dq�eM=-�n2GH "·��6���pB�y�m� -���w����:z�t�ظ A��[I�G��'-;Ŧ�DAk���)�;�g��dPʰaZ��2���u����[[�j��ދ�?�P�90�ۣwD �ֳ���b5���喥Ty���A�]֍{��LA�����AGXL�K���h��N���"���=�ͬ��
�e���_/��t`t�t:�Z�O��I,e�%Q�����m긷
)ň���Ģ�u���SPLB�#��	(MƋ�{�u��ҵK��� ��-�{�9���]Z�<i�����X�ɦ�n�ei�f�%.�r �u��7�)K��Y"����tF���^�����[�j	� K�����'ߒM�V�(�B6AN1r�����?�/���7m����1�Ĉ��.#���iAf`ӝ2l��=ͬa��p�m���-:�e�Yhr�Ǎ�U�K2�T�2N�8�"cE�9n���O��0?|)����\b��`$�����p��i^((]O=���+�m����I?q�V����J�m��$���8y�����W��N��f�F����|L�Mݼ��]e���e�t�N�[u���F�xaȊ�Q��n)+���kH1D[��#�a"�x���`�d��ל{�7b���E�<<;���?"ȗB}���>½�F�%~z͉yx����o�}܄��&��:��򼙎"w!.��VS
�K|��a߻��"�;D���8.��I�$ٝ��)���^��ȾiO�bA�t��q\��A0��a���#�e-,���0�g�]���:v`�"���,�J1h����� C�ex���H����B̺�?�|�����	�ҕ;��TL^ꓷ�%C0��S�t�&��lãX2rW$���Ӆ	��.oc{SP���.;׹�p '�M�#��?��跺_!q|a4��L�e�uV�(���Y�K���M��.�>\qߌZiD:9ON-���x��D���3Q��X����XW}r>�]�8,6��Wް�-I�r�Dw���L�p78������i��f��j��i��i0#7vW�.��`�E7�G;�4{u��*ݰ5����ntT��.\]oz��J�~�;��-���Vl�r�a�6��=����d�\������1]1qp��:z��̄ d���/_%�d�f�B0y�[�+��nxn2F�"�`�:��Vѳ�#k7�ꨀ�v��-�g�a3�g�;�\���*�Mm}XO�v�(w.A���)gos��F8�w9"2���^D�^�.�l�\��!v���}��X��^��W�:,aGqJ(j"k!�ϽS�[f�/��(���۰�;����0�N�ƬeaUhet�ɱ�!�c���bvp]%���)�m7�u���&�=��d%]Y%�n��V�j���c���"'�B�8�;�RC �x��nc���|��V|�%�i`%�]Ӌ����JS�)6�R�Xä|q ԉ�FǇ��!?J�j&&�}l@�i�q�6��7��R���G���  ���Ij8��|f�Q��?�G��.x%�b�s����2S�k��5'��M���V;מ{�b<�LOoڶt�#g��l�z�ȑyf��R�	�����S���Q���u�!�4^���G�Wt|�\��J�}��r"oleɂ�d?
e�t��Ck����g�Y���z�.�����[�i�;n���R+�d֞Q/����]���'Z^a��ӴޫV�út�U���������\�+C_��:�go~�5��5�qVމ�� ��
VsAr�t};?StG�a��p�p�X
��$-YopYb�򼍡�W�U�o=A��4uAm��:�t%w�-y*a����Yx��LYe�Y�')s;�Z��������d�q��p��.�LcC[M䡺ŇF�ahM(=����Ly���2&�>@��!��ƮA��6hm`����"�������ؿ�S�q�?@�����vgXy��&uy������{ԯ2��4���XO"|�p��f���F*�[�`s;d�)�_rN��ls��4C�KA�)_�O����l�`D�tVpmL���Ϸ�{VR>.��g    �u���(�{��/�u`ޅ��h�#�f��a��*8b�: �E#3�E�h��~`�8�rBC���/}��5Oiȱ{(+�J|��dQ�SI�_��J�'Ke��4^�6�7��O��y~�y,���Ϝe����] �r����DS��pC,��Rν�%q���S�^�\��φ��xT�:�W]%}Ja�`@#��47��\`���ޤ�	%
��p��:9��
�.| N��8�{�ɆC�Ha�[��#nSW	&�1�����,���9 ��[�<���g=h����x$�����c}A�.6���e�	� y����&������L�K\��b�D?�[�9R�(Y�ѿK����C��/�����2�$�j��r��a�y�m�m#k7i^�#͒ګ�1-�؅KcI��g��@�]+>\7(&�����ek*���w� ��T"-hVۈ�˚��W7[V��g�0�Y�T�!2��s55�*��Mq�G��BC����g�%r��{���S���$'L&�Iv剄D���Ǉ��>kn��ytfZN�uP����j0�Y&l���u��V ˩�z�ܲ�Ά��~�Ć�=�F����_>�(��KĹ;ua�`���e�#�M���s1�`�\�}h#5v�����cU|���Y_�eN��)���5�K�/�'T�����(4�Nw��ӄJ�[7��:�|`���-k=a��:���P�L�)g�86๎������xV����/�6!w�q�z���*T�g
	%g����T�C��Ƞ��i���S�-�x�rllq��A��,o���,��H-!laV��9�lUg�~:�A>j�Yu+�`�����5�0G�cv+\��k�oS����p��T*9B皴��M�#{27����ƧG��n@�d�r� cW0����y���I:j�:b�|��b���UYRs�������K�3�{�p{��/��'��q�Yo,ݩ���WD�T7qǣQq��X�~m��(����B�K$Kig�0��hSnp@�+��+��ϫlt��ܙ�T�<.�@^8�fⅭ˔���X?bN�t�D�@���}B�>�����ġ��*-)z�۽���$9IW�G�m�r�DX=��y�sUb���M��q�3��5G�ck��~������&�?������N#���`���چU��v�rH	�f�W�a��e�T�!��ƌ6��r%�V1㆖�X���HyT��$0@ ���a�����]m���4�!^���	���.	�
��M�K�ܑ�IQl{����$?��Eb�����ܕ�N��d1���K�f�f�w�.���Q��g0�l��ъ86m���>�&�0��A�B�&���.�� ��H�-�0B��z������e�f���-�O����m�s�4�z���:�<fp��^|FY6�ۯn���Y��z��sY��&~☬��d�%�5�$2,�]Ʊ7 �9W���#�]��Ƒl��z��3�9k�i��'%1��(REJ�N������\�P�>_ʹ��J q	D"v��OU�T�f���r�Y�X"%^����z	2�
���4ߝ�㐼�|�GZx��k�ld:Lh%)Ug
/�$Ө�+�I�15�{'�f�Şﭱ��ǡ&�~�]���U�A�^>��~ ����X�FR��j�������	*M�D�������R��u�S�=�X���o/6�8��W0��Wrǿ}ݫ2ڥ*&�xF��*�U�[����~�77�eR�w�����tB��|N�%�!�=�8��2���;�+��??L�|�U���ѩ���R��$ڛP!�X�\���:o�o�b1u����:�:�TOD!I��d�O�x���d���������ܑ��$�w'�,�T�P�Ɏ�uԙg��CC�Y�ރ
���-]��K��j5�(�M�'%��aY�XdNU#W`?�lC����!�
Z�3��Q��:&��[Ʉ�n�����ݐ�vS����`<e�Z�i�Ά�M�ǹTx�>�������������ٵ���!Ry������x��X�
�k����J�Y��a��ZN=��!L��{�XY�JT�ܲ�<���*d�_r�dbÂs�E���qR�&�&�w.Q,x&��S�O�{���JP�e����C�+��^6߹̹�L��r��x(u~�������y�����Z��f����5H�?^e:���g�#ζ?G��$O H�$1�q��X��e(u"�[���[:��җ����>5U���4�o��Y���x���x��2O�\X��T~��o�ڑ\˝�j���]��I�w��o��5;T�V���S��5յ����4R��|���T���sҝ���i�\c$>;�%��uM\��NsNr�<�u�,�.��k��tý_**M5���n
��e^b���O�F�����s�W�U�$����3����>�s\�͟z��F����k7��2����|7��R���?(�roO�v��|���N�.�;à����K�͙zG��_���,_�����ݫR�y O����2�9U'шF�G']N �+Һh��I;%Sw�3�S��q��u&�n,O���	k�.Z��F���jD��T��V��Il��X%�u���4��C��k�Ɵ�	�|�X�;좹=�"O1�����/��2��P��[@���$?G5-Rm�j��	R<ާc�ac�]B��iY��Q),��X.��ҭE�����^.j�C=�\���|S�Nbjp穏kt��� �/�Zz?�U����%�j����H��c����:�?�����Yv�f�����y��t"m�7>��1.4u^8{��S�7r\�@�W���-y��������hB
��&.e$�(u%)Ҭ�N݁�`a\��v���0����?L��
��z1�E�_�t��\���Ǥg�R�����5��B�`��YU�\��X���]8(�!��b����ң�£L'�K�L�鴼�D�$P��{�k�����!��$ ����ȜγJ73�}� �+Ҥb��jR�o3��˨��G9�DO�^'(G>a)�wWŦ�IX@��g F�O�~[�FAH�Ի�_�?�)o*��T���<���(�w��$�j�p��~�҅2�M.e`]��E~׹�SW�u�����Uî�Y�H���8�̕����&/kpn{�{w�%fa���{]�A{��N������?�#����rZ��u�7PӍ�^9K�o�x� TfV�r���r�+"�nM�:;\��_Ec%;�_��W��P����?�V������|�0��U�g��a�B]1t큂���������7�iR<T&=4��lP軧uD �i5!Ԡ�05���5��T�~��O�e�6�������(�4��u�FY\Q�-��1M���G3~=�M��aF���F�1WV*������k���ߋ��� ��"u��1�{�]�)~�b5ks0\�4P;t-DW˱p5Y�\d����$��/"�;�~V4��Eo�F�^�(���vęS��@�nO��7�=�~X:?4q��B?��RC��X;?4����J?l�[�s�*��*���?�5Ȳ�?Y��g�y�*���O�������2M�Fݙ� ����e��LU�܋�?&6k-)�ʝ}a*�-F��]����b�:T����|�Mu�����Nj�؁�~e.y�����4�O�uV��G�y���Q5���o�T�~��ϟ���j:w�Wn�R>���;.��̹yԋ���v�ӟ���*����=���lG��x9'�~��?ލxu�}FzgY�nڸyա��O��΃��O�)�����ܪ�OQ��tߑ~e��Ѭͯ*�y��N�>�r�E�|���K�<��g.)�<+�ؠ�3�>L�%�z��C�A�P���C:�����pz���>����Ra2�!���g>#��1�T�+�\���%l�%����Ŕ��N� R:%��	��l2p}ӏ�)��s��9yL�4~qD
*v5�T'�0 C��ބ)�]5ÿ5�F�­�T�!�;�;�/.�[,����6������mB�����W]����t�^W�_�T����tu    n��+l����	}E�p,�|�KegUn������\͘���9^�,�pbu��#��2N�T�)���]?�<���thw��x�Y�4������HB�Ԭo�|/��Ľ�2��@�>�p��:���b%��o��p7�q�G��O�4��2/����6����
���5�u�Ӗ�_�h��yl���Dn���g)�rη}�٩��!M���b�� Ulr�\����~N�ϛ�y�E	�." ����讪��U�B��kG?���:����X{��0b�jp;��f;�5�]������%��\ߞe�H�*%T5�%JL����ȼ�^B����Ww>�,QT{�_�үX��+��Z�;�T�Pj.���Tjl�p7:�+s�&�L��[r6�G��A1��}�u�>��j[�E��?�<�yȼs���̓����$��u�+���6 �]b�-UV��/�D��.����Z&����)���c�cBo�Y�����j�L��e	n7�d=a7S�,�~�9K���F���"�{��J�|���8��Li-L�.��@ �k��&��9�A��H�BZ�a܇?�J���0���{���yͦ���5N�*�.g����L�H�/�����S1iЭ��#��)�͗ُ*�)c��8���uz���;�& t4C,�{���F�5�1��2"��c���b)�e� A��2�W���u�� D ����XB����,�;<7�E}��)��8"��_�S�*�c�l�MU��H���j��4��6^&m��4���!��@��\���C���_�G2�t���;,	F�;*v���H��$�/P�
������=��j�> ��fdO_rZ�K��?�"៳b����iv?���HR���;y�?�ͽ^MF��·^�"�=]�y���'> p2c$��]��fb7��H#��&6T)�>�ܑ2K
�#���c�A#�}�=���4�lL�ǝYg�G�	��.��7������|v�t�#�lZ��}�N-��A-tU=�(��T6���Q0����ݖ� �� ��l���C�Al�Ȃ�h��<���]J� V<�:���b��(?�/�3�f7p��qi��5�WҍI${|~���=5��Tr���mJ�y����ZJ��U��	��]gS�}�C���|�;h��B]o0[E�sMz�p"��k;���?3+���ǧ~�x��#j����R�&U�Is�Td�$c���؈�;�,<&.R���f�^?�J��>s�h]�*�t*�yz�tJ�Y��
��,�C�I��Cx��;��;ZN�ift๎�p�\�1����&�fL��~�����1���b}^8�Q�j�H � ���q(��%¸���'���C��;�Z븨4�V��\���j>~�͍�F���*O�s�j��|5�p�����RM�{~rʦ����>����0j�x�pO*�: �lN����ң5���Ǿ3�^I,#P2T$ޏ�}Anł�>�;��n�}h�'��`V8{�E�	���3x&����ЊDЖ��a��|�Х�r7Zt��wP:m ĵ	�%����}?�Ui�Y+@&�%��~�ָ����\q@�`�fq���>��Ujg~V�e	m���7��(�zp:̤o�=�*�ձ<'�r<:�FLFO����)��nJ�9�c��'�M圸���XV�psk_)�-�kw&�xV�{��ׯ�KL�:If����tjA�*�)K�ꚼ��~̵�_>uR��E٭�*��y��XY�7��v��鱧9�
#�5Z��UU6"��Rk������iH�p�q��Up�Wј6�\g�F=�
 �4D�G��5t}Y��r����e�)<4�T?�!U�~�{�ng�����U��x�L�w������Lb�����|�vt|�L��3���r����!�Y֝qj9�i������B��eF�S6�6m-AF,�-�a�]�|�z�GL�p4�g?�2'�#Uϑf�X�v���rpˎj�J}rp,��(MP��H�6]6��~Ti?JwX�+��j<U+:u���	�רO�)��פ*��y�t~h����e^��`���lv��Xݵ+�#��n���s�X��1VZ��^�y�)�ZG��rζ�[<�\ۄ��>��냓g��1�rU�K=04��5�����0#�~ܟ��ꏮa3�0;W���+ie�W�.C�{x;�����1�W�:��0�<7����Ef�
�V�ށ�7���sRT�"?�e���U�B|�R8���.Es=v8����qo_4#>�u���-{��� hΗ�gp���Eya ���?.�����MMV�2�MX�:>g�wA��Ү���y��G8Hp����f7�#Y�[�q8�0�1�D���mauy� ��u#|<���C��bRa"	��Y����8sm����05kL�R�K)w[��BVf4Շ���Q��\��_�[�B�9�<j��H�w]ߎ�=��6V��.)
�����q$�玢��B]�4��ӏ��veb
r%�c��G>�+s.����ç��b!]�n�&D��J�>��^�~�U�U-�~8M�k�����-]�����a^����3����TlZ0��'����T������y��K�~���9��Bz�0�,�����S2G�](��-Ir�a싽�����:�i���ZR�䗑�)b�.4З1�~ݻaF��LK'�\�<~�f��L����m���+b�H����#ҋU{i�M�}	�~�հ����l�Q7��e�I:�v�O^��53+
[�D`(}z[�K�&�=����?`,��QGp�]oI�n��\~h����U^����/A_��(>:C$�t����b7^� d)�t�嗥��$�W_����R�;.�ͳ"���º~G�2ӝX(3��%�W���o���WC�L�Kg
;;�S�wK�����@�����M�K��ϝ_��Z�rS��%cϚ��n7�G�����w��N��`ݡA����_�'OE0��P?�iqmض��k�~���ܟ�\h�v�!������wkBT���e�����_���hI�O��UXg��������)Ok&=�E]Mj"��ˊ�Ӽ�������6��\�Z�U���T��3]K�o�n};/.�T���E*5�B���؍/����/JG�s}h/n���Ҡ�_2�j�gX� ��݃�%��()�#E3�~�b��}{z�󟼡4yx2Uf�8xwo�鴁�~*K��
3�g�<�+D���L��gx��;s�ي1���p�&���do�����ٞ����z��v�}�|��9ʿ�o~!b������
:	��]���dr*Ĕ��-{��>7�x��^���VI�@<���;�-򆔠0����Θ�� ��3'�V����z|	)�L�Osj��X}�&�D?���aF�Q%s�ߋ���L<���!��Bㆺ��� ���� �:�z5���W�����o��n:�@�c	C�t��"pTse$�VSp}����N/>)j��n�G�ddy��v�Q0���:8���;o��ޟd��ZE./��QI�PZͅ���ˁK~A���·G�x��|�G@_����~$�G��G�g���/�,|��o^��U}���d�L��pk��pe���<��g����gl�/�KWf��5?n2��6�Ŝ���ӝ�$Q����qqi���W�aͳYO�a��X������CQ7����|�2Ʉ��1T�tJv���6����X�.˚J����Pn4�D�jGvmg��!X@���E�D�\�/z��K� �����݊^�$sΗM\g�f}]K�/IL1�!g[��#�8��NV�� ��۴�Lm�h@��B"D���U�(�P��y�fCɌ�n���?μ��ºdqkH�O_r�C�qnʲ!=�	���v��/"��\��s���W��a������*w�_8�A�<#���ͺ�d��#Z���{yd����,*�'���D?W۲���uG7Ȫ��/�a���K��6{R�2)�*�6sT�"/8������@D�g��f��`���|�� �J,���^`�w�uV�q�1/�"�)    Pr1��"��~ـs�*��HLS�P|>r�r��e�XJ.�K�X��.�t�,������h�rW�i�E�<�?�qy��v�C���Pe^ׄ�N��s�#�W�]�BL?�RH+�E����7uMF,��$(t���v��ċr����*	U�i�gR���1�R<p�"l��is�HT`fw�y�r�>�1IZ+��|���U�����Yi2��-�����-<SSJ��u�G��n��M�NEYz�VWr}ǩ�M��#��j�`-	f�J$Wva����^�w��Zb�Ҟ����+�.��r�l�g�=�3_�I���{�R����=��%�ͤ �˩e�dS2�ui�3��NwC���ٽ)KX4 i_�)s�i�=����k��9�^��R�:n0������4,ϛJ���v�Z����^j�(��>Re�y��&2	��B�T����}��ư�IC���\'��o��:�S�;фQ��d���������5��4�7Of ��7�7rx�\��R�A�@��曪x8���ל�3�J��!n2��;�Dn%O��Z��J��H�$Ãl5��r)�����l�8���!��d��_�S��(bd��u�^m5�*�خ�,��:-�վ-*�����֡��ۥg������y�Ŏ-�m<�ztir��5�u�����@�Is���b��=�N�4��aG��b����]rL����=�~��(�r�T��iN>���d�Z�I�%�U����\�1)j�Kl@��u��q�*�閍�|�}z}2��!��m<�ܦF��}����{�����3�6�]޸冊f`���.M��*e�jhp�S��T��\�����k��At^��v��}�����:d��'���o��,=���$�� a"S]b=:;��[:���(t��� �/.�n&���`?E�L�����ʌ�����m��P�`������{Z&\�4V�b5P��it�ٽk�&��j%v\�<-""��\�M�L�:�j���?�snu&�s�m([t�p�-`&g�z���?|	]����F���k˻U���?���ٹ��O��%D�8|����"�>�R��%��27�t��1��%wiLu� �9������N�lBxRi�zH>�^q����*�&ńې�s���x�4Zm]�K��N�:��gI�;V��J���F:�S��>f���?��t���}�ʊŐA ��ZHn�]�^i���;�N0J�YҘ����0m�ռE����%��,$��A{��떰�\EW�Ӄ�Տ`	 E�2��@Z�|�+iE���e��&|���?ùz$bZ��<C�1�k���3��n���S�6��G�4M��"��r5����D�&E��*�}IAKG�g����+���0k!k�>�B��w�*���nTtd`U5a��Y��j�~�O��rCeUNpd�����Я���cY&�	8%)�������B��yA9��*ۍ��	"���+�B���KQX�{� �� Eĝz�@9
�u�ei�_As�1�Β�B�V��B������g��i`�w���s����e��h9~~�I���S��ST*Ya %�!џ9.2��&���>iŠ�9�$k�*�o�Bw��f��<!�sMH�:,�A���� �r)= �!�6`����ʅ�&�T�Zʚ�2,�ky�gfm=��&������SX��Ygt�x�h����v?�d��f�����S�O_�պ�Pٕ!�S��z&DRJ�*�s:��1x��Ӓ�=������U j��5M��;N�0<<��(X�p-ɄH��!�! ��Lw��˶�D�R��Ilo7sg���@�ǟ���ߵ&Q/�/Mj. �jD!Iq�4��]w|@}9>�8'��|��[J����8Ao�^慠z!M�xS*�YdiY�)u��Ǐ=�1z�Ÿ(Q���x��%M�b�j����k��p_:r�Gj�Kw·K7�Q�׎VD+�@ʾF-eE��: &󜌐zן����!���bV�:6(�8���~i���[�7

v��O�+S"�C�B콢V�H�/iJ�y0TA���'$.��j�.�Y�S���������{{�.E������K!����Y/vX��/(6�
�h�d���M�29�qn�QX�3�enD;�pvKw�=���
H&��Զ��c<)2�9MRj�xN��v���B���.c'B�8Q�Ɣ�},s���D
�,�
�G$�m�gE�&��Bŭ�`�q����Q�Mۋ��(8�s(�8t�A��0�F�b�rh�d���>t~����4R��_��������Rl���x�=����P�0;���R��
[8}�چ�\��ϕv�«���ȶ\GL>�d;>��w��u��v 5�~Z)�ŧ�2`��6�q��n�%>���$3����^�!~|��c���۬TS�Fz� �=��Q�x8��Xb�J��
���)8m�f=p'痫�f�z�R�|Cw���xjU�O��ѿ��x�@ڃe�e];�U�6��j�hPS侺J)��;%CZZ�.��u��g�l��|���VV��<��^#�19%�©T�#�HQ���2�S��08������*���M���#�e�oG�r�+Y|KRu-��Jh��J��ܾv';����FqK�������<`�!�e��gK�'o���U��R��M_	�^�|��O��4PKR�"3l�q�ʗ*�uY,�������Tpڗ��/�I�hQ+�6 F��������E��,��
7g:��k&��k����:u-��|/+��4F~/�6��J�JK�noa�CN����zJ2)S>��T���c�[�<;0)A[�A@�.Y��F�\�w��h�rт�������o\�oX�/��i��E��sp(��ޓ�2N��E�����g�A�k��]�Ms�?��!�
$��o��ȥ]�fa\5��z\v� �8m����M'8�Y�?��'�����_�|�m����F��o�b����pH�(ݾ�ꇬʍ}���ӬM�;��9�>�h�'��h��4��g�*����K�����s3�H���p��v���Qxk���g�̚4��g�{w���$	�������g"�����6��ɐ���k\��1j��*G��4(0J(ݟV�zA�*D��*jYVM�3���^��s����L�D��mO�mr%��A�����.+A�	
c���[�-*�_���/�7.���3���J릔2�e��8�w$(R3w��
��ẹ��mJ2��mQ+�\l�"�͒>:���MP��G�.�F��tҺ�$y%��C'��RU�^���4����i�NZ|�.����;2 �v�V�<�"c���_�"'Y&�i �Ǣ�V�!7.�%q�*��e8_��H���?u�c�{���i�Shڅ�-p��(޾�W��Z�2��N�$���U�q��y4�E�7۲��U����ԵR�߶�d��V5q��$fm�_�J@�Q�����0��mk��-�1 W��O��xy\Q������(�tJ`�j�L?s��i;��;��v�1/�CqR�LW�au.���o�Z,(��5(mK��\�ƂT���b����Ӈ�p3f7R����,3����E;�Ϥ�~��:� �
Z$��b]�y�F��wT[ڢ-}~1բ�tto��@s����9r�c��m���~�/5�x�򉴩e快��;��
.��?~���R�L��!���;�Yi��ظ�
�HUh����N�K�4r�J����$F�W���	4�����ع<��$��`�L޵�W~QC�Wx+����M�'�����p_-Ϊ2�M&�W�����g��}�>�e _��R��
�;�!���ǚ\c����܀3���3$����t:���HM˼ r Lp�r�Y�J,eAN_\��/�YE���|=�Z������CU��jd�1���˼�@gu�µ�`�ml��"Mz:y���4pz\����H��{���P�@��]����!#O�|��+���
���uYTM	�U��    �"z����ӫ	�!�+�o��2;��&��}{HDew�K)t@��"5IR l<W�F PK�)��΅�ui����iPP%RQ��i>��!Lnibt-:�D{MC�1mP�v��{:"��}�K�<ƞ�"�圮
�3GZ�����{��Ey)����`�H&xr�j��E��p�t��Id�*,Y�73�����o��p�N V�t��,x|}��u�{\��y)��[�3q��Hrˬ`��t0���]��p��.�
����xO:`���ߏ�1�H4CV	{�'I��I������8ueG��K��h-V��Zߴ��e3��9xE�����|�����	QVU�4��}�+�{���~7� E�jZ�e���,�����G��y6�{'�hx�7��FZ��v
�|���C<��-Ⱥ��p�
W�ÑI*j
����;���m�</pbI��ts�}��
�e�����G�S�{�q�Ӿ���#Q6��n���l(-�TYU��P��
�(��U�u�1v��L��wS�^�ӡ=��>�p^*���8�UN`���'�[Ǵ���U��r����6�t�AK��Z�k��O_��B�N(쵛���SsRx]�ͬ	��_&E]��0NSy�[�Ѧ�4��~+( i���Y�&Șn���@��R�U+�O)��)����-��Q���d�$�P��.�/0l���U�|n�p&��%����Ж_,���t�C)���?d5�>~��ˇj�\tv���d�L��q:Y���b����e�_���sM�g( M^�r'׸h�MA�{ҕݢ���둖S(�&�h�k��ˣ pb�ڃ�΂�'�����HPwO;b��IhdYN���m���Q����݌`�Dw�
i7i�
�:7Fݷn����K������#��U6��+�9�c�Q��I��~�w(��X��ef"?��:Ǵu��EW�*p�u�V�n���
�qW�NU�!��[�=����.�"�P9����ѡ��㱀x�W-��߳Q��|i����@8��l4NT�3T]�.6k^�v�aIMB�'��� Sbp�U�,��g��}����	��U@�\C��bԍ_�1U�W2EYK��\Z}_&��cV�P!��p#����D��H�Va���")����q<u��M��M�&nE��Y�Q����L�.Tu�t��J�	��;��wĪM�L�"V�2�W{���e�����Z�|����D�L����*��'�t����ũRW���xLS�n�tXޖ��86$�E}Z�nJk���Z�sSr)�%���ĳ�0o��ɿ�ZmvV�?���vNp�i��d�8B0��P�X�$�Y���wB��e�Pn�ˆ����O���!/9R_9�W�r���M�܄�'��+��Rym8#X��9�*2Pg�5��P�ͤ)�X��"�t��mЁ��(���/dypHoŃB-�;!���`eC7��"�u �L�G��>���t�V�M#�8)+��-~��>S�pf�a�!ec�M�Y�	V�_�ܔ��37��c��*��ɶ���,v�î�ةȗ��j��O�7���[�^m���V�;����:���_ZA�4/��>����V�	!et�Ԉ����Ԭ�(� ���k�֩/s��sX��{�I�,B�qZQ�3Swz���ag!�4�E}�}�(����>vJ��"�)��:����!#�M ��ᵻ^�iT��sk,�2�C��p���ʸ��!x�ݒ��DBx�t�{����U��5\�A�v�! �(��)(8�O���1Ȭ�2��f*�� '�]���N�m�!�r�
{���$���-7d���i��Us�ۛ^�o��bF�p&�><TzA#�%�!bYi������r�����[����x�g�uERpXF@]���{r�"�ꐩe���5গ�q8�� ���K�n����X�o���q���e�3N&G�^�0��&�b�gܫ�HB�ӿ��"�>���*�B6�|��}�5!�5Q � �	co8�5^Wk���`5rDw�Ϸ���q>��pO�[�b;"�����J=�c��Y]�s�t���71# $(���@��"ֈ!��k���"���_��4��i<YS �1_}�pL0a���Yd+��F~j@T��y�q�\*e���k��΍tUm������l}<+Y�o�v����.g�s����)������,�j?ᰯ�R+��o�gO�Y�Z��ԯLe��r�~�K�oSH�
���ϡyVf5�ӑ�>O �r��I��h:�*h�8���Nezr+*�uS+&��pu�*�!����䣅��4i��sd'#���z�+�ll�j�E�.���ǫ�T?�\ 5������h�ֻ咂�2�kp�Ѩ��-���$]��bVܻ�^�m}w��g	c�Oġo6�\���/��g�r�ӓ]U[`53]+R�׾���y����@�q~����)��WA��>�2%�I��I��� _��U�O۽��"f�Z�M:-�K�:�8�-���P��-w�Sr��@S�Lnz��+�o��\��g�V����}�IV9�����d�9��s��]�Ima��Q���,%&?�a|o�+)�����$��^��6R�d1Ѕ.SI��O&q)3dːɈH��BbV�_�z}R����������o��~v
�/�1�<lSJ8��W��:�]�dqJVHq�ؠ��9��|���)Nc*:�%
�YOɝnSj#�ʐ��!K��:�k�"�ts�2�J+օ�.2��0K�g����̻���d�֌D�U��B7w�ЪFT����}I���������ߡ�K3#oߑ�K��Um{���eP �T��w6M�f�]�/�C��.mC.d7a��P4�>^Q�X'�^��*�f�@�[%�/�X�o��sS#$�G����#�8h��4@7�,QU�>�:�2O��I�n��M��;�?#|qP��:�h���[�ӈ�R�@��n��pTCU m>��b��Y#pf����B��&Ω1+�՘��4<�ŊL��(-#eÁ�ex���H�� �G��E�E&ث��c��s�K3^2z9�F��}��' �,gr���:���ȧ��(��j��+g�su�d뉖a�s�68`���ז{�J_��n��΄�K?_���e��,�o �Y!�/��g�t4�����7$�~&�R�Ǘ������]sVVe�L��Z�5}]�$eM!ն\?V	Ϛ�w�G�݇������5AB�4N밉�!�PSC��0���"6<*� 0���ƣ���z���R�j{�����n뷀,;���9�˾���r{��p�z�3.q����O(r�u<�.ܜ�&�q��@��u%ԝ���E�V���%W�rыc��5�������v���v"��A"�X<��U4ԧ�/e��M�g(��d�2�faT��YZUR�D
pF��i�.�\�,�iT�2�
�c�g�2v]q�asny�D��h�[b����;|hM�|w�(�v��#��N��q�	\����B�ߋ4fuM' �r�Ԛ�Ȁ��&8�p�(�j��zcNB��.���n����zud�F��E' +Vkd+�dR�z̴��!=�("�� ���l�d�Q�|1��}��R,h�`y���9m�i"kӈ���	-�&^�^�ȕ"���&ʔ��
���O^���n ]����E
˕���r�*d�P-RȲ�ޡF�fe��������=JQ��ܻ�׏-Ӑ�/���
=	����eZ3p�4�sIR�Eex�pvg�^����|��@J��9�3��*N#����͗��FH�FZY���*uw�s�P��grx �%�7��nf�3d��	����\	w�j�=u�8��V����t퇭3'�:[���}��}[>Ã�B�BsI8�*&;i"�/As}�OΝ1���UG
o�i�k�Zywӫ*>��Ѝ��W�|}����K	�%��槕z������"��
*ܻn:�y�����y-��7F��ߌv�]dl&��tit[%�4kl��&.��    ��ͦQ��j/��&D�4:T�@����9\���XV�_�U(h�'��K�+��5oK5k�Y���4��8�*AYDd|U紆����^��"�t��t5p(ql�ꜴF���9s�b𸤩˚���o�����c"��楩l�}�颕W}3�R7�Eۄ��dv�{�2�I:h��n?��h�%�K�D��Fo��$��kk:�(*�.��M�8���dæ�H��'���@��A�x�_	�7.�+��xn�>�i��<U9��<�qk��T�@	�������䞬&�����ޝ�pV/�J�貜I�f�d���??$C��hڏC;9�Q�2��\��/�Iؠ�O���R(ۻ�נ�;�:0�t��B�N{z�i���O�"�d\TR}9Y#ta�t���,����8�A�ti��̪�d�<��1P��!��k)��i��:�>��`�6�n:C��Q9��KG'g�FD���g�RT/�:�%]�05B{{�LK+�ed,���
r�*�W�Ɖ�u�A8�!\�����	!\�h�
޲�OA3����:ݒ�f�+�"X�����\-���
2�c7�dz�'���^��ޭ�&�OaU�c˺��d�b�n��/�tF�o�8�s0��>f���g��BP^�I@�U����8��t����u����:�*������0�*��<�^�&�+�0zH�\�7��d����i A5��<��)_u��h�gņ��(���޻��}D���<ulE��` d���+:EHq���s�����e	X�@y���vi$�s{�
H��By�^(b�X�H��a"��"��s�]���'�
ty�;!�:��3J�GR��7K�UK葉x�X��W���x��&�y ������4@��:���{���b�ֺ�·�E�����f� �^�Ҟg��Tf� �ڛ�;H�yU �X&󬔤F3	�O��?i���5y
Up)����<s� �a��eg0����t�Lה��}�J�"��m�h��:�@����0_�b+ -�η)y�v����n#�\�k�"�!y�m��sv^�O$IP"ĨMVD�]�Yxm�x��҇炮H�5�b�US`Q
�/k��N���Lۜ�ؑ�h��!?~��VKNI:K�"� -R$,PqܛԥXSg��� �NY����/��92�N{�ba�s�ad��.�{ߏ�뇠�\�k%[�`��#�_'I]����)�J�O�P��T��'�I�ѧ �( !�Ӏ�:����\=5
k"��0�J"�.^�B5o�����&ڀ��P�4�Ma��6$O,�T�hBc8�%?O�UT�s�[�=���ޚ��¾�,B"���^\^�0�>�?�Y>mdq	tQ���{ïa�N�����$�\ �K5�kbO��@ �3;i���PWS�,��L�):e��M�j�秹�!��#��(�e��vj-2U\eY��+�#{~�p��m
��9�v^7>��bMA*@$��f?Db?�R��z�� �}�S�Y�SU9���
��׆i"6g�ڨ�h��T~�]����7q���ā�0�>�� �B�{��["�QV���0F�@�#��c��:C���2�m�j���~{<�7;����Q�
��KK����a��H��l�y�'�i?�F���6��6Rd(4����L�xXgY��%��̎y��8��<�BU�aE����@�@s'����tF������eF�0D�DVK���G M¹J��B�.�M���lu���U#���'#�[�T�oޕC�g�y~�"?�v�.1@F�e���|�QD��h0fݷM�O_J��z8c��A��sT�\����dܭ���%"6E��%�	OE��4��Wr?��l۩}�;zHIa=�Axh7M���)�Z��Ϊ�*N�- �6D��?���س0�۠����q,K8Y2����Ne=G`-_EpG���6@���[!��"��i���*:�~�bS0�3W������D�	�:���[�rNC{���B��)��Pķ�L�L��㲐Ђ���F���xC9^���Ϊ�LY0t���ߓ�������˒���ȗy�D �v��((H�%9�;����U�
��9�
����D�`5eF��.^���J�-��^��Nk�P
��=�^�5��Ȋ��Jɉ;��Ŋ�k�q� 3.r�5�������y�NNR"ٓ�|�L�d���Ry1a�����q8M��ƭ� ���@�s����>+�-�k-Hd���������Im�)X*3c/9i�"����׼��>v��)h.�������fK����5X�S�AY��MuP�1��و�8�+sm>_ovͱ^j��OI��Hik7<r{��l����=&���
����;��x���ra�eL��b�8�k�^?�"H�jo#HoݝNc��&?;�"��mn�C)��:�����47u��1�6�js��=���К�IY���m�GP����m-T��}�SNx�^#����H�B�t#�4[̥�CX�:{MС �{����� �}߃s�RR9W����FJZӈ�D����y�/�ju��M����*]>�|ƶo S-U��!�'�:�P�Ը�f7�B�c��q@�P��r�B��)
�K��|��-��a/�n����6��6P��s�����-:�&��[բ���V+�LJl��ֲ[���6*iI%��xQxE7)_��F����[[�;x:|C٩�n���0��l���f]6c[����ϣ�=rr����ZJ��I��������i\og��U#4B���<���RHI�}l=%95�Ü��`)`ܰ����d6�|�����u�a�"]z�>n�U:X����x~ϵ�u3�Il����:/�����q�v،%�CX�aɏ�k~���������Kav�����$�V;�huC��;�R�Z�����;�\� �^=��p��2�-(	��}��p9����lGU�V7����7#i�z
����y�<4���*b�2����[ܜ��f��_��:sgw��_�M�����(�DM��w���e���!4Y�����U+\��SH�_:���AN7������]��R�3@��
�_����Jog���q]~��. l];GA�x��Y�u�xE���omd"��
�o\u�Ө6�Ѥ�'�J�)�j;>+#w�Vx�d�Ƒ�N�72������y�x����g.^q+lj@��\�oZ�3���K��n(V�H�Es�M;o�ʥ�<�"�z-��N~�>��^���+'�����E⡵Y+7�����7���2;B�o�r�ZX�'a����ӯ\+i��T��"U3���7_2(�^y��T�����Z�����A��;�Y_�m*�bu#{I��+�,A�l	�wf�ZIغz����Z�\���q����qGN����Z�L�{�淏��<ԛ�1���`��6��4��`�����~�xtr.Y���(w[���`���y+��:����6���ӜdUd�a��������(������J���D��ݷ���ܩ�Z("8��ЂIc >}3�n��������� ��|W;6�h>y��9��r��a��o����yR�>�o=����iR/�[ۏ��"O�o_Ġ�<1�z���`E�k��Q���}���+,rܙJ�\�h������,ջ�Jxen��J]���i����9=����>J�m<~��+-3��<�X��ƽT�Ɯ�.�F�ˍ��Bx���]H=���Zh�[�X �dl�E����u)nÚ]�U��}��[A��9�'��t��9H�$/����w�!�{���iӈ��:��d�[	��c��Չ��}�,3p<��;�O�5���#���Q9j��9�;x8$��ȟ5P;��k{�����14�0��xk���v�\���*]܊X:�R���t��6�E�*A����zZ�xrm��H}�[}�pd��mK���ɷln"�C���Ա�F�>7$�fO�;7��y�l߈}�������^�<����a9Zo�6dӬ�&dm�g�ź�6�*˘OY�/<�    ���@K	LX�RwK]�K�����&��m�q7d4/4�^�&��m�~�5��k�o������:���A/[��gZ��W~���/�/~�u[��ŧ�g���}ak#�n��F�̙����!���|D��uL���Ϥ2�1��tvC�\�4��0s�6n�%E�P1va첂�JN�I�IC]��PHZ@�T�ퟛ�t�Z�~����I�H��y�/[Q�6(=�������x���/39�X�<�E�{t2�+��in�8k��ѹ@!$���i�
S�����c�Z�[ù�j䧙�Z2Ӧ9YH�r�<_�j}1��3U�zԦ)i�a�<��Ԣ*��Sb�I��~|�u�=�C�X#F⮴�9^�g��oj����\�}�10ڳe��[��Ŷ;��Ñ�^�tdf�%�H��,X��h�G�=�iФ�[��8t���0�1'�T�m̔��|�y%��ZIM7�3nױ~��d,�H�OMП�@�7����)�x��~���{Z�xm�╧�8��F"��d��b�]����$;|b�Ф�}�8g����*�zc���"����4�ͽ���-��V��
 �wݽ�=���ç�	��XO?5�
�h$13����SH���[P8����T��ʫh|˜WpX���/|$��۹�s8�y���0��ؤD��\/"�L��?�L�^�|�Y�-U(u}��N-��8�3l:p�l\w�J7�͟{�s����=�q�У]`��KC�|&�F������v����O,i3.�:���m�w����z��c����]6�0������u����X�"I�ז6��=��*0���*� ��4���A\>^oj���Ui#��A�3j�P�8^���<ͷ��tj�x������m|�U��u>Z��3���~�Ɋ��gTgz�>N�kRK�s�wO��c�n�62!l3
�gv�xO�m�� ���i��*��k��#.�X���)��¯��5N��C��!�M�5P�j�q��7�p��;T�[[�� ��@C����Ƣ]�i<�]fX7�]��3��-R|�%Y��CTH=�C8-�h�B�@g��	ʍ�s���r��� ����������ɗ��b��y,kT�j����w�h�*�e��R!+�[ӷJ�o�u"|V�λ뙶�� �-P�.\� 7�Nl߇��;��X�m^���<y`�!��:%�:�n90n���2��"�^+��G@�pa�_?AG���5s<q�l��E�p�*���Li
�O8��etI�?$";]i�6(F�H���>�v������6�K��t�-L^��K�F\��V��qS��O����e�БG��6�:�`���oT�9��h�$���nv8R�u��蔄�}-I3d��I��Q���DI��o�&��n:��y�M������"^	-j�t=�+���H���>C��&H��f�M}ƭ7����A9������i�"��VlkYX�L��X�B�˽���$J����\8y�*C[�G^!�8CU���ޅ0)$ŭ,C���rV��3�LeX��W>ݤ2�S�=)g�A2��H�%W�U����`ITx�i��T�j�y\u]h�W,-VX�Ds�}���|����_-W���J�1�+l�Bq�s{�s� �n0��/� ��j܋��|������M��je�{�������7�P�O>~sU]����[4����jj��ϖ�I�4n�`TB�2�#(�zw ����-)�t�1W�	ś���
^1����Y�&(��S wY(Jub���;���5��9&��L�"�)V��
�\~�JëVNO�D�3�J�ظc�����c g6���A\ＪǪMr�k��[���~���P�4�{������VpB���:>�p��@h K��4���7	[�y��������):���i%K-��Uw`����ݸ쓤�_�Ț�~WQ����c8����Z���-�_��gVO;��d�VX��JpSVS`�k�q�Z!�n������3��gӎ���(m �j$%rR����X\���ߝUyZ��jv�n���E��He8����y�d8��񋂄�diB�\|]�>��N`=},��&�Ka�h����.1|m�uŦW�����q:����%��~m�[�U�����~�պ��N�G�u[�M�^#K��5�q��5��|��,��{y���4�p4�J���K�..w�i��T��GR��-#m�C��X�Pq[~�FS1F�]q����};ѱ�8��a��eS�UVC(�VD|�m��7p��
-�lMh�M�x$w� �[݇�_�5�F��T��c���+�ک�l9�C�hQ��~��$�3p0��澹k�N������mx��m�<������(`�~ K٭s�ܷ�:����^�,�%m��|i�+eH��А59�V�|���휌o�'�L�����SX�%��Rv�@^�� ��S�+��L�x�47����_������۾�-'L؂*-RƠMZZ���ʣ� .�J�nt:PQ���K�>0Ͱ��J�/���ϧӼ҃�O��`5���I�*��5��4k��|�*�AQ�A�{{���P�:_4�\c9�"���nD��V�^�ɗ�5� Z��s^jg;9[��-Em��3�eQeވ�ѥ��r�C3	v$#�a��ӯL�:5�(_�ba���s�����HV��.3=�L��h�xo�|��G[�FH��9x�+��(H=tw��^l�����s��G(+ra�m:���:���mC�I#�PŴ7���N�>�6���t���'���o[�^Q��1V�6L����E���أb�V5�7�]�b�l�n�ڋ�8Оg��w�䏷;D�<Jv�����Ki��>4�Ъ�
�nz��_��b"t��l�L���$�١�A��i��XJ^�(�\����,��N��MM�����=��"QWٰs�P�I0��\�w���q�{$�IOs�Ud����5��,\j��L��^F��Ȫ�n��HZ�m.��Jy�d� �����`�DvZ!�k���(�T��*�YО�L�8YԈ��#w b8ĲN�Z(e����E&��RG����J�ԥ�8;L��Gjǎ/U�1*�H�c�|�7-D�%��R'#� ��k��][���bR��OΜ��ɴ��c;��d�T�r絴5[Gi�^2ɚ�jKUu&�j�sro[,`��ǎ�s���[�E���n�6p�),����D_��G�L�Ӭ+<^�p��{���+Ogx8M�l��x���G=���G��y�HSip#4C<�����}!�E+�����:7b����'��Xd��!��0��~m�"$���2k��YWi!}m�[��:"�<�������8߿�;$(�8
���VBZV���ev)Q�^C�Yw�Yɓ�#FI��o�B|���D���v�n��0s�{�X]s*�<_���K+�}7�����5	�3�zc����u5��,
�J۽)��#ss����Z��a^��0J���6"čX�f�ʟ��[,ֱX"eŚ0���gp�����Tu~���E��B�V��)��_��8�ZMx�NM,���"'�b��	g���t�EW�G/�Fx��y#�����w���p�CF[�B�����>Ӎ;}�7lj��8:-?o��1�˅y\�4����_U�@"B�J���U"����t��(��	I5R��j#�_?�Ӽ��,��,��L~�=��a|��14Y�6�u��v�a�Ag��,QC7��������y<N���e5�b�i��\��|�����{8�W� J8v� �$H����W�}��u�M��K`�$P�4V�cv�v��K�o�c�PjgH)Nr ���!�i_��?u�s�ʌ�󠠬��@�-��-b�3�w�8�u��*As�A��4��^$Hj��<$���v:Eaɇ���Ɖ�������y�w,3өT��y�BU�h@i�C���gS���'	Y�_YE���7���˧>���!Jϒ��GOw�����Ri�a���k�IJ��Z���5    �$�PvL�rj������k�Ք���k ���r)� ���
������*��ZU�g#� �(rv�g� �k9Ux=)�t��)�~�� r�sU�u5kC��om�y��P�/���[�7kTZ���&�DD�iB?��~wd�m�uʢ���e�I�l�o=�Вk�1�(��*�@\��=���}
�4^Ζ�S(`Q�^����nR�?�ޒ�yKvndƗx��}k�k2��y��~bL�(\�q��6K��"%�B|��Cs�v�ğ{�}2�/�e�&o�F�O��4a� 2U{F��o�d^F������5w�@!c���J�x31�g���\w��<���bL}�z��JP������Ƽ�HBUz�W�����g-�D�i��u�Ԫ���������ّ&�t��,��O�I�-fV�O�imA���m����&�v��E�J�6E���p�P�sU��ت/��a�j���)V���{�~nQ��[j����%2Yr�]�lk�Ǡ��:21E�VY���EVh0R�V`g��@�Y,2�ݷ�G��"�p����!���� K���T&WJmp�z&%7��%r)��E� uc���
4aMq���B������t�j^^*���^�;AZq�������}"����U���$�1i���d�Pv�m����o�������%"�����R��F*Xe��~��������5Ӥ����9w�>��a�~�l�Ā��#6���� `1;K�e�����L����9�w�1wRy'[KT��]�o�BӘn���ڷ�nQP^���	O{�ï���d��\Oݟ�������邦����ez�ě�چ�gUe�N�����<e�v
s���_�+��Fd�l�e�Z
y!s+l�/���?�����+I��m�H~p��~�(��%KU�}VF���T3��7��_BeS�=�S�
㱽����*���q�AQe�t&�x��re��he�������g!4m����)��?Q8Eh�Ts�D������AH��6��<@�����M��ؼ
Z͎I|�����L_��.��_�E�G;��;-����{�v�'��o�נS�x%������8lﾦ�����^�����+�X^�aC��?����Iw�� �����Z�=�Vw�&��к����C~�4U{C(��2�C�z�?P�խ��p%��@i�g��W8���q�vN��J�Ab�n�.vw� �~��ݓ}Lz��ݲ�-z���y�j������wl����OX���*�C'��
I!��o�s�� *X_��{~u���1�g���Yf]�R�{�'����B�C{=�L }.։�Ԁ̹�� �/��/p6�m���v��%s�<mkt�25�)����r�	�R����P�����y��A7��O��!H"�B� ҃��K;���Q�AT.���p�����&���Kо�އ��W�ɪ%��˅��^�(�T���TcIs\�Swz����
w)ȃdӼ}�OH䮊�ջOV�	���6P>����1��c�h����Qe&M�*=Xǌ�&��Duy��DV��ҷ�������K;u/��Ɔ�ݗ����H#����?g�Tb��##o�R��[�X�f�'K�p���j>��L�Ԓ��z��%���� U����j�)ޮ��dH�	�����{#W�@E�A���s���,3��s��y�S���H����A�h�����H���<����3~e�!�([���f7��������eR�zTA�l�����ױ[�.�K�>$�K#�*@���t����Z�d��Lô-��_"֡2�[|N�TUv�� ���i����Լ��^A+�{%E��+i�aǩ���5�SǩU��KLY��Te`��HuS=������'��c�%r2L�<7d;gK覔�ǉ\�%R�P�ͥ5o����?�&�������X���{1pD-�3Х�n?mck|t�M����ii7u\��L�t�T�-�*3�Hwrc/� 2}��l�ý��;?9��w�㽃�,�+}���G	712���C߷�1O��b�SE#dm����4�%R8ތ3�~:uw���&��&�J�6��-�r ��DVzSzE���Lr�r5�=�g����n�����!��F�6��q�Bk�o�/H��=�I#����o�}���YM;�M㢗ʒ>��B�`�x8�<3q�[�A��Dg�_���]��Ee�8��8�I��K�x���%��yUU���U�G.�Y�m&�p��H���c��7����	MV!o�mh�:dԇ� �p������]��̅sAUck���QK8��@��x��\��6�]rny^e�r�����B�ƶP��7�ݶ�A����g�X�i�+[�ޗ#��ׅ����Ʒ��n���������^�M7�)�mY3������[�9(���:��̻������!T��B�@S��Z[�i�0{guwQx����g��<^�����G�eQy��ϮgB{�˴eMQ���Z���!a6<;��7*����Ժ��0�ω)k$�ᣙl��ᏽ�R���Y���h/K�L�q�����V*G�W�d�&;f�-^F%v���o��p����a��T]uh�)���������r�����J�ϕ!/��%��������Jڜ��~��v�t��|��u�byԚQ�L��m�#�B �����߼7j��Z�}��7ܭ�p���nx�Å�c��6j�q;8���-no�\��4D��rjq�64Vӎ�㪌 ����k=c��M��Y�E;��{چ�=�T�@�g�0=��"pyV�Ny��USy
��|�,�sJ�c�M�l T�M�E+��
6�M��3MF��H�кN�k�|�Ϝa���<�I�tU��t��+��˪%�nK3uUTk�P��XW����U�FWK�
M��rm1tӸ�YYD��'��u�*;���
=h��l�uj���ޅ�l��������V�E8�+�&o#��G�}r��W�Q������n�jw9�/�]'�;�bj��7��#�EH�_��	ar�b���R:�˼�{SS�������l���C��P���c8w����e/4^�)i��hi�4lʪ��?(ޤ��\��8�W�r�BU��<��K��7&^�:�Yg_b��_�{�~^5�L���J0U��G��RA1�ot�����-���D�R�Z�|�]O��:�ͷ��*��ؘ͐��7T�vS6?_n��0�䠢M�d�d��IB���Q�seI���;�՞9�:W�0�"[�k�6
cK����Oޠ���V��F���s�i����|���Ew4��Hb�C����L�@���S!�?��m�m�}�_p�������	��GJbJ��HI9�5��ǉ H �lz���Yn����@D .���z׎�)3�e����'���龟�7ŝvڲʃg�n��Nɒ)Qpz��*�Y��Y�-1�H���������� a����� �$��D�J��r�nW?�m[X�����	p���ƽ�F;���ғ�$���6���zN��u�kWTP)��ɮ;ĺ�~q|A�tD����O�ZfLA���v��Dj�T��K��ՀW����ś�.��U��Wq�"���Mm��3���
+�9�ȋr!`���ѥ�NZ�}��ՁO�/��n�S�x�wH,O�7��Ee^�0 �+�����c
�љ�F�D�$�e�[][ٷAV��~l~�l @ �.�P#�z���K�/�_��1�އ�p�/��o��מ�X�a�`]~¾`���o(�$��ǏM���C�~������`��E�0ױ�9'�9O���6;b".�A�7(ݓ�Xe
�f�@��vۤ}�
Et�?�O��Σ�=.��>-�u����z�����ۉ�e������"s{9g�4�2?X����#����u���s7�-m�n�dT�(����9A��ˈ�����{��)O������(�����o纐����T���C�%�w�W���
{=hD� �+I7�    �;fELè���T,�b��}���`����:��`L�*�%w4L�]�w��J����|�IP�-�$.��#D��\���/Q��P]���u�n`/��
&��ޮ$H���p�\���~5�@�k������6_���BY���ЕF��\d��Ў���R-Þ������m�+�Z��]����(�ݮJIO����"o���^e���3x�̫:s�c�z�M�-����A�7Q��ީ�������C�I�+�i��|{N	�����&Ŧ��n�!}<°�O�w�I��a�z]mL��_�
�=XFgbA����Mj�㑞���!�̲��z7�����	��{y�4�R�G�O��FW�!�w�p��0���5?D�[e��9a��|�S�%�g���T��G�pG���:`��ͷ�Hg�L3�3�B$*����i�,s.�ݳ�V[�x��8^k��wz����U��7��v��(%�ݛ��)��:\u�$Yf@��	�k�ʿN�$������]~���8��ݓ���3�nea�G��?��+p�l����[�kWѫ2a�`��]@��xtk3���ᶛ��޶�����1Y8��Ѷ��.��r��z�2���U$=T��(������'*���0;]�"&_��{�k���y�J\�niEP{�ָ�ew͍����Gf��|��~�C�Yԙ?�/������j����,i�Ť�+�5t8��]#�xtU�s��i�Re\�`$��q�%�O`Agj����j8�u#�vy�R��(mg�]��CǳG��`�#L"�_w�C0ʿ8`?�F�);�ϔq�i��b)�9�:�5��Z V�A�	++<���؂���>5=��[�c��:�x>�V
�]tw�n���-�G�dx$u7�7]N����v��8�E[	, ����e�2Q��*�-l��L��p�Ys��5P�*L�R�2�P������?��$P������XĴ�4$�^��+�h8����!@���`���'��=YJF��)%D"6p�f�NԭT�T�M����&N$��Ҏ��Ib��\�H�}!<eYv�vMA�5�Ԑ��B��Y��m��!�;�l^k���c�Pդ���������J�:9���7���s�d����c;M�g�_\F9+��lhH��1MD��\f��,^�,�y|~�h��[U/�Y�%�_-p�8�\>������t�jk�E�E�r�?��3��I��H���$,��Ã�tŉ=�k7:Se?Ar# q2$����0��Ґ(�ai�_v2��u3�-Ul-E�#D6s�{��d�T�޷'A�x�4;34�Q�������qut?�"T��[�|(�fU��v��ӋG�x�`Vq���� Jd/��pS�Igc��V8D(�rE%\ص�<�ܖ��*����H�˵Vx������x�m�t�ͦ��KI��:�*���|�ө�atɵmp��D���?�D�����.��"���(��DZr&[�og�~�̿�����D�Ο���Y�L=q���h�wox~БzK��Zg��&����}8�И�)�U��M^����l����������a�7��A5U$��ѵ>o��y{�/+�jb����=�1j�tCsn����4"���!յ��J��2(�;�:�/U��j�*򡆐�*�Y��ő���醾�Wt�ȳ5���b�XPT�����)ei�����D�i0�a1�џfV
<����AƧ���2�������٘K���<�6�j)��GϮԟ��T=I]��k��N�x��o�xm3}}�(4@�fa�|96�# rV���$�7L���Z�O��Ò��]ۓ
�L���	k�L�$^� `�nЭo�Ҡt�t�d�ݭei���|�
��@z����v\v}Zp�L�֘2�H�[q���+gy8QԨisiHq˳��F88u�n,O��|R�U2�-�f�`g��-Ԋ�/�U1y�:������_Nna�\��51��Q|�7i��n��J��CJ�j��[�j���e�Dm8�Vިu4�y8b^���$k� ]�( ��LpQ��-?���b�t��8k�8�Ckn�F=g�i1:_*:���b%�BU3����l��4xP�-����o�	~S�eٚfU��$H�N^�X�X�S����
E�����"ƾ��Րu���8~���*��E�<GT��Hx\r�}�����gNY��#�~���?~��;Q`v$V^,�t)ѿي
m6�MX�ع��P�+�3�됋�ʵQG��o�ȧ��~J�a"���J��±C�r��[�ٺH,m��:�ǎ�����,r@�P��VCV�Cj��u[(���tMC?F��]ۼ/��6<l/��!ˀ���x?���"l�%�h#a���I5$ݏ�7�"\��G�|2ȶW�G/���������8Ya�u/���.���t���u�mcy���§��tÅ�j��btb�J-���7]����Qp��֭#m�y�1)�o�˹6����e
{���~v� 4:��?O�ܦs0`n-3m[˙ �b+XJD��6w�G�� ���C�����HB9[�\k���l���Ѥ��:T����zi�i�$(x��П{���E帼`���`�*�>g���'�cR\���LZ�|��a�s�I�);�T����2��wyP�h��]����.��T��f1$�f�t7�+s@���p�<vc��|k:kT!��������>ֲU���dK9�hY/��#�]��bS���<6��oMazv3�/K�`��R�����u�j�ϓ8߇�&.�e'�!�˟v�/嘜RLĄ��[F��=�>7$6P>W�#g����d2E�h`4��@�O���ц�^�r�C�fYS��u��-s�F��5=���ɳX�EZ�� uz�����i�8���*�4ACBw���F��HK�@�!Tu<\�m]iuǵ�K���`5H��'�om�vP������̷��T8ɗr~�������l���̫i�^av�T�X��4��E������M�ǭ��u�տ�mY���u�&�#}��CI�?�?���HF���>�U�-�4j[�)s�k��~fn�,6oD��H��5�c��<Phz�V���*�ee�=u�7n:v�E�����_;�Q�����K������)�"�*�+���FC�Ծ7�l��~8���E<چY�u�Y�2X���r����1�/�h���Q(m�¤����1�8n��
dh��HI�2Be��~�����/4!X��Sw��>\.sb!Uc,���C}�6r����]d[t���SK>�;y��~#���3��~��|����篰�ؔ��8�3��;7 �f�m;��Xׯ����poI��tq�T�<mJ�q�`�h�J���t���dr;���!��}�n�[�\��}���zFk�5}��oV������\��SP-.�_ak����U~�ϔ�N�\��up���zy�WE֤ѝ�{�3���r{<���:���"��j��:�f�{G��� �3�H��f[P��-m��ZޜQrR��u���	��y���!��\&�p���I������q�h��t6�V��e&��YǶLe���Dc��Gv����B@dG���j=������-�B�����r-�:i�����ס�;'s����R�u�א��n����@"��D8�?-3@OZ=8/��d�NhrA���&��{O���m0��!��g�wm���0\g���L3;|k���e�{S���D&*t���F��];��΀�"��g���n@n���/|��2Φ(J%Bl�00wxDW�������v*�qӡ
���\F�M��cp|�^n�x� /(S8�J_�x���VzZQ�@Ǩ 3�'�O��ҡr�z��ȍ��(�;�4x������QlTUC��k&���L:j�Kɚ��l�➨���ϯ#�{\�C]�d����ە���{~84Y���x�g��dJD�d�御G�9��e�Qu�]���i�_Z� �����~Y�̤M;�^)b�i��5]��6����;��g��k�c|?��Wv�Jv��4��Z"���6&�0����b�bT6r�    ���~��w��+�J1�]�z&]fx�s�+��%x�~&�v̻f��K3㛿�z�$�ܸ��\����]r��/�8"Q �6��f^�7��-^E�f�Z���0;/5"�7_l7�pӷ-��ZW��f����>K3+��Je�ܓG��yنh"���3cX;�������$8�����0�zڌ�i���:���e���b6��^L��
*��&���-��.�'rW�g*���N.n��p��)��n\�n[�*�nט�$|��4�)��ߵ��2C������7�A6�"��yl�)���y�<"?2E:�%�%�`���0�'������lz�o�3��j6�P�.>��<%���<�DG��d�@CN�S�@#Qq,��(�D�>���~��q���NU�
g!Q����(�H���Dw�$��<�t�}C����d^����I��J����F�^w��;6V�ڊ�BA��z �.�Uvw��ʳ}�D���S�ݞ�恜f>�SG��;��ؤc���s�#����eGl�J�J�����@�9b$���Oy���	��V�L�²�Va���f�Z�/�%r�sD�Z���t��������ǵ���L�*��N��Y�ל��e���7v�O�	kY�N��r�~Z���)\�	O[���[ui{�}���Q6G����?u�&}u�I\�a����*M oc��ܱt7�r��`?P��{�4������NlzE�ME=��U1�[!?d��K�J3���`�h-~6ް�H'rT��H;���<6�eN;�gEY3�Ą�EfM�>i>���|t^�j����H�k
�]�y��+����� \�'��@��8R-�����fn/��<�ctk�%��"O�d<llD�Rr��p��z3tYk,)����Akef=ަ+Bd�Pe-6�jUi��n�(̤9���Y�����F8w�RMA�s��\���N���'>>F.w�'4��̞N[�<�? PV�]Nz�	)�S�09�l�h�m�
�t�?_���@����NnajH �I�2cBٙ�����^���Ӭ��ºγ"s���ie�>�R?I]qU*{w��?�Wf����i��;��7���������.s,/��֬w5�R��Șm��\S�&� ᶞcV�v��Bd��G�MV�T�^H���h~���Վf��H�n�!"l�q;�UJ�Uk�oc�>������##T�u+����k7�?{u�Vh�;O�.�y�r�f0w��9�F���=X�bq��ޞ��zE���,�c
��]��mV�p<�s�����s�G^��V��8�����D5�#�1V��!�3[��,7����P�-j��އ�G�[���V�������tF�U��}��];����"����4�f�L�;�2��/��
�k��'���Ze��4"7�@Y.��g�Mɧ�J���C�7��'�ML�ۛ�����h�p��)H��sBV6]�����B�['B@���8'�6W\]T|k��� '1�m������Z;C���(M��_w�e����xcˎL�c�xl�u�:.�o�����k��#�XT�׾�ߏZ�,8�qW���$�<I@Q�[n����}�Q�)f�Dd�"~�f<]�b�|1l&��E6�}�gOF����=@�N��y4���QjnB�̻�h��_Hn�Y�U냋K�Y�,�f��V���H%-��q�u�����~�MHg|����Mw�V;*�z,y�#�_ֹ����A�ӳ�c��uam!�w =��ۖ �T[�^]��֎B��m��n�G-�Pk�w�����D8�y!b�`.�߿�!��
m��|��A�]��?t��Nq]�YZ�c�
��|����G�6ҩ��8E�ݍ<��c萂�&��,Q1
"_�C�WV����t�<�:0O*ǽ�߾�ڬ8�[3���9��6�g3vp!��i`�	~i�H]��0~���"��3����]�e��W\�
]~iލ��F7�҉:���/�nC+��C�q�t[����(�#+��SɡAB�.e�B��ߍV��^�֭�}���'���W��/Td� �8�}V�JC�8�����sF$oU���_>�|
��Zo~����b#5��M�o���{R��"���:�_�����N�F&�B��?�ı���ܨ+�[�4�/f�U�j����l\X�y�q�������FP��?�.m����v'�w��W��Qc��}z�W�������X�OﺧuOZ:tF�~�I��"�_�*-�d�lq���>\"&�k�JɌ|H�����6l	�*fI����T�\S��>��c���K��r��k;����sQK��@b#�~�|�2.�;��/��N�*k�1X�i0O��}���C���s��\�
u���_R��(3���O����7�"�a�/�E*����Vo�%�Rm��*�Le��5cB��~����˕��1��kT�Y��1>:\�;C�m���O����Z(G0��w�T�Z%�B���}rej���WL����	x`�;�tJ�c�u1h�io4��;u�ߪђ��tC��	���b���	UF {YH��ib���/70�v�Z�[P�(~w����*͏E����	�jK`���T�U÷N!��[S2�I��2���ܪR��"�Ei#�<�t��%Q�DD��Ζ���7���@���%pC$1"�%�v6FI]�(�ϥN�%ϧ���{>QHwI� �`y㎜��>�-^{Ê�����Ȍq�16��~&x��-su�H���j˃����D~	^>5c�no�*����)Ѹ�a��p��6�>2�J�@�uy�0���_t��48���](����|���d���|��u��U���~VK���Eu�N\�����ĭ��r�D�=���Һ����)Av�G���$h�Ck�|�Qז����"(nXFs
�4��.�Y����oj�(}|=��� s�q�ȏfl�ϰ�Ȧ'���*T����_���郤Ƶm��B���#2���јѬ=L����K���C�����to����K�}6��4�ԴK�˞�%�p������vv߸�>#��W�U��{�?�KY��D	�!A������$��L��q�����{s;�������/B��D��1?����}j���8h�1-<N�����摣���x0[�:�7�\[Hd�{<~!�=���I�5=7`���1���[��O#���K;��&B����ѝ/d��c�@����6��~��� Z�m	��T��ł5�p
F����z�9����9��}��g{�����N� GZ��zH+����:G�R|�;���y	�$>98��2Li�-��������|�p��v�	륈���U�8��L?'�ҏ3�P_�R�*uv�>~Q4�� �ͺ�mw�_�>/���^\����hZDӕ�1[��瑱�^=��0�0��d�n/��d�f����%*5$L����e�����5!�"���Ic�숿��xxA�#����s0$�x�n�u{/����rߒ����Cf��f����ͽ!�����P�g��I�
��x�`�;�.�`d2Y̷l���EJ���`��Uh�k49�z���U�{F'�[��)�QtIZ�E���,ɏ��Ib�/����4�H�"(Ѭ�a�p��� Y��Jm���ʂ�O���M3���	��<�	F����N��K9� ��JC����{���e�?�w�5�Ң>����Ԟ���"�ٛ�&�wɨ*U-s���Ϫ�i�(��|�-����|��mc��~	]�b�k�I��.�#�\-\Ɨ�fݶr�Kړ���U����4v]UN׶E�V�/N=v��=fk��t�^�t�lt{���;ҕ�M�~>���b�%8�a+Iy*h!@����$T��$�Ka/����)�G�O �,���9�1"{)DA:�tC�r/�\����Yߠ�L\�m0�a"_�,|l]gYm�zA�;�$��pwˬ�_�8��b�]�$M��˕̩�o��i7le�r7l��SX4�+t^:(�f�F�U�<��0��ٔdۊ���W����i    ����s�����W<e�<(��x�ȵ���t�pYm�E�E�Su87����/��۔&�ߗM�	xiƵ���ZG���0��t�[ �cF�O%���Tnƕ�����N��@��鱂�%� Fa3����>i�n:!�w�5��O�zGagx#�5o��d:�"O�����ۜ[t�[8��i�ކ��q�s��.IY{hxdC�蘴��6�RE�uUD���sE��Nj�q�' wgMv�PK�M���/_�~�ۂ�YdY� �M��g�t�Ϡ���iΫ ���>���,���FA4�b��c����زX���s��R��^5�\��oW/�d��u�U(�������GK����$
�aS
`$�5�L%f�f^z���y�Fu^�:���4ަ��;^Ʉ4%�
����Bp� ����׊�^g�X�bkK簻�v�Q���t�������F6��#:ڊ�}%��ա)�|�(�@�}�pi�!!��$�9(��o�Ӑh��F�L�%U���B��U2���װA�&xZ�k8o�}�'f����_+p�g��0�q���X���vg�_��`�Ng���[����<�]wfj���6Q�	�H�s	�?gDuzY�����2����r�p�"i��KR6E;h�a��p�ӷc�<_C`cы,��m�|�K2��Zu��@Xk�@5�+����U�~��m��K�7�pP��=�F�m9o�(�/�yI�ͷ������d����/4*�nS����an���K���ٹ�l�YH��3��ík���������� yN\W
�:L-1r��ē��H�P�EDI<�	����zu���7uLJ0�B�ѝ���W��M�A�wh�@��y���qe"׭d�zXK�R!6��o�)�;��i�@Vx��8^P6b����3�]���4��_���lfQU�e�K�$�2�I(#�Tk���qN��|�?��<_��WA���1��P�������@��VnD
	u�ϞN�@W:�s����0S������[p�����s���P�﯑�uX��ޢå�Q�M,	ǎ�V����U����<��P��b������g�����ƃܡΦ�/ɛG��/f\d��륻?�q��i���5?��w�����T-��<W"��Kّ˼xSy���%
�8�Q��ڀ���*�WF��e��AJ��osh7��P���$�;��@��	��l�k��#�0m��Q�g����?kx�L�[��-;��0>�/��h,�!!c$�$P�y�t�����tpTVF	p�+�KCmwK�M�$ݴ����6�5=�5�����CXz�LH��:��=S���J���Â}��i�+>��ܫ��c�����b�I9ʊU����֬���-�9�!X-1 >��9�4�>���f�V��o�/�	��Ɗ8�q>o��q&ҏˬ5o
j��,����h�
�%Yv���E�疶Z��PQʴ �ZTvN%%�<.�������2z~���pNn2�*F##�͡�h����ٜVQ�id��M�Q�Iŗ�`���wt1S����������v�@D�@�*���v�kgS���3!�4ݰ98����>�BqC�����+���,bl�2U��D'�'�IԶ�Z@�"="c�n�+s̀��K�cdO�	si�;<�О�k&���x�QW�n���G���ᳵ��+*n�I�Џq��An�,e�Ei����(���5;�pU�I��8~S�B��٘�!e/���C��e��.�S�Q�bv����ɴ��5@g�Z=*��l)gPR�/��\f��Z�*6c��W0�*Ca�v��ش�~6�6@��u�Ŵ�R��È�O�����:q#]��<�Z�ά���5��v�4[��N3��Bh)܁g�=
�UZU���e�� ќ�Ηa+k��aRǖ� 3g��yN<��t�I�n��"h�����T��+���-ҙ�����Q�j=��5B������f�����s2�[?�X�y�_G�����k"�H�
�E}3?��_Sr����p�'�Z�����! �K$�>��<�Ab����0�)vWV��Y��׷��H���v��	��T�du~zxq�Y�z�/���g��U���pmz���\e��p��f������s8a�>؅�:O��u��V7q8��N��|�'a_���um\��[+�#��v_�kċ���v�������t��������)3����O���Z������'�4���Ɓ:	r�ˠ�w/D�]�p�ʠx���܌[w���tFRZ�u��O�<,z<k�:�ٟm�ƛ���$�mn&6��x�s�45?�|*�H� �����~���5^Քŉ�KԻ�?����P\�Iw���L�f���,�@����ʶ��|�3`
�Rù��0���\W�d�+WqtUh��'����%>���>���wa8K�)��b[^��t:�C�b��H����S~��㫇1����=@	Ha�b���Y9�8�ơ�_��(Þ�i�h�2����m����=O���Mo-�����~��o�F��Xz#�sW���a��$h'�.�֞�qxY�nb�����ڰ��F���z<��1lЙP��L��,H�]@\�/sX5a^S@"6�r3� ��?0Т�{��S�?�����Y�/X��F7�g?�\G?k�Ծ#�/��#Q�{������p��}����B7�׏]� �UN\�,G/d�������%HIB�{3g���Z�ǲ�@bQV�$8CRwŚ:tM[s��,�-�_
|2HǣS��'2_���Hq��:)�����p�pw�5�6@'�iO2d��<0z$.`������d��ʖV0ﬀ%�,�Lp�+�	8��S-"[(˚K';�G�Sh�VP�tJ�	�Y~�%JT���>�k��/x 
'���ᨲ�|��DU�Iԫ�(k�'����*U�,�&�����,�,9N�~/T�,��:�Ԋ��@U��PR+��cBH Ke��:)�R�QI�%�bK#WQrɊ-u^K9���D��l���Xc�ײ�@���U,�X��1
e*�5X$�m(t_��$ʔ=�Q�N��YG?'1�xE��e�|���xцH�����3��d$ϥ}��q9�tZ�x�wx������d�����x���W�:��P�	�a��W�vQw��w���#�DP�T��3��F&E�B^ר�5��DZ>i�׻��k��ױaK���=���N;A�D�������:Vp��ڵ\R�OQ�K=Baqі�Po�Ch~\�\HS��1���ez���ޝ��2r������v��V���D�r���:�|�uLZ����ꋴ>�G��>��*r�ʔc���ӭ|;q����J�~�t���	bh ��N��>�h�Aw�%�S�H��Ȣ��U�X+�5�u;��tK�.�R�1:����K�F��V"Y���ɐ������Vg�]�)�i�L#��Z���E��S��M��U欽kHMD�}r?�[���������k~��b;�x�`-�������Nc�N�\�WKص�Y�J����)'����޵���'�z!�R��Y�NQȶ�/���<a9}L�� S����F��'Pe��	����9���7�*sM.K�͠�\�hN_�М�_g��FÏ�p�7:'n����n��cB�w���X��6�e��	Q�U�
�a'U�.�B����vp5�:F�$ɑʏ�,vH�}�*@�z�����޾&�?W�pNB�c85�!��N�y��̳�t��N�\�ꉃ�Kɋʕ�� Nl|��x%Z}*�����b�R�J��X���9Oh��������q�w��:c{�j�����)w�1
��4L�}CI_յ>�����e���Q�H�r�M�{�ן���T�6�K�n�������^4U���UH4�����:���tH��g)�o���R��}5�W{ov������~z�ß�)l�fy�}�fGx%ː�c��7L@�&�X��G�}~�*������S��-	��P��ss�ܽ=nD������~���"
Gb>��N�p��w�0ۙ���*n�z��3���8O�<}�����"T    Y���6]�7�����s	l�sIX�Xq8]�t\
����Չٖ�bi�@���v~Aa�)�����<<��~��x��(~ �A)��o	iЦ-���l!t�xo>P$J֌`p�i櫧˞q Q�r�T������$@f)��dH���c�L3�j������H�h�/���C���,U�ij	�]{��b�yk�3o��������8Y��I����	`z�2����@��u0��tM[��C*d�X��8�
�q�p�Pd��	�Zɝ���T.��_U��-��j���� Z(�y��k�J�8Y1�&e��Q����.�uh���3NZdvҟ�ю}���������N��/%�s��'8�#��2����&?F��ۮ�%�r�gն��{�U^{��t���@c�ui��Jݧ�8�D���B��� ���-��׶�i��x�p��*�)c�\J)�)�y�^7��\`=�!���N�@2�|`"=��#����+L�FԚ��<�C��{�H��;a�2/bhN٣���ם���i�a��m8�%Pg��[��н�C��7��~I@"�LcS �
]�<���#���b�(\n&�s�ԋ� �P�
��et#J%�L���+�沦.��5�ƩRE��-N�B2����&H�.���H�*+�6$��2Ó�`x�4�����*�F^Ɔ.ٿZ���5&�R���JO)8��AP��
7w[4���a�����qJV��t��.��^@�K:�pj/��|�&7ެ|����D.8��/���9^�b�'���~���}�:�<v��\��H����d����N�amˏ���P�S�G�L"w*�"�DD/����&�s>�c?�*�ψ~s����r��ND���Պ���M���ˡ����x�V�����:�9c�����B�F'!^e���z�����,{���E��Y�+Ć��Y��kUe���������������yq8�$�Xj�H�Nn/�[��^g�~�N!���L.|�[M��BE��PM6��|�'f>B���.�����!���E=��I)�g6]Lη�����!n�^��0n�fv�k�K��]؆��(�����I�I���K#yN��M#,;�a/uZ��QAƺ��<��0�r�N�/���R!�GWx_$���t�s?5�F-�;I��j{_�Z2z��$���L� ��p�w��F�]�f�Ų�딄�Ν��W��^�:�5]Mz�/��ɇ�͂k��l�����¾�xl��ʽJ_�Z�*� Z���qoo=�"��o�8ˑ����t%\.�d��(BV�UlΨvQ3Ո�H��*�^0<�Ǐ$?����}���8x�ZU6�*ė�1,���K����%�rL����&o����A��/��jo	�%�z+D�� »�Y�\c���ֲϢ�=pHsp�EZ��`p�O�$z�����y��Q�����1��q��+	�@��z�j
ǩ����,����^�N�#!rO�G����g�识�Hu$�:��J�������T}�)�"��-=4�,ma:x�Eg�����Ή�	��YW��:��� �
�d%P.�'�ώ�D� �8���l��0r��,���y�sX��'�=gF�IK����[ ���4�kߨ
�ܝ���F���P*�����f��Z���n�X�������+������u����(����c���>l7��v�Y�y����q"EZ���Q��k�fD�،��d�@���������WEa� ⩌�k[�\�RF�-�;l;M-M|רU�"��?��3h�+�)����ئ�✗<�k~4��fr�n�L7@���hN��O3&~� l4-���?�~o�>k�|���*�,+N�������#��>8:�$Y{��r�+dY�gX��"�a�_� m���~ҝP�t�?\���������<(-:��̝'B�@��W�g>?��)��������?�:��z]�ja���Y,�r�S����i�)ې�ߟ��b�睮%���8&���m�y&�V��*-e
����$ӛΜ�ʠ���AD�!��'S:�|�_d�JՂ}~�HJg\+��-6G�G۞uèᓖ�E����W��TG��'����U���N�[�o���7�]��hF��h��!�?���3�]2�7���{Lr�Q���0X�B��4Hy�&�Y���?6L5�T�R[ 2�p�X�ϏWh�6�N:�;��8�܊
�KnL�/���e�[k��Hs��N��4r�������1:ۗI�o�%��B��f(Ż�]�&�9:�	(��uѻx&/�����Gg��n>�8M�y�HT��s�0��o�}�,��#��aAD�R��A���U`�R��D���+qtu����f{��E�WيK>��N_?<.�~=}tv%��d�t?�c?��8S7|��7�	�w�3���ȁX�>,c�uSkJ:�A��P�����B���;�r�x�Ψ�ٸ/�H����]����1�P/����r/�8�zy���߽�X��T�������AW��1�ͼ����6@@YԵ�t��a���l̸~E� ^Ȳ�f%S�o��)I�`�B3"`]������;�������Х=�G�@�pw��E���$C���'�b�ɟ��,[T5Y��a�JGu�y"g�J߉<�s%�<Ӌ��1����L`��l�n�X�=�C�e�L�8cV
A�}Kڟ����G�vdzA""M,�\�g�(�DT��K��Y�wo�H� �}��?����������*�r��O]���kk�����視^�4&��Td?\�>v����WE�m�K�����:n�҅�u��.qod��	+�\�v8�~�e�0�L�i��[˄���O�aQu��Т>��$Cb\*z�;��D��b��WVn(T���D�T-y������v�Ξ��M����V�_�"|\w^�HL�h���X�o�Yn�y�$���������g�b���q��e�LI/�!j��ˉ+r¡%�!�������$��<�y�\	@�l�w�	oqOw���f���J��=-
$C�;]�ۃʊ� <v�!�Hb��c/> �q[�M�Hp��H	����� ����e���'�*żK2غR��KA��K
5
���j�o>\;�澤˖lh:�����<o? ��%��V����1����<kx)��g���So6	�\�l�7q�Õ@��H���	�jK`��Z�	HGZ�+���;B�sX�.H�G�P]C��m����in��F^n����Z.�Gc�̗p�n�P�#Iعyj�r�P�K�O /�o�q���љp���pyYx��Z��	,�J!�LY/���%�����#/�~�9J�j�p�ZnX8���y7���f�/��@��x�qI��ZM ~S����-���Kt.Y��l�g?�Z4U���1�^ RC>�{��$�oc�K�O��Mc�B��G�5��y���5��:@1�����ɻ�պc�̂�n @��\�����U��N��H�W�#`��)��n���ܤ�-/��.ӚX`�4��%�06�'�SKR�:TQY����̨�V�Q�4x�<2֎]{})��+���Y��t��ʛ@�á#�4[1�4��<N��N��Fx $T�'n��4vn&���$ts����(�ב% C���a$�����s�؇ྩ�{��p���	�杋Y!�m�z���K�ӓ�\����<r�㏚��޻�n��?�c7��A�8��gW�_�塒}��x�(���Jч<h��#*��c|L�Q��g�δCѬ�I���H��m���Y/�Z+U���;��ͱ[Գ_�P�rB/>��9��ߓ�tAV�o�n3��,�	��4��?���n�ᙬH���q�W�J�.�m��8�a�kO�
���W�6�<�:�e�C�Odb�פ?&E��T�|�}]�ai�1�	v���0�	02p�}���>��2���N&����E<���;ލi��m�Hp�G��E�=�%���\�g��    �'|ۖ���� ���E8��(�"ȕ.�S�,3�"�5x� |i���}Ԁ������c3��ܠi�n=��T���܀J��J�d�P�р/O����C�j��Im�yM uZ��dZD�����p�\��?��	~��L"}�8L#�G��@����'��ntbg�,�D:��F#{�$Zbև��Gr#�S+"�������.>�݌��(���i]K���ÓH:+�� ]�����M=����C�Z_<�ܜSFѦjT+K�2�,�T�py��if
��C�-�D[y��j��גS��\uj��(��	�b֡������%�VE�<$�^s,][�qs�X*��E�^{��i4�J-��ACgH�����а2l�����5��Z���^e���e}�#��$H��;��M���0���!�"Y8��&N�B<",�6N_s6<D�hL������|���D���B����'�j�P����N���]���M�&ǟ�/
�� W���}�C����픴�E���:��S��Έ��\xdʚ��B�;���|&��E\n��~��>��n�3����`�[o�� $2�,	��lS'��_�(2�=�w���)).?ю��u�Z��3qh9u1_I�<>n���a(�1��lC0��hps��������(��z�pRc4����ȵ����[D���`;�/gB�Q,)|�wkP�o����7X��5�yl�%r�Ab���W����DA��ÿ,�bIE�P��!�<#�k��,��*c3G�r�'�Q�~�rg�Ym���� ���q�GF�Ug�d�4%}�>�e��͆��N��v>si��Q�N�փ�!������T2 ����On`E�,��`i��^v��Z�S�_��]�	ݳ֛j�8�(�\�&��y�l;�К�� @L�	��)���/��FE���m� �z� �6�Y���Q��������7Zf��m�-�h���3�} !^յ�r��:�-�oa�?��|D%HT�2n?N������U<܇�q2�v��7SkWxP�e��h��C1���^�C���8��B��|���V���`"[1��\a���>ɶ��j�7s#�>SAP�B%�d���l��՛)8X)t��� iRc�����q�Ho�f���ֻH��E�T�z����'P=�o�L����e��UG�ָ��\Xh�F �A?;:���|k����o��:[y��T��l����֠��pPh�l��z�2�	]p��Z���)��r��׋�e��l���������_g.L�(�A+��~�<���=s2/j�Lb#��Lts1�$��:å\�aoUa����Q�|b^��P����mM�x:>="��4��W�(�6����L�%�H�b9;S�(�LH}<v��ywa��ToRԛSsBݥo	ޫu�J���ږ_Ax�<�b�ܾ�)qA�q�6c�֗0�+e &�逍�k7~�����cm�-d��-b�����E�4�A�>��o�4������Y��%Lm�`"E����W7���q�e�
���}��̈�*��9���	=cJ_xZ��`�lg�5�Y�Ҙh�܇e�2�w�=��FK���jn��jK�!b]����e�����4�,B�,��(����Tj�P	W��H.-�|�|���(-�U�rU��Ԝ��#��b�H���o{<Ɉ�t��}D�"��kBm���ؽ���U:m����w�D��A�:��}i�[��� R˺�/h���PՊ�����'ݲ��v���@ə].�IdҐП������x���g:q��ז��E\�"���e��	�c���D>ad'w�Q�+���gP�v�8K�t��mx�Ĩ2���?�K��<�E�nf-�R~������
�l^E�X������~��42�"��E���wS(���Bey��#���{���[���|k����6ج�ҞE��H\
��ۿ����ۏv
\%d��'�̰S�*N*���yzޏ�obũ%�T�"8w�%��@�:���=��F�ـa�x��@"��uB`�Gw�r�1�o|�L��D`eq��|g�"ς;�!�Wj墬��\@b����"�������$;���{�rQːDbi�]��4��߽����i��|h�kۘ��ĭ����5�nP�O�s�_�I5?N�+�#R���f�;>����
�k�W>�,���A$DA
�G3���vt��K����L�/�Ӎ`��]���'�5��K�	G��{r����^��y���}ia���<
�����j>���FH*⢟�g��jE�<�HkF�ӈ���k6�k�W �Ti��̡�����	v+��9�a�J%��4�M��%��&����D���r�2d����Ю6_l�y�r��4Sd���
�
|N]��02�X��6w�H)�Ѓ���2��I²�^c}M�v!�rƺ��Y\����rϸ�rpEUzS���]��@�m���r4�Q�ZP��*�f?�/r�ﺲ��~�� � �������lH��̮fS[U$�TB~\.�TU�w�W!e�la�������'�����+N�5o6E�	�Z�����a@?�y����:I6âɊ�&p,����5͆+�#��{^�m=c�Dc�2����"/��ER���6�H�\ِ���"���2��U!|��'G��E5G��D���V8X�:���jA
UU���5�U�$�3TZT�_#�
��JY8�VC�;#�UtQ%龞
��m8�r�z;o+~�p��C���U���I��@�k�&rA�\�R{m��6?��2w�����gjnPu��Q$����jS����l��l��u���P�pB���GE�i&�Oڔ��*3N5V���������[i�o�o���[`��e���2U�(�?����2R�NW�n�H���#�h��9�=e���ۇ��nc�c;ۚ�S��w�4�0�oVh��%��Q��N��_�f����e�n��2�t��U�A�Cu},ؠ����`������+������L�f�-��}`��i�q\]��"P�,�݋cahSJ�>At_jRmV�Dx���#�T 4K�`b1e� topZ��u{ҕH��af�s3K��;\�XG\^T�s4Xd���\�Cf��؈سs�Q��-��M@��2tG�P媂��{x�m"4̕�S.��K6��6?M�滝f�+&�Uts2������K��y�(Ӽ~���*i�T��G:��|�/�D]�D��S�����2gs�O�& 7ݎ��ex����	Q�1�6�����!�LMv4&����{Į�ج��Q�]��q���n��1;
@�2�~C���@�vݍ���O�\G�A]aD0!�#��+0���� ��n3⩻����>��q_�Q�P�to?��{��!9}������v�2'9v},����m'���}y��7��A�hڎ�M�_{YyO�"��kS;��̆ʢ!���3w�u����\�$�,z���v�$�`継�1���37��rK.�����V붞��!�~�^�����eH6���'���d����/�/�
�ϣ���L�`��ʧ�Ώ����VN�4R�Q�K�YI�� ��H��K|��	9HǽOF���b�u���d����t�0U�������~�c��t�]�kZ�U�7�y� �!!�(	��h��e���Q5�r�3�ۈ�J�H8�V�"$#p��$��e4����D�f�R�y���K�#�ctv�����H	�����f�7i$ߝ!�>�+�����6����|��+y~$����b��e��3[��Of��ɾx'[�}��]pV�.Ly|�}3!��|:��_z0��d$����Xny���pPRP�A�vLj�A4hY�����-HD�38�|0��L��M�%��-a�G�N��j͵�`��l�b ���95�g?8��2|���(4J.#�E�?�p���h�QŶ��!�jK �jC\Q�Q�������_\������Mc���A�ѧ����t;���L
Ѫ��3�����:M��6ȪL��c����\�/4�+�5Ϙ�p0H����R����Gq�rp6���R�    �sy�c��0=��7c3'S�9}����7��Ŧh�&"a�{D>Q�@-Q��0$�����5�T�ˌ�hkKR�������+�����{V��.���,�jZz�JY�� ���396�/�_���h�4�LU谂8�,� ��	��_�ˠ�TNJ]B�:���[�џ�?��^H�8E|d�-� ;�\}z���<�Ncu!f�Vb/�����z������R���Gsx����u�l�B���ޟ�7�Ay�~���ǎ�K.E .��0��]\�
W�wƛr�u |Bj�%�v)����1\�4�鈽���k�j��6Kԙ6�����H�7�%4"�v�zsN��-�U�W�E�Cf*x�UdL��4��~SzO�������``� 2/���C$P�Ɍ�2�9�	�ǥK*^��PW;��sroN&�J˴:l'(��u0mf9o���'��g��O�yX��[,���@j�2����٩(� w��V1l<�1.�P$�k���e�$�|XPg.�ˤȳsE&n�c���!uj�z�t�a��WT�y<�%b��!	�`"'� ���uE?#���1�߈�e��c��T|X�J����g�*Pռ:���tE�3���_���mjF��]��5K�L͵��e@���g��h�zo�bAqŝo��/,� _��g���$_e(��M�9���H��X�:�؞X��<<{�q�B�HG�	C�aҸH��-�R6((��
�ഥ<�8"1�@ �	�)�K��dޮ� �����ؼ�j
31d)I��~I��(��~��iS I�@���v������n�h#$6YJ�XL��"�c�|t7�[��Y��������{q5i`�@��)���*V�D��~�`*�:�����XM� �7tG[�-�(R{�mp����rE����~J=fXvC?�Ӿޛ��d�.��]x�'[�g��2,Qn���@�E���oH��ӝvW�+�i��UY�����c�B�B�H{��,|"���=��;4)�y�?,���������oʡ1���eP���
wG0�S�,w���7@�<uE���a �]������2O�����\jV����"���O���z�"��q�<�k�.�֤{2BI7�Q�e %�Ì���HR�T�@��~��D��PtJ���IwG�^`G�pQ�UIv34�n���{R[�K���*��w��B`�?&�(O������HQv�GNU8z�6�iJ�񰱎ι<�7�Z�d�G�g��s>w�M!��)0Nq&�v����G�Co
�di{vJ��U/���;��A��?t���NR���������R9}ҵ6�t�5{�E������5E��	�GIk$v�Tu��檐I����V��׿�;2,���~k��J�c�l��{�C0�v��9��3�x�����{�ģA9���"�jk�0X�`��H��ٕx�� �n�&����&�׋	��D�s�^�g�%"ޮ�Vc�z�_�H{��F�4�{�Ƿ��㯖+%����!2o��T�p2t�]G�tҬ�%\,�8��r���&�A��Kop��,nj�׎�>l�/��ǳ�:ҟ��K��0�&���<����_����U�OC�!��KJ��B�Zt�=<'(���[�ȳ<�=D?m<�J�X(�v0pQ�}`�c��9^��y�ڏ��ɠC���X�N�+:�Ǣo<^5��æi:T���J���@`��������j/mN���2!?ݭ_T��ܺ��I"�un�4ǈ+ʒ_��m��gjzr�T3N��ڨ���;i
����pm�_�m�t����6
�x��W��P�u-�����#R�"���Rx�x��QD�<��a3�vP�0��J괴5��ʪ�dk1��n�\7����߿�l���Z�ea?��[��������C�Y�1�ܮV�݋O��H�J�����5ω��|҅���}N:�X���0��Fd���V:��JEt���Ze�l�:N�xT&"q% qwߜ��3[x&|鶆@V�qi��	͛ҔDؐ�kC�?���&�d%Rf�)�Tk�)�uC�t������E��ѵ�~��}�uk�R��5W��,�����s��#�zc�隵����6�$H<�%QmnaM�toC�ԑa7J�7�cZӀi���	�ғX���M��1k��k�^���ⅼ�"���0\���f/���h:���rI���Zj���tx2N�����#Rg=�]�ﱁ���h{3��>�f���(X����fy�� +S���������r�QV�v|Mc��*��ag���"u�MB$J�Ճgp{[���ɓ��AE[�V ���6����2�h4��MZ��N�KdN���;�����6ꝉ@rzD�ɹ��٤uh(	9R�������g��[Ol-�����c;��.�4��'T�Ǯ=]��\�:!�R����a�@�f����r�W`%4ݞg���u9���<_<"t��K�Hz�ҹ���ؒ Ud ���HP�����;��VI����Sq��	���
~[��r�;�OmRd6iy�(��le�ߒ����y��'��I��a4tx��$$Ryx�M4o����=������D!#��T;��<t�Cׂxpi�֭k�t��vV��#QTy�\V�vDG'C�(~�l���\�5�͹$�7���$�Z�\����Hg�.���$V'�z�[�>��pR�-ܔ`�d�]OZ�(^�i�܋���
|�<����������3����40���pe��%��i��t�*t1���P�輢���85<b�8��T�-;�$]��f}�4K����v���������g��=��b}k�%��������e���,]��Z�C��Ro�;P�/��O��e��<]�=3��\�g󎃡=lH��C
�#e�E^� �jIk��L{Ps(�Qنa�;Ī2��9r����*�bs���-��q�&�c@��:s؏J��7��F��h� �U"`���s�"K|��,$o�gxQ�4���#N� ��|��Ŵ#QJ~Ո�0�\m��5�����-
_ܱEB���L�	�Q$U�*�8�-,p`�r�h���)��q�M$�>z����g���WKR�q�I��Bu�n@�]��R� 	�8�!�	&��S��xpN�4��L�E��gx�^�en�2)���\XP<�{��OW���?-���h�PڢW�S�϶�J�x�쏾ÁʪU��2.��Wݵ�pQ��b�Q�֟;1:"�v���Q�:�>#&bx;~^�[M�"1����=��.�E^҉��=�]�����;�*�����ˠ�~�1��cȲX�0ś��25D�!g�(���d��
Y��w2홊i��نu��MZh�F�y��DR�@�8�׽E��F�Ţ��W�?���1���	���<�Ws\�H�\Ԍm���,����~|��%"�T�f��f��3�~XUh�H����� ���Q�86�_b����I1�h�e�<���2g]54�������Fp����+�kH�[�!x}B�5q�����R�o�$�P⎥m�ެ���)�#�tp�@�8�-�����ym��rd{�P��������ˤ(��!�|Bl湻��#�~�F�Avh�=��D,ѻ�WϣD��:�[� Ȗ��_�	���ͺ>����ﾃB�ܺx���@Q�)���E=�o5Dh�n �`�f��ȃ�B�a��JR9���V�*���FW�{�iaל/���i�gǙ$u��NDX�)^������]�l��*d�hrK`9=�Ag��M-�r!�|��M@�8�t��@C�9�� ���ov���-f �c����� !b;(広�o o�s�G�tkׇc;�$C�9!S�×K �Ys�o��� @��q�臑�ж}���#)|���d�<uF�&�ݼz�/ϻ��7q��.�0jl���|��-�<����K8]�+������&�h��j��X�A3T�M�(B���z�u��5�<������?�J�~E�y�%5����	$!�"�o���    B"E.pE�vϩ�}��4k�}�3k.b����S�-�����ӂb7��.��[m��6R��8������{IEd�5�VH#������њ��*e�N~$�E���l��d����8`ۣJTU�K�Z��f�[�v������9:2��S:��%0�o�d>�t�6].�U\U(�%�Jݝ�q�e�a�u4�u�i�B��c��HwO��%[����M�O�,�;*x,�;Q��??�����}�/h
��5���@@ �u�]Tj�[��������ټ/����k?q���p��(\n���3��?G��M�p�6z��D �*�^�Ī�Te�\�D�����)2�z�+p�&�hΆ�&��v
�Ō�ǵ�P��(8����GS�(� �N���89ZЛ|��
���r�#����b�UoB�,�I��2g�2��j�ϴ��n�R�?���kX��zY�.�����ˑ�Ȗ��Y�/��ݖ��m�1"K��&R�l��9>?�� HI����,U��ừ�ڀ���"���Y,]����cV�M���h-��8�ͣ�L��d�%�؅�%�L���UD�_�3H��c�ހ�ܭ?=P�}S�c�y���ż��<<��eq��^��T��df�(m׀4}6#z�ر�1�wt��e�;��P%v���]��~�{ӅR��V n�'��c��u�����>4ב#tc�`C~� Q
�O�@�lA�U�@�-��u4-���*O�a��:^݀���P��d���r�kn�������f8��`y������o3�.�ؙgq4�g�h���Α4v}z�E�5rs�������|n��"����X��m�N�m4I�-��h��<������KR���B)	�����H
{�#�j�6_�߃;�W7C�^wx&:��\�f��:A�t:�]��2��d�ԕ�2��~�A�^�c�	>$��C=�=B��c2|�g���9��ګ}�&��L��kP$pTo	�W ����TH������8|n3G�0P,�_r�9��^�n�K4��
3h+S��>&wz�V0��row�X�j�h׻���2��o�n��f'��̏}H���#-�����~$�c��|��MP,�Ĕ��\��_..�S�����*�U�(��r6;I��!!E��k��[�҅�m�#���cVCO�,2�'j�
*��J�����#O`tӌ�e.| W��+jf��~F�Y���U���.BX�9�an��ɈF^;6�~��F�x�E<#c�آ�ǿvW:\J���u��E!%CeV)x���� #5�ⵐ6���P��D�"a%_��@O��h���r�)�t"^�ټE���plON�T�*���Z�y���ڀ������*q��[���Gbp��"}f��n)�=#Rd�@���`\�p*���q`y�q�H��c��vf���#��XE:/��z3=�.o�h6/_b�i-�;���Ocb����q?�5��DPc���?G�8�<��i����"�y"̀c�L�y�t���5
:!8(,�M�|X�����U �vj�����en�)}�V���cM�	��D�59x)���y�7@����j���)��u�zwU���ƟP3z�=�{3�:�-(��ޱ��m��zﾘ~�]����6���?�n�	�?��'R�a'"�?����_I��/[�ԗ-J��NgCum���7�H�&t�pIZ�g�|40O�ww�\����UvMJ,7����g8�9��kk�,�*`Ѹ(²?,���+��� �����:�+����Zw��͞/t��^`�j� �!�&Rƶ=v�h�tKgi���Џ?#���hPO䒯�MO��q�1�v�t����bSz�:�$�
R��h{�6���#�/*(I����3�O7�:HE	?����g�&�^U�<�������1�X�X��6[艕�4XVT\
y���d���4h������p��y��תvve�-�z�;�e�N��K�8w�p������54��e��O�H��C?��c������y^3�14�Q�Ӆ?�E��b��L��0�+�݁Gd�v8C�
�\=�/\s-p�y��0�h�vn�A�{;�"��+t@Q,FF"L�]�y��w������\ �#ۙ����[�=��3�؜M6�L���
h���6
�G���/���M�8�XSz;�4hC �l�}�.�d��50=�1Xқf�� �����y�B*��Q(�l�G��p���w�\��w����c��])]q����A����:�N�v~��O�:0�t7E3�WvnzX�z��ؽ��N׏�5/�;�3	߲���Ⱦ9*b���Zx���(C���4��QNg��օ53+B��@�n�y<���r	1\�
e� %4(��D�	��l�_�����j���:/R�"uU�ƶ��⸍e��[���.������X�e���ǃ4b�l�Y�m[��{)H��J���t�X|�]���W�\�PE��X�������C՝�>=���`ΥsI<D��u�����OXH�G�`]1��+���݅>89?a~?^�G?6��:�>u�P�V���n���
�x��~��t�t���G[D$H5�H��P_W�Z���y�9�d�����$};kz=�gۡ���(Ы�Qк�f%*�!��#�q���څ"\�J�s�\��F�e� ��&%���5ȖI�z|]�8K�5�������(C������b6>��+Po��?��m'nd���G0��w �o�h�,��x�_-�e��M۸u�.�����X�yʓ]��_BêmkD-�Tr>I�Di���n+#3�kc��i�����d8�n��N^jxm���UhF�m̻���Y{�8)��VKod�C0�߈݄q�V<��EZ�dh!�w��{m��u*T�ϱ�ޒS3�.��o���DLJL���Ȑ����ti5W���c4iD���5�z�q��lQb�b�N߉9�'���3~>_Nr`�1��nS�U�H��[N�tV��Ƿ\�5gys���/��DC%]n,P��m6ޘEX�C�#�X�E!G��8�ݝ���.�O��A<.�D؆�h�G�zݼR���Caj1s�Pb7����jiq�vl��#�����D$t���>s�U�$\�W.�ٟS+==:X�^����،Br����>4"[��c���cdY"x�*�|��V&b�M2�Ҵ���y�f1����	�����hEkT��;¯w�X%�W1���x
R��
�"\C�����Ϊ����$�8��ォ����e.���Dr.�	��c@$�3\:�Wp�)�
T����о�Ei�hP�,E����U�!L�P�]�E��e�0C�q�]6�*�I��S�Nmo�9������M������4�Q��������Ƕ/���b��I� �u��T���f�,J���'�(�:xf`�*�n	�o���F�ν��9����(�pUw�%Z�(0E�d-�T�|뚶�hbl����zj� `�Y�����?.a%1�+��w��t�䷱SW�S�6/�:��Y�N�!�۫á�l��#욻��R.�t��z��/�%L�[��E��Ŗ�[D�^@ �B7]���#�h�\�9y���$�-&���4_�3�������9�oۃWi�s��bP4�ֈd���x�rqT�����;���	�d+a���^HC���°Kh�����e!�eC�^�
wm�Ww&���>��+i�s�lYM�6I+ i;t���u�;�t��2������ޚv���|�d���kث����g���GB������j�KA��������q��VѤ�p�i�{9Xs*��:�m�|��C�$QC�附��%��Z��W1�����2_��-��lDP�˃"�!T���g<")�H�U�u5*�6���'�MD�	��n�I���9ℶGM��c�2q���vt�0[nRk�I��'�+A�tP,�!�nj�bY�^�~BY��AWpU��>hk�(k�ǆ�DF�b�[M��o�T�L    �жu���鈆��F�}�2DJ���L"����!s������&"�(�ȹ�}#Nv#%��3@3��e)�3�.�C4jl��C�^����:Q#�8~\���#�����_w�(C{�w#��6���F6\�Z/�E/�U^��9����K�N"�Ai��Y~y���,E9��]�B����ߙHȪ�J��hi�������D�}l��%���c\��Z�tv#�v)+ͱMC+8[����ݜ$���Ԭ`�4�`E���)���g�lb����Dت:e�K�ߡS��WTF���lTf���L���%��G�-[C�w�[ԯV�+�H*��	+��X�����ITEV��Y�����ɥ#N1��4I�\�2c#�cL�K��dX�9TV��Z�P��NO�����y�{�I���M�d��v�K���6|%zdc����_�����mI�iE�*��/�_�8cđ8	�U��O�7�N��U坑d4rZ�:Z�R\�ʼ�euv��à�_	Zxu�i�����C"�D�؜Z�p;ܼ]Q��]\UÇ�q���u�����a�랆O����7,z�N0^>[�).������EW�O:��5��o����s�ze�'p��r��,t��#FV$X䛖�6A���#A�TͰ���)��\y�5�m���m&0������v�|
�KZP�a�NV��
{��/�i���Fe����J��d�+p�'ĳ#Ig�A�_����2���o��~eM�zo:C�&2�ʫ��/��F���;���Dj�N��&JWH4d������2S�k^/4��A�������G�2��wԱo|���	"����������2�@\�[J{W��+%�*��W.��18��U
�"{.{�M��y
���ªH�PN�����&ƌPa9�_Eᢪ|�Hџ����.�Gr#���\!M�F����4�	)��ՙ���j��P�6�p$����]x�T�Tl�����ou��쵰<�d?d�˕'��^�0�Wΰ8%f{��C?ؼc��_#�1�sr�>~|ԈH�C��i�W����,��g0�V��p�� Q��(؝��=��9�#D��mbu��n&���7�:r�z]�̴�5N/J��t=����i �!v#�f*����ĵ�{<Ow��d�֜X�p���1{�$!I6�x�����q���.��_�27���
����E�#�>G�8#���T��	��nz4\N`&R����㈺����3�pҤt�.\'�u�8����~��C�ΈŠ��X���)=��Ӿ�v<��[�;�|�X�0��#/9p4D����N��o+1�K��>]:{�D���|e��D`wi8g��H>�����E�%�*�@̌/r+|fO}2��~�0���"z�E9ϻk�`�jX�o�]�²uX����fi�5�6��L�,�j �&�Ř�:H`|M��LXE��^]�-g���^�	���k�RZ�Y��2ϳZ.� ��m��Z� �W�V�o7�<���g�.�&]e%��0_�?�{����AK@�PK{ ���4���G]?���,Qy��{�7����7Tn���,�|yH��Bk%lx��v�����R/X�F�y�Aq��j>��z�38/��+�o��s�E<uR����i�7��d�K��fn��i�_\�bQ"a���c	�ڹ�V�y��)w��
5Pf��gt����t�|O��/�¡�a��$$ݦ�%�2�U�n��G3����,�C�wJ�|��}|��á���l��=�d&@O:޸|�f�5
l?Β��ܢ8��
�M���*͜�����&�Z��}�W7����O�e�;=�.�gjBFd�jѮx���7y<M�tQ�L,������vp�Y-�C""Q���{ i�[�k2^c^h�D$3o��*���d���R��~z�S�&�F\�aY����Bu�W���I��Q�)�R��z҆UIY/�k�lį��E,3�ܥ���g��c���#u�b2��7i�m�]�v)�����������V�M�L4��WV�v�����Sϕ�%�li��������pvʊh¨�(�<�����&�u�M�B�&a��]�ԝ��,�u�f5I�
~����[������2��2)�|��I+�13���ƍF��g��]h3o���`���@F�a����h^�]8'�&��q�|q���������9w�W��Y�����N[x0�}t��D!E���'�S����k��2+!�"ŽV��z���Z(�V%�@z���7�~�u�l2�hWܳ��J��а%�c��+I��U�L�(��W�u%L��ؽ}���9 hکZ#���l��ވ���7=E�
2��K���Ȩ��kyjn�A��14�� %��o���nèJցh����ޭ�sŝX��������Yg2��O��~����%E�ע�Lx��P�D$�v�;��s�:��c��/w	̢�r} ���ʬ$�?����bw��0ɉ���e�w�ߤ����b���v�*�Ñ���(���IHt�
hD�5$f3]�^��CD�����4��
����a7��	\�r�Z':��M����=�9�b�,�&X�l�#¹+��Vd�6���m������o�<X��N��XHTF�fv�5�^�1w�Y抪��5��i(M�_H����u�i6��!��W�k���{�=���	�T��/���R�1����Y)s.�u�$�hn� �N�be�	�\�$UyY��k��ړ@`Yyvz�W�r�0�n�g�hzl�e�uhz�0q�"��߼r@	[����MJ<*:��H��ˑ���ao�j�Q��{��V�/\X�E��SF���K��&�pH��G~��/��C)�v:/�[}j�|k����׼t6B$}�)j�q���S��nV�b���A�NB c��0_��_/g^�<��P�G"�Y�B#�Ï!�4ʜ�LH�<�U��R�[2������m⥑��1)�X�_[?"Qy�Z�c��Q2���y�F��7����)�Z���S��$��:-̸����/��I���hO��9g�.9@.$J�͢�W>��?X��݌?u�i���U���C�Z�\k�M�����|�ĺ
Np)g��L�3�Ε�:���GX�����-�s^�)T��>7���8��F��JDx�e�q2's6W+f�Ex�9u38O���i�PCk�$�j����*� \��ѡ��[beh8��z��?4�XA/��*��3Ӡ�[�e�U�@�2��Ԍ%�ꗖ���T��v~Xv��������\|J���%�j
���Nc�ц�j+�Os/�1�sD�c�� گ
k��ܮ'�u�4mw�:
 �,obɈ��q�|���8�c��Lx��I`��O#��*�,�f�
v�������qK�Hs�ϘL`�޲�//��fxcEE=��;�����xGf�̐��BD�����z BR�&|��ݮ�\c��'N3����{��<k�D!a.p�9S���R&��z�	�����к��K8�RYb\{K�S���\qz��R�38R��zċ�AJ�m�W��>+�X�Πz,�L I�\�KQr�W�VjE9�4j=�ﰞA�ݲ�%���5%6#8�>�˲j�b�TC�5��S�6[n%�H�PB6;�@&ڹ�c��Xe�eVo� �'��y\z��d4"P�jw���>]�,#2t̺�W�n5+J]?�S��W��W ��F��=�i�]�bu�VJUJgu�4.?pi�a��VT�7�_v��v��t
|�#�G7���� �`v臋G`c����m
P&j�fM@��꒵�j��%�H��Hڨ��A�]ڔ��>ƕ��a���ʉ�_+LTQ�5Gyq���X<�q���׏��72g�oƪ����C���ɖRt��Z��;v���U����Pe��)����	��t��K]��k����B�ֽ�*-מ#H��39�@5s�A&�'[x9�?vV��g�V��MJ3� ^�q��Wć�c������s�,V    �>4I�yD��3,�g8�]?��u[' "��e�E��D�M*����� �������@�e阎"� �il/'���;lQz!�'��"zf�xu)�:�<�Ub&�v� �*<���~h7����t��h�"���ݰ�χ�HD��T�e���a�,���G��Mx�C0x��0ctМ�Kڭ�5L��q��?$����9��LG$.�R	z�c?-����J%+�{��'d��g�}�7[�
�<���ɞ���o���4qVRpتZ�z ]gm���TŊ��DF9!n���zy�?N�g_�XJU�t�M��#x?����ؼ0�@�Иܖըѵw��SY�X�F��sv���O� ��k�&Y@'�ig���8Sɰ=R[�����H��-S'����� �N]8m� ����ɛ;������U8�+�����do�5��\�IV��n�s@x���ѥ�"�i5)
�`�Oz����A+��k�З,)���-	ݮ�4na&�y7��H��?Z{6�]��dM{��(��R߰
�S�Ϧ5���/~���+V������/b�_����҂��: PT�Ȭ��&'��{2�B�	�� $�����R��}O�9�s���^�E+zѠ?����;�r����^��7�}7������k_/��e��C�:��
����}j9zVf��P��b�3d��9Z{�H���I�Ģ�r�wQ��
J�����}�2��$jq�е0	�����*�,b[��=|��a0��h{*+��I�Sgi2�O�)��+�])z"U���W�9[�jU�\�v"O�5�+W��
-�/E�|�񌿌�@�Rk>�
&:/�hycs��cݲU���6Sx�6%�U&�̽I_%�qؒG�4�<���6 xV.��Ö��5�R�V�0Kk���̾�l�۫�Vl�Y��Ҽ�������$d��='4<�_���0�,dBW�������D)$/�[K	(R������z�7Q�
�<��Z2w͛���W�N
��F��'� p���tY���!L :"J��="0+
-9,�*H���n�P���$��33�~"�rln�>����`Wr���km����g����bT��{������J��|�/Bk���<>���k�]-sԺu�-Y�D=�7�������?��(~�m�m��H�2&ؙ�*8<6_�o(�?�o�Z�;J�님h~o��NN�{���,}F�U�MH.#;'t�%��5�֭�u�����9g0߮�	1�ߋ"��?c�
k*M"0�^	�U� ?��̑#V�Av������������םf�W�^�K$�8^����,MXU��mM ܆A�����o Q}��H�:1���G�Ypv���DL�h�B$=���m#W*�z�q���)��l�.�������TW;`�k��{�u�a��j��Z�څ�L�*�kMCf4����9w��kb�Bp��16�;���(�A!��8p�kңu)��s+�>z�o�ې�����*aT+�V(̢���W�]���U��/�~�@u�}h�z�WGh�I�e�D-B�О�]ǫ�E��>�e�6H�P8�;�A��n�:O�[l%J{c{\9���^����ša�����v_��)V�����ts�;��-=���h�(u����'^�Z�K���Z�s�q��|F�4��L�qA��X/�dhl?��2��q�j,"6}�Z� Ѻ�_j^-s���� �L/ח�@�{���^�� �(Tno�9�hȋ��t���d��D����w���`��6�j�' ^p ����i�G���$�=�&..�/�������H�Ab������X~d]��%#���qH}���W=&mJ��;!;]M�`�e�g��ƗRU����{��c)j��(wbR��c��eY�S*�B�{���Ԛ�|;l�=3D��)�0ֿ��q��GV%<}Br�d��GG<�2'��1��T\�e��X��Ýן�y� {���B������̖��zވ&I�"/Ǘ<��&�� X��~�1��W)d�BS@WM�ѭͼW��x]�ޤu��o'�B�j�1�P(
R�=
ɽ�����`�!��r�˼���K͋�C��j�'�U�\���LW֤A�ޮW>�(��&���5D���%��k���YR�.l�Yݖ�.3R^R�Ne�C3^���%�m���qy
EV��~q�v�A��/�Af�Jױ>Zco�d"�q�8��AYU�C� ��<ؚ�v(E:"��(���Z�Cq{4G#@�*��%n�Mw��gʐ�sМ:xh�,v&�U޼�&�3���& �ެ%�,�a9�N��J`��] �e�� x6 Q�q9ۤ��vÌI~E��0�#�j\�t�&��a�Mi�g&mt��|�����E�$!�H1�b�w*��-��u#0��/<+�|�Y��w��3�+�X�\~��$9�9��d����I\�Ph��0�L��>C@HR�A �7<��߲#C��S�2"����U�e��h�Y�A��?���
($M[Pe�{o���'.�	��p��9JC2N�}��3��~i���3�$�U�;H��cd�����J/�U�qQ+��;Ƴ�\�y&ߐ6�*.{�v�h�7]o���S�?��Ljn�G�|�@S!�4�I������T���3�g�s4��U�Rҏ:�{Z���7�g�7���84^e��!^��>>�Rp�A��\�J۬��M;/مUґ��p���� �By"��]��ZǒD�����/��EJ,L�YF�R��m�ГT0N.g�}��V�wݷ�s:u�'��pf�=lm���Ƞ�X^��=������6%��i(�[yڰWY�뮏�;��ق:�Ʒ��@�����4��R��x�k?����A����ҡ��:�Y3hjg�$#
IzF���q���	}�>d�����&������D���̤#"o�zͶ��*�6\�[2���db�w��i�0��dj�2US�Ө��K����{���'Wxk���9u/��ol��5b�j:-��z3�5��z�as�y�+)vL�F���*^���j�'\����VQB׮H��S?\��$Ó.|˙����"\5"�H	�dE���4ЪBS�]���^��LNl�@�\$	� ݺ%>��JE{_�h_��?o{0��6P�W��I�P4x���������t�5��j8D�fxjqR��@����5�Tl���C����n���&e��U���!��3@JzZCl���a*��^h��8���浥��)��O4:}�쭲Q/��Z4"_���2������r��|A�Pns��	wDh�E�ҁW���|����pF�q���K3Z�謠���{��h��⋊��ДP\w�<\�S�[�J����G�#�����gC�|���S]�Y��Z<��jw��LCz���Eg������
���+���x��]��Y1���������r�����i��ܓw"0w1?��I������;��V�t����$��a�n��/Q����4#=��*��47`�� E�O�*zRArWwn��2:S��+e���z���	�uH��q{�{����ڠ�(К�D�$�58��1���q=4]2��x���\;��2 P��h	���I�X��dA��:쎗�{O=5�aY�J��]�n�5c���ʅ;�Yt��<E����3)X6�;r�1%�9���	�pa��[*�o�ߤ8_~��2¢<9�f$��e<�Ǥ ��w��f�ExC��@���I��T�_'u>��e�fP�Uoj��%���0&�ǖٮ:ª���[� ��oΉ]���2D�誓�\ѭit�~��?Q`���"��ĲT})ͥ�I �0E��[s�&�A2�tbVɡN:	�,,�~��L�}?.ɭ=<����,h�7���7j�]`���R�X��t��UִY�ֹ;�R(DW!�gPn�-�fFʢ��K�Qwsi�f��^ح�b��X3vKB
&����|4tUn���I�tJ-?��n0��=bC-n���d@�@�6��ṅө�����w�;Ԫ!qoZ���/v��vR 
�}�����`    �b~�_k4=�N^�<M��@��.U��e�,J�-����I��0�
��@���@c�s�p߃d=O���٭ڝ����]іj�b��)H��5C����F,�l�s߃�j��}<xf�@�=F%��츻��?�@*NF�b�-4��xk��5ѳ/�.;�}ߣ���僖�1=:UϦD3�R�h�G��-�t.�LV�>��B!)zK¬�<����Ӆ����C�@�NE�oJ�Ե�TH&�4=��z�h�^�Wj��E�6��ӈtz2O#˴�;�?lW�G�<r���hPC\�$x�ơ�����1t��d��(���^�����lj��M��s�]'k�c���[����"�d�T�4s]��Z�+4��+�4cӮ��6��$!3xf#L�/��h~-O�8���S��fL��m�v���2^���}�N��E���rIRFYs���Is|vSr���PX�9,�Fb�2�k((Ib��֜��_Cw�A�0���"G㌔�6�H|mGr�]k��]����5��IZNUQV5]����f����uRw�VUp�0��~�?�#��[�$��c�c������?*)��;��p`6�c*�x��C��Ѡ3��z��P�8�<��B���{c��ᝧm'`���dQ�C��	�[���As�W���,��)Iں�$��F�V��FއU$i��^�;��`��e,E����j�i&P�Т��~���Q����z�-�<r�O�Y��6 Ͽ�7�5-#_�pƅ,I�$$*wԹ���H��/���E&�/�)�Cp��<����d�����	����#���H}�����K�!��g�H��W��._z%��P��Ǔ��~8cMHlv{�Wέo�0����B�P��#��z!Q~��ٱ�͟�Dv���HdO��ѣ'i�O��z�r�L��=|� Z�Z��׾��л�[��,P^sS�|Ck~���-����LsU�L�@+B>fR�Ѧ973�@�.�U
�u�۱A�k�|����Q�)d�����QF�0��|N2�wq;UF��H:���V�y4�3�>�ZG���(CX�+C �䅉v�����EdU�D�@�;���W�"����N�@,�je��i��{s�s�����ƶe�u6cle/rGJJ�s�����	b��*�*y�>���^��yv�Z��HpX��,~��e�g�	A9l�9�S����L���㷦@� S-6����5�H}1e�㊚8!� {ܧR\a�Pշ���6�h�K���N����-��X��2��mj�vxK����t�/#=�QU�:�R�!֗�9��H�;&Ӎ�4O4�t����W��.A�s�D�>I�&���'���z�>�3�$@4_�E���}�*{Kcx	`����\�tA�T~���}W{�oۀYiփ��vmį�)9
��l��}�ZȲ�#��}'�!���rs� ��+���`I�G��C�.�r�)�]��n����k��UtX�]����-7,-3�^����F�
�L�on�oC{;�wכr�qSk3BË���s�Ղ
Ŭ�F��>x�dZb�0]OW�����}L:#���[�����J���s�c=wd�LR��6�vj���VhAZwױ:�Pë
n*�m���?Q��x��_x{E#74�}<>�+=�$<�?���E�~��󉰩��	{����k;z�^�R��01�>���3�$N`��l���D#'#�8��\J�04���{�Q�ֵ+c@��-��F�� IT�40a�H�>r>1�]��p8��gJdH�ɭd��(�,nI��Ks�+����ϒ*:
W9ڇV
7�}��ơ��^Ŏ�n�U����7�'3��@�,�xn�mD� N����kT���ƍ����q���r;_K���T
�=�YmY833�9(SI5@��e����-ƃ��CL��>!��q"�H��;	��HB��r��?�����ؙ�.��E���~�lE���bq��y�[k(.���V�ҍ��"��me�;�V���:$��=7/6��_�r/k�I�{�ǯm�v˔�3���x�UI
�C�y��]��Q��áB���MH�;]���!�"�us�qG���Lw�̿����*��� �wrñ�r�ԒS\ڿ�LV����4�uPR�0�E���w����f�$8�_n���܈�3��#!�x�w0��g��� ���t����j́���U�%�P�b,E��-M"X��3���G�C�/��Q��-0ʔX��q����G2vO%p���Bg��@���J����XD��X ��R&`���j�m�da������r��njuc��H�w��TaBi��@���6�
ʌ�5:]E��#о��iXҍhU��G�e�� ��i$��c4�?��td`�UV��\���+��v����O"2�k��h��a��֡�k�i"!��B�H�?AI�"UI���'[��ʫ�4�c���j�<,����4#�s��;_�]����&������PP�@e��F�����#6��F4Yv������qL�Ա�t>Q�S�Re��_A���ݹ�R�p��~Xz��eU�w�
M�������ю@�3�̬k��<�v��!}���V�ȶ� ��p�-�/P�*O�b<4c��Áݓ�B�v}�r#,�)|�Gf%��:]�y���	�:����Qõ@,�ΐ�y���?.�4�G��2���\y���A!u8t.kDrAt>�g⛏s;����s�%qkT�.�i�5�>nF��ܧ���ݧ���آ����,<T�W����B���d�"�`ԍ�n���ƨ��u.��,�+�(��L�����q��:�/u�-#�65>z���Ca�<U��ь�g�SIbϑK0{l>����23QT�h0�\vADs�� 
@r�/�*���������\����D\�+'�o�y��Lt\E�{�t������Ԭ9i����S �*�w%`����������Ҋ�^�g�O~����&V*ȥ�6Z8�s��R�b԰��,�I)��O�]F��.�Wm(��Y�ޙ=ËJã�J_�h8\�ڌ�&���ԺkbD.�|'N��>��pf`�`o���0b��<�������tmW/�n4SU�d��$�z��i2I8��#�{�̏�e&NJ��?��������y��Ǚ�`��A��Ȕ���ޞ�WN
J��tQ)��Ŏ@��y{tom@_���-��h�9�s��"�l�� �J��V����;]�צ�[�\w}��<K�%��>7�5Y/$k8"�c^�`\��Q�[��+����*�U
4�oM��e��An@���Jw���J؄�hŬǥX[oDjn�����Ԅ [��j�nG���aY!ZY/�&4���7�_��/[fL��+B��ՠ���d?|�m�:���'�G��!.՘������$�O�c�N~P��#����g8<	s���R�Ƈ�>�,�Q1@��ы����;U��p���4s�e�i��L_K/v�P�e*kذ�LQ�急���m�R��U�K�qU�Y����$�����'�띤z�NS��E R-(�2�y�@EV�tLB^A��C���5.v%�}�k�vi�<d��v����t
Y�xc�����r��\�A�A~�s���pIפ���(�wROZ0l�j�8�YM�΢xNb���k�o��s)W� 1����O��-)<�f؈'�m�?wX'6Q y�o�x�{��ع���ҍ@��|:;���"]��!��sw�F�2��%ڃ�	:�t�}�%?.G�N�W9�>��%�5��Q�h��:�^�iY�� �����R�Ql����VN��~䈝� :�֪��3Z�u�Gt�ݲ��ٌZbB��+·���z�}?�Z�Ӓ�P��$o\��V�k�0ߵ���\xq��0�ˑ)
�����t�'�dP�w3	��к�Ԧ��yo�8]`򲩡�<�Ҕ,_ �����n�����/搛Ϳ|6�s��FSڀ�J    �$��;�`��N��/��@d@@.4��`:���qZV3��CO��g�u����\ګ��o�.�p⬣mA����j�#�l�*Iq�^H46*���X4�{K�F�ҠG�pmB"+'���J��ь�ƞ٩w �9mj���}Oct{{��/��_�o�5���=
u��\͚����tR��p0+���&�lրe�3H���rG� �;#i�ؼ����f�F߮����%�l�y|�$,�ؤ�:2��u�Q(ţ��x��o�%W���g�}�Y^�.��@(��M����AT�i#�V(D�ӏD�lm�{�>���yޮӜ��E�C�=>�����G��h|u٫�Pczi<��+vb�U��
 �&�ݦ��ɠ��兆ws���7$J)�I ���Uξ�����<�����9�bm�u4���ؽ9k�O8�#�).>����7FL����:�6	��z$��};V��3��NJd�G���m��+
(���n�mk�ÄM��_�wJ@�
�|�e�J�CkQ��G%�T���bhH�^]��)�1Z�YX���ҭřY�� ����l;�b�
����2P% E�;����K�Ͳ������Ӽ9ߥ,�ǆto�\Ւœm`$�Y��$�oC�A!�c�7�$&�wj�\�058�b��{�����Q�X�.���$C����E��+�m\�w�َ7�@�;C��w�7o�����N�R�?�����h�߀�ڇi�>gk�Wh	G/)C��]�B���b�e*�U��j^;^�O�����R�7"q9rWZ�;��u�L2���o������k����y����ɹ,YwN���)��ΠūR�G86C�����;U�*�����e�`�i�O�ܬ2�oY�9ӽ��5y31�\�55�ʨC��鮿�ʅ:2 +�ޑY{���_^�:0����U�:��qS�For���x<��^��eBd�l�����	��z�4"�W�I����p�~8��s�y��쿨�y�����T��,�r��r���&N���M���&�%��
��lڶ�ʑ���a]T�ka���BHo�xyiu�\Na�u,SF����-FK]��$�ټ;z3I@�/i2J����
-��[�l�,�囯��� 6�4)� �ջG�ݴ]�.i���'�����;�-�V[�n��lއ%1����b�g�>�y�b�c̋��ً������#"�gd�R��nj�G.;0��	$I1�8�(�%�(�%�M|<MrI�L���b�矶*׾=r��縖�{˦����%Z�9#%?IjNo��*z��QIDGS�u�"���/7�<�N������S}����8��=�B̮���Ree�K�����N-�	���e�IH���*���}��/��l����&?� QP�!(|��������K�nP����DHL`�J~�ՒSq�av����px#)�s��\8��D�ʃ)��㊔���z��/lFC��ò�M@E�:C��[��lY�nÝ;x�b���_��TD�T����ɐ���5˿t���rJ��=��@/w��t�+�Ĩ�ݓd��9&�J�>/�L�|R�a��� ��~&���͕s ��jmũTE�Jy��	&���!�%��ˈB�yt,��h=��:�ˇ��p�t����ãM�S�9��ɄȖ@8�r�'��Q���R�s��6l!J�a���f+S.�ڟ���4n���v5l�܈�I���&0�˥�Dl����f+�ӭ��ҢD�W�`ɲ�&](��l�/	��M��]q��7����+Xۡ������W���^ذ5�p9���t�J��8k����5	@���VdVdjF������kX!����zi��q�k��AJ�#��:kj6O�K�s��a<���VY4K�B@��k>}�p����	
��F��N��&A�g���a;*c�)~�6g�px�t����A�V.�j��n�eW>���v)�;t��9���Z�������**s�R7ժ�����l�U3�*�X�<�s蠰w]�alu�:�d.��#�^�zW)lm�����������04S����]� 	(lÁ@/]?����_N)��t3��#d��U+H���8������h��\M�Qp��C�r�w��<��!�Vej/���4GpZ��P�fn���p�Gݘ��ђ�5ڵ�na�N���34T���[o8{C����@���.��X}c$)�2e�>T3��I`�.�Wҹ�㍏���'��3R�צh���p��ǣX �P�/K����|j���+�M�Ӣ�Zy9r?щ�IN*��3��yeL���
E�(�����֟z��r�eI������/�������1o��Z�3��J���.H��V3�Һ�C�)�&U�د������,UYGqCo�6��-:�V!Y^����(�=��Q��E.�J�؉~���Ed�_�@#\ȡer;C��7���˽��W�g�}��W)��Y�=���0_�����$��Q~�!a�O �8�%�*�rY�R�vVE����E�f?��A�J��J�[L�_F��T���D��Q��e���mӛ�$��.B7�xH~j��E%(<���\c5�aI!j�[����bz��JJ�������4��I�ti��*���Gb;�׿H��@ɱD�uM�4�3�;o�g�y�k!4g�4�,,��Q�����p�k��چb�H��E,7`�dߛw{pO��t�������<�K�7��~��P�o8��U�i�Q�ھ�B^��6.�YC�a3��{n���.b�����O��PjGw?������%O��E����Y+����g��C�3����Ҝ����Q�qG"��-��1�@[�"%Qr.>ϵsꐃH4YͤĔ�����q�	U�/A.�	`�NH�6�MQ�M������K�,B͟��I�;t�Zzvh�}(7W*E�]�2�u^ջ3	E���zmr��Zda�H����KK�E]��m�u��ޯ�?䢷��D�B��LAI���}>P��F>q�ٮ\Y�9�;K@"��|����W��ڭ4�W R�z�B��F{g2�%و1�P��o{^��#BkY���}hTYQ���pJ��������Nj�����B4��I36���<�m�B��j��4�	M2�Eզh�R��J���W��$��;��j1T��S�螿[���-�[m}Zã^y�_~��~0DP8eA�g����r�G?�m�W��{R�&O�u����}�" $���y��s&o|4:����J�dj������ߠ,���A6��٣�$�=� %�
�+77P��\����˵�Ld &df��0����0�>"w����K�#㺖 h��%U���&�\y�C-�q��i
�w��{�����wvd=�m�R͏'�U+p��`D�t%9ܓ�J����$f偀�����*Z�=��*8��9�*���zƍ�[�����Ol�d���+c�A��?�����~�<ݰ��f��~�G�T��雽�x��f|��̥�B-�sG��$�MX)�"���\�Q`�[<�/��M�ѩ�:1��'����/���� =+���3>����g-���Q�1���?�+n� �굣���V�,����)NIH	G��Ӛ����~�((
p�$wd��%1�,ex3�"K�h���uo��2]�ş��ͬVay��0�o����:���v�1q�����8��ڝ�����������e	�HP�T�ܣ���i�ʆ�K��"��%(�z'�
0h*g��~�.i�a1�,�jbg��TY�;7Ӹ��츏�|��U�@�nGC�t���
w&��p�k5��M�t�{u�-�L�����[�T��x��4�O��4�3t��k�7訢`?�:�VZ��8BVǹ���%ZSQ�`�F�]M0��a��m�Rb��92hQZ��d����q��Z*��@�D����4��A�EÅk=�K1�2�r�����ќ�i���J��q s  h��8�27ø%���`��&��z�o�V)*�A9�c�Ш9VD�M���\�y���Z��6���qT�%b\��z����Z�?4gj���cd����z�����*2��f�A}���p����Т�V ;��|'5��u�����C�G��KT}�De�Z��[ax��`�ոz\��٦������������_J�Q�	�E/�bƾ`ڭ��O_�����9o�Bx���D�y���$��6�:�R��<�GG����F(FWa|{���_H<5�2� �кp�j�����$ ��2�/9�}7���|{9�t��+)��e*��F`v��;���,Ū��(�x���&#hTˤ:�<7^�n���+ӝ�>	U�W��@�I�uLB+E�)����Z"qF[�6��ӼR;�6·Q:���&O�+��6��n�9Wl6g;���Pz���]��UPa�m|�~\�w��h�tɠY�)rff��ue( Z� �Vx~����c��Z3��^�rǮ�ij�������FW��*W^T�����;V���`����|��Rx�]�{���N����y��D,pix^�gFo����R_�%�����
E��)���Q��S��7Y��ȹ�\���u���4CϢ#T�����r��<F�,�VIѸ�w�Ô��%y�����YD����'� ����M�9�ՙ�6�ݭ�V�U��ވF�f��J]�i�� �f��pe��h�nD��+�����_	��x����ޒ�9�s�҅v\X���^���1�l�&)I��)�$N!��7���m�W�g��Z�ʲ�ݣ��>z���4D�O��eE����N'�+8bkzC\���ao��yT�C򄩦�����ҋ:�q�b�Q�y����s���� �M)yw��~��}LHoJZQ���t�DO�4��^f;�S��n�s�������\��5Y��� K�SA;�b�
(�Wr5�#"ܱ��J�W���ȹ�I��T2�z�֏df�Mz���Ft���tC��ť��a}�z|=�zϼ5�NF>����$L��l���G�ПNm�%�����h䅿�CC�K����ιk��6�W�+!�K��\5͘DMB�L�ض��M㉅sW%}
�I����i2�W��-	��"0���#�<�]g������{e�Wk+�(�Z^�������'���+���w-Lhʿ�B����QQ��a�����\6������d�t�0��O�s	�b�Q�ג
]fC��~_c�2�g$1KB�\�;w���4��y�?�>+Jͩ�y�<dR��0������T�u;H��g��'Z�!�B%�'�(.&S֎��r5tfU�$�k$TZ�3�KA���4�h��z�t Dt6	�̣���'�>nYY������:�5S�Ns,������l��1Z!��w�tZ���#�V!]'���)QUX�:��q�H��̜ݶ����eհ��*� ��4���FKw{�F S9	���Y�-��V���K|���G�񕄚���Q(��ş{���������}|eZ��8+��7��d��i,+z�2D����v[Ӗ��;">?]^Ѫ��Ōh��K��P����r"v���:&6��ж�ʫ8��r�Eq��MPT� ��_u����B��&��}�@��Õ��-���a��l��<@n�pDg)�}�����3�a �|)�;NF�<�u��8"���=���|�ӯ;�gtG?/A��TR�zR�FB������N�j�X���4��v0W��%
�4��=�p��4�H ��&������\������������2X�&��� ���rU$�e��i�n�E��rXn�CoY����]��hX�NC2?`�rυv���p1	�w�H�Eu�=7$\%�,dl�\#!I-w$��q�wMÅ4�,�PU�( k񈾁�HG�������Z��S/ʽZ<�^������&����^]�IO�:������?@0#[4qA�ϽnR�( �1�Q�W��~��tu��}�>,�9�f�q.���f�W�P�_�a�28���m���Q�����4{�
�߰k�CC`X`V����}�a��aβ��i0� �����	��3zK����QЧ&y<I+٬����9��Ө����}���#&��������H m�-É6��e"�X�?�� �������beYH�L�����j?^�O>Oh�Mr�M�+;�3݂1&"H�rD�����8g7S����L����G�r_�/h���ɼ����p�+W��6�l��D�m��A�Y��uMs3��.��H�B�3d襶���|��1Qay�/�u.g��^�q�Y�6��S�%�;󆆙���. ��2,���WA����3���5"2����[�-D�;��!�~��\'{�W`��* S��-%�2�n(b;Գ�h6��2¢*��L��H�u���6t9�o�eQ��@�Q��WRy����t�~F�
r#�(O
+�B�`����H� |��v|G��&��0%��_f���2ɠ��ti�)�ߏ�`��E�ACu�s��/�n��$��b�&O��-Y�@!EM�?F���+�hznD�ZN[�����+!�h��Lڵ�)"j�ykF)����@:],^Bko�NID1��W�>�o�~���9zLU�ih�#����s_����L�j��>�JE�J�4��Ks8�QU��%�)+C�7g
�^� @�
���B�J��kt�!-�����O�|����*�*��]]�UIZ���Ǹ]I�3�2���2Y���8�\YTYE7�9^�x���~����֑�Ҝ]5e�J����1��(j����&�Õ)�Ӯ�P�F^W��5�L��J(R<�]�y�D-���n0m ��M�=����O���4��:Y3� �be����.Q�	t7��l��;\��t�o��j�e cp~n���D����9]��:�^)3���<i"�/���/������^����9s[�s�o�������z�lA���b�J��E$�u���{#�'[U�v�0��'�0Ԉ�o��fh��آ�@-w�j�8|,t���i���������W$Ъ��������%4$���4O6T��v&�lQt��N����.|Hc���p�ꈑZ?��IԨpL�l;N���Ӿ�ߒq$oAk}���{��F"�*�3W�{}BI��)
{&ł �Rg�����[~�d�����k>]��q$6HRݾ�_;Բ�iDo����9ik�N�;�x\��Jkr�Y�\-9��r�B���d�rHs�d?���@Lr8�du����|LY����2�V�pNZ�}�.�Ok���|�*�YT�d���C�Cs�"33����M=3D��U^q�8z��+N���e�߯��LIs��ɪ"�
�������COE���KQ��� ��L�����������T�      d      x������ � �      c      x������ � �      [      x������ � �      i      x������ � �      j   7   x�3�t�K�OI-�2��M-J�H�K�,r�9=��R�J�*��K�J�b1z\\\ �#�      _   b  x�}W�r�]�~�Iۙ4�l˒�EK�)R%)�:������5�������5%I݅\�^K�SI���ݾ;ю��S/;m�E��ݶ�b�E㿣�]�[J��"��%����QN���-ё�:�QZ��i��+Q�K���)�vNƻ�����vR�H+�pN�۫�o�-��hz{?�$�rplW���4�]�a
�C3c!|0�� �H��߰V�84�3ӣa+Fx���G ��q}�N��W�̨eKg��^�)��tR͸v�AFo�E)�9�[<�IO�<���~Rr�dӰJ\Q��X���hOȫ�1�d\/_d$�B�n��b"$�Z��5�[ }�0�������|��9[��"Xj�t����4;�e�3�{f)�q>���)�3D���L���Қwr��"N��m&��2�!-�D0��69�����䯏�vq��l�R=f����uu֮C��̖�"i58Z���e�p$�py�*���-�ķ����5�X�v{�yTD�Ar�Ly73�w�e�����>h�-� �u����oT���Z�P��3E���t`�*Y�.dg�x�~#�j����¨!s��&�({d�m���!1��������ذ�!��3���b�|�RBn����D�'�x��P�4�f��4g"�g����3�8Hl萖#)p��u��*�L�+d�w�b9+�a��'�r|C=C�+�r���4���\�D�s,p�6C3�M�w�<s���M�E�,�k^�%ʺV9A�+4��t�`���*G�p4���?��̰�����~U�wj�ϫ�l�;�r�d��@Ca��s}�
g%D��g�	A�8��h	��%E̗Z��B����
��E��I����i�m�>t&��cq�X�C�R� =T���/�^��kÊٚd��0S���C�Yo��
Ѫ��@K�Y��������G������2�W;q�δ���f��^����ol��z�l��^�c����DMP���V�8��,����@J�G��T5�o-u��cH�2��u-Vu��gM�*g5�ފ������b���v(2��<P��Fh5G�1�8z~�S>`�[�Z��iy zF������z��B�(�����Vר��|��1*��]�aKvE���˨�����;��{����b}�A���.(�P��g�5g�D�L���ۛ�����S�h%�/��i򌜏B��eWnU"��2������%滷�����4�ݻq���T�[���gM�ލ���l~N���3g^;Tl�����͎#��(y2����aCv^-��{S>�a��x@������m�����a H�P����M�������ur}j#�_����
<;��P�B�կ��Ǔ�����wnDÈ�a�N(m���Fо���]>+�㥙�4��ӳ��%�;�^C���臥]��
�
z�**Tp�|���UNsk1���
��cq���5��<���[�S����˯2f��f��].r#�����A�xE%���k�m7��F��_0x���?<��Xn�p�W/�Ag�p��Nt<�E�G�&Wз��&xI��,��6��M�-��?����ۏ?��1׭      ]   U  x�u��j�0E������m�KҔ@J�e�f�1Q$Wr��Wj�e��{|�a��6-�	kv�x�զu��$�?���\�D>M[�T�4l�:9:�-���I�Fv9%�Sm%:�z���!~��xqv$%͵�%Q^e	�m��S���vHp!8�_�8�X����&2/�l�|t���l�V됔o:-���=���l�C����,]�ɶ����㌮t�.BO�՚ 4<��� �5=վF���\ހ�<ҥ�;*)�5wW�F��{OE2Do���/!f�~��F���Ԫ���X(��_O��Y!q��7?K|�������/�Iɾ     