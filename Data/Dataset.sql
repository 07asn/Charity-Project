PGDMP  0                    }            charity    17.4    17.4 <    p           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            r           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            s           1262    24576    charity    DATABASE     m   CREATE DATABASE charity WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-GB';
    DROP DATABASE charity;
                     postgres    false            �            1259    24726    admins    TABLE     V   CREATE TABLE public.admins (
    id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.admins;
       public         heap r       postgres    false            �            1259    24725    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public               postgres    false    230            t           0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public               postgres    false    229            �            1259    24595    beneficiary    TABLE     �  CREATE TABLE public.beneficiary (
    id integer NOT NULL,
    user_id integer NOT NULL,
    total_debt numeric(10,2) NOT NULL,
    remaining_debt numeric(10,2) NOT NULL,
    reason text,
    verified boolean,
    identity_image character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category character varying(50),
    CONSTRAINT beneficiary_category_check CHECK (((category)::text = ANY ((ARRAY['فك كربة السجناء'::character varying, 'مساعدة المرضى'::character varying, 'سداد ديون الأسر المحتاجة'::character varying, 'سداد ديون التعليم'::character varying])::text[])))
);
    DROP TABLE public.beneficiary;
       public         heap r       postgres    false            �            1259    24594    beneficiary_id_seq    SEQUENCE     �   CREATE SEQUENCE public.beneficiary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.beneficiary_id_seq;
       public               postgres    false    220            u           0    0    beneficiary_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.beneficiary_id_seq OWNED BY public.beneficiary.id;
          public               postgres    false    219            �            1259    24716 
   contact_us    TABLE     �   CREATE TABLE public.contact_us (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.contact_us;
       public         heap r       postgres    false            �            1259    24715    contact_us_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contact_us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.contact_us_id_seq;
       public               postgres    false    228            v           0    0    contact_us_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.contact_us_id_seq OWNED BY public.contact_us.id;
          public               postgres    false    227            �            1259    24672 	   donations    TABLE     5  CREATE TABLE public.donations (
    id integer NOT NULL,
    donor_id integer NOT NULL,
    debtor_id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_method character varying(50) NOT NULL,
    payment_status character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT donations_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['Online'::character varying, 'Bank Transfer'::character varying, 'Cash'::character varying, 'Paypal'::character varying])::text[]))),
    CONSTRAINT donations_payment_status_check CHECK (((payment_status)::text = ANY ((ARRAY['Completed'::character varying, 'Pending'::character varying, 'Failed'::character varying])::text[])))
);
    DROP TABLE public.donations;
       public         heap r       postgres    false            �            1259    24671    donations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.donations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.donations_id_seq;
       public               postgres    false    224            w           0    0    donations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.donations_id_seq OWNED BY public.donations.id;
          public               postgres    false    223            �            1259    24612    donors    TABLE     �   CREATE TABLE public.donors (
    id integer NOT NULL,
    user_id integer NOT NULL,
    total_donated numeric(10,2) DEFAULT 0
);
    DROP TABLE public.donors;
       public         heap r       postgres    false            �            1259    24611    donors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.donors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.donors_id_seq;
       public               postgres    false    222            x           0    0    donors_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.donors_id_seq OWNED BY public.donors.id;
          public               postgres    false    221            �            1259    24581    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(50) NOT NULL,
    address character varying(255),
    phone character varying(20),
    image character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['beneficiary'::character varying, 'donor'::character varying, 'Admin'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    24580    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    218            y           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            �            1259    24702    verification_requests    TABLE     �  CREATE TABLE public.verification_requests (
    id integer NOT NULL,
    debtor_id integer NOT NULL,
    status character varying(50) NOT NULL,
    reviewed_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT verification_requests_status_check CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'Approved'::character varying, 'Rejected'::character varying])::text[])))
);
 )   DROP TABLE public.verification_requests;
       public         heap r       postgres    false            �            1259    24701    verification_requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.verification_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.verification_requests_id_seq;
       public               postgres    false    226            z           0    0    verification_requests_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.verification_requests_id_seq OWNED BY public.verification_requests.id;
          public               postgres    false    225            �           2604    24729 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    24598    beneficiary id    DEFAULT     p   ALTER TABLE ONLY public.beneficiary ALTER COLUMN id SET DEFAULT nextval('public.beneficiary_id_seq'::regclass);
 =   ALTER TABLE public.beneficiary ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    24719    contact_us id    DEFAULT     n   ALTER TABLE ONLY public.contact_us ALTER COLUMN id SET DEFAULT nextval('public.contact_us_id_seq'::regclass);
 <   ALTER TABLE public.contact_us ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    24675    donations id    DEFAULT     l   ALTER TABLE ONLY public.donations ALTER COLUMN id SET DEFAULT nextval('public.donations_id_seq'::regclass);
 ;   ALTER TABLE public.donations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    24615 	   donors id    DEFAULT     f   ALTER TABLE ONLY public.donors ALTER COLUMN id SET DEFAULT nextval('public.donors_id_seq'::regclass);
 8   ALTER TABLE public.donors ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    24584    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    24705    verification_requests id    DEFAULT     �   ALTER TABLE ONLY public.verification_requests ALTER COLUMN id SET DEFAULT nextval('public.verification_requests_id_seq'::regclass);
 G   ALTER TABLE public.verification_requests ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            m          0    24726    admins 
   TABLE DATA           -   COPY public.admins (id, user_id) FROM stdin;
    public               postgres    false    230   �L       c          0    24595    beneficiary 
   TABLE DATA           �   COPY public.beneficiary (id, user_id, total_debt, remaining_debt, reason, verified, identity_image, created_at, updated_at, category) FROM stdin;
    public               postgres    false    220   +M       k          0    24716 
   contact_us 
   TABLE DATA           O   COPY public.contact_us (id, full_name, email, message, created_at) FROM stdin;
    public               postgres    false    228   mP       g          0    24672 	   donations 
   TABLE DATA           ~   COPY public.donations (id, donor_id, debtor_id, amount, payment_method, payment_status, created_at, payment_date) FROM stdin;
    public               postgres    false    224   �P       e          0    24612    donors 
   TABLE DATA           <   COPY public.donors (id, user_id, total_donated) FROM stdin;
    public               postgres    false    222   �Q       a          0    24581    users 
   TABLE DATA           t   COPY public.users (id, full_name, email, password, role, address, phone, image, created_at, updated_at) FROM stdin;
    public               postgres    false    218   �Q       i          0    24702    verification_requests 
   TABLE DATA           _   COPY public.verification_requests (id, debtor_id, status, reviewed_at, created_at) FROM stdin;
    public               postgres    false    226   �X       {           0    0    admins_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.admins_id_seq', 1, false);
          public               postgres    false    229            |           0    0    beneficiary_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.beneficiary_id_seq', 14, true);
          public               postgres    false    219            }           0    0    contact_us_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.contact_us_id_seq', 1, true);
          public               postgres    false    227            ~           0    0    donations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.donations_id_seq', 3, true);
          public               postgres    false    223                       0    0    donors_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.donors_id_seq', 1, false);
          public               postgres    false    221            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 27, true);
          public               postgres    false    217            �           0    0    verification_requests_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.verification_requests_id_seq', 1, false);
          public               postgres    false    225            �           2606    24731    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public                 postgres    false    230            �           2606    24605    beneficiary beneficiary_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.beneficiary
    ADD CONSTRAINT beneficiary_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.beneficiary DROP CONSTRAINT beneficiary_pkey;
       public                 postgres    false    220            �           2606    24724    contact_us contact_us_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.contact_us
    ADD CONSTRAINT contact_us_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.contact_us DROP CONSTRAINT contact_us_pkey;
       public                 postgres    false    228            �           2606    24681    donations donations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_pkey;
       public                 postgres    false    224            �           2606    24618    donors donors_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.donors
    ADD CONSTRAINT donors_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.donors DROP CONSTRAINT donors_pkey;
       public                 postgres    false    222            �           2606    24593    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            �           2606    24591    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            �           2606    24709 0   verification_requests verification_requests_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.verification_requests
    ADD CONSTRAINT verification_requests_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.verification_requests DROP CONSTRAINT verification_requests_pkey;
       public                 postgres    false    226            �           2606    24732    admins admins_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_user_id_fkey;
       public               postgres    false    4796    230    218            �           2606    24606 $   beneficiary beneficiary_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.beneficiary
    ADD CONSTRAINT beneficiary_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.beneficiary DROP CONSTRAINT beneficiary_user_id_fkey;
       public               postgres    false    218    220    4796            �           2606    24687 "   donations donations_debtor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_debtor_id_fkey FOREIGN KEY (debtor_id) REFERENCES public.beneficiary(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_debtor_id_fkey;
       public               postgres    false    224    4798    220            �           2606    24682 !   donations donations_donor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_donor_id_fkey FOREIGN KEY (donor_id) REFERENCES public.donors(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.donations DROP CONSTRAINT donations_donor_id_fkey;
       public               postgres    false    4800    224    222            �           2606    24619    donors donors_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donors
    ADD CONSTRAINT donors_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.donors DROP CONSTRAINT donors_user_id_fkey;
       public               postgres    false    222    4796    218            �           2606    24710 :   verification_requests verification_requests_debtor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.verification_requests
    ADD CONSTRAINT verification_requests_debtor_id_fkey FOREIGN KEY (debtor_id) REFERENCES public.beneficiary(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.verification_requests DROP CONSTRAINT verification_requests_debtor_id_fkey;
       public               postgres    false    220    4798    226            m   *   x��I  �wFű$��:�Ζ;�<H�I��ȕ�׀a�6      c   2  x���[n�@���U��s�o��f�"��`����iz�.�JM�R�)Rv2�M��!�0� �������39HB0!���ٌ���{��jn�/旙���eve����1���(�z-?��Ƒ��#L��Z%���ek��6�t���%H�l��\�hz)�ُ�#J�ȅ� �6$��D]���@4� ��Jz�pOE$���X22O�p�]��4�ײ:�秖�$~�X�	��Fm��BK*�8?�J�| �߃U!*�b���VЩ��� �
D�+�K��K�7݂N5�6R�ȼ��sy��/�cU�]�\±Լ4�}�.�٥y0��n�Ɖ�Ͼ��؈:y�E�[���P����h�z^��Q�j|<nգޱ7,k��װΨ��p�ֱ��A=����cz�m�� >a]u�o�N<8�՝�¸qFK��@�̸��1�Qq���y��ci�\��s��S�c#�N�V;�]�Q�[��Q���J��8`�|\-)�
�"H$�35���:�ڌ����~|҅�J:���iU�%]��T��S�w�P`���i��/�'^e�_ 
���Z�o�O�L��|��%԰����xym��2�T��Z��>CKh�����n�;��aʞ}[�U��il^�(��`��u�X�v`�����*��J��ǩ���fB�$�������>��C�4�l��zVr�t��n����~e�(I>_>�������#�������oH����Uv"L#]p�ս5 ޘIN��mS�5ٶ^o�'J�m��a����i�tx�l�`�+�+4&L�Ʒ+�C\�T�1��      k   P   x�3��H,N�S�M�+�/-�� ���s����s3s���s9�M9��Lu��H��������X��؂+F��� j��      g   �   x��бn1���S�9v�2�kY"���)�.�=WX` $ZY^~[�,'�b�#�Dxk��*�ߛ�X�Lf$3�(���X���32�Ab�vN�Ki_�rW���m=��gm�2�B����?�Z���k*�	����G8��rؖ�Ϭ�oq�OJǔ�e�[��>a,ߑfI�����und��~��,�=Y?��FnV�s�      e   <   x�5���0�����l�8�B�u �䷫iaciHщ'�}��<v�E��CmK����>�8      a   �  x��X�r�8}���]�2���U]3��8�NRS5%���a��|��&tC��g�䫊ι�ѽW��:�c����Yt����/<JC���<�WI�`B��DADO�� �s�x`��&�|��uEY�Vpg���&��\��z� ���CƸNq���#f�����o��δ�j@Ce��F�����˖����{l}�����L�ȍ�I0x�׮�p�wy�N [�fj��ͅ�a��M��)�!,#�ff�jPe&C�C���x&�}HDN��l���"b��ɖm9�	\	��u��^�d ,�0���=�]w<懈nhR�%����<&�<w',t}��<��x�������	o��7)�Y>�����d=v�Rϩ�̓\I�d��y��<�E<��I6�x0/<�c8s�F}�$Y��_Ra���/�s���_��.�<
ʟN���z����6�H���%����
SM8[+�_x���������FV?�T�e;v��J��w�\6�W���DF���:2 ҄��C�������H�T�	 e;��C��+��pZ����p�~�,20blV�f���l��,��j[�b�@-��ckh��J��}��b ��*kW_'L{���'U@��U�	�����UH����	b��&�Ȉ�*"�E�*�	il�X���UDuq����p�s��%�K7cX�O"5�Ӌx����F��u�~M��K���P_�~�A�gF��=�a;�1���C�Pw�Y���g�y��C#�i�#�u��BU3��%l������*�!k�Pzǟ'��a��P�;�{���z���L��Ѣ3��!t���ާ:q<g��T���Y�a�NԨy�.<O|����p�&��a]�=��󁽸?�;n��`6�ݴ�pԺ`��߹Ͷ��NL\$gJ��9�N�r[�D𻽟ͪ<���K�m�5�\���h�a�v�5�&$��W^p�N�^ܼ7�l=��n�pU�3��V	W.{��$e�G�Q��"��KX���|���r�X�;�.7��z��[��ZY�	�v}z+I�V�R��u��H�&�1�?�L`��,�%�D�����\��m����+�v��v���+m��;+©c��d�g8y
)�Ɠ�~p1Ӿ�mW�}�	MS�x�ҺX�D���{.�82LFF�1q�!��]��w����ި}������x�o�E��//�o
����8��v�Q�=z��|zǗ��ł"���8f��e��<~/��z�^�<�xј��;�A��Ţ�����7�;NۿV���>�s����-	�"x3��#fI�ڊ�I����m�9_*���pf7^�����*�U�b�̃���6��&�N�TJ_~L"V����q�*�
��#���ɴ��Y �����Z�N(��B��M|q�w����`����1EiztW���Ά�M}�%����˿��'+Of���^�m[����m�:��o��M�ج#&"dT=f�Tx�e;��{���♛��]kg�(0�v��U[@���O�ĀY���`�!يy�C��H`T�� ����G���|bT�4�[8�&��Yu�h6q�������jv�N���	]��m�����4��g[�dn�a�(^�d�2�;/#o��#�I��"�(K�3��ub���`�L�m��:��<O�W<5L34��4L^ķH��i��B��UU��]�J��	�#      i      x������ � �     