PGDMP                  
    {            scan_os    16.1    16.1 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16562    scan_os    DATABASE     {   CREATE DATABASE scan_os WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1252';
    DROP DATABASE scan_os;
                postgres    false            �            1259    16570    result_scan    TABLE     �   CREATE TABLE public.result_scan (
    scan_id integer NOT NULL,
    host_ip character varying(128) NOT NULL,
    login character varying(128) NOT NULL,
    info_about_os character varying(10000) NOT NULL
);
    DROP TABLE public.result_scan;
       public         heap    postgres    false            �            1259    16577    result_scan_scan_id_seq    SEQUENCE     �   ALTER TABLE public.result_scan ALTER COLUMN scan_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.result_scan_scan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �          0    16570    result_scan 
   TABLE DATA           M   COPY public.result_scan (scan_id, host_ip, login, info_about_os) FROM stdin;
    public          postgres    false    215   )	       �           0    0    result_scan_scan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.result_scan_scan_id_seq', 16, true);
          public          postgres    false    216            Q           2606    16574    result_scan result_scan_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.result_scan
    ADD CONSTRAINT result_scan_pkey PRIMARY KEY (scan_id);
 F   ALTER TABLE ONLY public.result_scan DROP CONSTRAINT result_scan_pkey;
       public            postgres    false    215            �   U  x��K��0��ɯ�P��ܶ]���i�n����`V�l�]���@^�!�.5Rd�{<�>q0!l��M�a��G��*=O�$eJa�� ��
L�&�<S�h4��%��cv��Y��H�3�ճ�V=`�~=,�����T0��D`��/���r	�!b���{���B��'q/�����S7q)v����w(�<�'�SY�U+?U{��v��H�B��T��{�{*J�Ep�����o�>�b��/�j��ǥ�I�V4�阖Q2H���ޮ��d�\Ku^��7��{"��:̙Hr�|V�^�TP���Ϙ�IU�I�5�W�乬��m*��Z��;�M�j6��ݐRm��r�e[B��{��\߫�	P2�5��ڏ?�����ݏv;b�)�>�����ʉ]�%J-�ۈjN�����Q�s:4�m6�H��̞.Ģ]��x�	�{���ۿ����v܇S9G.�}X�7k8���>=Nq�n�Л2�C�����ƁF<tġF<t�X#:bdiƃg�4��3>q���3�x@�/����Sl1�&أ.rq��.x"���Q�4�-�.�4���_ri����x<��D�     