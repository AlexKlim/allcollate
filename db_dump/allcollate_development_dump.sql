--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO alex;

--
-- Name: brands; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.brands (
    id bigint NOT NULL,
    brand_name character varying,
    agoda_brand_id character varying,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.brands OWNER TO alex;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO alex;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO alex;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO alex;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.hotels (
    id bigint NOT NULL,
    brand_id bigint,
    name character varying,
    overview text,
    star_rating integer,
    checkin character varying,
    checkout character varying,
    number_rooms integer,
    number_floors integer,
    year_opened integer,
    year_renovated integer,
    addressline1 character varying,
    zipcode character varying,
    city character varying,
    state character varying,
    country character varying,
    country_iso_code character varying,
    longitude double precision,
    latitude double precision,
    continent_name character varying,
    agoda_hotel_id integer,
    agoda_continent_id integer,
    agoda_city_id integer,
    agoda_country_id integer,
    agoda_url character varying,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    slug character varying,
    hotel_state character varying DEFAULT 'draft'::character varying
);


ALTER TABLE public.hotels OWNER TO alex;

--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotels_id_seq OWNER TO alex;

--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    continent_name character varying,
    country character varying,
    country_iso_code character varying,
    state character varying,
    city character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO alex;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO alex;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.partners (
    id bigint NOT NULL,
    name character varying,
    affiliate_url character varying,
    api_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.partners OWNER TO alex;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partners_id_seq OWNER TO alex;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.photos (
    id bigint NOT NULL,
    hotel_id bigint,
    partner_id integer,
    url character varying,
    "order" integer,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.photos OWNER TO alex;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO alex;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.rates (
    id bigint NOT NULL,
    hotel_id bigint,
    partner_id integer,
    roomtype_name character varying,
    currency character varying,
    daily_rate double precision,
    actual_on date,
    crossed_out_rate double precision,
    discount_percentage double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    star_rating double precision,
    review_count integer,
    review_score double precision
);


ALTER TABLE public.rates OWNER TO alex;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rates_id_seq OWNER TO alex;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.rates_id_seq OWNED BY public.rates.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO alex;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: alex
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO alex;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO alex;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: rates id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.rates ALTER COLUMN id SET DEFAULT nextval('public.rates_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-04-06 21:17:37.556492	2020-08-04 21:03:35.660682
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.brands (id, brand_name, agoda_brand_id, created_at, updated_at) FROM stdin;
575	Hilton	70	2020-05-06 00:59:34.654413	2020-05-06 00:59:34.654413
685	Hoteles Catalonia	340	2020-05-06 00:59:34.654413	2020-05-06 00:59:34.654413
738		0	2020-05-06 00:59:34.654413	2020-05-06 00:59:34.654413
751	Okura Hotels and Resorts	2038	2020-05-06 00:59:34.654413	2020-05-06 00:59:34.654413
787	Corinthia Hotels International	247	2020-05-06 00:59:34.654413	2020-05-06 00:59:34.654413
1085	Grand Prince Hotel	498	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1160	Daiwa Royal Hotel	1642	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1171	Leading Hotels of the World	398	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1233	Tryp	128	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1240	Steigenberger Hotels	577	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1270	Archipelago International	1864	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1281	Sarova Hotels	531	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1284	Park Hyatt Hotels	83	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1315	Sutton Place Hotel	580	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1429	Skycity	3990	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1500	Isrotel	362	2020-05-06 00:59:34.763936	2020-05-06 00:59:34.763936
1549	Dan Hotels	1644	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1556	Radisson Blu	50	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1591	Ibis Hotels	30	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1601	FC Sotetsu Fresa Inn	4437	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1632	Thon Hotels	584	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1642	Crowne Plaza	85	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1682	Hoteles Silken	342	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1693	Best Western International	45	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1770	World Hotels	4215	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1836	Novotel	34	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
1840	NH Hotels	451	2020-05-06 00:59:34.873119	2020-05-06 00:59:34.873119
2027	Sheraton	3821	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2229	Macau CTS Hotel	4320	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2237	The Langham Hotels and Resorts	391	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2261	FH Hotels	297	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2273	Holiday Inn	86	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2331	Mercure	31	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2355	Pullman	36	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2360	Astotel	797	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2379	Doubletree	66	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2492	Marriott	1034	2020-05-06 00:59:34.987784	2020-05-06 00:59:34.987784
2567	No brand	894	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
2607	Scandic Hotels	535	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
2633	Hyatt Regency Hotels	767	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
2665	Leonardo Hotels	293	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
2690	Radisson Hotels	51	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
2777	Hilton Garden Inn	71	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
2788	Classic British Hotels	815	2020-05-06 00:59:34.995733	2020-05-06 00:59:34.995733
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.hotels (id, brand_id, name, overview, star_rating, checkin, checkout, number_rooms, number_floors, year_opened, year_renovated, addressline1, zipcode, city, state, country, country_iso_code, longitude, latitude, continent_name, agoda_hotel_id, agoda_continent_id, agoda_city_id, agoda_country_id, agoda_url, created_at, updated_at, slug, hotel_state) FROM stdin;
8	1693	Thon Hotel Maløy	Best Western Måløy Hotel is conveniently located in the popular Maloy area. The property features a wide range of facilities to make your stay a pleasant experience. To be found at the hotel are 24-hour front desk, express check-in/check-out, luggage storage, room service, airport transfer. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as desk, telephone, television, television LCD/plasma screen, satellite/cable TV. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, diving, fishing, massage, children's playground. No matter what your reasons are for visiting Maloy, Best Western Måløy Hotel will make you feel instantly at home.	3	03:00 PM	12:00 PM	\N	\N	\N	\N	Gate 1 nr.25	6700	Maloy		Norway	NO	5.11163	61.931679	Europe	14	4	16148	129	https://www.agoda.com/partners/partnersearch.aspx?hid=14	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.833677	thon-hotel-maloy	active
13	1429	SKYCITY Hotel	Skycity Hotel is perfectly located for both business and leisure guests in Auckland. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. To be found at the hotel are 24-hour room service, free Wi-Fi in all rooms, wheelchair accessible, casino, 24-hour front desk. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, carpeting, complimentary instant coffee, complimentary tea, mirror. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, spa, massage. A welcoming atmosphere and excellent service are what you can expect during your stay at Skycity Hotel.	5	03:00 PM	11:00 AM	323	8	1996	\N	Corner Victoria & Federal Streets		Auckland	Auckland	New Zealand	NZ	174.761966	-36.848387	Pacific Ocean and Australia	25	7	3750	25	https://www.agoda.com/partners/partnersearch.aspx?hid=25	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.878396	skycity-hotel	active
14	2355	Pullman Bordeaux Lac	Located in Le Lac, Pullman Bordeaux Lac is a perfect starting point from which to explore Bordeaux. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Casino, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas are just some of the facilities on offer. Each guestroom is elegantly furnished and equipped with handy amenities. To enhance guests' stay, the hotel offers recreational facilities such as fitness center, golf course (within 3 km), outdoor pool, massage, solarium. Pullman Bordeaux Lac is an excellent choice from which to explore Bordeaux or to simply relax and rejuvenate.	4	02:00 PM	12:00 PM	\N	\N	\N	\N	Avenue Jean Gabriel Domergue	33300	Bordeaux	Aquitaine	France	FR	-0.565954	44.889622	Europe	33	4	12838	153	https://www.agoda.com/partners/partnersearch.aspx?hid=33	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.887637	pullman-bordeaux-lac	active
17	738	Hotel Agua Escondida	Located in Taxco City Center, Hotel Agua Escondida is a perfect starting point from which to explore Taxco. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. Service-minded staff will welcome and guide you at the Hotel Agua Escondida. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. Convenience and comfort makes Hotel Agua Escondida the perfect choice for your stay in Taxco.	4	03:00 PM	12:00 PM	\N	\N	\N	\N	Guillermo Spartling, 4 Centro 	40200	Taxco		Mexico	MX	-99.60556	18.55731	North America	37	6	708	86	https://www.agoda.com/partners/partnersearch.aspx?hid=37	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.918116	hotel-agua-escondida	active
18	738	Hotel Caribe Cartagena	The 5-star Hotel Caribe Cartagena offers comfort and convenience whether you're on business or holiday in Cartagena. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. To be found at the hotel are 24-hour room service, free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, car park. Designed for comfort, selected guestrooms offer cleaning products, mirror, closet, separate living room, internet access – wireless to ensure a restful night. Take a break from a long day and make use of hot tub, fitness center, sauna, golf course (on site), outdoor pool. Discover all Cartagena has to offer by making Hotel Caribe Cartagena your base.	5	03:00 PM	01:00 PM	363	7	1941	2010	Carrera 1, 2-87, Bocagrande		Cartagena	Bolivar	Colombia	CO	-75.560768	10.397937	South America	38	8	10838	10	https://www.agoda.com/partners/partnersearch.aspx?hid=38	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.925871	hotel-caribe-cartagena	active
23	2777	Hilton Garden Inn Pittsburgh University Place	Stop at Hilton Garden Inn Pittsburgh University Place to discover the wonders of Pittsburgh (PA). The hotel offers a wide range of amenities and perks to ensure you have a great time. 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage, Wi-Fi in public areas are just some of the facilities on offer. All rooms are designed and decorated to make guests feel right at home, and some rooms come with television LCD/plasma screen, air conditioning, heating, desk, alarm clock. The hotel offers various recreational opportunities. A welcoming atmosphere and excellent service are what you can expect during your stay at Hilton Garden Inn Pittsburgh University Place.	3	03:00 PM	12:00 PM	\N	\N	\N	\N	3454 Forbes Avenue	15213	Pittsburgh (PA)	Pennsylvania	United States	US	-79.959274	40.439487	North America	69	6	11488	181	https://www.agoda.com/partners/partnersearch.aspx?hid=69	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.976445	hilton-garden-inn-pittsburgh-university-place	active
26	685	Catalonia Brussels Hotel	Ideally located in the prime touristic area of Elsene / Ixelles, Hotel HC Brussels promises a relaxing and wonderful visit. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, car park, room service are there for guest's enjoyment. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as internet access – wireless, air conditioning, heating, wake-up service, desk. The hotel offers various recreational opportunities. No matter what your reasons are for visiting Brussels, Hotel HC Brussels will make you feel instantly at home.	3	03:00 PM	12:00 PM	80	\N	1978	2004	Avenue du Haut-Pont, 2 Hoge Bruglaan	B1060	Brussels	Brussels-Capital	Belgium	BE	4.35322	50.820938	Europe	78	4	15904	118	https://www.agoda.com/partners/partnersearch.aspx?hid=78	2020-05-06 01:06:42.738126	2020-06-11 21:43:01.00334	catalonia-brussels-hotel	active
216	575	Hilton Newark Airport Hotel	Hilton Newark Airport Hotel is conveniently located in the popular Newark Airport Area area. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. All the necessary facilities, including Wi-Fi in public areas, car park, room service, laundry service, elevator, are at hand. Some of the well-appointed guestrooms feature internet access – wireless, non smoking rooms, air conditioning, heating, desk. Take a break from a long day and make use of hot tub, fitness center, outdoor pool. Discover all Newark (NJ) has to offer by making Hilton Newark Airport Hotel your base.	4	04:00 PM	11:00 AM	382	12	1988	\N	1170 Spring Street Elizabeth	07201-2114	Newark (NJ)	New Jersey	United States	US	-74.193253	40.687309	North America	646	6	3936	181	https://www.agoda.com/partners/partnersearch.aspx?hid=646	2020-05-06 01:06:42.864469	2020-06-11 21:43:02.797628	hilton-newark-airport-hotel	active
31	1171	Royal Hotel Sanremo	Located in Sanremo Center, Royal Hotel Sanremo is a perfect starting point from which to explore Sanremo. The hotel has everything you need for a comfortable stay. Free Wi-Fi in all rooms, 24-hour front desk, 24-hour room service, luggage storage, Wi-Fi in public areas are just some of the facilities on offer. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, non smoking rooms, air conditioning, heating, desk. To enhance guests' stay, the hotel offers recreational facilities such as hot tub, fitness center, sauna, golf course (within 3 km), outdoor pool. Convenience and comfort makes Royal Hotel Sanremo the perfect choice for your stay in Sanremo.	5	03:00 PM	12:00 PM	126	5	1872	2013	80 Corso Imperatrice	18038	Sanremo		Italy	IT	7.768031	43.813789	Europe	102	4	79371	205	https://www.agoda.com/partners/partnersearch.aspx?hid=102	2020-05-06 01:06:42.739695	2020-06-11 21:43:01.051273	royal-hotel-sanremo	active
38	787	Corinthia Hotel St. George’s Bay	The 5-star Corinthia Hotel St. George's Bay offers comfort and convenience whether you're on business or holiday in St. Julian's. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Free Wi-Fi in all rooms, 24-hour front desk, express check-in/check-out, luggage storage, Wi-Fi in public areas are just some of the facilities on offer. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. Corinthia Hotel St. George's Bay combines warm hospitality with a lovely ambiance to make your stay in St. Julian's unforgettable.	5	02:00 PM	12:00 PM	249	5	\N	2009	St. George`s Bay	STJ 3301	St. Julian's	Malta	Malta	MT	14.490159	35.929157	Europe	124	4	4329	57	https://www.agoda.com/partners/partnersearch.aspx?hid=124	2020-05-06 01:06:42.745558	2020-06-11 21:43:01.120384	corinthia-hotel-st-george-s-bay	active
42	738	Mariel Hotel Boutique	Located in Lima City Center, Hotel Mariel & Apartments is a perfect starting point from which to explore Lima. The hotel has everything you need for a comfortable stay. Free Wi-Fi in all rooms, 24-hour front desk, luggage storage, Wi-Fi in public areas, valet parking are there for guest's enjoyment. All rooms are designed and decorated to make guests feel right at home, and some rooms come with wake-up service, air conditioning, heating, mini bar, telephone. The hotel offers various recreational opportunities. For reliable service and professional staff, Hotel Mariel & Apartments caters to your needs.	3	02:00 PM	12:00 PM	\N	\N	\N	\N	General Belisario Suarez, 240 - Miraflores	Lima18	Lima		Peru	PE	-77.027382	-12.11821	South America	132	8	7082	186	https://www.agoda.com/partners/partnersearch.aspx?hid=132	2020-05-06 01:06:42.748377	2020-06-11 21:43:01.153335	mariel-hotel-boutique	active
47	1281	Sarova Whitesands Beach Resort & Spa	The 5-star Sarova Whitesands Beach Resort & Spa offers comfort and convenience whether you're on business or holiday in Mombasa. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, car park, airport transfer are just some of the facilities on offer. All rooms are designed and decorated to make guests feel right at home, and some rooms come with separate living room, internet access – wireless, internet access – wireless (complimentary), non smoking rooms, air conditioning. Entertain the hotel's recreational facilities, including fitness center, outdoor pool, spa, massage, kids club. Convenience and comfort makes Sarova Whitesands Beach Resort & Spa the perfect choice for your stay in Mombasa.	5	12:00 PM	10:30 AM	338	3	1984	2012	Nyali/Malindi Highway	00801	Mombasa	Mombasa	Kenya	KE	39.732356	-3.995454	Africa	141	1	7081	176	https://www.agoda.com/partners/partnersearch.aspx?hid=141	2020-05-06 01:06:42.751181	2020-06-11 21:43:01.205243	sarova-whitesands-beach-resort-spa	active
49	738	Van der Valk Hotel Hildesheim	Ideally located in the prime touristic area of Hildesheim City Center, Van der Valk Hotel Hildesheim promises a relaxing and wonderful visit. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. To be found at the hotel are free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, room service, meeting facilities. Designed for comfort, selected guestrooms offer air conditioning, heating, desk, mini bar, iPod docking station to ensure a restful night. Take a break from a long day and make use of fitness center, sauna, indoor pool, spa, massage. Convenience and comfort makes Van der Valk Hotel Hildesheim the perfect choice for your stay in Hildesheim.	4	03:00 PM	12:00 PM	\N	\N	\N	\N	Markt 4, GPS: Jakobistraße	31134	Hildesheim		Germany	DE	9.95159	52.15295	Europe	147	4	1417	101	https://www.agoda.com/partners/partnersearch.aspx?hid=147	2020-05-06 01:06:42.752457	2020-06-11 21:43:01.223451	van-der-valk-hotel-hildesheim	active
53	2237	Cordis, Auckland – a new brand by Langham Hospitality Group	The Langham Auckland Hotel is a popular choice amongst travelers in Auckland, whether exploring or just passing through. The property features a wide range of facilities to make your stay a pleasant experience. To be found at the hotel are 24-hour room service, free Wi-Fi in all rooms, 24-hour security, daily housekeeping, gift/souvenir shop. Television LCD/plasma screen, carpeting, linens, mirror, sofa can be found in selected guestrooms. The hotel offers various recreational opportunities. No matter what your reasons are for visiting Auckland, The Langham Auckland Hotel will make you feel instantly at home.	5	03:00 PM	11:00 AM	409	10	1986	\N	83 Symonds Street	1010	Auckland	Auckland	New Zealand	NZ	174.763706	-36.857836	Pacific Ocean and Australia	153	7	3750	25	https://www.agoda.com/partners/partnersearch.aspx?hid=153	2020-05-06 01:06:42.754837	2020-06-11 21:43:01.270537	cordis-auckland-a-new-brand-by-langham-hospitality-group	active
64	1682	Hotel Silken Alfonso X	The 4-star Hotel Silken Alfonso X offers comfort and convenience whether you're on business or holiday in Ciudad Real. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Service-minded staff will welcome and guide you at the Hotel Silken Alfonso X. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find internet access – wireless (complimentary), air conditioning, heating, wake-up service, desk. The hotel offers various recreational opportunities. Discover all Ciudad Real has to offer by making Hotel Silken Alfonso X your base.	4	02:00 PM	12:00 PM	66	7	2000	\N	Carlos Vazquez Street 8	13001	Ciudad Real		Spain	ES	-3.927567	38.985039	Europe	184	4	12401	167	https://www.agoda.com/partners/partnersearch.aspx?hid=184	2020-05-06 01:06:42.763621	2020-06-11 21:43:01.398142	hotel-silken-alfonso-x	active
79	738	DORMERO Hotel Dresden City	Stop at DORMERO Hotel Koenigshof Dresden to discover the wonders of Dresden. The property features a wide range of facilities to make your stay a pleasant experience. 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out are on the list of things guests can enjoy. Some of the well-appointed guestrooms feature television LCD/plasma screen, separate living room, smoke detector, internet access – wireless (complimentary), non smoking rooms. Entertain the hotel's recreational facilities, including fitness center, sauna. For reliable service and professional staff, DORMERO Hotel Koenigshof Dresden caters to your needs.	4	03:00 PM	12:00 PM	93	\N	\N	\N	Kreischaer Street 2/ Wasaplatz	01219	Dresden	Saxony	Germany	DE	13.760247	51.027672	Europe	229	4	11323	101	https://www.agoda.com/partners/partnersearch.aspx?hid=229	2020-05-06 01:06:42.772241	2020-06-11 21:43:01.569244	dormero-hotel-dresden-city	active
84	738	Rey Arturo Hotel	Rey Arturo Hotel is conveniently located in the popular Villagonzalo Pedernales area. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. To be found at the hotel are free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, car park, room service. Each guestroom is elegantly furnished and equipped with handy amenities. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including skiing, garden. Rey Arturo Hotel is an excellent choice from which to explore Villagonzalo Pedernales or to simply relax and rejuvenate.	3	12:00 PM	12:00 PM	52	2	1996	2010	Ctra. A62, Km 6,600. Villagonzalo Pedernales (Burgos)	09195	Villagonzalo Pedernales	Castile and Leon	Spain	ES	-3.731039	42.306477	Europe	253	4	73941	167	https://www.agoda.com/partners/partnersearch.aspx?hid=253	2020-05-06 01:06:42.775627	2020-06-11 21:43:01.634101	rey-arturo-hotel	active
95	575	Hilton Vienna Plaza	Hilton Vienna Plaza Hotel is perfectly located for both business and leisure guests in Vienna. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Facilities like 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out are readily available for you to enjoy. Designed for comfort, selected guestrooms offer television LCD/plasma screen, additional bathroom, additional toilet, linens, mirror to ensure a restful night. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, sauna, massage. Friendly staff, great facilities and close proximity to all that Vienna has to offer are three great reasons you should stay at Hilton Vienna Plaza Hotel.	5	03:00 PM	12:00 PM	254	10	1988	2014	Schottenring 11	1010 Vienna	Vienna	Vienna	Austria	AT	16.364691	48.215038	Europe	284	4	16582	130	https://www.agoda.com/partners/partnersearch.aspx?hid=284	2020-05-06 01:06:42.781535	2020-06-11 21:43:01.740511	hilton-vienna-plaza	active
98	738	Hotel Don Paco	Hotel Don Paco is conveniently located in the popular Casco Antiguo area. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Facilities like 24-hour room service, free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, car park are readily available for you to enjoy. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, carpeting, internet access – wireless, internet access – wireless (complimentary), whirlpool bathtub. Take a break from a long day and make use of outdoor pool. Discover all Seville has to offer by making Hotel Don Paco your base.	3	02:00 PM	12:00 PM	200	5	1972	2009	Plaza Padre Jeronimo de Cordoba 4	41003	Seville	Andalusia	Spain	ES	-5.986755	37.39275	Europe	293	4	16577	167	https://www.agoda.com/partners/partnersearch.aspx?hid=293	2020-05-06 01:06:42.784057	2020-06-11 21:43:01.764551	hotel-don-paco	active
102	1233	Tryp Mérida Medea Hotel	Tryp Merida Medea Hotel is perfectly located for both business and leisure guests in Merida. The hotel has everything you need for a comfortable stay. 24-hour front desk, Wi-Fi in public areas, car park, family room, car hire are just some of the facilities on offer. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, linens, towels, whirlpool bathtub, non smoking rooms. To enhance guests' stay, the hotel offers recreational facilities such as outdoor pool. Convenience and comfort makes Tryp Merida Medea Hotel the perfect choice for your stay in Merida.	4	02:00 PM	12:00 PM	126	7	\N	\N	Avenida Portugal, s/n	06800	Merida	Extremadura	Spain	ES	-6.362141	38.905277	Europe	302	4	11430	167	https://www.agoda.com/partners/partnersearch.aspx?hid=302	2020-05-06 01:06:42.786624	2020-06-11 21:43:01.797077	tryp-merida-medea-hotel	active
106	738	Hotel Nacional Inn Copacabana	Ibiza Copacabana Hotel is conveniently located in the popular Copacabana / Leme area. The hotel has everything you need for a comfortable stay. Free Wi-Fi in all rooms, 24-hour front desk, luggage storage, room service, family room are on the list of things guests can enjoy. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find air conditioning, desk, mini bar, balcony/terrace, telephone. The hotel offers various recreational opportunities. For reliable service and professional staff, Ibiza Copacabana Hotel caters to your needs.	3	02:00 PM	12:00 PM	\N	\N	\N	\N	Rua Belford Roxo 250	22020010	Rio De Janeiro		Brazil	BR	-43.1763	-22.963381	South America	312	8	7395	207	https://www.agoda.com/partners/partnersearch.aspx?hid=312	2020-05-06 01:06:42.789199	2020-06-11 21:43:01.832973	hotel-nacional-inn-copacabana	active
108	1240	IntercityHotel Hamburg Altona	InterCityHotel Hamburg Altona is a popular choice amongst travelers in Hamburg, whether exploring or just passing through. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. Facilities for disabled guests, Wi-Fi in public areas, restaurant, laundry service, elevator are just some of the facilities on offer. Some of the well-appointed guestrooms feature television LCD/plasma screen, internet access – wireless (complimentary), non smoking rooms, air conditioning, heating. The hotel offers various recreational opportunities. For reliable service and professional staff, InterCityHotel Hamburg Altona caters to your needs.	3	02:00 PM	12:00 PM	133	5	1995	2009	Paul-Nevermann-Platz 17	22765	Hamburg		Germany	DE	9.935905	53.552483	Europe	320	4	7169	101	https://www.agoda.com/partners/partnersearch.aspx?hid=320	2020-05-06 01:06:42.79045	2020-06-11 21:43:01.848362	intercityhotel-hamburg-altona	active
109	738	Hotel & Spa Chateau de l'ile	The 5-star Hôtel & Spa Château de l'ile offers comfort and convenience whether you're on business or holiday in Ostwald. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage, valet parking are just some of the facilities on offer. Each guestroom is elegantly furnished and equipped with handy amenities. To enhance guests' stay, the hotel offers recreational facilities such as hot tub, sauna, golf course (within 3 km), indoor pool, spa. For reliable service and professional staff, Hôtel & Spa Château de l'ile caters to your needs.	5	03:00 PM	12:00 PM	\N	\N	\N	\N	4, Quai Heydt	67540	Illkirch-Graffenstaden		France	FR	7.71379	48.54475	Europe	321	4	23007	153	https://www.agoda.com/partners/partnersearch.aspx?hid=321	2020-05-06 01:06:42.79045	2020-06-11 21:43:01.860693	hotel-spa-chateau-de-l-ile	active
113	2633	Hyatt Regency Austin	Ideally located in the prime touristic area of Austin City Center, Hyatt Regency Austin promises a relaxing and wonderful visit. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Take advantage of the hotel's free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, air conditioning, heating, wake-up service, desk. To enhance guests' stay, the hotel offers recreational facilities such as hot tub, fitness center, outdoor pool. No matter what your reasons are for visiting Austin (TX), Hyatt Regency Austin will make you feel instantly at home.	4	04:00 PM	11:00 AM	448	\N	\N	\N	208 Barton Springs Road	78704	Austin (TX)	Texas	United States	US	-97.747223	30.260761	North America	340	6	4542	181	https://www.agoda.com/partners/partnersearch.aspx?hid=340	2020-05-06 01:06:42.792982	2020-06-11 21:43:01.893501	hyatt-regency-austin	active
115	738	Conti Hotel	Stop at Conti Hotel to discover the wonders of Cologne. The hotel offers a wide range of amenities and perks to ensure you have a great time. Take advantage of the hotel's free Wi-Fi in all rooms, 24-hour front desk, luggage storage, Wi-Fi in public areas, car park. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. No matter what your reasons are for visiting Cologne, Conti Hotel will make you feel instantly at home.	3	02:00 PM	11:00 AM	49	5	1950	2012	Brusseler Street 40-42	50674	Cologne	North Rhine-Westphalia	Germany	DE	6.934433	50.936039	Europe	347	4	16190	101	https://www.agoda.com/partners/partnersearch.aspx?hid=347	2020-05-06 01:06:42.794169	2020-06-11 21:43:01.909674	conti-hotel	active
125	738	Napoleon Hotel	Stop at Napoleon Hotel to discover the wonders of Beirut. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. All the necessary facilities, including 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage, valet parking, are at hand. Internet access – wireless (complimentary), whirlpool bathtub, non smoking rooms, air conditioning, heating can be found in selected guestrooms. Entertain the hotel's recreational facilities, including massage. No matter what your reasons are for visiting Beirut, Napoleon Hotel will make you feel instantly at home.	4	03:00 PM	12:00 PM	\N	8	\N	2010	N. Yafet Street, Hamra Area	1103	Beirut		Lebanon	LB	35.479889	33.897209	Middle East	372	5	11680	68	https://www.agoda.com/partners/partnersearch.aspx?hid=372	2020-05-06 01:06:42.800565	2020-06-11 21:43:02.001492	napoleon-hotel	active
131	2331	Mercure Kuta Bali	Set in a prime location of Bali, Mercure Kuta Bali puts everything the city has to offer just outside your doorstep. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Facilities like 24-hour room service, ticket service, gift/souvenir shop, 24-hour security, convenience store are readily available for you to enjoy. Designed for comfort, selected guestrooms offer television LCD/plasma screen, mirror, internet access – wireless, internet access – wireless (complimentary), non smoking rooms to ensure a restful night. To enhance guests' stay, the hotel offers recreational facilities such as water park, surfing lessons, outdoor pool, spa, pool (kids). Discover all Bali has to offer by making Mercure Kuta Bali your base.	4	02:00 PM	12:00 PM	130	4	2001	2018	Kuta Beach Street 10 X Br Pande Mas	80361	Bali	Bali	Indonesia	ID	115.169792	-8.721107	Asia	385	2	17193	192	https://www.agoda.com/partners/partnersearch.aspx?hid=385	2020-05-06 01:06:42.805086	2020-06-11 21:43:02.051637	mercure-kuta-bali	active
139	1770	Quirinale Hotel	Quirinale Hotel is conveniently located in the popular Termini Central Station area. Both business travelers and tourists can enjoy the hotel's facilities and services. Service-minded staff will welcome and guide you at the Quirinale Hotel. Television LCD/plasma screen, internet access – wireless (complimentary), non smoking rooms, air conditioning, heating can be found in selected guestrooms. To enhance guests' stay, the hotel offers recreational facilities such as fitness center, garden. For reliable service and professional staff, Quirinale Hotel caters to your needs.	4	02:00 PM	12:00 PM	210	5	1865	\N	Via Nazionale 7	00184	Rome	Lazio	Italy	IT	12.49506	41.901478	Europe	407	4	16594	205	https://www.agoda.com/partners/partnersearch.aspx?hid=407	2020-05-06 01:06:42.81072	2020-06-11 21:43:02.11615	quirinale-hotel	active
141	738	Jerusalem Gold Hotel	Located in Central Bus Station Area, Jerusalem Gold Hotel is a perfect starting point from which to explore Jerusalem. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. All the necessary facilities, including 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out, are at hand. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like air conditioning, heating, wake-up service, desk, soundproofing. The hotel offers various recreational opportunities. Discover all Jerusalem has to offer by making Jerusalem Gold Hotel your base.	4	03:00 PM	11:00 AM	196	11	2002	2010	234 Jaffa Street	94383	Jerusalem	Jerusalem	Israel	IL	35.201527	31.788923	Middle East	411	5	9927	144	https://www.agoda.com/partners/partnersearch.aspx?hid=411	2020-05-06 01:06:42.811873	2020-06-11 21:43:02.132138	jerusalem-gold-hotel	active
153	2607	Scandic Olympic	The 3-star Scandic Olympic offers comfort and convenience whether you're on business or holiday in Esbjerg. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. Free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas are just some of the facilities on offer. Some of the well-appointed guestrooms feature heating, balcony/terrace, desk, telephone, television LCD/plasma screen. The hotel offers various recreational opportunities. Scandic Olympic combines warm hospitality with a lovely ambiance to make your stay in Esbjerg unforgettable.	3	03:00 PM	12:00 PM	\N	\N	\N	\N	Strandbygade 3	6700	Esbjerg		Denmark	DK	8.44177	55.467098	Europe	440	4	2038	158	https://www.agoda.com/partners/partnersearch.aspx?hid=440	2020-05-06 01:06:42.818917	2020-06-11 21:43:02.244501	scandic-olympic	active
157	1556	Radisson Blu Royal Viking Hotel Stockholm	Set in a prime location of Stockholm, Radisson Blu Royal Viking Hotel Stockholm puts everything the city has to offer just outside your doorstep. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Take advantage of the hotel's free Wi-Fi in all rooms, 24-hour front desk, 24-hour room service, facilities for disabled guests, express check-in/check-out. Each guestroom is elegantly furnished and equipped with handy amenities. Entertain the hotel's recreational facilities, including hot tub, fitness center, sauna, indoor pool. Convenience and comfort makes Radisson Blu Royal Viking Hotel Stockholm the perfect choice for your stay in Stockholm.	5	03:00 PM	12:00 PM	459	9	1984	2019	Vasagatan 1	S-10124	Stockholm	Stockholm	Sweden	SE	18.058117	59.331429	Europe	448	4	1618	49	https://www.agoda.com/partners/partnersearch.aspx?hid=448	2020-05-06 01:06:42.821321	2020-06-11 21:43:02.277584	radisson-blu-royal-viking-hotel-stockholm	active
158	1642	Crowne Plaza Beijing Wangfujing	Crowne Plaza Beijing Wangfujing is conveniently located in the popular Wangfujing Street & Forbidden City area. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. Service-minded staff will welcome and guide you at the Crowne Plaza Beijing Wangfujing. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, internet access – wireless, internet access – wireless (complimentary), non smoking rooms, air conditioning. The hotel offers various recreational opportunities. Convenience and comfort makes Crowne Plaza Beijing Wangfujing the perfect choice for your stay in Beijing.	5	02:00 PM	12:00 PM	335	9	1991	2009	48 Wangfujing Avenue	100006	Beijing	Beijing	China	CN	116.411217	39.918953	Asia	449	2	1569	191	https://www.agoda.com/partners/partnersearch.aspx?hid=449	2020-05-06 01:06:42.822636	2020-06-11 21:43:02.293734	crowne-plaza-beijing-wangfujing	active
162	738	Ambra Cortina Luxury&Fashion Hotel	Located in Cortina d'Ampezzo City Center, Hotel Ambra is a perfect starting point from which to explore Cortina d'Ampezzo. Both business travelers and tourists can enjoy the hotel's facilities and services. To be found at the hotel are free Wi-Fi in all rooms, 24-hour front desk, luggage storage, car park, room service. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as heating, wake-up service, mini bar, telephone, television LCD/plasma screen. The hotel offers various recreational opportunities. Discover all Cortina d'Ampezzo has to offer by making Hotel Ambra your base.	4	02:00 PM	12:00 PM	\N	\N	\N	\N	Via XXIX Maggio 28	32043	Cortina d'Ampezzo		Italy	IT	12.13808	46.537842	Europe	468	4	10951	205	https://www.agoda.com/partners/partnersearch.aspx?hid=468	2020-05-06 01:06:42.825554	2020-06-11 21:43:02.329369	ambra-cortina-luxury-fashion-hotel	active
164	738	Scandic Stavanger Park	Scandic Stavanger Park is perfectly located for both business and leisure guests in Stavanger. Both business travelers and tourists can enjoy the hotel's facilities and services. Facilities for disabled guests, luggage storage, meeting facilities, newspapers, dry cleaning are there for guest's enjoyment. All rooms are designed and decorated to make guests feel right at home, and some rooms come with heating, desk, mini bar, telephone, television LCD/plasma screen. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including golf course (within 3 km). Scandic Stavanger Park combines warm hospitality with a lovely ambiance to make your stay in Stavanger unforgettable.	4	03:00 PM	12:00 PM	\N	\N	\N	\N	Prestegårdsbakken 1	4002	Stavanger		Norway	NO	5.73103	58.965618	Europe	475	4	6796	129	https://www.agoda.com/partners/partnersearch.aspx?hid=475	2020-05-06 01:06:42.826845	2020-06-11 21:43:02.344983	scandic-stavanger-park	active
165	1770	Ercilla Hotel	Ercilla Hotel is conveniently located in the popular Abando area. The property features a wide range of facilities to make your stay a pleasant experience. Take advantage of the hotel's 24-hour room service, casino, facilities for disabled guests, valet parking, car park. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. For reliable service and professional staff, Ercilla Hotel caters to your needs.	4	02:00 PM	12:00 PM	325	13	1972	\N	Ercilla 37-38	48011	Bilbao	Basque Country	Spain	ES	-2.938564	43.261097	Europe	476	4	7413	167	https://www.agoda.com/partners/partnersearch.aspx?hid=476	2020-05-06 01:06:42.826845	2020-06-11 21:43:02.352375	ercilla-hotel	active
176	738	Hotel Sveitsi	Rantasipi Sveitsi is perfectly located for both business and leisure guests in Hyvinkaa. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. To be found at the hotel are free Wi-Fi in all rooms, 24-hour front desk, luggage storage, meeting facilities, restaurant. Designed for comfort, selected guestrooms offer heating, desk, satellite/cable TV, toiletries, hair dryer to ensure a restful night. To enhance guests' stay, the hotel offers recreational facilities such as fitness center, golf course (within 3 km), garden. Rantasipi Sveitsi is an excellent choice from which to explore Hyvinkaa or to simply relax and rejuvenate.	4	03:00 PM	12:00 PM	\N	\N	\N	\N	Härkävehmaankatu 4	05900	Hyvinkaa		Finland	FI	24.83193	60.632568	Europe	500	4	16503	28	https://www.agoda.com/partners/partnersearch.aspx?hid=500	2020-05-06 01:06:42.834771	2020-06-11 21:43:02.448209	hotel-sveitsi	active
181	2355	Pullman Dubai Creek City Centre	Pullman Dubai Creek City Centre is perfectly located for both business and leisure guests in Dubai. Both business travelers and tourists can enjoy the hotel's facilities and services. Take advantage of the hotel's 24-hour room service, free Wi-Fi in all rooms, 24-hour security, convenience store, daily housekeeping. Some of the well-appointed guestrooms feature television LCD/plasma screen, internet access – wireless, internet access – wireless (complimentary), non smoking rooms, air conditioning. Entertain the hotel's recreational facilities, including bowling alley, dart board, fitness center, sauna, golf course (within 3 km). For reliable service and professional staff, Pullman Dubai Creek City Centre caters to your needs.	5	03:00 PM	12:00 PM	317	11	1998	2012	Baniyas Road, Deira City Centre P.O. Box 61871, Deira, Dubai United Arab Emirates	61871	Dubai	Dubai	United Arab Emirates	AE	55.335073	25.250837	Middle East	514	5	2994	64	https://www.agoda.com/partners/partnersearch.aspx?hid=514	2020-05-06 01:06:42.837631	2020-06-11 21:43:02.496949	pullman-dubai-creek-city-centre	active
185	2360	Le 123 Elysees - Astotel	The 4-star Le 123 Elysees - Astotel offers comfort and convenience whether you're on business or holiday in Paris. The property features a wide range of facilities to make your stay a pleasant experience. Service-minded staff will welcome and guide you at the Le 123 Elysees - Astotel. Designed for comfort, selected guestrooms offer television LCD/plasma screen, complimentary instant coffee, complimentary tea, linens, mirror to ensure a restful night. The hotel offers various recreational opportunities. Le 123 Elysees - Astotel is an excellent choice from which to explore Paris or to simply relax and rejuvenate.	4	02:00 PM	12:00 PM	41	6	1889	2016	123 Rue Du Faubourg St Honore	75008	Paris	Ile-de-France	France	FR	2.309849	48.873009	Europe	537	4	15470	153	https://www.agoda.com/partners/partnersearch.aspx?hid=537	2020-05-06 01:06:42.840565	2020-06-11 21:43:02.535355	le-123-elysees-astotel	active
187	2379	DoubleTree by Hilton Hotel and Suites Houston by the Galleria	DoubleTree Suites by Hilton Houston by the Galleri is conveniently located in the popular Westchase area. Both business travelers and tourists can enjoy the hotel's facilities and services. 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage, Wi-Fi in public areas are just some of the facilities on offer. Some of the well-appointed guestrooms feature television LCD/plasma screen, non smoking rooms, air conditioning, heating, desk. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, outdoor pool, games room. DoubleTree Suites by Hilton Houston by the Galleri is an excellent choice from which to explore Houston (TX) or to simply relax and rejuvenate.	4	04:00 PM	12:00 PM	476	\N	\N	\N	5353 Westheimer Road	77056	Houston (TX)	Texas	United States	US	-95.469223	29.738855	North America	542	6	1178	181	https://www.agoda.com/partners/partnersearch.aspx?hid=542	2020-05-06 01:06:42.842006	2020-06-11 21:43:02.554867	doubletree-by-hilton-hotel-and-suites-houston-by-the-galleria	active
190	575	Hilton Strasbourg	Hilton Strasbourg Hotel is conveniently located in the popular Kable area. Both business travelers and tourists can enjoy the hotel's facilities and services. 24-hour room service, facilities for disabled guests, Wi-Fi in public areas, valet parking, car park are there for guest's enjoyment. Some of the well-appointed guestrooms feature television LCD/plasma screen, carpeting, slippers, separate living room, smoke detector. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, tennis courts. Friendly staff, great facilities and close proximity to all that Strasbourg has to offer are three great reasons you should stay at Hilton Strasbourg Hotel.	4	03:00 PM	12:00 PM	245	7	1980	2018	Avenue Herrenschmidt	67000	Strasbourg	Alsace	France	FR	7.75364	48.598518	Europe	547	4	7254	153	https://www.agoda.com/partners/partnersearch.aspx?hid=547	2020-05-06 01:06:42.845158	2020-06-11 21:43:02.579171	hilton-strasbourg	active
194	1642	ANA Crowne Plaza Osaka	Located in Umeda, ANA Crowne Plaza Osaka is a perfect starting point from which to explore Osaka. The hotel offers a wide range of amenities and perks to ensure you have a great time. Facilities like free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas are readily available for you to enjoy. Some of the well-appointed guestrooms feature television LCD/plasma screen, internet access – wireless (complimentary), non smoking rooms, air conditioning, heating. The hotel offers various recreational opportunities. ANA Crowne Plaza Osaka is an excellent choice from which to explore Osaka or to simply relax and rejuvenate.	5	03:00 PM	12:00 PM	473	24	1984	2008	Kita-ku Dojimahama 1-3-1	530-0004	Osaka	Osaka	Japan	JP	135.498367	34.695301	Asia	559	2	9590	3	https://www.agoda.com/partners/partnersearch.aspx?hid=559	2020-05-06 01:06:42.848306	2020-06-11 21:43:02.616871	ana-crowne-plaza-osaka	active
314	1642	Crowne Plaza Brugge	Stop at Crowne Plaza Hotel Brugge to discover the wonders of Bruges. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Service-minded staff will welcome and guide you at the Crowne Plaza Hotel Brugge. Television LCD/plasma screen, non smoking rooms, air conditioning, desk, mini bar can be found in selected guestrooms. The hotel offers various recreational opportunities. For reliable service and professional staff, Crowne Plaza Hotel Brugge caters to your needs.	4	03:00 PM	11:00 AM	96	8	\N	\N	Burg 10	8000	Bruges	West Flanders	Belgium	BE	3.227411	51.208912	Europe	934	4	17729	118	https://www.agoda.com/partners/partnersearch.aspx?hid=934	2020-05-06 01:06:42.94101	2020-06-11 21:43:03.607765	crowne-plaza-brugge	active
200	738	Hotel Belloy Saint Germain	Located in 6th - Saint Germain - Luxembourg, Hotel Belloy Saint Germain is a perfect starting point from which to explore Paris. The hotel has everything you need for a comfortable stay. Take advantage of the hotel's 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, luggage storage, car park. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, linens, locker, mirror, towels. The hotel offers various recreational opportunities. Convenience and comfort makes Hotel Belloy Saint Germain the perfect choice for your stay in Paris.	4	02:00 PM	12:00 PM	50	6	\N	\N	2, Rue Racine	75006	Paris	Ile-de-France	France	FR	2.342217	48.850338	Europe	590	4	15470	153	https://www.agoda.com/partners/partnersearch.aspx?hid=590	2020-05-06 01:06:42.852619	2020-06-11 21:43:02.664002	hotel-belloy-saint-germain	active
204	1315	Sutton Place Hotel	Sutton Place Hotel is a popular choice amongst travelers in Vancouver (BC), whether exploring or just passing through. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. To be found at the hotel are 24-hour room service, facilities for disabled guests, Wi-Fi in public areas, valet parking, car park. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, separate living room, air conditioning, heating, wake-up service. Take a break from a long day and make use of hot tub, fitness center, indoor pool, spa, massage. No matter what your reasons are for visiting Vancouver (BC), Sutton Place Hotel will make you feel instantly at home.	5	3:00 PM	12:00 PM	397	\N	\N	2012	845, Burrard Street	V6Z 2K6	Vancouver (BC)		Canada	CA	-123.124207	49.282642	North America	602	6	9023	100	https://www.agoda.com/partners/partnersearch.aspx?hid=602	2020-05-06 01:06:42.855601	2020-06-11 21:43:02.698513	sutton-place-hotel	active
211	1549	Dan Panorama Jerusalem Hotel	Dan Panorama Jerusalem Hotel is a popular choice amongst travelers in Jerusalem, whether exploring or just passing through. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage are just some of the facilities on offer. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, outdoor pool, kids club, games room. No matter what your reasons are for visiting Jerusalem, Dan Panorama Jerusalem Hotel will make you feel instantly at home.	0	03:00 PM	12:00 PM	289	\N	\N	\N	39 Keren Hayesod Street	94188	Jerusalem		Israel	IL	35.221645	31.772472	Middle East	634	5	9927	144	https://www.agoda.com/partners/partnersearch.aspx?hid=634	2020-05-06 01:06:42.860008	2020-06-11 21:43:02.758585	dan-panorama-jerusalem-hotel	active
215	2229	Emperor Hotel	Located in Macau City, Emperor Hotel is a perfect starting point from which to explore Macau. The hotel offers a wide range of amenities and perks to ensure you have a great time. All the necessary facilities, including free Wi-Fi in all rooms, 24-hour security, daily housekeeping, ticket service, 24-hour front desk, are at hand. Some of the well-appointed guestrooms feature television LCD/plasma screen, carpeting, clothes rack, complimentary instant coffee, complimentary tea. To enhance guests' stay, the hotel offers recreational facilities such as sauna. Convenience and comfort makes Emperor Hotel the perfect choice for your stay in Macau.	4	02:00 PM	12:00 PM	390	22	1992	2013	51 Rua de Xangai	                    	Macau		Macau	MO	113.547939	22.191001	Asia	645	2	21397	169	https://www.agoda.com/partners/partnersearch.aspx?hid=645	2020-05-06 01:06:42.862882	2020-06-11 21:43:02.788906	emperor-hotel	active
224	738	Han Hsien International Hotel	The 5-star Han Hsien International Hotel offers comfort and convenience whether you're on business or holiday in Kaohsiung. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, valet parking, car park are just some of the facilities on offer. All rooms are designed and decorated to make guests feel right at home, and some rooms come with clothes rack, separate living room, television LCD/plasma screen, internet access – wireless, internet access – wireless (complimentary). The hotel offers various recreational opportunities. Discover all Kaohsiung has to offer by making Han Hsien International Hotel your base.	5	03:00 PM	12:00 PM	380	42	2007	\N	No. 33, Sszuwei 3rd Road	                    	Kaohsiung	Kaohsiung City	Taiwan	TW	120.310881	22.619157	Asia	666	2	756	140	https://www.agoda.com/partners/partnersearch.aspx?hid=666	2020-05-06 01:06:42.870896	2020-06-11 21:43:02.866583	han-hsien-international-hotel	active
240	738	Hotel Bellavista	Stop at Hotel Bellavista to discover the wonders of Puerto Varas. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. 24-hour front desk, facilities for disabled guests, luggage storage, room service, airport transfer are on the list of things guests can enjoy. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as internet access – wireless (complimentary), non smoking rooms, heating, wake-up service, mini bar. The hotel offers various recreational opportunities. No matter what your reasons are for visiting Puerto Varas, Hotel Bellavista will make you feel instantly at home.	4	03:00 PM	12:00 PM	\N	\N	\N	\N	Avda Vicente Perez Rosales, 060	9999999	Puerto Varas		Chile	CL	-72.980392	-41.31905	South America	709	8	8934	69	https://www.agoda.com/partners/partnersearch.aspx?hid=709	2020-05-06 01:06:42.881882	2020-06-11 21:43:03.000203	hotel-bellavista	active
243	1693	Best Western CTC Hotel Verona	Best Western CTC Hotel Verona is conveniently located in the popular San Giovanni Lupatoto area. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. Facilities like free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas are readily available for you to enjoy. All rooms are designed and decorated to make guests feel right at home, and some rooms come with television LCD/plasma screen, linens, towels, closet, internet access – wireless (complimentary). Access to the hotel's fitness center will further enhance your satisfying stay. Discover all Verona has to offer by making Best Western CTC Hotel Verona your base.	4	02:00 PM	12:00 PM	203	10	2000	2011	28 Monte Pastello Street	37057	Verona		Italy	IT	11.015969	45.398712	Europe	715	4	4257	205	https://www.agoda.com/partners/partnersearch.aspx?hid=715	2020-05-06 01:06:42.883512	2020-06-11 21:43:03.024074	best-western-ctc-hotel-verona	active
248	738	Hotel Montparnasse Alesia	Stop at Hotel Montparnasse Alesia to discover the wonders of Paris. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. To be found at the hotel are free Wi-Fi in all rooms, Wi-Fi in public areas, car park, tours, coffee shop. Some of the well-appointed guestrooms feature television LCD/plasma screen, internet access – wireless, internet access – wireless (complimentary), air conditioning, heating. The hotel offers various recreational opportunities. Hotel Montparnasse Alesia combines warm hospitality with a lovely ambiance to make your stay in Paris unforgettable.	3	02:00 PM	12:00 PM	70	\N	\N	\N	Street Alesia 147 ter	75014	Paris		France	FR	2.32037	48.83012	Europe	724	4	15470	153	https://www.agoda.com/partners/partnersearch.aspx?hid=724	2020-05-06 01:06:42.888785	2020-06-11 21:43:03.06433	hotel-montparnasse-alesia	active
249	1836	Novotel Paris Nord Expo Aulnay	Stop at Novotel Paris Nord Expo Aulnay to discover the wonders of Aulnay-sous-Bois. Both business travelers and tourists can enjoy the hotel's facilities and services. Take advantage of the hotel's 24-hour room service, free Wi-Fi in all rooms, taxi service, wheelchair accessible, 24-hour front desk. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, linens, mirror, towels, closet. Take a break from a long day and make use of outdoor pool. Convenience and comfort makes Novotel Paris Nord Expo Aulnay the perfect choice for your stay in Aulnay-sous-Bois.	4	02:00 PM	12:00 PM	139	5	1974	2015	65 Rue Michel ange	93600	Aulnay-sous-Bois	Ile-de-France	France	FR	2.487338	48.955265	Europe	725	4	101583	153	https://www.agoda.com/partners/partnersearch.aspx?hid=725	2020-05-06 01:06:42.888785	2020-06-11 21:43:03.072913	novotel-paris-nord-expo-aulnay	active
251	1836	Novotel Praha Wenceslas Square Hotel	Located in Prague 02, Novotel Praha Wenceslas Square Hotel is a perfect starting point from which to explore Prague. Both business travelers and tourists can enjoy the hotel's facilities and services. Take advantage of the hotel's 24-hour room service, facilities for disabled guests, car park, room service, restaurant. Television LCD/plasma screen, separate living room, air conditioning, wake-up service, desk can be found in selected guestrooms. The hotel's peaceful atmosphere extends to its recreational facilities which include hot tub, fitness center, sauna, indoor pool, massage. Novotel Praha Wenceslas Square Hotel is an excellent choice from which to explore Prague or to simply relax and rejuvenate.	4	02:00 PM	12:00 PM	147	5	2000	\N	38 Katerinska	12000	Prague	Prague	Czech Republic	CZ	14.427843	50.075203	Europe	729	4	15977	13	https://www.agoda.com/partners/partnersearch.aspx?hid=729	2020-05-06 01:06:42.890622	2020-06-11 21:43:03.089017	novotel-praha-wenceslas-square-hotel	active
255	1500	Isrotel King Solomon Hotel	Set in a prime location of Eilat, Isrotel King Solomon Hotel puts everything the city has to offer just outside your doorstep. Both business travelers and tourists can enjoy the hotel's facilities and services. Free Wi-Fi in all rooms, 24-hour front desk, 24-hour room service, facilities for disabled guests, luggage storage are just some of the facilities on offer. All rooms are designed and decorated to make guests feel right at home, and some rooms come with complimentary tea, closet, towels, television LCD/plasma screen, sofa. To enhance guests' stay, the hotel offers recreational facilities such as hot tub, fitness center, sauna, outdoor pool, spa. Discover all Eilat has to offer by making Isrotel King Solomon Hotel your base.	5	03:00 PM	12:00 PM	\N	\N	\N	\N	North Beach	88000	Eilat	Southern	Israel	IL	34.961952	29.552385	Middle East	742	5	9752	144	https://www.agoda.com/partners/partnersearch.aspx?hid=742	2020-05-06 01:06:42.894928	2020-06-11 21:43:03.122948	isrotel-king-solomon-hotel	active
258	738	Hotel Ducasse	Ideally located in the prime touristic area of Copacabana / Leme, Hotel Ducasse promises a relaxing and wonderful visit. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. To be found at the hotel are 24-hour front desk, luggage storage, family room, newspapers, elevator. Designed for comfort, selected guestrooms offer air conditioning, balcony/terrace, telephone, television, satellite/cable TV to ensure a restful night. The hotel offers various recreational opportunities. For reliable service and professional staff, Hotel Ducasse caters to your needs.	3	02:00 PM	12:00 PM	\N	\N	\N	\N	Rua Sá Ferreira, 76	22071100	Rio De Janeiro		Brazil	BR	-43.191891	-22.98097	South America	756	8	7395	207	https://www.agoda.com/partners/partnersearch.aspx?hid=756	2020-05-06 01:06:42.898697	2020-06-11 21:43:03.147285	hotel-ducasse	active
263	575	Hilton Nagoya	Hilton Nagoya hotel is perfectly located for both business and leisure guests in Nagoya. The property features a wide range of facilities to make your stay a pleasant experience. 24-hour security, daily housekeeping, gift/souvenir shop, taxi service, 24-hour front desk are there for guest's enjoyment. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, clothes rack, complimentary instant coffee, complimentary tea, free welcome drink. Enjoy the hotel's recreational facilities, including fitness center, sauna, indoor pool, spa, massage, before retiring to your room for a well-deserved rest. No matter what your reasons are for visiting Nagoya, Hilton Nagoya hotel will make you feel instantly at home.	4	03:00 PM	12:00 PM	460	28	\N	2016	3-3, Sakae 1-chome, Naka-ku	460-0008	Nagoya	Aichi	Japan	JP	136.894501	35.1675	Asia	783	2	13740	3	https://www.agoda.com/partners/partnersearch.aspx?hid=783	2020-05-06 01:06:42.902345	2020-06-11 21:43:03.187838	hilton-nagoya	active
274	751	Kyoto Hotel Okura	Kyoto Hotel Okura is perfectly located for both business and leisure guests in Kyoto. The hotel has everything you need for a comfortable stay. Take advantage of the hotel's free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as television LCD/plasma screen, internet access – wireless, internet access – wireless (complimentary), non smoking rooms, air conditioning. Access to the hotel's fitness center, sauna, massage, steamroom will further enhance your satisfying stay. Kyoto Hotel Okura is an excellent choice from which to explore Kyoto or to simply relax and rejuvenate.	5	03:00 PM	11:00 AM	321	17	1994	\N	Kawara-machi-oike Nakagyo-ku	604-8558	Kyoto	Kyoto	Japan	JP	135.769418	35.011712	Asia	817	2	1784	3	https://www.agoda.com/partners/partnersearch.aspx?hid=817	2020-05-06 01:06:42.914393	2020-06-11 21:43:03.276454	kyoto-hotel-okura	active
275	738	Hotel Touring	Set in a prime location of Bologna, Hotel Touring puts everything the city has to offer just outside your doorstep. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Facilities like 24-hour front desk, facilities for disabled guests, luggage storage, room service, meeting facilities are readily available for you to enjoy. Some of the well-appointed guestrooms feature air conditioning, heating, desk, mini bar, soundproofing. The hotel offers various recreational opportunities. Discover all Bologna has to offer by making Hotel Touring your base.	4	02:00 PM	11:30 AM	\N	\N	\N	\N	Via de' Mattuiani 1/2	40124	Bologna		Italy	IT	11.34248	44.489052	Europe	821	4	1002	205	https://www.agoda.com/partners/partnersearch.aspx?hid=821	2020-05-06 01:06:42.914393	2020-06-11 21:43:03.285254	hotel-touring	active
279	738	Anchorage Port Stephens	Anchorage Port Stephens is perfectly located for both business and leisure guests in Port Stephens. Both business travelers and tourists can enjoy the hotel's facilities and services. All the necessary facilities, including free Wi-Fi in all rooms, daily housekeeping, fireplace, private check in/check out, wheelchair accessible, are at hand. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, non smoking rooms, air conditioning, heating, wake-up service. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including fitness center, sauna, golf course (within 3 km), outdoor pool, diving. For reliable service and professional staff, Anchorage Port Stephens caters to your needs.	5	03:00 PM	11:00 AM	80	2	1992	2016	Corlette Point Road	2315	Port Stephens	New South Wales	Australia	AU	152.105713	-32.718744	Pacific Ocean and Australia	830	7	12619	139	https://www.agoda.com/partners/partnersearch.aspx?hid=830	2020-05-06 01:06:42.917313	2020-06-11 21:43:03.31738	anchorage-port-stephens	active
281	2690	Radisson Blu Resort	Set in a prime location of St. Julian's, Radisson Blu Resort puts everything the city has to offer just outside your doorstep. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. Facilities like 24-hour room service, free Wi-Fi in all rooms, 24-hour security, car power charging station, convenience store are readily available for you to enjoy. Television LCD/plasma screen, internet access – wireless, private pool, internet access – wireless (complimentary), whirlpool bathtub can be found in selected guestrooms. The hotel's peaceful atmosphere extends to its recreational facilities which include watersports equipment rentals, hot tub, private beach, fitness center, sauna. Convenience and comfort makes Radisson Blu Resort the perfect choice for your stay in St. Julian's.	4		11:00 AM	252	7	\N	2015	St. Georges Bay	STJ3391	St. Julian's	Malta	Malta	MT	14.490967	35.927807	Europe	834	4	4329	57	https://www.agoda.com/partners/partnersearch.aspx?hid=834	2020-05-06 01:06:42.919021	2020-06-11 21:43:03.333327	radisson-blu-resort	active
290	2273	Holiday Inn Hamburg	Holiday Inn Hamburg is conveniently located in the popular Rothenburgsort area. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Service-minded staff will welcome and guide you at the Holiday Inn Hamburg. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. A welcoming atmosphere and excellent service are what you can expect during your stay at Holiday Inn Hamburg.	4			\N	\N	\N	\N	Billwerder Neuer Deich 14	20539	Hamburg	Hamburg	Germany	DE	10.030534	53.535336	Europe	853	4	7169	101	https://www.agoda.com/partners/partnersearch.aspx?hid=853	2020-05-06 01:06:42.926409	2020-06-11 21:43:03.409761	holiday-inn-hamburg	active
293	1770	Rilano 24/7 Munich Hotel	Ideally located in the prime touristic area of Schwabing, Rilano 24/7 Munich Hotel promises a relaxing and wonderful visit. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Free Wi-Fi in all rooms, daily housekeeping, 24-hour front desk, facilities for disabled guests, Wi-Fi in public areas are on the list of things guests can enjoy. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. Rilano 24/7 Munich Hotel is an excellent choice from which to explore Munich or to simply relax and rejuvenate.	3	3:00 PM	11:00 AM	228	12	1972	2012	Domagkstrasse 26, Bavaria	80807	Munich	Bavaria	Germany	DE	11.594804	48.183319	Europe	861	4	16017	101	https://www.agoda.com/partners/partnersearch.aspx?hid=861	2020-05-06 01:06:42.927524	2020-06-11 21:43:03.433102	rilano-24-7-munich-hotel	active
295	738	Savoy Hotel	The 4-star Savoy Hotel offers comfort and convenience whether you're on business or holiday in Rome. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Take advantage of the hotel's free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, Wi-Fi in public areas, valet parking. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, bathroom phone, carpeting, slippers, smoke detector. Access to the hotel's indoor pool will further enhance your satisfying stay. Savoy Hotel combines warm hospitality with a lovely ambiance to make your stay in Rome unforgettable.	4	02:00 PM	10:00 AM	120	6	1889	2017	Via Ludovisi 15	00187	Rome	Lazio	Italy	IT	12.489181	41.907291	Europe	866	4	16594	205	https://www.agoda.com/partners/partnersearch.aspx?hid=866	2020-05-06 01:06:42.928608	2020-06-11 21:43:03.449433	savoy-hotel	active
35	1601	Hotel Sunroute Nara	Ideally located in the prime touristic area of Nara City Center, Hotel Sunroute Nara promises a relaxing and wonderful visit. The property features a wide range of facilities to make your stay a pleasant experience. To be found at the hotel are free Wi-Fi in all rooms, daily housekeeping, laundromat, 24-hour front desk, Wi-Fi in public areas. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, non smoking rooms, air conditioning, heating, wake-up service. The hotel offers various recreational opportunities. Convenience and comfort makes Hotel Sunroute Nara the perfect choice for your stay in Nara.	3	02:00 PM	11:00 AM	95	5	1981	2005	1110 Takabatake-cho	630-8301	Nara	Nara	Japan	JP	135.83226	34.679607	Asia	109	2	13313	3	https://www.agoda.com/partners/partnersearch.aspx?hid=109	2020-05-06 01:06:42.742533	2020-06-11 21:43:01.0889	hotel-sunroute-nara	active
75	751	Hotel East 21 Tokyo (Okura Hotels & Resorts)	Set in a prime location of Tokyo, Hotel East 21 Tokyo (Okura Hotels & Resorts) puts everything the city has to offer just outside your doorstep. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Free Wi-Fi in all rooms, shrine, daily housekeeping, 24-hour front desk, Wi-Fi in public areas are on the list of things guests can enjoy. Some of the well-appointed guestrooms feature television LCD/plasma screen, air purifier, complimentary tea, linens, mirror. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, sauna, outdoor pool, indoor pool, massage. Hotel East 21 Tokyo (Okura Hotels & Resorts) is an excellent choice from which to explore Tokyo or to simply relax and rejuvenate.	4	02:00 PM	11:00 AM	394	21	1992	2012	6-3-3 Toyo, Koto-Ku	135-0016	Tokyo	Tokyo	Japan	JP	139.814587	35.674747	Asia	217	2	5085	3	https://www.agoda.com/partners/partnersearch.aspx?hid=217	2020-05-06 01:06:42.769711	2020-06-11 21:43:01.518453	hotel-east-21-tokyo-okura-hotels-resorts	active
77	738	Kongress Hotel Davos	Kongress Hotel Davos is perfectly located for both business and leisure guests in Davos. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Facilities like 24-hour front desk, facilities for disabled guests, luggage storage, room service, meeting facilities are readily available for you to enjoy. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find heating, wake-up service, desk, mini bar, balcony/terrace. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including sauna, golf course (within 3 km), massage, table tennis, garden. Friendly staff, great facilities and close proximity to all that Davos has to offer are three great reasons you should stay at Kongress Hotel Davos.	4	02:00 PM	12:00 PM	\N	\N	\N	\N	Promenade 94	7270	Davos		Switzerland	CH	9.83211	46.801151	Europe	220	4	12190	51	https://www.agoda.com/partners/partnersearch.aspx?hid=220	2020-05-06 01:06:42.77091	2020-06-11 21:43:01.544895	kongress-hotel-davos	active
134	738	Carsson Hotel Buenos Aires	Set in a prime location of Buenos Aires, Carsson Hotel Buenos Aires puts everything the city has to offer just outside your doorstep. The hotel offers a wide range of amenities and perks to ensure you have a great time. Car park, family room, tours, coffee shop, concierge are there for guest's enjoyment. Each guestroom is elegantly furnished and equipped with handy amenities. Take a break from a long day and make use of fitness center, garden. Friendly staff, great facilities and close proximity to all that Buenos Aires has to offer are three great reasons you should stay at Carsson Hotel Buenos Aires.	4	01:00 PM	11:00 AM	89	\N	\N	\N	Viamonte 650	1053	Buenos Aires		Argentina	AR	-58.37608	-34.599922	South America	393	8	9294	5	https://www.agoda.com/partners/partnersearch.aspx?hid=393	2020-05-06 01:06:42.808157	2020-06-11 21:43:02.075569	carsson-hotel-buenos-aires	active
159	1836	Novotel Frankfurt City Hotel	Novotel Frankfurt City Hotel is a popular choice amongst travelers in Frankfurt am Main, whether exploring or just passing through. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. All the necessary facilities, including 24-hour room service, facilities for disabled guests, Wi-Fi in public areas, car park, room service, are at hand. Television LCD/plasma screen, air conditioning, heating, desk, mini bar can be found in selected guestrooms. Enjoy the hotel's recreational facilities, including fitness center, sauna, tennis courts, before retiring to your room for a well-deserved rest. No matter what your reasons are for visiting Frankfurt am Main, Novotel Frankfurt City Hotel will make you feel instantly at home.	4	03:00 PM	12:00 PM	235	7	1989	\N	Lise-Meitner-Str.2		Frankfurt am Main	Hessen	Germany	DE	8.641863	50.115871	Europe	453	4	15847	101	https://www.agoda.com/partners/partnersearch.aspx?hid=453	2020-05-06 01:06:42.822636	2020-06-11 21:43:02.302834	novotel-frankfurt-city-hotel	active
167	738	2Home Stockholm South	2Home Stockholm South is conveniently located in the popular Älvsjö / Årsta area. Both business travelers and tourists can enjoy the hotel's facilities and services. To be found at the hotel are free Wi-Fi in all rooms, luggage storage, Wi-Fi in public areas, car park, family room. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as television LCD/plasma screen, linens, mirror, internet access – wireless, non smoking rooms. The hotel offers various recreational opportunities. Discover all Stockholm has to offer by making 2Home Stockholm South your base.	3	03:00 PM	11:00 AM	137	4	\N	\N	Abyvagen 20	12044	Stockholm		Sweden	SE	18.02424	59.291	Europe	479	4	1618	49	https://www.agoda.com/partners/partnersearch.aspx?hid=479	2020-05-06 01:06:42.828201	2020-06-11 21:43:02.368271	2home-stockholm-south	active
183	2027	Sheraton Mexico City Maria Isabel Hotel	Sheraton Mexico City Maria Isabel Hotel is conveniently located in the popular Historic City Center area. The hotel has everything you need for a comfortable stay. 24-hour front desk, Wi-Fi in public areas, valet parking, car park, restaurant are just some of the facilities on offer. Some of the well-appointed guestrooms feature air conditioning, heating, desk, mini bar, telephone. Entertain the hotel's recreational facilities, including fitness center, outdoor pool, tennis courts. Friendly staff, great facilities and close proximity to all that Mexico City has to offer are three great reasons you should stay at Sheraton Mexico City Maria Isabel Hotel.	4	03:00 PM	12:00 PM	755	\N	\N	\N	Paseo de la Reforma 325 Col. Cuauhtemoc	6500	Mexico City	Federal District	Mexico	MX	-99.167694	19.428038	North America	519	6	2086	86	https://www.agoda.com/partners/partnersearch.aspx?hid=519	2020-05-06 01:06:42.839102	2020-06-11 21:43:02.513898	sheraton-mexico-city-maria-isabel-hotel	active
201	738	The Wild Boar Hotel	The Wild Boar Hotel is conveniently located in the popular Mitchelland area. Both business travelers and tourists can enjoy the hotel's facilities and services. Take advantage of the hotel's free Wi-Fi in all rooms, luggage storage, Wi-Fi in public areas, car park, restaurant. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as closet, television LCD/plasma screen, internet access – wireless (complimentary), heating, iPod docking station. The hotel's peaceful atmosphere extends to its recreational facilities which include canoe, fitness center, golf course (within 3 km), indoor pool, fishing. For reliable service and professional staff, The Wild Boar Hotel caters to your needs.	4	03:00 PM	11:00 AM	33	\N	\N	2005	Crook Road	LA23 3NF	Windermere	North West, England	United Kingdom	GB	-2.870218	54.350593	Europe	597	4	9728	107	https://www.agoda.com/partners/partnersearch.aspx?hid=597	2020-05-06 01:06:42.852619	2020-06-11 21:43:02.675132	the-wild-boar-hotel	active
213	1693	Duke Of Cornwall Hotel	Best Western Duke Of Cornwall Hotel is conveniently located in the popular Plymouth City Center area. Both business travelers and tourists can enjoy the hotel's facilities and services. Service-minded staff will welcome and guide you at the Best Western Duke Of Cornwall Hotel. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like heating, desk, telephone, television, DVD/CD player. The hotel offers various recreational opportunities. Best Western Duke Of Cornwall Hotel combines warm hospitality with a lovely ambiance to make your stay in Plymouth unforgettable.	3	02:00 PM	11:00 AM	\N	\N	\N	\N	Millbay Road, Plymouth	PL1 3LG	Plymouth		United Kingdom	GB	-4.14998	50.367771	Europe	638	4	252	107	https://www.agoda.com/partners/partnersearch.aspx?hid=638	2020-05-06 01:06:42.861498	2020-06-11 21:43:02.773839	duke-of-cornwall-hotel	active
268	738	The Riverside	The 3-star The Riverside offers comfort and convenience whether you're on business or holiday in Kendal. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. Luggage storage, room service, meeting facilities, restaurant, newspapers are on the list of things guests can enjoy. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as heating, desk, telephone, television, interconnecting room(s) available. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including hot tub, fitness center, sauna, indoor pool, steamroom. For reliable service and professional staff, The Riverside caters to your needs.	3	03:00 PM	11:00 AM	\N	\N	\N	\N	Stramongate Bridge	LA9 6EL	Kendal		United Kingdom	GB	-2.7417	54.330502	Europe	793	4	4670	107	https://www.agoda.com/partners/partnersearch.aspx?hid=793	2020-05-06 01:06:42.908748	2020-06-11 21:43:03.227684	the-riverside	active
306	738	Lotte Legend Hotel Saigon	The 5-star Lotte Legend Hotel Saigon offers comfort and convenience whether you're on business or holiday in Ho Chi Minh City. The hotel has everything you need for a comfortable stay. Take advantage of the hotel's 24-hour room service, free Wi-Fi in all rooms, 24-hour security, daily housekeeping, gift/souvenir shop. Designed for comfort, selected guestrooms offer complimentary tea, towels, carpeting, fireplace, slippers to ensure a restful night. The hotel offers various recreational opportunities. Discover all Ho Chi Minh City has to offer by making Lotte Legend Hotel Saigon your base.	5	01:30 PM	12:30 PM	283	17	2001	2014	2A-4A Ton Duc Thang Street, District 1	                    	Ho Chi Minh City	Ho Chi Minh	Vietnam	VN	106.706797	10.778689	Asia	902	2	13170	38	https://www.agoda.com/partners/partnersearch.aspx?hid=902	2020-05-06 01:06:42.936086	2020-06-11 21:43:03.544514	lotte-legend-hotel-saigon	active
3	1270	Sai Kaew Beach Resort	The 4-star Sai Kaew Beach Resort offers comfort and convenience whether you're on business or holiday in Koh Samet. The property features a wide range of facilities to make your stay a pleasant experience. Free Wi-Fi in all rooms, daily housekeeping, gift/souvenir shop, 24-hour front desk, Wi-Fi in public areas are just some of the facilities on offer. Some of the well-appointed guestrooms feature slippers, separate living room, television LCD/plasma screen, mirror, internet access – wireless. Take a break from a long day and make use of fitness center, sauna, outdoor pool, spa, massage. No matter what your reasons are for visiting Koh Samet, Sai Kaew Beach Resort will make you feel instantly at home.	4	02:00 PM	11:30 AM	160	\N	2000	2018	8/1 Moo 4 Tumbon Phe Muang	21160	Koh Samet	Rayong	Thailand	TH	101.466979	12.568135	Asia	1	2	17222	106	https://www.agoda.com/partners/partnersearch.aspx?hid=1	2020-05-06 01:06:42.722721	2020-06-11 21:43:00.780932	sai-kaew-beach-resort	active
4	738	Marine Hotel	Marine Hotel is perfectly located for both business and leisure guests in Dublin. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. Free Wi-Fi in all rooms, 24-hour front desk, luggage storage, car park, room service are just some of the facilities on offer. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as heating, telephone, television, satellite/cable TV, shower. Entertain the hotel's recreational facilities, including sauna, golf course (within 3 km), indoor pool, garden. No matter what your reasons are for visiting Dublin, Marine Hotel will make you feel instantly at home.	3	03:00 PM	12:00 PM	\N	\N	\N	\N	Sutton Cross	D13	Dublin		Ireland	IE	-6.11034	53.38884	Europe	6	4	1131	188	https://www.agoda.com/partners/partnersearch.aspx?hid=6	2020-05-06 01:06:42.734047	2020-06-11 21:43:00.801015	marine-hotel	active
199	1591	Ibis Hong Kong North Point	The 3-star Ibis North Point Hotel offers comfort and convenience whether you're on business or holiday in Hong Kong. The hotel offers a wide range of amenities and perks to ensure you have a great time. To be found at the hotel are free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage. Television LCD/plasma screen, mirror, slippers, towels, internet access – wireless can be found in selected guestrooms. The hotel offers various recreational opportunities. No matter what your reasons are for visiting Hong Kong, Ibis North Point Hotel will make you feel instantly at home.	3	02:00 PM	12:00 PM	275	31	2000	2011	138 Java Road	                    	Hong Kong	Hong Kong	Hong Kong	HK	114.200706	22.292311	Asia	587	2	16808	132	https://www.agoda.com/partners/partnersearch.aspx?hid=587	2020-05-06 01:06:42.851093	2020-06-11 21:43:02.656309	ibis-hong-kong-north-point	active
27	1085	Grand Prince Hotel Shin Takanawa	The 4-star Grand Prince Hotel New Takanawa offers comfort and convenience whether you're on business or holiday in Tokyo. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. 24-hour room service, free Wi-Fi in all rooms, 24-hour security, chapel, shrine are just some of the facilities on offer. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, internet access – wireless (complimentary), non smoking rooms, air conditioning, heating. Enjoy the hotel's recreational facilities, including hot tub, fitness center, sauna, outdoor pool, spa, before retiring to your room for a well-deserved rest. Convenience and comfort makes Grand Prince Hotel New Takanawa the perfect choice for your stay in Tokyo.	4	03:00 PM	11:00 AM	938	15	1982	2016	3-13-1 Takanawa, Minato-ku	108-8612	Tokyo	Tokyo	Japan	JP	139.733517	35.629819	Asia	85	2	5085	3	https://www.agoda.com/partners/partnersearch.aspx?hid=85	2020-05-06 01:06:42.738126	2020-06-11 21:43:01.017888	grand-prince-hotel-shin-takanawa	active
45	738	Gioberti Hotel	Gioberti Hotel is a popular choice amongst travelers in Rome, whether exploring or just passing through. The hotel offers a wide range of amenities and perks to ensure you have a great time. Free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage are just some of the facilities on offer. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. For reliable service and professional staff, Gioberti Hotel caters to your needs.	4	02:00 PM	12:00 PM	80	5	\N	\N	Via Gioberti 20	00185	Rome		Italy	IT	12.501347	41.899482	Europe	138	4	16594	205	https://www.agoda.com/partners/partnersearch.aspx?hid=138	2020-05-06 01:06:42.749848	2020-06-11 21:43:01.185084	gioberti-hotel	active
54	2261	Hotel Cornavin	Located in Geneva City Center, Hotel Cornavin is a perfect starting point from which to explore Geneva. The property features a wide range of facilities to make your stay a pleasant experience. All the necessary facilities, including free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas, are at hand. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like internet access – wireless (complimentary), non smoking rooms, air conditioning, desk, mini bar. Enjoy the hotel's recreational facilities, including fitness center, sauna, spa, before retiring to your room for a well-deserved rest. A welcoming atmosphere and excellent service are what you can expect during your stay at Hotel Cornavin.	4	02:00 PM	12:00 PM	164	8	\N	\N	23 Blvd James-Fazy	1201	Geneva		Switzerland	CH	6.14067	46.208038	Europe	156	4	16592	51	https://www.agoda.com/partners/partnersearch.aspx?hid=156	2020-05-06 01:06:42.756177	2020-06-11 21:43:01.283029	hotel-cornavin	active
61	738	Kreuz Bern Modern City Hotel.	The 3-star Hotel Kreuz Bern AG offers comfort and convenience whether you're on business or holiday in Bern. The property features a wide range of facilities to make your stay a pleasant experience. Free Wi-Fi in all rooms, daily housekeeping, wheelchair accessible, 24-hour front desk, luggage storage are on the list of things guests can enjoy. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, carpeting, linens, mirror, towels. Enjoy the hotel's recreational facilities, including fitness center, before retiring to your room for a well-deserved rest. A welcoming atmosphere and excellent service are what you can expect during your stay at Hotel Kreuz Bern AG.	3	02:00 PM	11:00 AM	97	5	\N	2017	Zeughausgasse 41	3011	Bern	Bern	Switzerland	CH	7.444631	46.9491	Europe	179	4	4690	51	https://www.agoda.com/partners/partnersearch.aspx?hid=179	2020-05-06 01:06:42.760622	2020-06-11 21:43:01.361506	kreuz-bern-modern-city-hotel	active
67	738	Temptation Cancun Resort - All Inclusive - Adults Only	Set in a prime location of Cancun, Temptation Resort & Spa puts everything the city has to offer just outside your doorstep. The hotel offers a high standard of service and amenities to suit the individual needs of all travelers. Wi-Fi in public areas, room service, restaurant, tours, laundry service are just some of the facilities on offer. Designed for comfort, selected guestrooms offer television LCD/plasma screen, whirlpool bathtub, air conditioning, mini bar, telephone to ensure a restful night. The hotel's peaceful atmosphere extends to its recreational facilities which include hot tub, fitness center, sauna, outdoor pool, spa. A welcoming atmosphere and excellent service are what you can expect during your stay at Temptation Resort & Spa.	5	03:00 PM	11:00 AM	384	4	1985	2007	Km 3.5 Blvd Kukulcan Zona Hotelera	77500	Cancun	Quintana Roo	Mexico	MX	-86.792206	21.148403	North America	197	6	5954	86	https://www.agoda.com/partners/partnersearch.aspx?hid=197	2020-05-06 01:06:42.764883	2020-06-11 21:43:01.42833	temptation-cancun-resort-all-inclusive-adults-only	active
168	738	Hotel Brittany	The 3-star Hotel Brittany offers comfort and convenience whether you're on business or holiday in Paris. Both business travelers and tourists can enjoy the hotel's facilities and services. All the necessary facilities, including 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, express check-in/check-out, luggage storage, are at hand. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, carpeting, linens, towels, closet. The hotel offers various recreational opportunities. No matter what your reasons are for visiting Paris, Hotel Brittany will make you feel instantly at home.	3	02:00 PM	12:00 PM	40	7	1917	2009	3 rue Saint Lazare	75009	Paris		France	FR	2.3386	48.87682	Europe	480	4	15470	153	https://www.agoda.com/partners/partnersearch.aspx?hid=480	2020-05-06 01:06:42.829354	2020-06-11 21:43:02.381643	hotel-brittany	active
90	1840	NH Wien Belvedere	NH Wien Belvedere is perfectly located for both business and leisure guests in Vienna. The property features a wide range of facilities to make your stay a pleasant experience. Facilities like 24-hour room service, free Wi-Fi in all rooms, facilities for disabled guests, Wi-Fi in public areas, valet parking are readily available for you to enjoy. Comfortable guestrooms ensure a good night's sleep with some rooms featuring facilities such as smoke detector, internet access – wireless (complimentary), non smoking rooms, air conditioning, heating. Entertain the hotel's recreational facilities, including fitness center, sauna, spa, massage. Friendly staff, great facilities and close proximity to all that Vienna has to offer are three great reasons you should stay at NH Wien Belvedere.	4	03:00 PM	12:00 PM	125	5	1992	2000	Rennweg 12a		Vienna	Vienna	Austria	AT	16.383301	48.195541	Europe	265	4	16582	130	https://www.agoda.com/partners/partnersearch.aspx?hid=265	2020-05-06 01:06:42.779203	2020-06-11 21:43:01.695147	nh-wien-belvedere	active
105	2665	Apollo Museumhotel Amsterdam City Centre	Stop at Apollo Museumhotel Amsterdam City Centre to discover the wonders of Amsterdam. Both business travelers and tourists can enjoy the hotel's facilities and services. Free Wi-Fi in all rooms, wheelchair accessible, 24-hour front desk, facilities for disabled guests, luggage storage are just some of the facilities on offer. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, internet access – wireless (complimentary), air conditioning, desk, mini bar. The hotel offers various recreational opportunities. Friendly staff, great facilities and close proximity to all that Amsterdam has to offer are three great reasons you should stay at Apollo Museumhotel Amsterdam City Centre.	3	02:00 PM	11:00 AM	182	\N	\N	\N	Pieter Cornelisz Hooftstraat 2	1071 BX	Amsterdam		Netherlands	NL	4.884132	52.361225	Europe	308	4	13868	149	https://www.agoda.com/partners/partnersearch.aspx?hid=308	2020-05-06 01:06:42.787977	2020-06-11 21:43:01.823272	apollo-museumhotel-amsterdam-city-centre	active
136	2567	Ramat Rachel Resort	Ideally located in the prime touristic area of South Jerusalem, Ramat Rachel Resort promises a relaxing and wonderful visit. The hotel offers a wide range of amenities and perks to ensure you have a great time. All the necessary facilities, including 24-hour security, daily housekeeping, free Wi-Fi in all rooms, gift/souvenir shop, taxi service, are at hand. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, non smoking rooms, air conditioning, heating, wake-up service. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including fitness center, sauna, outdoor pool, indoor pool, spa. For reliable service and professional staff, Ramat Rachel Resort caters to your needs.	0	03:00 PM	10:00 AM	165	6	\N	2012	Kibbutz Ramat Rachel	909000	Jerusalem		Israel	IL	35.218185	31.737877	Middle East	397	5	9927	144	https://www.agoda.com/partners/partnersearch.aspx?hid=397	2020-05-06 01:06:42.809465	2020-06-11 21:43:02.091317	ramat-rachel-resort	active
143	1632	Thon Hotel Rosenkrantz Oslo	Thon Hotel Rosenkrantz Oslo is perfectly located for both business and leisure guests in Oslo. The hotel has everything you need for a comfortable stay. To be found at the hotel are free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in public areas. Designed for comfort, selected guestrooms offer clothes rack, slippers, towels, closet, internet access – wireless (complimentary) to ensure a restful night. To enhance guests' stay, the hotel offers recreational facilities such as fitness center. Discover all Oslo has to offer by making Thon Hotel Rosenkrantz Oslo your base.	4	03:00 PM	12:00 PM	151	8	\N	2014	Rosenkranzgt. 1	0159	Oslo	Oslo	Norway	NO	10.740558	59.915625	Europe	417	4	12746	129	https://www.agoda.com/partners/partnersearch.aspx?hid=417	2020-05-06 01:06:42.813055	2020-06-11 21:43:02.151404	thon-hotel-rosenkrantz-oslo	active
160	575	Hilton Kansas City Airport Hotel	Hilton Kansas City Airport Hotel is perfectly located for both business and leisure guests in Kansas City (MO). Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. Service-minded staff will welcome and guide you at the Hilton Kansas City Airport Hotel. Television LCD/plasma screen, air conditioning, heating, wake-up service, desk can be found in selected guestrooms. The hotel's peaceful atmosphere extends to its recreational facilities which include fitness center, sauna, outdoor pool, indoor pool, tennis courts. Hilton Kansas City Airport Hotel is an excellent choice from which to explore Kansas City (MO) or to simply relax and rejuvenate.	4	3:00 PM	11:00 AM	771	11	1974	\N	8801 n w 112th Street	64195	Kansas City (MO)	Missouri	United States	US	-94.68277	39.2966	North America	456	6	10665	181	https://www.agoda.com/partners/partnersearch.aspx?hid=456	2020-05-06 01:06:42.824448	2020-06-11 21:43:02.310587	hilton-kansas-city-airport-hotel	active
170	1160	THE KASHIHARA	Kashihara Royal Hotel is perfectly located for both business and leisure guests in Nara. Both business travelers and tourists can enjoy the hotel's facilities and services. Free Wi-Fi in all rooms, chapel, 24-hour front desk, Wi-Fi in public areas, car park are just some of the facilities on offer. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, air conditioning, heating, alarm clock, telephone. Enjoy the hotel's recreational facilities, including sauna, hot spring bath, massage, before retiring to your room for a well-deserved rest. For reliable service and professional staff, Kashihara Royal Hotel caters to your needs.	4	03:00 PM	11:00 AM	205	8	\N	\N	652-2 Kume-cho, Kashihara-shi	634-0063	Asuka	Nara	Japan	JP	135.794983	34.484631	Asia	484	2	108716	3	https://www.agoda.com/partners/partnersearch.aspx?hid=484	2020-05-06 01:06:42.830635	2020-06-11 21:43:02.400492	the-kashihara	active
184	1840	NH Collection Mexico City Reforma	Ideally located in the prime touristic area of Historic City Center, NH Collection Mexico City Reforma promises a relaxing and wonderful visit. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. To be found at the hotel are 24-hour room service, free Wi-Fi in all rooms, 24-hour security, daily housekeeping, gift/souvenir shop. Television LCD/plasma screen, slippers, separate living room, internet access – wireless, internet access – wireless (complimentary) can be found in selected guestrooms. Recuperate from a full day of sightseeing in the comfort of your room or take advantage of the hotel's recreational facilities, including fitness center, outdoor pool, pool (kids). NH Collection Mexico City Reforma combines warm hospitality with a lovely ambiance to make your stay in Mexico City unforgettable.	4	03:00 PM	12:00 PM	306	14	1972	2016	Liverpool 155, Zona Rosa	6600	Mexico City	Federal District	Mexico	MX	-99.165421	19.424202	North America	533	6	2086	86	https://www.agoda.com/partners/partnersearch.aspx?hid=533	2020-05-06 01:06:42.840565	2020-06-11 21:43:02.525746	nh-collection-mexico-city-reforma	active
192	2665	Leonardo Hotel Monchengladbach	The 4-star Leonardo Hotel Monchengladbach offers comfort and convenience whether you're on business or holiday in Monchengladbach. Both business travelers and tourists can enjoy the hotel's facilities and services. Free Wi-Fi in all rooms, wheelchair accessible, 24-hour front desk, facilities for disabled guests, luggage storage are there for guest's enjoyment. All rooms are designed and decorated to make guests feel right at home, and some rooms come with television LCD/plasma screen, internet access – wireless (complimentary), air conditioning, heating, desk. Access to the hotel's fitness center, sauna will further enhance your satisfying stay. No matter what your reasons are for visiting Monchengladbach, Leonardo Hotel Monchengladbach will make you feel instantly at home.	4	03:00 PM	12:00 PM	128	6	\N	\N	Speicker Street 49	41061	Monchengladbach	North Rhine-Westphalia	Germany	DE	6.431057	51.190868	Europe	554	4	16494	101	https://www.agoda.com/partners/partnersearch.aspx?hid=554	2020-05-06 01:06:42.846689	2020-06-11 21:43:02.598893	leonardo-hotel-monchengladbach	active
202	1693	Best Western St Catharines Hotel & Conference Centre	The 3-star Best Western St Catharines Hotel & Conference Cent offers comfort and convenience whether you're on business or holiday in Saint-Catharines (ON). The hotel has everything you need for a comfortable stay. Facilities for disabled guests, Wi-Fi in public areas, car park, room service, airport transfer are on the list of things guests can enjoy. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, non smoking rooms, air conditioning, wake-up service, desk. Enjoy the hotel's recreational facilities, including fitness center, outdoor pool, indoor pool, massage, garden, before retiring to your room for a well-deserved rest. A welcoming atmosphere and excellent service are what you can expect during your stay at Best Western St Catharines Hotel & Conference Cent.	3	04:00 PM	11:00 AM	145	2	1966	\N	2 North Service Road	L2N 4G9	St. Catharines (ON)	Ontario	Canada	CA	-79.250313	43.177464	North America	598	6	79664	100	https://www.agoda.com/partners/partnersearch.aspx?hid=598	2020-05-06 01:06:42.854296	2020-06-11 21:43:02.682927	best-western-st-catharines-hotel-conference-centre	active
206	2273	Holiday Inn Leamington Spa / Warwick	Stop at Holiday Inn Leamington Spa / Warwick to discover the wonders of Warwick. The hotel offers a wide range of amenities and perks to ensure you have a great time. Service-minded staff will welcome and guide you at the Holiday Inn Leamington Spa / Warwick. Each guestroom is elegantly furnished and equipped with handy amenities. The hotel offers various recreational opportunities. Discover all Warwick has to offer by making Holiday Inn Leamington Spa / Warwick your base.	3	02:00 PM	12:00 PM	91	3	1989	\N	Olympus Avenue, Tachbrook Park	CV34 6RJ	Warwick	West Midlands, England	United Kingdom	GB	-1.549984	52.276131	Europe	610	4	17380	107	https://www.agoda.com/partners/partnersearch.aspx?hid=610	2020-05-06 01:06:42.856971	2020-06-11 21:43:02.715403	holiday-inn-leamington-spa-warwick	active
238	2788	Wyck Hill House Hotel & Spa	Set in a prime location of Stow-on-the-wold, Wyck Hill House Hotel & Spa puts everything the city has to offer just outside your doorstep. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. All the necessary facilities, including free Wi-Fi in all rooms, wheelchair accessible, taxi service, ticket service, grocery deliveries, are at hand. Some of the well-appointed guestrooms feature carpeting, mirror, towels, closet, internet access – wireless (complimentary). The hotel offers various recreational opportunities. Wyck Hill House Hotel & Spa is an excellent choice from which to explore Stow-on-the-wold or to simply relax and rejuvenate.	4	02:30 PM	11:00 AM	60	\N	\N	\N	The Cotswolds	GL54 1HY	Stow-on-the-wold		United Kingdom	GB	-1.711572	51.898056	Europe	702	4	10356	107	https://www.agoda.com/partners/partnersearch.aspx?hid=702	2020-05-06 01:06:42.880543	2020-06-11 21:43:02.984243	wyck-hill-house-hotel-spa	active
256	1693	Best Western Leoso Hotel Ludwigshafen	Set in a prime location of Ludwigshafen, Best Western Leoso Hotel Ludwigshafen puts everything the city has to offer just outside your doorstep. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. Free Wi-Fi in all rooms, Wi-Fi in public areas, car park, room service, babysitting are just some of the facilities on offer. All rooms are designed and decorated to make guests feel right at home, and some rooms come with television LCD/plasma screen, air conditioning, heating, desk, mini bar. Access to the hotel's sauna, golf course (within 3 km), indoor pool will further enhance your satisfying stay. Discover all Ludwigshafen has to offer by making Best Western Leoso Hotel Ludwigshafen your base.	4	03:00 PM	11:00 AM	\N	\N	\N	\N	Pasadena Allee 4	67059	Ludwigshafen		Germany	DE	8.43531	49.478661	Europe	747	4	16158	101	https://www.agoda.com/partners/partnersearch.aspx?hid=747	2020-05-06 01:06:42.896879	2020-06-11 21:43:03.130975	best-western-leoso-hotel-ludwigshafen	active
261	738	City Angkor Hotel	Located in Kruos, City Angkor Hotel is a perfect starting point from which to explore Siem Reap. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. To be found at the hotel are free Wi-Fi in all rooms, daily housekeeping, gift/souvenir shop, postal service, private check in/check out. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, additional bathroom, carpeting, free welcome drink, locker. Enjoy the hotel's recreational facilities, including outdoor pool, spa, massage, garden, steamroom, before retiring to your room for a well-deserved rest. No matter what your reasons are for visiting Siem Reap, City Angkor Hotel will make you feel instantly at home.	4	10:00 AM	12:00 PM	150	4	1994	2017	Airport Road, Angkor		Siem Reap	Siem Reap	Cambodia	KH	103.840947	13.372345	Asia	777	2	16917	163	https://www.agoda.com/partners/partnersearch.aspx?hid=777	2020-05-06 01:06:42.900438	2020-06-11 21:43:03.171436	city-angkor-hotel	active
285	1836	Novotel Sydney International Airport	The 4-star Mercure Sydney International Airport Hotel offers comfort and convenience whether you're on business or holiday in Sydney. Featuring a complete list of amenities, guests will find their stay at the property a comfortable one. To be found at the hotel are 24-hour room service, 24-hour security, daily housekeeping, private check in/check out, taxi service. Guestrooms are fitted with all the amenities you need for a good night's sleep. In some of the rooms, guests can find television LCD/plasma screen, complimentary instant coffee, complimentary tea, closet, non smoking rooms. To enhance guests' stay, the hotel offers recreational facilities such as golf course (within 3 km), massage, tennis courts. Mercure Sydney International Airport Hotel combines warm hospitality with a lovely ambiance to make your stay in Sydney unforgettable.	4	02:00 PM	11:00 AM	271	9	1981	2019	22 Levey Street, Wolli Creek	2205	Sydney	New South Wales	Australia	AU	151.156555	-33.933983	Pacific Ocean and Australia	841	7	14370	139	https://www.agoda.com/partners/partnersearch.aspx?hid=841	2020-05-06 01:06:42.922212	2020-06-11 21:43:03.366965	novotel-sydney-international-airport	active
300	2492	Amman Marriott Hotel	Stop at Marriott Amman Hotel to discover the wonders of Amman. The property features a wide range of facilities to make your stay a pleasant experience. 24-hour security, daily housekeeping, fax machine, gift/souvenir shop, photocopying are there for guest's enjoyment. All rooms are designed and decorated to make guests feel right at home, and some rooms come with television LCD/plasma screen, air conditioning, heating, wake-up service, desk. To enhance guests' stay, the hotel offers recreational facilities such as hot tub, fitness center, sauna, outdoor pool, indoor pool. Friendly staff, great facilities and close proximity to all that Amman has to offer are three great reasons you should stay at Marriott Amman Hotel.	5	03:00 PM	12:00 PM	292	14	1982	2009	Issam Al Ajlouni Street, Shmeissani	11190	Amman	Amman	Jordan	JO	35.906331	31.9727	Middle East	873	5	15806	152	https://www.agoda.com/partners/partnersearch.aspx?hid=873	2020-05-06 01:06:42.932362	2020-06-11 21:43:03.487723	amman-marriott-hotel	active
301	2567	Hotel Oceania Le Metropole	The 4-star Hôtel Oceania Le Métropole offers comfort and convenience whether you're on business or holiday in Montpellier. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. All the necessary facilities, including free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, express check-in/check-out, luggage storage, are at hand. Some of the well-appointed guestrooms feature air conditioning, desk, telephone, television, satellite/cable TV. To enhance guests' stay, the hotel offers recreational facilities such as fitness center, outdoor pool, solarium, garden. Hôtel Oceania Le Métropole combines warm hospitality with a lovely ambiance to make your stay in Montpellier unforgettable.	4	03:00 PM	12:00 PM	\N	\N	\N	\N	3 rue Clos Rene	34000	Montpellier		France	FR	3.88032	43.60659	Europe	878	4	5320	153	https://www.agoda.com/partners/partnersearch.aspx?hid=878	2020-05-06 01:06:42.932362	2020-06-11 21:43:03.495795	hotel-oceania-le-metropole	active
302	1693	Best Western PLUS Cedar Bluff Inn	Set in a prime location of Knoxville (TN), Best Western PLUS Cedar Bluff Inn puts everything the city has to offer just outside your doorstep. The hotel offers guests a range of services and amenities designed to provide comfort and convenience. 24-hour front desk, facilities for disabled guests, express check-in/check-out, Wi-Fi in public areas, car park are on the list of things guests can enjoy. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like television LCD/plasma screen, non smoking rooms, air conditioning, heating, wake-up service. To enhance guests' stay, the hotel offers recreational facilities such as fitness center, golf course (within 3 km), outdoor pool, fishing, tennis courts. Best Western PLUS Cedar Bluff Inn combines warm hospitality with a lovely ambiance to make your stay in Knoxville (TN) unforgettable.	3	03:00 PM	11:00 AM	95	\N	\N	\N	420 N Peters Road	37922-2332	Knoxville (TN)	Tennessee	United States	US	-84.100632	35.914864	North America	879	6	11658	181	https://www.agoda.com/partners/partnersearch.aspx?hid=879	2020-05-06 01:06:42.933696	2020-06-11 21:43:03.504199	best-western-plus-cedar-bluff-inn	active
307	1284	Park Hyatt Tokyo	The 5-star Park Hyatt Tokyo offers comfort and convenience whether you're on business or holiday in Tokyo. Offering a variety of facilities and services, the hotel provides all you need for a good night's sleep. 24-hour room service, free Wi-Fi in all rooms, 24-hour front desk, facilities for disabled guests, luggage storage are just some of the facilities on offer. Designed for comfort, selected guestrooms offer television LCD/plasma screen, mirror, slippers, towels, closet to ensure a restful night. Entertain the hotel's recreational facilities, including hot tub, fitness center, sauna, indoor pool, spa. Park Hyatt Tokyo combines warm hospitality with a lovely ambiance to make your stay in Tokyo unforgettable.	5	03:00 PM	12:00 PM	177	52	\N	\N	3-7-1-2 Nishi-Shinjuku Shinjuku-ku 	163-1055	Tokyo		Japan	JP	139.690918	35.68573	Asia	910	2	5085	3	https://www.agoda.com/partners/partnersearch.aspx?hid=910	2020-05-06 01:06:42.936086	2020-06-11 21:43:03.551936	park-hyatt-tokyo	active
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.locations (id, continent_name, country, country_iso_code, state, city, created_at, updated_at) FROM stdin;
1	Asia	Thailand	TH	Rayong	Koh Samet	2021-05-31 19:59:36.064042	2021-05-31 19:59:36.064042
2	Europe	Ireland	IE		Dublin	2021-05-31 19:59:36.069	2021-05-31 19:59:36.069
3	Europe	Norway	NO		Maloy	2021-05-31 19:59:36.078418	2021-05-31 19:59:36.078418
4	Pacific Ocean and Australia	New Zealand	NZ	Auckland	Auckland	2021-05-31 19:59:36.085314	2021-05-31 19:59:36.085314
5	Europe	France	FR	Aquitaine	Bordeaux	2021-05-31 19:59:36.106413	2021-05-31 19:59:36.106413
6	North America	Mexico	MX		Taxco	2021-05-31 19:59:36.110049	2021-05-31 19:59:36.110049
7	South America	Colombia	CO	Bolivar	Cartagena	2021-05-31 19:59:36.113337	2021-05-31 19:59:36.113337
8	North America	United States	US	Pennsylvania	Pittsburgh (PA)	2021-05-31 19:59:36.116844	2021-05-31 19:59:36.116844
9	Europe	Belgium	BE	Brussels-Capital	Brussels	2021-05-31 19:59:36.120159	2021-05-31 19:59:36.120159
10	Asia	Japan	JP	Tokyo	Tokyo	2021-05-31 19:59:36.124046	2021-05-31 19:59:36.124046
11	Europe	Italy	IT		Sanremo	2021-05-31 19:59:36.129352	2021-05-31 19:59:36.129352
12	Asia	Japan	JP	Nara	Nara	2021-05-31 19:59:36.135762	2021-05-31 19:59:36.135762
13	Europe	Malta	MT	Malta	St. Julian's	2021-05-31 19:59:36.159262	2021-05-31 19:59:36.159262
14	South America	Peru	PE		Lima	2021-05-31 19:59:36.173306	2021-05-31 19:59:36.173306
16	Africa	Kenya	KE	Mombasa	Mombasa	2021-05-31 19:59:36.187051	2021-05-31 19:59:36.187051
17	Europe	Germany	DE		Hildesheim	2021-05-31 19:59:36.207238	2021-05-31 19:59:36.207238
18	Europe	Switzerland	CH		Geneva	2021-05-31 19:59:36.212039	2021-05-31 19:59:36.212039
19	Europe	Switzerland	CH	Bern	Bern	2021-05-31 19:59:36.215583	2021-05-31 19:59:36.215583
20	Europe	Spain	ES		Ciudad Real	2021-05-31 19:59:36.218872	2021-05-31 19:59:36.218872
21	North America	Mexico	MX	Quintana Roo	Cancun	2021-05-31 19:59:36.223149	2021-05-31 19:59:36.223149
22	Europe	Switzerland	CH		Davos	2021-05-31 19:59:36.230892	2021-05-31 19:59:36.230892
23	Europe	Germany	DE	Saxony	Dresden	2021-05-31 19:59:36.255227	2021-05-31 19:59:36.255227
24	Europe	Spain	ES	Castile and Leon	Villagonzalo Pedernales	2021-05-31 19:59:36.260898	2021-05-31 19:59:36.260898
25	Europe	Austria	AT	Vienna	Vienna	2021-05-31 19:59:36.265192	2021-05-31 19:59:36.265192
26	Europe	Spain	ES	Andalusia	Seville	2021-05-31 19:59:36.270473	2021-05-31 19:59:36.270473
27	Europe	Spain	ES	Extremadura	Merida	2021-05-31 19:59:36.274572	2021-05-31 19:59:36.274572
28	Europe	Netherlands	NL		Amsterdam	2021-05-31 19:59:36.281647	2021-05-31 19:59:36.281647
29	South America	Brazil	BR		Rio De Janeiro	2021-05-31 19:59:36.304915	2021-05-31 19:59:36.304915
31	Europe	France	FR		Illkirch-Graffenstaden	2021-05-31 19:59:36.318395	2021-05-31 19:59:36.318395
32	North America	United States	US	Texas	Austin (TX)	2021-05-31 19:59:36.326997	2021-05-31 19:59:36.326997
33	Europe	Germany	DE	North Rhine-Westphalia	Cologne	2021-05-31 19:59:36.337839	2021-05-31 19:59:36.337839
34	Middle East	Lebanon	LB		Beirut	2021-05-31 19:59:36.359482	2021-05-31 19:59:36.359482
35	Asia	Indonesia	ID	Bali	Bali	2021-05-31 19:59:36.365216	2021-05-31 19:59:36.365216
36	South America	Argentina	AR		Buenos Aires	2021-05-31 19:59:36.370025	2021-05-31 19:59:36.370025
15	Europe	Italy	IT	Lazio	Rome	2021-05-31 19:59:36.179836	2021-05-31 19:59:36.405069
37	Middle East	Israel	IL	Jerusalem	Jerusalem	2021-05-31 19:59:36.377911	2021-05-31 19:59:36.413696
38	Europe	Norway	NO	Oslo	Oslo	2021-05-31 19:59:36.419451	2021-05-31 19:59:36.419451
39	Europe	Denmark	DK		Esbjerg	2021-05-31 19:59:36.424383	2021-05-31 19:59:36.424383
40	Europe	Sweden	SE	Stockholm	Stockholm	2021-05-31 19:59:36.434763	2021-05-31 19:59:36.434763
41	Asia	China	CN	Beijing	Beijing	2021-05-31 19:59:36.460236	2021-05-31 19:59:36.460236
42	Europe	Germany	DE	Hessen	Frankfurt am Main	2021-05-31 19:59:36.467666	2021-05-31 19:59:36.467666
43	North America	United States	US	Missouri	Kansas City (MO)	2021-05-31 19:59:36.47441	2021-05-31 19:59:36.47441
44	Europe	Italy	IT		Cortina d'Ampezzo	2021-05-31 19:59:36.49151	2021-05-31 19:59:36.49151
45	Europe	Norway	NO		Stavanger	2021-05-31 19:59:36.50939	2021-05-31 19:59:36.50939
46	Europe	Spain	ES	Basque Country	Bilbao	2021-05-31 19:59:36.513716	2021-05-31 19:59:36.513716
48	Asia	Japan	JP	Nara	Asuka	2021-05-31 19:59:36.521438	2021-05-31 19:59:36.521438
49	Europe	Finland	FI		Hyvinkaa	2021-05-31 19:59:36.525798	2021-05-31 19:59:36.525798
50	Middle East	United Arab Emirates	AE	Dubai	Dubai	2021-05-31 19:59:36.532206	2021-05-31 19:59:36.532206
51	North America	Mexico	MX	Federal District	Mexico City	2021-05-31 19:59:36.555187	2021-05-31 19:59:36.555187
47	Europe	France	FR	Ile-de-France	Paris	2021-05-31 19:59:36.518119	2021-05-31 19:59:36.562842
52	North America	United States	US	Texas	Houston (TX)	2021-05-31 19:59:36.566204	2021-05-31 19:59:36.566204
53	Europe	France	FR	Alsace	Strasbourg	2021-05-31 19:59:36.569494	2021-05-31 19:59:36.569494
54	Europe	Germany	DE	North Rhine-Westphalia	Monchengladbach	2021-05-31 19:59:36.573	2021-05-31 19:59:36.573
55	Asia	Japan	JP	Osaka	Osaka	2021-05-31 19:59:36.578345	2021-05-31 19:59:36.578345
56	Asia	Hong Kong	HK	Hong Kong	Hong Kong	2021-05-31 19:59:36.584305	2021-05-31 19:59:36.584305
57	Europe	United Kingdom	GB	North West, England	Windermere	2021-05-31 19:59:36.608208	2021-05-31 19:59:36.608208
58	North America	Canada	CA	Ontario	St. Catharines (ON)	2021-05-31 19:59:36.612474	2021-05-31 19:59:36.612474
59	North America	Canada	CA		Vancouver (BC)	2021-05-31 19:59:36.615919	2021-05-31 19:59:36.615919
60	Europe	United Kingdom	GB	West Midlands, England	Warwick	2021-05-31 19:59:36.619725	2021-05-31 19:59:36.619725
61	Europe	United Kingdom	GB		Plymouth	2021-05-31 19:59:36.623847	2021-05-31 19:59:36.623847
62	Asia	Macau	MO		Macau	2021-05-31 19:59:36.630313	2021-05-31 19:59:36.630313
63	North America	United States	US	New Jersey	Newark (NJ)	2021-05-31 19:59:36.637206	2021-05-31 19:59:36.637206
64	Asia	Taiwan	TW	Kaohsiung City	Kaohsiung	2021-05-31 19:59:36.659001	2021-05-31 19:59:36.659001
65	Europe	United Kingdom	GB		Stow-on-the-wold	2021-05-31 19:59:36.663278	2021-05-31 19:59:36.663278
66	South America	Chile	CL		Puerto Varas	2021-05-31 19:59:36.673023	2021-05-31 19:59:36.673023
67	Europe	Italy	IT		Verona	2021-05-31 19:59:36.67932	2021-05-31 19:59:36.67932
68	Europe	France	FR	Ile-de-France	Aulnay-sous-Bois	2021-05-31 19:59:36.687286	2021-05-31 19:59:36.687286
69	Europe	Czech Republic	CZ	Prague	Prague	2021-05-31 19:59:36.706751	2021-05-31 19:59:36.706751
70	Middle East	Israel	IL	Southern	Eilat	2021-05-31 19:59:36.709744	2021-05-31 19:59:36.709744
71	Europe	Germany	DE		Ludwigshafen	2021-05-31 19:59:36.712717	2021-05-31 19:59:36.712717
72	Asia	Cambodia	KH	Siem Reap	Siem Reap	2021-05-31 19:59:36.717093	2021-05-31 19:59:36.717093
73	Asia	Japan	JP	Aichi	Nagoya	2021-05-31 19:59:36.719961	2021-05-31 19:59:36.719961
74	Europe	United Kingdom	GB		Kendal	2021-05-31 19:59:36.722815	2021-05-31 19:59:36.722815
75	Asia	Japan	JP	Kyoto	Kyoto	2021-05-31 19:59:36.726546	2021-05-31 19:59:36.726546
76	Europe	Italy	IT		Bologna	2021-05-31 19:59:36.731844	2021-05-31 19:59:36.731844
77	Pacific Ocean and Australia	Australia	AU	New South Wales	Port Stephens	2021-05-31 19:59:36.736777	2021-05-31 19:59:36.736777
78	Pacific Ocean and Australia	Australia	AU	New South Wales	Sydney	2021-05-31 19:59:36.7569	2021-05-31 19:59:36.7569
30	Europe	Germany	DE	Hamburg	Hamburg	2021-05-31 19:59:36.312228	2021-05-31 19:59:36.75952
79	Europe	Germany	DE	Bavaria	Munich	2021-05-31 19:59:36.763043	2021-05-31 19:59:36.763043
80	Middle East	Jordan	JO	Amman	Amman	2021-05-31 19:59:36.768164	2021-05-31 19:59:36.768164
81	Europe	France	FR		Montpellier	2021-05-31 19:59:36.771898	2021-05-31 19:59:36.771898
82	North America	United States	US	Tennessee	Knoxville (TN)	2021-05-31 19:59:36.77529	2021-05-31 19:59:36.77529
83	Asia	Vietnam	VN	Ho Chi Minh	Ho Chi Minh City	2021-05-31 19:59:36.780778	2021-05-31 19:59:36.780778
84	Europe	Belgium	BE	West Flanders	Bruges	2021-05-31 19:59:36.805137	2021-05-31 19:59:36.805137
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.partners (id, name, affiliate_url, api_key, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.photos (id, hotel_id, partner_id, url, "order", created_at, updated_at) FROM stdin;
43674	17	1	http://pix4.agoda.net/hotelimages/37/37/37_08112415020080.jpg?s=312x	1	2020-05-06 01:24:02.917527	2020-05-06 01:24:02.917527
43678	77	1	http://pix5.agoda.net/hotelimages/220/220/220_1112130629005014723.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43680	95	1	http://pix4.agoda.net/hotelimages/4889241/0/03af9627216b338c32e8e9afc1a31c82.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43681	102	1	http://pix4.agoda.net/hotelimages/4870344/0/2e6cabdf6322c1f5d974288cbd2e37d4.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43685	143	1	http://pix3.agoda.net/hotelimages/417/417/417_15040820480026767436.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43686	157	1	http://pix2.agoda.net/hotelimages/5105520/0/b1084e0586223cb9124109af47e4fd5b.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43687	183	1	http://pix5.agoda.net/hotelimages/5079954/0/297e2b8a85c481ec9966fc56e39089f5.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43688	190	1	http://pix4.agoda.net/hotelimages/547/0/7f6a2b00c754dd8d74638db06996301e.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
43692	279	1	http://pix2.agoda.net/hotelimages/830/830/830_14062410300019989778.jpg?s=312x	1	2020-05-06 01:24:02.918342	2020-05-06 01:24:02.918342
88008	14	1	http://pix3.agoda.net/hotelimages/6584938/0/dc16bcf0fcfe7d2d5110462ebed1705b.jpg?s=312x	1	2020-05-06 01:24:04.482783	2020-05-06 01:24:04.482783
88017	153	1	http://pix3.agoda.net/hotelimages/440/440/440_1112190621005222328.jpg?s=312x	1	2020-05-06 01:24:04.482783	2020-05-06 01:24:04.482783
88018	160	1	http://pix5.agoda.net/hotelimages/456/456/456_16090815530046251417.jpg?s=312x	1	2020-05-06 01:24:04.482783	2020-05-06 01:24:04.482783
88019	162	1	http://pix2.agoda.net/hotelimages/468/468/468_0912190644001934182.jpg?s=312x	1	2020-05-06 01:24:04.483573	2020-05-06 01:24:04.483573
88022	185	1	http://pix4.agoda.net/hotelimages/537/537/537_14082520350021560713.jpg?s=312x	1	2020-05-06 01:24:04.483573	2020-05-06 01:24:04.483573
88028	274	1	http://pix2.agoda.net/hotelimages/817/817/817_17082809570055753924.jpg?s=312x	1	2020-05-06 01:24:04.483573	2020-05-06 01:24:04.483573
88033	301	1	http://pix1.agoda.net/hotelimages/878/878/878_080913000100557.jpg?s=312x	1	2020-05-06 01:24:04.483573	2020-05-06 01:24:04.483573
131936	53	1	http://pix3.agoda.net/hotelimages/4876478/0/f367eb8e089bb60a2e76cad438545935.jpg?s=312x	1	2020-05-06 01:24:06.090292	2020-05-06 01:24:06.090292
131940	108	1	http://pix1.agoda.net/hotelimages/320/0/41dfe1eea44cd51178b4b08863af7222.jpg?s=312x	1	2020-05-06 01:24:06.090292	2020-05-06 01:24:06.090292
131941	109	1	http://pix2.agoda.net/hotelimages/321/321/321_130726203659007.jpg?s=312x	1	2020-05-06 01:24:06.090292	2020-05-06 01:24:06.090292
131945	213	1	http://pix4.agoda.net/hotelimages/638/638/638_17033006530052017196.jpg?s=312x	1	2020-05-06 01:24:06.090292	2020-05-06 01:24:06.090292
131949	240	1	http://pix5.agoda.net/hotelimages/709/709/709_110425183342.jpg?s=312x	1	2020-05-06 01:24:06.091117	2020-05-06 01:24:06.091117
131950	261	1	http://pix3.agoda.net/hotelimages/6539796/0/386117f1b7877e65080ee102613a4ced.jpg?s=312x	1	2020-05-06 01:24:06.091117	2020-05-06 01:24:06.091117
176013	49	1	http://pix3.agoda.net/hotelimages/147/147/147_1112051559004767099.jpg?s=312x	1	2020-05-06 01:24:08.068393	2020-05-06 01:24:08.068393
176017	125	1	http://pix3.agoda.net/hotelimages/372/372/372_121129111816401.jpg?s=312x	1	2020-05-06 01:24:08.068393	2020-05-06 01:24:08.068393
176021	181	1	http://pix3.agoda.net/hotelimages/514/514/514_17100408160057080928.jpg?s=312x	1	2020-05-06 01:24:08.069221	2020-05-06 01:24:08.069221
220032	200	1	http://pix4.agoda.net/hotelimages/590/0/a2dfebceb61c1277bddcf28775acac2c.jpg?s=312x	1	2020-05-06 01:24:09.981817	2020-05-06 01:24:09.981817
220035	263	1	http://pix4.agoda.net/hotelimages/2286942/0/0507b1f695881d4ccf97700fcdb5c67b.jpg?s=312x	1	2020-05-06 01:24:09.981817	2020-05-06 01:24:09.981817
264113	8	1	http://pix5.agoda.net/hotelimages/14/14/14_16051513390042341825.jpg?s=312x	1	2020-05-06 01:24:11.622309	2020-05-06 01:24:11.622309
264115	47	1	http://pix1.agoda.net/hotelimages/141/-1/920bbb1725aebe9f5da472eb58d80845.jpg?s=312x	1	2020-05-06 01:24:11.622309	2020-05-06 01:24:11.622309
264118	115	1	http://pix1.agoda.net/hotelimages/347/347/347_14081918140021339850.jpg?s=312x	1	2020-05-06 01:24:11.622309	2020-05-06 01:24:11.622309
264122	139	1	http://pix2.agoda.net/hotelimages/407/0/dd6e57ffdce94a72597b9bfd8cbff6e3.jpg?s=312x	1	2020-05-06 01:24:11.622309	2020-05-06 01:24:11.622309
264123	255	1	http://pix2.agoda.net/hotelimages/742/742/742_14062416070020004488.jpg?s=312x	1	2020-05-06 01:24:11.622309	2020-05-06 01:24:11.622309
264124	302	1	http://pix2.agoda.net/hotelimages/879/0/fb5d04eb2af3314c84baeb698f40df1b.jpg?s=312x	1	2020-05-06 01:24:11.622309	2020-05-06 01:24:11.622309
264125	306	1	http://pix4.agoda.net/hotelimages/902/-1/2b23f05dd7efdaa810ba9c527f414afe.jpg?s=312x	1	2020-05-06 01:24:11.623083	2020-05-06 01:24:11.623083
308296	26	1	http://pix2.agoda.net/hotelimages/78/0/c0c8e0157b466534215921d295e02974.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308297	27	1	http://pix3.agoda.net/hotelimages/2293978/0/cfb97a672601c2a46da6b7643c2eeaae.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308301	165	1	http://pix2.agoda.net/hotelimages/476/476/476_16052721370042820024.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308302	98	1	http://pix1.agoda.net/hotelimages/293/293/293_16051716440042408979.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308303	113	1	http://pix3.agoda.net/hotelimages/340/0/64aec8e58807a295bbab3e11e64f172f.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308306	168	1	http://pix2.agoda.net/hotelimages/480/480/480_14072316070020428685.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308310	206	1	http://pix5.agoda.net/hotelimages/610/0/e1717007ea95a5167d9b9d108a2d3d5e.jpg?s=312x	1	2020-05-06 01:24:13.245454	2020-05-06 01:24:13.245454
308311	215	1	http://pix4.agoda.net/hotelimages/645/645/645_16041315300041490621.jpg?s=312x	1	2020-05-06 01:24:13.24621	2020-05-06 01:24:13.24621
308313	249	1	http://pix4.agoda.net/hotelimages/725/725/725_17112405170059802885.jpg?s=312x	1	2020-05-06 01:24:13.24621	2020-05-06 01:24:13.24621
352681	38	1	http://pix1.agoda.net/hotelimages/5076456/0/38babc9d6d69991b542483a4fa8cc1d9.jpg?s=312x	1	2020-05-06 01:24:14.856255	2020-05-06 01:24:14.856255
352691	248	1	http://pix3.agoda.net/hotelimages/3306765/0/b76cf29797e85afc2931551c82816fd0.jpg?s=312x	1	2020-05-06 01:24:14.857012	2020-05-06 01:24:14.857012
352692	268	1	http://pix1.agoda.net/hotelimages/793/793/793_080913000100509.jpg?s=312x	1	2020-05-06 01:24:14.857012	2020-05-06 01:24:14.857012
352696	314	1	http://pix2.agoda.net/hotelimages/4891104/0/28f1ab0e2e27d026a1133b132cbf9ce1.jpg?s=312x	1	2020-05-06 01:24:14.857012	2020-05-06 01:24:14.857012
396905	18	1	http://pix5.agoda.net/hotelimages/38/38/38_120516001857736.jpg?s=312x	1	2020-05-06 01:24:16.445401	2020-05-06 01:24:16.445401
396909	35	1	http://pix3.agoda.net/hotelimages/109/109/109_16052212090042589176.jpg?s=312x	1	2020-05-06 01:24:16.445401	2020-05-06 01:24:16.445401
396922	204	1	http://pix4.agoda.net/hotelimages/7455701/0/f07ceaf6338e064949f0d6cfb12fd822.jpg?s=312x	1	2020-05-06 01:24:16.445401	2020-05-06 01:24:16.445401
396923	211	1	http://pix2.agoda.net/hotelimages/634/634/634_16101912150047912455.jpg?s=312x	1	2020-05-06 01:24:16.446279	2020-05-06 01:24:16.446279
396929	295	1	http://pix5.agoda.net/hotelimages/2310462/0/72c2a1fd545c72bcacf222764ce1338c.jpg?s=312x	1	2020-05-06 01:24:16.446279	2020-05-06 01:24:16.446279
441155	3	1	http://pix2.agoda.net/hotelimages/1/-1/0ff4876f93688b8adcbed487b5a2175d.jpg?s=312x	1	2020-05-06 01:24:18.047189	2020-05-06 01:24:18.047189
441156	54	1	http://pix3.agoda.net/hotelimages/4867014/0/5d2009cee136e812f8351ee37f43f277.jpg?s=312x	1	2020-05-06 01:24:18.047189	2020-05-06 01:24:18.047189
441162	106	1	http://pix3.agoda.net/hotelimages/312/312/312_080913000100249.jpg?s=312x	1	2020-05-06 01:24:18.047189	2020-05-06 01:24:18.047189
441167	202	1	http://pix5.agoda.net/hotelimages/598/0/b20eb908ebd3816bb9212bcb44077d58.jpg?s=312x	1	2020-05-06 01:24:18.047972	2020-05-06 01:24:18.047972
441173	256	1	http://pix5.agoda.net/hotelimages/747/747/747_15091118120035918742.jpg?s=312x	1	2020-05-06 01:24:18.047972	2020-05-06 01:24:18.047972
441174	300	1	http://pix2.agoda.net/hotelimages/4873921/0/09961cfc2597915ebb64b786390a1609.jpg?s=312x	1	2020-05-06 01:24:18.047972	2020-05-06 01:24:18.047972
441175	307	1	http://pix4.agoda.net/hotelimages/910/910/910_110713134205177.jpg?s=312x	1	2020-05-06 01:24:18.047972	2020-05-06 01:24:18.047972
485346	45	1	http://pix5.agoda.net/hotelimages/138/-1/5a34a779300e997df06fee851cadda1c.jpg?s=312x	1	2020-05-06 01:24:19.741019	2020-05-06 01:24:19.741019
485352	134	1	http://pix4.agoda.net/hotelimages/393/393/393_13050714590012091436.jpg?s=312x	1	2020-05-06 01:24:19.741019	2020-05-06 01:24:19.741019
485354	158	1	http://pix3.agoda.net/hotelimages/5076283/0/777bccd72d9b1b501a39f246105fa8b5.jpg?s=312x	1	2020-05-06 01:24:19.741019	2020-05-06 01:24:19.741019
485355	192	1	http://pix5.agoda.net/hotelimages/554/554/554_15082620220035141734.jpg?s=312x	1	2020-05-06 01:24:19.741019	2020-05-06 01:24:19.741019
485360	275	1	http://pix3.agoda.net/hotelimages/821/821/821_0906011652001115063.jpg?s=312x	1	2020-05-06 01:24:19.741019	2020-05-06 01:24:19.741019
529390	61	1	http://pix1.agoda.net/hotelimages/179/0/51f029bfb110c883fcc6d148a3543457.jpg?s=312x	1	2020-05-06 01:24:21.418181	2020-05-06 01:24:21.418181
529391	75	1	http://pix3.agoda.net/hotelimages/7129243/0/fe1a4eadee128a8b58b19756b3a17c5b.jpg?s=312x	1	2020-05-06 01:24:21.418181	2020-05-06 01:24:21.418181
529393	159	1	http://pix2.agoda.net/hotelimages/4890894/0/fb2aa06d567d72164330d92f48abcfab.jpg?s=312x	1	2020-05-06 01:24:21.418181	2020-05-06 01:24:21.418181
529395	164	1	http://pix1.agoda.net/hotelimages/475/475/475_0906080659001352929.jpg?s=312x	1	2020-05-06 01:24:21.418181	2020-05-06 01:24:21.418181
529396	170	1	http://pix2.agoda.net/hotelimages/484/-1/90afe4df4d3ade010ae40698c6df7e8a.jpg?s=312x	1	2020-05-06 01:24:21.418181	2020-05-06 01:24:21.418181
529399	224	1	http://pix3.agoda.net/hotelimages/666/666/666_17071308270054428767.jpg?s=312x	1	2020-05-06 01:24:21.418181	2020-05-06 01:24:21.418181
529401	251	1	http://pix4.agoda.net/hotelimages/729/729/729_16120204280049335252.jpg?s=312x	1	2020-05-06 01:24:21.418971	2020-05-06 01:24:21.418971
529402	285	1	http://pix3.agoda.net/hotelimages/5443647/0/2258fa2b88d074247b95f876759afb13.jpg?s=312x	1	2020-05-06 01:24:21.418971	2020-05-06 01:24:21.418971
573938	79	1	http://pix5.agoda.net/hotelimages/229/0/286de973e06a2d0ff190341ba48ecff3.jpg?s=312x	1	2020-05-06 01:24:23.195976	2020-05-06 01:24:23.195976
573940	105	1	http://pix2.agoda.net/hotelimages/308/308/308_16060210580043042201.jpg?s=312x	1	2020-05-06 01:24:23.196732	2020-05-06 01:24:23.196732
573943	131	1	http://pix2.agoda.net/hotelimages/385/385/385_17051613500053013484.jpg?s=312x	1	2020-05-06 01:24:23.196732	2020-05-06 01:24:23.196732
573944	141	1	http://pix4.agoda.net/hotelimages/411/411/411_14070613410020163237.jpg?s=312x	1	2020-05-06 01:24:23.196732	2020-05-06 01:24:23.196732
573946	187	1	http://pix4.agoda.net/hotelimages/542/0/e0c78afeef94c6dc7e060cb5d0fc554e.jpg?s=312x	1	2020-05-06 01:24:23.196732	2020-05-06 01:24:23.196732
573948	201	1	http://pix5.agoda.net/hotelimages/597/597/597_14061216290019814083.jpg?s=312x	1	2020-05-06 01:24:23.196732	2020-05-06 01:24:23.196732
573952	281	1	http://pix5.agoda.net/hotelimages/834/834/834_16032817380041125240.jpg?s=312x	1	2020-05-06 01:24:23.196732	2020-05-06 01:24:23.196732
618198	42	1	http://pix3.agoda.net/hotelimages/132/132/132_1112020202004688488.jpg?s=312x	1	2020-05-06 01:24:24.817488	2020-05-06 01:24:24.817488
618199	90	1	http://pix4.agoda.net/hotelimages/265/0/bee6323fd06dbb3e701ed379be22567c.jpg?s=312x	1	2020-05-06 01:24:24.817488	2020-05-06 01:24:24.817488
618205	194	1	http://pix4.agoda.net/hotelimages/5501822/0/0f983a301347f6997d7eafde703c9c9c.jpg?s=312x	1	2020-05-06 01:24:24.817488	2020-05-06 01:24:24.817488
618210	243	1	http://pix3.agoda.net/hotelimages/715/715/715_17071105000054362569.jpg?s=312x	1	2020-05-06 01:24:24.817488	2020-05-06 01:24:24.817488
618214	290	1	http://pix5.agoda.net/hotelimages/4865121/0/9952b649af9c55a2108b89ba3e25aea0.jpg?s=312x	1	2020-05-06 01:24:24.818234	2020-05-06 01:24:24.818234
662149	4	1	http://pix4.agoda.net/hotelimages/6/6/6_1112201742005261861.jpg?s=312x	1	2020-05-06 01:24:26.374469	2020-05-06 01:24:26.374469
662151	31	1	http://pix5.agoda.net/hotelimages/102/102/102_16061314090043482668.jpg?s=312x	1	2020-05-06 01:24:26.374469	2020-05-06 01:24:26.374469
662153	64	1	http://pix2.agoda.net/hotelimages/184/0/5bd3a37f32b5a051ef7418ccaef3e502.jpg?s=312x	1	2020-05-06 01:24:26.374469	2020-05-06 01:24:26.374469
662154	67	1	http://pix3.agoda.net/hotelimages/197/-1/414dad37769bab0053c2244f2c50f473.jpg?s=312x	1	2020-05-06 01:24:26.374469	2020-05-06 01:24:26.374469
662155	84	1	http://pix4.agoda.net/hotelimages/253/253/253_120416201318.jpg?s=312x	1	2020-05-06 01:24:26.374469	2020-05-06 01:24:26.374469
662157	167	1	http://pix1.agoda.net/hotelimages/10677152/0/ae54867be934d0f8bde620bc0d41e4f8.jpg?s=312x	1	2020-05-06 01:24:26.375187	2020-05-06 01:24:26.375187
662158	184	1	http://pix4.agoda.net/hotelimages/533/0/028cdf846b720ae1c9a7da0fa82542bb.jpg?s=312x	1	2020-05-06 01:24:26.375187	2020-05-06 01:24:26.375187
662160	199	1	http://pix2.agoda.net/hotelimages/5665807/0/4e80b18fd7b7235e0c6c7c71c9d14e19.jpg?s=312x	1	2020-05-06 01:24:26.375187	2020-05-06 01:24:26.375187
662164	293	1	http://pix2.agoda.net/hotelimages/861/0/4db1e8036da7cf3d55d57f68b01fd7e0.jpg?s=312x	1	2020-05-06 01:24:26.375187	2020-05-06 01:24:26.375187
705752	13	1	http://pix3.agoda.net/hotelimages/25/-1/8dad037385fd554a85e013f931a8a1d5.jpg?s=312x	1	2020-05-06 01:24:28.572984	2020-05-06 01:24:28.572984
705753	23	1	http://pix3.agoda.net/hotelimages/69/0/45bf6f3bfdbf04196eabaacdfaae2ff4.jpg?s=312x	1	2020-05-06 01:24:28.572984	2020-05-06 01:24:28.572984
705757	136	1	http://pix3.agoda.net/hotelimages/397/397/397_14110715050023240241.jpg?s=312x	1	2020-05-06 01:24:28.572984	2020-05-06 01:24:28.572984
705764	216	1	http://pix5.agoda.net/hotelimages/646/0/816998e0e262eee75fee3d40c2dbfe69.jpg?s=312x	1	2020-05-06 01:24:28.573694	2020-05-06 01:24:28.573694
705767	238	1	http://pix1.agoda.net/hotelimages/702/702/702_130108103341911.jpg?s=312x	1	2020-05-06 01:24:28.573694	2020-05-06 01:24:28.573694
705769	258	1	http://pix2.agoda.net/hotelimages/756/756/756_1209131912007450333.jpg?s=312x	1	2020-05-06 01:24:28.573694	2020-05-06 01:24:28.573694
749677	17	1	http://pix2.agoda.net/hotelimages/37/37/37_13060408140012629582.jpg?s=312x	2	2020-05-06 01:24:48.093436	2020-05-06 01:24:48.093436
749681	77	1	http://pix3.agoda.net/hotelimages/220/220/220_1001231613002554769.jpg?s=312x	2	2020-05-06 01:24:48.093436	2020-05-06 01:24:48.093436
749684	102	1	http://pix1.agoda.net/hotelimages/302/302/302_17111518340059408075.jpg?s=312x	2	2020-05-06 01:24:48.093436	2020-05-06 01:24:48.093436
749688	143	1	http://pix3.agoda.net/hotelimages/417/417/417_14101721450022805961.jpg?s=312x	2	2020-05-06 01:24:48.094302	2020-05-06 01:24:48.094302
749689	157	1	http://pix5.agoda.net/hotelimages/448/-1/66411b5c5cc326a7a6f7c8bee325933b.jpg?s=312x	2	2020-05-06 01:24:48.094302	2020-05-06 01:24:48.094302
749690	183	1	http://pix1.agoda.net/hotelimages/5079954/77881794/b9b4a9a39542329dc800c5c9668e8d35.jpg?s=312x	2	2020-05-06 01:24:48.094302	2020-05-06 01:24:48.094302
749691	190	1	http://pix2.agoda.net/hotelimages/547/-1/39b1804fa55d79f16f400d9089883062.jpg?s=312x	2	2020-05-06 01:24:48.094302	2020-05-06 01:24:48.094302
749695	279	1	http://pix1.agoda.net/hotelimages/830/830/830_14120805210023826409.jpg?s=312x	2	2020-05-06 01:24:48.094302	2020-05-06 01:24:48.094302
794011	14	1	http://pix3.agoda.net/hotelimages/33/33/33_15022714410025654631.jpg?s=312x	2	2020-05-06 01:24:50.36888	2020-05-06 01:24:50.36888
794020	153	1	http://pix5.agoda.net/hotelimages/440/440/440_1201211523006084947.jpg?s=312x	2	2020-05-06 01:24:50.36888	2020-05-06 01:24:50.36888
794021	160	1	http://pix1.agoda.net/hotelimages/2285949/99238352/76b12973340adc36c0bdaf3794412416.jpg?s=312x	2	2020-05-06 01:24:50.36888	2020-05-06 01:24:50.36888
794022	162	1	http://pix1.agoda.net/hotelimages/468/468/468_13060408240012630134.jpg?s=312x	2	2020-05-06 01:24:50.36888	2020-05-06 01:24:50.36888
794025	185	1	http://pix3.agoda.net/hotelimages/537/537/537_15032416140026408245.jpg?s=312x	2	2020-05-06 01:24:50.369727	2020-05-06 01:24:50.369727
794031	274	1	http://pix1.agoda.net/hotelimages/817/817/817_14060409550019692543.jpg?s=312x	2	2020-05-06 01:24:50.369727	2020-05-06 01:24:50.369727
794036	301	1	https://q-xx.bstatic.com/xdata/images/hotel/max500/82172726.jpg?k=628da460b5aada6fb58d0ae68690ca735b908a5bfa3e6bf5607a576f62f65900&o=	2	2020-05-06 01:24:50.369727	2020-05-06 01:24:50.369727
837939	53	1	http://pix4.agoda.net/hotelimages/153/-1/1f705837afb62d5ce2ea1ae56d96381d.jpg?s=312x	2	2020-05-06 01:24:52.473623	2020-05-06 01:24:52.473623
837943	108	1	http://pix5.agoda.net/hotelimages/320/320/320_17101806190057911587.jpg?s=312x	2	2020-05-06 01:24:52.473623	2020-05-06 01:24:52.473623
837944	109	1	http://pix4.agoda.net/hotelimages/321/321/321_1201211701006088238.jpg?s=312x	2	2020-05-06 01:24:52.473623	2020-05-06 01:24:52.473623
837948	213	1	https://q-xx.bstatic.com/xdata/images/hotel/max500/157521431.jpg?k=feb86bea74a6d593aef43ac29bf11f6fa5ed785660685f56d56a1844ad61680d&o=	2	2020-05-06 01:24:52.473623	2020-05-06 01:24:52.473623
837952	240	1	http://pix5.agoda.net/hotelimages/709/709/709_110425183343.jpg?s=312x	2	2020-05-06 01:24:52.474906	2020-05-06 01:24:52.474906
837953	261	1	http://pix1.agoda.net/hotelimages/777/777/777_15122413250038716632.jpg?s=312x	2	2020-05-06 01:24:52.474906	2020-05-06 01:24:52.474906
882016	49	1	http://pix4.agoda.net/hotelimages/147/147/147_1201061640005633620.jpg?s=312x	2	2020-05-06 01:24:54.93438	2020-05-06 01:24:54.93438
882020	125	1	https://q-xx.bstatic.com/xdata/images/hotel/max500/41416574.jpg?k=beb4d6bbe57f6a71d643bd5a31f29f60baa6a2f62ed72adb40fe9eaf29b241aa&o=	2	2020-05-06 01:24:54.935279	2020-05-06 01:24:54.935279
882024	181	1	http://pix3.agoda.net/hotelimages/514/514/514_120508195208433.jpg?s=312x	2	2020-05-06 01:24:54.935279	2020-05-06 01:24:54.935279
926035	200	1	http://pix3.agoda.net/hotelimages/590/590/590_15072114200032691960.png?s=312x	2	2020-05-06 01:24:57.032323	2020-05-06 01:24:57.032323
926038	263	1	http://pix3.agoda.net/hotelimages/783/783/783_15080310230033517021.jpg?s=312x	2	2020-05-06 01:24:57.032323	2020-05-06 01:24:57.032323
970116	8	1	http://pix3.agoda.net/hotelimages/14/14/14_1001232141002632156.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
970118	47	1	http://pix5.agoda.net/hotelimages/141/141/141_13050618460012085630.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
970121	115	1	http://pix3.agoda.net/hotelimages/347/347/347_1201211628006087094.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
970125	139	1	http://pix5.agoda.net/hotelimages/407/407/407_15062319200030527800.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
970126	255	1	http://pix2.agoda.net/hotelimages/742/742/742_14101017390022679060.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
970127	302	1	http://pix1.agoda.net/hotelimages/879/879/879_1201221030006117674.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
970128	306	1	http://pix5.agoda.net/hotelimages/902/902/902_16050413300042040523.jpg?s=312x	2	2020-05-06 01:24:59.446972	2020-05-06 01:24:59.446972
1014299	26	1	http://pix4.agoda.net/hotelimages/78/78/78_17110906000058958908.jpg?s=312x	2	2020-05-06 01:25:01.327236	2020-05-06 01:25:01.327236
1014300	27	1	http://pix4.agoda.net/hotelimages/85/85/85_14070608500020162883.jpg?s=312x	2	2020-05-06 01:25:01.327236	2020-05-06 01:25:01.327236
1014304	165	1	http://pix2.agoda.net/hotelimages/476/476/476_0906011649001114104.jpg?s=312x	2	2020-05-06 01:25:01.327236	2020-05-06 01:25:01.327236
1014305	98	1	http://pix5.agoda.net/hotelimages/293/293/293_13111123500017375321.jpg?s=312x	2	2020-05-06 01:25:01.327978	2020-05-06 01:25:01.327978
1014306	113	1	http://pix1.agoda.net/hotelimages/340/340/340_16092212160046773909.jpg?s=312x	2	2020-05-06 01:25:01.327978	2020-05-06 01:25:01.327978
1014309	168	1	http://pix2.agoda.net/hotelimages/480/480/480_14072316220020429424.jpg?s=312x	2	2020-05-06 01:25:01.327978	2020-05-06 01:25:01.327978
1014313	206	1	http://pix1.agoda.net/hotelimages/610/1292331/53d202901fdba92e0654d179d5e43e42.jpg?s=312x	2	2020-05-06 01:25:01.327978	2020-05-06 01:25:01.327978
1014314	215	1	http://pix3.agoda.net/hotelimages/645/645/645_14102414280022939679.jpg?s=312x	2	2020-05-06 01:25:01.327978	2020-05-06 01:25:01.327978
1014316	249	1	http://pix2.agoda.net/hotelimages/725/725/725_13090515120014875527.jpg?s=312x	2	2020-05-06 01:25:01.327978	2020-05-06 01:25:01.327978
1058684	38	1	http://pix4.agoda.net/hotelimages/124/124/124_1207310921007003927.jpg?s=312x	2	2020-05-06 01:25:03.126982	2020-05-06 01:25:03.126982
1058694	248	1	http://pix5.agoda.net/hotelimages/724/724/724_120518200659814.png?s=312x	2	2020-05-06 01:25:03.126982	2020-05-06 01:25:03.126982
1058695	268	1	http://pix4.agoda.net/hotelimages/793/793/793_1001240157002691475.jpg?s=312x	2	2020-05-06 01:25:03.127683	2020-05-06 01:25:03.127683
1058699	314	1	http://pix4.agoda.net/hotelimages/934/1305816/1b28b63b8c4338f53288aa1a5f419ad3.jpg?s=312x	2	2020-05-06 01:25:03.127683	2020-05-06 01:25:03.127683
1102908	18	1	http://pix3.agoda.net/hotelimages/38/38/38_111102221618017.jpg?s=312x	2	2020-05-06 01:25:04.916836	2020-05-06 01:25:04.916836
1102912	35	1	http://pix5.agoda.net/hotelimages/109/109/109_16052211280042588226.jpg?s=312x	2	2020-05-06 01:25:04.916836	2020-05-06 01:25:04.916836
1102925	204	1	http://pix2.agoda.net/hotelimages/602/602/602_130403141853.jpg?s=312x	2	2020-05-06 01:25:04.917466	2020-05-06 01:25:04.917466
1102926	211	1	http://pix1.agoda.net/hotelimages/634/634/634_14090917140021985768.jpg?s=312x	2	2020-05-06 01:25:04.917466	2020-05-06 01:25:04.917466
1102932	295	1	http://pix1.agoda.net/hotelimages/866/866/866_14090123110021759933.jpg?s=312x	2	2020-05-06 01:25:04.917466	2020-05-06 01:25:04.917466
1147158	3	1	http://pix1.agoda.net/hotelimages/1/-1/7782ad8d6225d670c8c6a54107f98119.jpg?s=312x	2	2020-05-06 01:25:06.798504	2020-05-06 01:25:06.798504
1147159	54	1	http://pix5.agoda.net/hotelimages/156/156/156_1201090609005663903.jpg?s=312x	2	2020-05-06 01:25:06.798504	2020-05-06 01:25:06.798504
1147165	106	1	http://pix1.agoda.net/hotelimages/312/312/312_1201211658006088161.jpg?s=312x	2	2020-05-06 01:25:06.798504	2020-05-06 01:25:06.798504
1147170	202	1	http://pix4.agoda.net/hotelimages/598/598/598_17090514510055994804.jpg?s=312x	2	2020-05-06 01:25:06.798504	2020-05-06 01:25:06.798504
1147176	256	1	http://pix1.agoda.net/hotelimages/747/747/747_13072823230014128128.jpg?s=312x	2	2020-05-06 01:25:06.799223	2020-05-06 01:25:06.799223
1147177	300	1	http://pix4.agoda.net/hotelimages/873/873/873_13041518440011905683.jpg?s=312x	2	2020-05-06 01:25:06.799223	2020-05-06 01:25:06.799223
1147178	307	1	http://pix4.agoda.net/hotelimages/910/910/910_14071812530020337648.jpg?s=312x	2	2020-05-06 01:25:06.799223	2020-05-06 01:25:06.799223
1191349	45	1	http://pix3.agoda.net/hotelimages/138/-1/69ecbd6e3d1539022b153668922b61aa.jpg?s=312x	2	2020-05-06 01:25:08.590102	2020-05-06 01:25:08.590102
1191355	134	1	http://pix3.agoda.net/hotelimages/393/393/393_13051023370012162460.jpg?s=312x	2	2020-05-06 01:25:08.590102	2020-05-06 01:25:08.590102
1191357	158	1	http://pix3.agoda.net/hotelimages/449/449/449_14030711020018592378.jpg?s=312x	2	2020-05-06 01:25:08.590102	2020-05-06 01:25:08.590102
1191358	192	1	http://pix1.agoda.net/hotelimages/554/554/554_14031717530018732540.jpg?s=312x	2	2020-05-06 01:25:08.590102	2020-05-06 01:25:08.590102
1191363	275	1	http://pix2.agoda.net/hotelimages/821/821/821_1001231545002547950.jpg?s=312x	2	2020-05-06 01:25:08.590823	2020-05-06 01:25:08.590823
1235393	61	1	http://pix3.agoda.net/hotelimages/179/179/179_17012314550050488460.jpg?s=312x	2	2020-05-06 01:25:10.35186	2020-05-06 01:25:10.35186
1235394	75	1	http://pix3.agoda.net/hotelimages/217/217/217_16011014130039005900.jpg?s=312x	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1235396	159	1	http://pix1.agoda.net/hotelimages/453/453/453_14082117020021436616.jpg?s=312x	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1235398	164	1	https://q-xx.bstatic.com/xdata/images/hotel/max500/130675499.jpg?k=da1486f6b5582ebaa37d60978eb41e942d189a8ee41829a7d13af9ea05bb716a&o=	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1235399	170	1	http://pix2.agoda.net/hotelimages/484/-1/677a9e4b072a35c657298da7f5a56d16.jpg?s=312x	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1235402	224	1	http://pix2.agoda.net/hotelimages/666/666/666_120210124459401.jpg?s=312x	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1235404	251	1	http://pix3.agoda.net/hotelimages/729/729/729_13090511240014838762.jpg?s=312x	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1235405	285	1	http://pix1.agoda.net/hotelimages/841/-1/d1af154eda0a8aaf97ae3310e6eba1d2.jpg?s=312x	2	2020-05-06 01:25:10.352537	2020-05-06 01:25:10.352537
1279946	131	1	http://pix5.agoda.net/hotelimages/385/385/385_16010909450038989717.jpg?s=312x	2	2020-05-06 01:25:12.253702	2020-05-06 01:25:12.253702
1279941	79	1	http://pix1.agoda.net/hotelimages/229/229/229_14061219350019819571.jpg?s=312x	2	2020-05-06 01:25:12.253702	2020-05-06 01:25:12.253702
1279943	105	1	http://pix2.agoda.net/hotelimages/308/308/308_1201211708006088434.jpg?s=312x	2	2020-05-06 01:25:12.253702	2020-05-06 01:25:12.253702
1279945	176	1	https://q-xx.bstatic.com/xdata/images/hotel/max500/129887608.jpg?k=c58c2393e385bb7b4a73f01b325fe1ebbc7eb415d8d34c979ac7b7cf18aedc90&o=	2	2020-05-06 01:25:12.253702	2020-05-06 01:25:12.253702
1279947	141	1	http://pix4.agoda.net/hotelimages/411/411/411_14090917550021988714.jpg?s=312x	2	2020-05-06 01:25:12.253702	2020-05-06 01:25:12.253702
1279949	187	1	http://pix5.agoda.net/hotelimages/2287168/35214890/f9ed7ee623fca59bf8f1a09a6a311b48.jpg?s=312x	2	2020-05-06 01:25:12.254583	2020-05-06 01:25:12.254583
1279951	201	1	http://pix5.agoda.net/hotelimages/597/597/597_14061216290019814095.jpg?s=312x	2	2020-05-06 01:25:12.254583	2020-05-06 01:25:12.254583
1279955	281	1	http://pix5.agoda.net/hotelimages/834/834/834_14031118090018648094.jpg?s=312x	2	2020-05-06 01:25:12.254583	2020-05-06 01:25:12.254583
1324201	42	1	https://q-xx.bstatic.com/xdata/images/hotel/max500/90621299.jpg?k=71b8a03f0c5f4a924c9c90a8b55ad371899576aca6076ad36a38bfbb23666aa6&o=	2	2020-05-06 01:25:14.038038	2020-05-06 01:25:14.038038
1324202	90	1	http://pix5.agoda.net/hotelimages/265/265/265_15032318400026371227.jpg?s=312x	2	2020-05-06 01:25:14.038038	2020-05-06 01:25:14.038038
1324208	194	1	http://pix2.agoda.net/hotelimages/559/559/559_16090506580046090411.jpg?s=312x	2	2020-05-06 01:25:14.038038	2020-05-06 01:25:14.038038
1324213	243	1	http://pix4.agoda.net/hotelimages/715/715/715_14091519550022147265.jpg?s=312x	2	2020-05-06 01:25:14.038817	2020-05-06 01:25:14.038817
1324217	290	1	http://pix5.agoda.net/hotelimages/853/1291465/f60092efad3955ddbb977732f94d1ff7.jpg?s=312x	2	2020-05-06 01:25:14.038817	2020-05-06 01:25:14.038817
1368152	4	1	http://pix2.agoda.net/hotelimages/6/6/6_1201211018006071850.jpg?s=312x	2	2020-05-06 01:25:15.898268	2020-05-06 01:25:15.898268
1368154	31	1	http://pix4.agoda.net/hotelimages/102/102/102_14120818350023840184.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368156	64	1	http://pix3.agoda.net/hotelimages/184/184/184_110829174155.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368157	67	1	http://pix1.agoda.net/hotelimages/197/197/197_20030701460089144166.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368158	84	1	http://pix1.agoda.net/hotelimages/253/253/253_120416201323.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368160	167	1	http://pix2.agoda.net/hotelimages/479/479/479_13060407290012627490.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368161	184	1	http://pix4.agoda.net/hotelimages/533/533/533_16060123520043026652.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368163	199	1	http://pix1.agoda.net/hotelimages/587/587/587_15071316210032192881.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1368167	293	1	http://pix5.agoda.net/hotelimages/861/861/861_17080316520054878658.jpg?s=312x	2	2020-05-06 01:25:15.899136	2020-05-06 01:25:15.899136
1411755	13	1	http://pix2.agoda.net/hotelimages/25/25/25_15062308450030331242.jpg?s=312x	2	2020-05-06 01:25:17.649647	2020-05-06 01:25:17.649647
1411756	23	1	http://pix4.agoda.net/hotelimages/69/3271889/2da4a16bb4021f6845cca2067f61e194.jpg?s=312x	2	2020-05-06 01:25:17.649647	2020-05-06 01:25:17.649647
1411760	136	1	http://pix5.agoda.net/hotelimages/397/397/397_14110715180023240893.jpg?s=312x	2	2020-05-06 01:25:17.649647	2020-05-06 01:25:17.649647
1411767	216	1	http://pix4.agoda.net/hotelimages/646/646/646_1204021124006469768.jpg?s=312x	2	2020-05-06 01:25:17.650464	2020-05-06 01:25:17.650464
1411770	238	1	http://pix5.agoda.net/hotelimages/702/702/702_16052721500042820284.jpg?s=312x	2	2020-05-06 01:25:17.650464	2020-05-06 01:25:17.650464
1411772	258	1	http://pix4.agoda.net/hotelimages/756/756/756_1201212147006096040.jpg?s=312x	2	2020-05-06 01:25:17.650464	2020-05-06 01:25:17.650464
1455680	17	1	http://pix5.agoda.net/hotelimages/37/37/37_080913000100175992.jpg?s=312x	3	2020-05-06 01:25:33.028326	2020-05-06 01:25:33.028326
1455684	77	1	http://pix2.agoda.net/hotelimages/220/220/220_1112130629005014724.jpg?s=312x	3	2020-05-06 01:25:33.028326	2020-05-06 01:25:33.028326
1455687	102	1	http://pix2.agoda.net/hotelimages/302/302/302_15090914330035810665.jpg?s=312x	3	2020-05-06 01:25:33.028326	2020-05-06 01:25:33.028326
1455691	143	1	http://pix1.agoda.net/hotelimages/417/417/417_15040820480026767426.jpg?s=312x	3	2020-05-06 01:25:33.029163	2020-05-06 01:25:33.029163
1455692	157	1	http://pix4.agoda.net/hotelimages/448/-1/5bf924a0fa94bb2602f4a89a93196916.jpg?s=312x	3	2020-05-06 01:25:33.029163	2020-05-06 01:25:33.029163
1455693	183	1	http://pix2.agoda.net/hotelimages/519/519/519_17032616260051872204.jpg?s=312x	3	2020-05-06 01:25:33.029163	2020-05-06 01:25:33.029163
1455694	190	1	http://pix4.agoda.net/hotelimages/547/0/5de36cdb8606d856eb251b44bb890107.jpg?s=312x	3	2020-05-06 01:25:33.029163	2020-05-06 01:25:33.029163
1455698	279	1	http://pix2.agoda.net/hotelimages/830/830/830_14062410300019989773.jpg?s=312x	3	2020-05-06 01:25:33.029163	2020-05-06 01:25:33.029163
1500014	14	1	http://pix4.agoda.net/hotelimages/33/33/33_17080709240054945185.jpg?s=312x	3	2020-05-06 01:25:34.612124	2020-05-06 01:25:34.612124
1500023	153	1	http://pix4.agoda.net/hotelimages/440/440/440_0912190533001923569.jpg?s=312x	3	2020-05-06 01:25:34.613146	2020-05-06 01:25:34.613146
1500024	160	1	http://pix5.agoda.net/hotelimages/456/456/456_0912182210001862837.jpg?s=312x	3	2020-05-06 01:25:34.613146	2020-05-06 01:25:34.613146
1500025	162	1	http://pix3.agoda.net/hotelimages/468/468/468_0912190644001934173.jpg?s=312x	3	2020-05-06 01:25:34.613146	2020-05-06 01:25:34.613146
1500028	185	1	http://pix5.agoda.net/hotelimages/537/537/537_14082520350021560658.jpg?s=312x	3	2020-05-06 01:25:34.613146	2020-05-06 01:25:34.613146
1500034	274	1	http://pix3.agoda.net/hotelimages/817/817/817_15072711470033074673.jpg?s=312x	3	2020-05-06 01:25:34.613146	2020-05-06 01:25:34.613146
1500039	301	1	http://pix2.agoda.net/hotelimages/878/878/878_120619164532700.jpg?s=312x	3	2020-05-06 01:25:34.613146	2020-05-06 01:25:34.613146
1543942	53	1	http://pix1.agoda.net/hotelimages/153/0/7197c0c71942801c6970214d518239c3.jpg?s=312x	3	2020-05-06 01:25:36.197783	2020-05-06 01:25:36.197783
1543946	108	1	http://pix3.agoda.net/hotelimages/320/320/320_17111006220059065105.jpg?s=312x	3	2020-05-06 01:25:36.197783	2020-05-06 01:25:36.197783
1543947	109	1	http://pix4.agoda.net/hotelimages/321/321/321_1112181001005212819.jpg?s=312x	3	2020-05-06 01:25:36.197783	2020-05-06 01:25:36.197783
1543951	213	1	http://pix2.agoda.net/hotelimages/638/638/638_17033006530052017195.jpg?s=312x	3	2020-05-06 01:25:36.197783	2020-05-06 01:25:36.197783
1543955	240	1	http://pix1.agoda.net/hotelimages/709/709/709_110425183339.jpg?s=312x	3	2020-05-06 01:25:36.197783	2020-05-06 01:25:36.197783
1543956	261	1	http://pix4.agoda.net/hotelimages/777/777/777_15061610410029607929.jpg?s=312x	3	2020-05-06 01:25:36.197783	2020-05-06 01:25:36.197783
1588019	49	1	http://pix5.agoda.net/hotelimages/147/147/147_0912031314001740894.jpg?s=312x	3	2020-05-06 01:25:37.868704	2020-05-06 01:25:37.868704
1588023	125	1	http://pix2.agoda.net/hotelimages/372/372/372_121128173738.jpg?s=312x	3	2020-05-06 01:25:37.868704	2020-05-06 01:25:37.868704
1588027	181	1	http://pix2.agoda.net/hotelimages/514/514/514_16050919030042176352.jpg?s=312x	3	2020-05-06 01:25:37.868704	2020-05-06 01:25:37.868704
1632038	200	1	http://pix1.agoda.net/hotelimages/590/590/590_15072114180032691721.png?s=312x	3	2020-05-06 01:25:39.48919	2020-05-06 01:25:39.48919
1632041	263	1	http://pix2.agoda.net/hotelimages/783/0/f502a1bf05a77e9dcae8b25ddae1b702.jpg?s=312x	3	2020-05-06 01:25:39.48919	2020-05-06 01:25:39.48919
1676119	8	1	http://pix3.agoda.net/hotelimages/14/14/14_16032419040041052238.jpg?s=312x	3	2020-05-06 01:25:41.002733	2020-05-06 01:25:41.002733
1676121	47	1	http://pix4.agoda.net/hotelimages/141/141/141_130424160757.jpg?s=312x	3	2020-05-06 01:25:41.002733	2020-05-06 01:25:41.002733
1676124	115	1	http://pix1.agoda.net/hotelimages/347/347/347_0912031414001753392.jpg?s=312x	3	2020-05-06 01:25:41.002733	2020-05-06 01:25:41.002733
1676128	139	1	http://pix2.agoda.net/hotelimages/407/407/407_15062319150030527461.jpg?s=312x	3	2020-05-06 01:25:41.00353	2020-05-06 01:25:41.00353
1676129	255	1	http://pix2.agoda.net/hotelimages/742/742/742_14101017390022679061.jpg?s=312x	3	2020-05-06 01:25:41.00353	2020-05-06 01:25:41.00353
1676130	302	1	http://pix2.agoda.net/hotelimages/879/879/879_17081109080055325331.jpg?s=312x	3	2020-05-06 01:25:41.00353	2020-05-06 01:25:41.00353
1676131	306	1	http://pix4.agoda.net/hotelimages/902/902/902_15121010520038399695.jpg?s=312x	3	2020-05-06 01:25:41.00353	2020-05-06 01:25:41.00353
1720302	26	1	http://pix1.agoda.net/hotelimages/78/78/78_16051514190042342598.jpg?s=312x	3	2020-05-06 01:25:42.529326	2020-05-06 01:25:42.529326
1720303	27	1	http://pix2.agoda.net/hotelimages/85/85/85_110630084149715.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720307	165	1	http://pix2.agoda.net/hotelimages/476/476/476_0906011649001114081.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720308	98	1	http://pix3.agoda.net/hotelimages/293/293/293_14060316510019684017.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720309	113	1	http://pix2.agoda.net/hotelimages/340/340/340_17111703510059523575.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720312	168	1	http://pix2.agoda.net/hotelimages/480/480/480_14061817350019911248.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720316	206	1	http://pix2.agoda.net/hotelimages/610/0/ee0925461fd73218d1c07edf75c1c820.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720317	215	1	http://pix5.agoda.net/hotelimages/645/645/645_14102414110022939059.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1720319	249	1	http://pix2.agoda.net/hotelimages/725/725/725_16052019040042553287.jpg?s=312x	3	2020-05-06 01:25:42.530164	2020-05-06 01:25:42.530164
1764687	38	1	http://pix4.agoda.net/hotelimages/124/124/124_08091300010066316.jpg?s=312x	3	2020-05-06 01:25:44.179182	2020-05-06 01:25:44.179182
1764697	248	1	http://pix4.agoda.net/hotelimages/724/724/724_120810144049976.jpg?s=312x	3	2020-05-06 01:25:44.179182	2020-05-06 01:25:44.179182
1764698	268	1	http://pix5.agoda.net/hotelimages/793/793/793_1012151213003349856.jpg?s=312x	3	2020-05-06 01:25:44.179182	2020-05-06 01:25:44.179182
1764702	314	1	http://pix2.agoda.net/hotelimages/934/0/10f3ced055f191615effd91c3d108d15.jpg?s=312x	3	2020-05-06 01:25:44.179845	2020-05-06 01:25:44.179845
1808911	18	1	http://pix2.agoda.net/hotelimages/38/38/38_0912190005001879680.jpg?s=312x	3	2020-05-06 01:25:45.696801	2020-05-06 01:25:45.696801
1808915	35	1	http://pix2.agoda.net/hotelimages/109/109/109_110928140746380.jpg?s=312x	3	2020-05-06 01:25:45.697425	2020-05-06 01:25:45.697425
1808928	204	1	http://pix1.agoda.net/hotelimages/602/602/602_130403141855.jpg?s=312x	3	2020-05-06 01:25:45.698109	2020-05-06 01:25:45.698109
1808929	211	1	http://pix2.agoda.net/hotelimages/634/634/634_14090917110021985609.jpg?s=312x	3	2020-05-06 01:25:45.698109	2020-05-06 01:25:45.698109
1808935	295	1	http://pix2.agoda.net/hotelimages/866/866/866_14052800270019598722.jpg?s=312x	3	2020-05-06 01:25:45.698109	2020-05-06 01:25:45.698109
1853161	3	1	http://pix4.agoda.net/hotelimages/1/-1/59241704e99027895aa6293d734c9fb1.jpg?s=312x	3	2020-05-06 01:25:47.233978	2020-05-06 01:25:47.233978
1853162	54	1	http://pix3.agoda.net/hotelimages/156/156/156_14100315190022564191.jpg?s=312x	3	2020-05-06 01:25:47.233978	2020-05-06 01:25:47.233978
1853168	106	1	http://pix3.agoda.net/hotelimages/312/312/312_1112181025005213006.jpg?s=312x	3	2020-05-06 01:25:47.234818	2020-05-06 01:25:47.234818
1853173	202	1	http://pix4.agoda.net/hotelimages/598/598/598_17091514410056405683.jpg?s=312x	3	2020-05-06 01:25:47.234818	2020-05-06 01:25:47.234818
1853179	256	1	http://pix2.agoda.net/hotelimages/747/747/747_1102161154003572025.jpg?s=312x	3	2020-05-06 01:25:47.234818	2020-05-06 01:25:47.234818
1853180	300	1	http://pix3.agoda.net/hotelimages/873/-1/3f7118bf9cf9e62090a0b8e9c4640093.jpg?s=312x	3	2020-05-06 01:25:47.234818	2020-05-06 01:25:47.234818
1853181	307	1	http://pix5.agoda.net/hotelimages/910/910/910_17080813550054990929.jpg?s=312x	3	2020-05-06 01:25:47.234818	2020-05-06 01:25:47.234818
1897352	45	1	http://pix4.agoda.net/hotelimages/138/138/138_13010722350010092471.jpg?s=312x	3	2020-05-06 01:25:48.759484	2020-05-06 01:25:48.759484
1897358	134	1	http://pix4.agoda.net/hotelimages/393/393/393_1112181652005216459.jpg?s=312x	3	2020-05-06 01:25:48.759484	2020-05-06 01:25:48.759484
1897360	158	1	http://pix1.agoda.net/hotelimages/449/449/449_14030710510018592009.jpg?s=312x	3	2020-05-06 01:25:48.759484	2020-05-06 01:25:48.759484
1897361	192	1	http://pix3.agoda.net/hotelimages/554/554/554_15082620220035141735.jpg?s=312x	3	2020-05-06 01:25:48.759484	2020-05-06 01:25:48.759484
1897366	275	1	http://pix1.agoda.net/hotelimages/821/821/821_0906011652001115065.jpg?s=312x	3	2020-05-06 01:25:48.759484	2020-05-06 01:25:48.759484
1941396	61	1	http://pix2.agoda.net/hotelimages/179/179/179_16020320370039616060.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941397	75	1	http://pix3.agoda.net/hotelimages/217/217/217_16042812570041886520.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941399	159	1	http://pix5.agoda.net/hotelimages/453/453/453_15061120120029331454.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941401	164	1	http://pix3.agoda.net/hotelimages/475/475/475_0906080659001352930.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941402	170	1	http://pix4.agoda.net/hotelimages/484/484/484_14103111010023101502.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941405	224	1	http://pix4.agoda.net/hotelimages/666/666/666_17071308270054428760.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941407	251	1	http://pix5.agoda.net/hotelimages/729/729/729_13041502040011901471.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1941408	285	1	http://pix1.agoda.net/hotelimages/841/841/841_16100504010047375508.jpg?s=312x	3	2020-05-06 01:25:50.292981	2020-05-06 01:25:50.292981
1985944	79	1	http://pix1.agoda.net/hotelimages/229/0/eff2a65ac4269886bb3ff1ffdef8755d.jpg?s=312x	3	2020-05-06 01:25:51.830889	2020-05-06 01:25:51.830889
1985946	105	1	http://pix1.agoda.net/hotelimages/308/308/308_16060210580043042194.jpg?s=312x	3	2020-05-06 01:25:51.830889	2020-05-06 01:25:51.830889
1985949	131	1	http://pix1.agoda.net/hotelimages/385/385/385_15072316130032893688.jpg?s=312x	3	2020-05-06 01:25:51.830889	2020-05-06 01:25:51.830889
1985950	141	1	http://pix1.agoda.net/hotelimages/411/411/411_14070613410020163238.jpg?s=312x	3	2020-05-06 01:25:51.830889	2020-05-06 01:25:51.830889
1985952	187	1	http://pix3.agoda.net/hotelimages/542/542/542_16090109180045987635.jpg?s=312x	3	2020-05-06 01:25:51.830889	2020-05-06 01:25:51.830889
1985954	201	1	http://pix1.agoda.net/hotelimages/597/597/597_14061216290019814079.jpg?s=312x	3	2020-05-06 01:25:51.830889	2020-05-06 01:25:51.830889
1985958	281	1	http://pix5.agoda.net/hotelimages/834/834/834_16032817380041125241.jpg?s=312x	3	2020-05-06 01:25:51.831745	2020-05-06 01:25:51.831745
2030204	42	1	http://pix2.agoda.net/hotelimages/132/132/132_0907060958001636683.jpg?s=312x	3	2020-05-06 01:25:53.384607	2020-05-06 01:25:53.384607
2030205	90	1	http://pix1.agoda.net/hotelimages/265/265/265_15072015570032618978.jpg?s=312x	3	2020-05-06 01:25:53.384607	2020-05-06 01:25:53.384607
2030211	194	1	http://pix4.agoda.net/hotelimages/5501822/0/8995dab1eb31109119f1503f35e0c06a.jpg?s=312x	3	2020-05-06 01:25:53.384607	2020-05-06 01:25:53.384607
2030216	243	1	http://pix2.agoda.net/hotelimages/715/715/715_17071105000054362566.jpg?s=312x	3	2020-05-06 01:25:53.385347	2020-05-06 01:25:53.385347
2030220	290	1	http://pix1.agoda.net/hotelimages/853/853/853_13081615010014352128.jpg?s=312x	3	2020-05-06 01:25:53.385347	2020-05-06 01:25:53.385347
2074155	4	1	http://pix5.agoda.net/hotelimages/6/6/6_0905131455001101926.jpg?s=312x	3	2020-05-06 01:25:54.898688	2020-05-06 01:25:54.898688
2074157	31	1	http://pix4.agoda.net/hotelimages/102/102/102_14120818320023840125.jpg?s=312x	3	2020-05-06 01:25:54.898688	2020-05-06 01:25:54.898688
2074159	64	1	http://pix3.agoda.net/hotelimages/184/0/beccfe3e59c0c7b95f12e3a32dd1dd04.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2074160	67	1	http://pix3.agoda.net/hotelimages/197/-1/9bd7c746da73edf9f4bb2aaffdd36222.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2074161	84	1	http://pix4.agoda.net/hotelimages/253/253/253_120416201319.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2074163	167	1	http://pix5.agoda.net/hotelimages/479/479/479_13061101320012864246.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2074164	184	1	http://pix2.agoda.net/hotelimages/533/533/533_16060123520043026659.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2074166	199	1	http://pix5.agoda.net/hotelimages/587/587/587_17032508180051840517.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2074170	293	1	http://pix2.agoda.net/hotelimages/861/861/861_14081214060021034321.jpg?s=312x	3	2020-05-06 01:25:54.899345	2020-05-06 01:25:54.899345
2117758	13	1	http://pix5.agoda.net/hotelimages/25/25/25_15062308460030331423.jpg?s=312x	3	2020-05-06 01:25:56.401778	2020-05-06 01:25:56.401778
2117759	23	1	http://pix3.agoda.net/hotelimages/69/69/69_17080817270055081893.jpg?s=312x	3	2020-05-06 01:25:56.401778	2020-05-06 01:25:56.401778
2117763	136	1	http://pix3.agoda.net/hotelimages/397/397/397_14110715050023240240.jpg?s=312x	3	2020-05-06 01:25:56.40255	2020-05-06 01:25:56.40255
2117770	216	1	http://pix3.agoda.net/hotelimages/646/646/646_17090703440056072462.jpg?s=312x	3	2020-05-06 01:25:56.40255	2020-05-06 01:25:56.40255
2117773	238	1	http://pix1.agoda.net/hotelimages/702/702/702_130107193957.jpg?s=312x	3	2020-05-06 01:25:56.40255	2020-05-06 01:25:56.40255
2117775	258	1	http://pix2.agoda.net/hotelimages/756/756/756_08091300010094962.jpg?s=312x	3	2020-05-06 01:25:56.40255	2020-05-06 01:25:56.40255
2161683	17	1	http://pix2.agoda.net/hotelimages/37/37/37_080913000100175994.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161687	77	1	http://pix5.agoda.net/hotelimages/220/220/220_1112130629005014725.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161690	102	1	http://pix2.agoda.net/hotelimages/302/302/302_16060816000043289885.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161694	143	1	http://pix5.agoda.net/hotelimages/417/417/417_15040820480026767428.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161695	157	1	http://pix4.agoda.net/hotelimages/448/-1/30bea6319acd00ca950fd30bfdcb2d49.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161696	183	1	http://pix3.agoda.net/hotelimages/519/519/519_17032616260051872206.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161697	190	1	http://pix3.agoda.net/hotelimages/547/-1/f3a2d8d3d93a08be21335f1bfc68d7f5.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2161701	279	1	http://pix4.agoda.net/hotelimages/830/830/830_14062410300019989775.jpg?s=312x	4	2020-05-06 01:26:10.707675	2020-05-06 01:26:10.707675
2206017	14	1	http://pix5.agoda.net/hotelimages/33/33/33_17080709240054945186.jpg?s=312x	4	2020-05-06 01:26:12.242185	2020-05-06 01:26:12.242185
2206026	153	1	http://pix3.agoda.net/hotelimages/440/440/440_0912190533001923571.jpg?s=312x	4	2020-05-06 01:26:12.242185	2020-05-06 01:26:12.242185
2206027	160	1	http://pix2.agoda.net/hotelimages/456/456/456_0912182210001862838.jpg?s=312x	4	2020-05-06 01:26:12.242185	2020-05-06 01:26:12.242185
2206028	162	1	http://pix4.agoda.net/hotelimages/468/468/468_0912190644001934174.jpg?s=312x	4	2020-05-06 01:26:12.242185	2020-05-06 01:26:12.242185
2206031	185	1	http://pix1.agoda.net/hotelimages/537/537/537_14082520350021560684.jpg?s=312x	4	2020-05-06 01:26:12.242185	2020-05-06 01:26:12.242185
2206037	274	1	http://pix3.agoda.net/hotelimages/817/817/817_15072711470033074675.jpg?s=312x	4	2020-05-06 01:26:12.243131	2020-05-06 01:26:12.243131
2206042	301	1	http://pix4.agoda.net/hotelimages/878/878/878_120619164534121.jpg?s=312x	4	2020-05-06 01:26:12.243131	2020-05-06 01:26:12.243131
2249945	53	1	http://pix1.agoda.net/hotelimages/153/0/a63bda3177218b83269bc01b8326b557.jpg?s=312x	4	2020-05-06 01:26:13.793259	2020-05-06 01:26:13.793259
2249949	108	1	http://pix5.agoda.net/hotelimages/320/320/320_17111006220059065106.jpg?s=312x	4	2020-05-06 01:26:13.793259	2020-05-06 01:26:13.793259
2249950	109	1	http://pix5.agoda.net/hotelimages/321/321/321_1112181001005212820.jpg?s=312x	4	2020-05-06 01:26:13.793259	2020-05-06 01:26:13.793259
2249954	213	1	http://pix3.agoda.net/hotelimages/638/638/638_17040517200052142305.jpg?s=312x	4	2020-05-06 01:26:13.793259	2020-05-06 01:26:13.793259
2249958	240	1	http://pix3.agoda.net/hotelimages/709/709/709_110727175404612.jpg?s=312x	4	2020-05-06 01:26:13.793259	2020-05-06 01:26:13.793259
2249959	261	1	http://pix4.agoda.net/hotelimages/777/777/777_15061610410029607930.jpg?s=312x	4	2020-05-06 01:26:13.793259	2020-05-06 01:26:13.793259
2294022	49	1	http://pix4.agoda.net/hotelimages/147/147/147_0912031314001740898.jpg?s=312x	4	2020-05-06 01:26:15.344498	2020-05-06 01:26:15.344498
2294026	125	1	http://pix4.agoda.net/hotelimages/372/372/372_121129111759151.jpg?s=312x	4	2020-05-06 01:26:15.345342	2020-05-06 01:26:15.345342
2294030	181	1	http://pix1.agoda.net/hotelimages/514/514/514_16050919030042176355.jpg?s=312x	4	2020-05-06 01:26:15.345342	2020-05-06 01:26:15.345342
2338041	200	1	http://pix4.agoda.net/hotelimages/590/-1/e2ea504c326c565dcca5d2f7d0bfc04e.jpg?s=312x	4	2020-05-06 01:26:17.005226	2020-05-06 01:26:17.005226
2338044	263	1	http://pix5.agoda.net/hotelimages/783/0/caa71c4ac1d34fcfbc9448249ece36b5.jpg?s=312x	4	2020-05-06 01:26:17.005226	2020-05-06 01:26:17.005226
2382122	8	1	http://pix4.agoda.net/hotelimages/14/14/14_16032419040041052246.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2382124	47	1	http://pix1.agoda.net/hotelimages/141/141/141_130424160758.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2382127	115	1	http://pix3.agoda.net/hotelimages/347/347/347_1112181051005213366.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2382131	139	1	http://pix4.agoda.net/hotelimages/407/407/407_15062319150030527466.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2382132	255	1	http://pix5.agoda.net/hotelimages/742/742/742_14101017390022679062.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2382133	302	1	http://pix4.agoda.net/hotelimages/879/879/879_17081109080055325338.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2382134	306	1	http://pix2.agoda.net/hotelimages/902/902/902_18010901460060915631.jpg?s=312x	4	2020-05-06 01:26:18.935381	2020-05-06 01:26:18.935381
2426305	26	1	http://pix2.agoda.net/hotelimages/78/78/78_16051514190042342599.jpg?s=312x	4	2020-05-06 01:26:20.559482	2020-05-06 01:26:20.559482
2426306	27	1	http://pix5.agoda.net/hotelimages/85/85/85_110630084150075.jpg?s=312x	4	2020-05-06 01:26:20.559482	2020-05-06 01:26:20.559482
2426310	165	1	http://pix5.agoda.net/hotelimages/476/476/476_0906011649001114087.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2426311	98	1	http://pix4.agoda.net/hotelimages/293/293/293_14060316510019684023.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2426312	113	1	http://pix3.agoda.net/hotelimages/340/340/340_17111703510059523576.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2426315	168	1	http://pix1.agoda.net/hotelimages/480/480/480_14061817350019911249.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2426319	206	1	http://pix2.agoda.net/hotelimages/610/0/0b0b5b363d6554eab338f868261f8063.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2426320	215	1	http://pix1.agoda.net/hotelimages/645/645/645_15021010080025229825.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2426322	249	1	http://pix4.agoda.net/hotelimages/725/725/725_16052019040042553288.jpg?s=312x	4	2020-05-06 01:26:20.560169	2020-05-06 01:26:20.560169
2470705	314	1	http://pix2.agoda.net/hotelimages/934/0/9cb536f8936c23392e16ca5054be8368.jpg?s=312x	4	2020-05-06 01:26:22.185355	2020-05-06 01:26:22.185355
2470690	38	1	http://pix1.agoda.net/hotelimages/124/124/124_1001231823002585111.jpg?s=312x	4	2020-05-06 01:26:22.184477	2020-05-06 01:26:22.184477
2470700	248	1	http://pix1.agoda.net/hotelimages/724/724/724_120810144858235.jpg?s=312x	4	2020-05-06 01:26:22.184477	2020-05-06 01:26:22.184477
2470701	268	1	http://pix4.agoda.net/hotelimages/793/793/793_1112212023005293013.jpg?s=312x	4	2020-05-06 01:26:22.184477	2020-05-06 01:26:22.184477
2514914	18	1	http://pix2.agoda.net/hotelimages/38/38/38_0912190005001879681.jpg?s=312x	4	2020-05-06 01:26:23.706668	2020-05-06 01:26:23.706668
2514918	35	1	http://pix1.agoda.net/hotelimages/109/109/109_13041810270011932326.jpg?s=312x	4	2020-05-06 01:26:23.706668	2020-05-06 01:26:23.706668
2514931	204	1	http://pix5.agoda.net/hotelimages/602/602/602_130403141856.jpg?s=312x	4	2020-05-06 01:26:23.707338	2020-05-06 01:26:23.707338
2514932	211	1	http://pix4.agoda.net/hotelimages/634/634/634_14090917110021985611.jpg?s=312x	4	2020-05-06 01:26:23.707338	2020-05-06 01:26:23.707338
2514938	295	1	http://pix2.agoda.net/hotelimages/866/866/866_15030421590025805635.jpg?s=312x	4	2020-05-06 01:26:23.707338	2020-05-06 01:26:23.707338
2559164	3	1	http://pix5.agoda.net/hotelimages/1/-1/fce5d70fac02fcb7aa25f31dd25850a8.jpg?s=312x	4	2020-05-06 01:26:25.329175	2020-05-06 01:26:25.329175
2559165	54	1	http://pix3.agoda.net/hotelimages/156/156/156_14100315190022564193.jpg?s=312x	4	2020-05-06 01:26:25.329175	2020-05-06 01:26:25.329175
2559171	106	1	http://pix4.agoda.net/hotelimages/312/312/312_1112181025005213007.jpg?s=312x	4	2020-05-06 01:26:25.329175	2020-05-06 01:26:25.329175
2559176	202	1	http://pix2.agoda.net/hotelimages/598/598/598_17091514410056405691.jpg?s=312x	4	2020-05-06 01:26:25.329175	2020-05-06 01:26:25.329175
2559182	256	1	http://pix4.agoda.net/hotelimages/747/747/747_1102161154003572026.jpg?s=312x	4	2020-05-06 01:26:25.329945	2020-05-06 01:26:25.329945
2559183	300	1	http://pix4.agoda.net/hotelimages/873/-1/10cd864fd19abc5df9660c18980af2a8.jpg?s=312x	4	2020-05-06 01:26:25.329945	2020-05-06 01:26:25.329945
2559184	307	1	http://pix3.agoda.net/hotelimages/910/910/910_17080813550054990932.jpg?s=312x	4	2020-05-06 01:26:25.329945	2020-05-06 01:26:25.329945
2603355	45	1	http://pix1.agoda.net/hotelimages/138/138/138_13123022340017985380.jpg?s=312x	4	2020-05-06 01:26:26.946974	2020-05-06 01:26:26.946974
2603361	134	1	http://pix3.agoda.net/hotelimages/393/393/393_1112181652005216464.jpg?s=312x	4	2020-05-06 01:26:26.946974	2020-05-06 01:26:26.946974
2603363	158	1	http://pix1.agoda.net/hotelimages/449/449/449_14030710510018592010.jpg?s=312x	4	2020-05-06 01:26:26.946974	2020-05-06 01:26:26.946974
2603364	192	1	http://pix4.agoda.net/hotelimages/554/554/554_15082620220035141736.jpg?s=312x	4	2020-05-06 01:26:26.946974	2020-05-06 01:26:26.946974
2603369	275	1	http://pix5.agoda.net/hotelimages/821/821/821_0906011652001115066.jpg?s=312x	4	2020-05-06 01:26:26.947793	2020-05-06 01:26:26.947793
2647399	61	1	http://pix3.agoda.net/hotelimages/179/179/179_16020320370039616063.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647400	75	1	http://pix5.agoda.net/hotelimages/217/217/217_16042812570041886522.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647402	159	1	http://pix2.agoda.net/hotelimages/453/453/453_15061120120029331455.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647404	164	1	http://pix4.agoda.net/hotelimages/475/475/475_0906080659001352931.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647405	170	1	http://pix4.agoda.net/hotelimages/484/-1/84a25edd918ff62b9e241ffecb2340b8.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647408	224	1	http://pix4.agoda.net/hotelimages/666/666/666_17071308270054428761.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647410	251	1	http://pix4.agoda.net/hotelimages/729/729/729_13041502040011901472.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2647411	285	1	http://pix1.agoda.net/hotelimages/841/841/841_16100504010047375509.jpg?s=312x	4	2020-05-06 01:26:28.828133	2020-05-06 01:26:28.828133
2691947	79	1	http://pix3.agoda.net/hotelimages/229/0/b44f40ad2b3f0ad3205517b7b09b8297.jpg?s=312x	4	2020-05-06 01:26:30.4673	2020-05-06 01:26:30.4673
2691949	105	1	http://pix3.agoda.net/hotelimages/308/308/308_16060210580043042195.jpg?s=312x	4	2020-05-06 01:26:30.4673	2020-05-06 01:26:30.4673
2691952	131	1	http://pix3.agoda.net/hotelimages/385/385/385_15072316130032893692.jpg?s=312x	4	2020-05-06 01:26:30.4673	2020-05-06 01:26:30.4673
2691953	141	1	http://pix1.agoda.net/hotelimages/411/411/411_14070613410020163239.jpg?s=312x	4	2020-05-06 01:26:30.4673	2020-05-06 01:26:30.4673
2691955	187	1	http://pix1.agoda.net/hotelimages/542/542/542_16090109180045987638.jpg?s=312x	4	2020-05-06 01:26:30.4673	2020-05-06 01:26:30.4673
2691957	201	1	http://pix2.agoda.net/hotelimages/597/597/597_14061216290019814082.jpg?s=312x	4	2020-05-06 01:26:30.4673	2020-05-06 01:26:30.4673
2691961	281	1	http://pix2.agoda.net/hotelimages/834/834/834_16032817380041125242.jpg?s=312x	4	2020-05-06 01:26:30.467987	2020-05-06 01:26:30.467987
2736207	42	1	http://pix1.agoda.net/hotelimages/132/132/132_0907060958001636684.jpg?s=312x	4	2020-05-06 01:26:32.11213	2020-05-06 01:26:32.11213
2736208	90	1	http://pix2.agoda.net/hotelimages/265/-1/e9dc1717448c02a94e565be3979467f0.jpg?s=312x	4	2020-05-06 01:26:32.11213	2020-05-06 01:26:32.11213
2736214	194	1	http://pix4.agoda.net/hotelimages/5501822/0/f17542e83d49f75027d4c6bac4242f8e.jpg?s=312x	4	2020-05-06 01:26:32.11213	2020-05-06 01:26:32.11213
2736219	243	1	http://pix5.agoda.net/hotelimages/715/715/715_17071105000054362567.jpg?s=312x	4	2020-05-06 01:26:32.11213	2020-05-06 01:26:32.11213
2736223	290	1	http://pix1.agoda.net/hotelimages/853/853/853_13081615010014352129.jpg?s=312x	4	2020-05-06 01:26:32.11213	2020-05-06 01:26:32.11213
2780158	4	1	http://pix1.agoda.net/hotelimages/6/6/6_0905131455001101927.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780160	31	1	http://pix4.agoda.net/hotelimages/102/102/102_16061314080043482544.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780162	64	1	http://pix5.agoda.net/hotelimages/184/0/b65010d4a50f57f88ff98d79f1673f74.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780163	67	1	http://pix3.agoda.net/hotelimages/197/-1/d6f3fdb99f10e6d6806955516f712258.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780164	84	1	http://pix2.agoda.net/hotelimages/253/253/253_120416201320.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780166	167	1	http://pix1.agoda.net/hotelimages/479/479/479_13060407280012627439.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780167	184	1	http://pix5.agoda.net/hotelimages/533/533/533_16060123520043026660.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780169	199	1	http://pix3.agoda.net/hotelimages/587/587/587_17032508180051840518.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2780173	293	1	http://pix2.agoda.net/hotelimages/861/861/861_14081214060021034328.jpg?s=312x	4	2020-05-06 01:26:33.732574	2020-05-06 01:26:33.732574
2823761	13	1	http://pix2.agoda.net/hotelimages/25/25/25_15062308460030331424.jpg?s=312x	4	2020-05-06 01:26:35.327329	2020-05-06 01:26:35.327329
2823762	23	1	http://pix1.agoda.net/hotelimages/69/69/69_17080817270055081908.jpg?s=312x	4	2020-05-06 01:26:35.327329	2020-05-06 01:26:35.327329
2823766	136	1	http://pix2.agoda.net/hotelimages/397/397/397_14110715050023240243.jpg?s=312x	4	2020-05-06 01:26:35.327329	2020-05-06 01:26:35.327329
2823773	216	1	http://pix2.agoda.net/hotelimages/646/0/e3424a98d5548cf259a22612052cf432.jpg?s=312x	4	2020-05-06 01:26:35.328288	2020-05-06 01:26:35.328288
2823776	238	1	http://pix4.agoda.net/hotelimages/702/702/702_130107194000.jpg?s=312x	4	2020-05-06 01:26:35.328288	2020-05-06 01:26:35.328288
2823778	258	1	http://pix5.agoda.net/hotelimages/756/756/756_08091300010094964.jpg?s=312x	4	2020-05-06 01:26:35.328288	2020-05-06 01:26:35.328288
2867686	17	1	http://pix4.agoda.net/hotelimages/37/37/37_080913000100175995.jpg?s=312x	5	2020-05-06 01:26:48.388224	2020-05-06 01:26:48.388224
2867690	77	1	http://pix4.agoda.net/hotelimages/220/220/220_1112130629005014726.jpg?s=312x	5	2020-05-06 01:26:48.388224	2020-05-06 01:26:48.388224
2867693	102	1	http://pix1.agoda.net/hotelimages/302/302/302_16060816000043289887.jpg?s=312x	5	2020-05-06 01:26:48.388224	2020-05-06 01:26:48.388224
2867697	143	1	http://pix2.agoda.net/hotelimages/417/417/417_15040820480026767448.jpg?s=312x	5	2020-05-06 01:26:48.389027	2020-05-06 01:26:48.389027
2867698	157	1	http://pix1.agoda.net/hotelimages/448/-1/a0ca0ac953044cb952370c7f7393e1ef.jpg?s=312x	5	2020-05-06 01:26:48.389027	2020-05-06 01:26:48.389027
2867699	183	1	http://pix4.agoda.net/hotelimages/519/519/519_17032616260051872209.jpg?s=312x	5	2020-05-06 01:26:48.389027	2020-05-06 01:26:48.389027
2867700	190	1	http://pix3.agoda.net/hotelimages/547/-1/f14c97eb99cbe88d8d37d8e10a02f9a6.jpg?s=312x	5	2020-05-06 01:26:48.389027	2020-05-06 01:26:48.389027
2867704	279	1	http://pix2.agoda.net/hotelimages/830/830/830_14062410300019989776.jpg?s=312x	5	2020-05-06 01:26:48.389027	2020-05-06 01:26:48.389027
2912020	14	1	http://pix3.agoda.net/hotelimages/33/33/33_17080709240054945187.jpg?s=312x	5	2020-05-06 01:26:50.06444	2020-05-06 01:26:50.06444
2912029	153	1	http://pix2.agoda.net/hotelimages/440/440/440_0912190533001923573.jpg?s=312x	5	2020-05-06 01:26:50.06444	2020-05-06 01:26:50.06444
2912030	160	1	http://pix3.agoda.net/hotelimages/456/456/456_0912182210001862839.jpg?s=312x	5	2020-05-06 01:26:50.06444	2020-05-06 01:26:50.06444
2912031	162	1	http://pix2.agoda.net/hotelimages/468/468/468_0912190644001934176.jpg?s=312x	5	2020-05-06 01:26:50.06444	2020-05-06 01:26:50.06444
2912034	185	1	http://pix3.agoda.net/hotelimages/537/537/537_14082520350021560685.jpg?s=312x	5	2020-05-06 01:26:50.06444	2020-05-06 01:26:50.06444
2912040	274	1	http://pix2.agoda.net/hotelimages/817/817/817_15072711470033074677.jpg?s=312x	5	2020-05-06 01:26:50.06444	2020-05-06 01:26:50.06444
2912045	301	1	http://pix5.agoda.net/hotelimages/878/878/878_120619164536103.jpg?s=312x	5	2020-05-06 01:26:50.065446	2020-05-06 01:26:50.065446
2955948	53	1	http://pix3.agoda.net/hotelimages/153/0/5581278fc6ea570abc0d93deaa220fcd.jpg?s=312x	5	2020-05-06 01:26:51.704962	2020-05-06 01:26:51.704962
2955952	108	1	http://pix1.agoda.net/hotelimages/320/320/320_17111006220059065113.jpg?s=312x	5	2020-05-06 01:26:51.705805	2020-05-06 01:26:51.705805
2955953	109	1	http://pix3.agoda.net/hotelimages/321/321/321_1112181001005212821.jpg?s=312x	5	2020-05-06 01:26:51.705805	2020-05-06 01:26:51.705805
2955957	213	1	http://pix4.agoda.net/hotelimages/638/638/638_17040517200052142306.jpg?s=312x	5	2020-05-06 01:26:51.705805	2020-05-06 01:26:51.705805
2955961	240	1	http://pix5.agoda.net/hotelimages/709/709/709_110425183337.jpg?s=312x	5	2020-05-06 01:26:51.705805	2020-05-06 01:26:51.705805
2955962	261	1	http://pix4.agoda.net/hotelimages/777/777/777_15061610410029607931.jpg?s=312x	5	2020-05-06 01:26:51.705805	2020-05-06 01:26:51.705805
3000025	49	1	http://pix1.agoda.net/hotelimages/147/147/147_0912031314001740899.jpg?s=312x	5	2020-05-06 01:26:53.398124	2020-05-06 01:26:53.398124
3000029	125	1	http://pix5.agoda.net/hotelimages/372/372/372_121129111800448.jpg?s=312x	5	2020-05-06 01:26:53.398124	2020-05-06 01:26:53.398124
3000033	181	1	http://pix1.agoda.net/hotelimages/514/514/514_16050922360042179447.jpg?s=312x	5	2020-05-06 01:26:53.398124	2020-05-06 01:26:53.398124
3044044	200	1	http://pix3.agoda.net/hotelimages/590/-1/89901d5e74cb05be0711b3f2cb6884bf.jpg?s=312x	5	2020-05-06 01:26:55.048011	2020-05-06 01:26:55.048011
3044047	263	1	http://pix5.agoda.net/hotelimages/783/0/1d314ca42a6cd9cee1eeb000c725e4ae.jpg?s=312x	5	2020-05-06 01:26:55.048011	2020-05-06 01:26:55.048011
3088125	8	1	http://pix4.agoda.net/hotelimages/14/14/14_16051513390042341815.jpg?s=312x	5	2020-05-06 01:26:56.65065	2020-05-06 01:26:56.65065
3088127	47	1	http://pix5.agoda.net/hotelimages/141/141/141_130424160804.jpg?s=312x	5	2020-05-06 01:26:56.65065	2020-05-06 01:26:56.65065
3088130	115	1	http://pix2.agoda.net/hotelimages/347/347/347_1112181051005213367.jpg?s=312x	5	2020-05-06 01:26:56.651489	2020-05-06 01:26:56.651489
3088134	139	1	http://pix1.agoda.net/hotelimages/407/407/407_15062319150030527472.jpg?s=312x	5	2020-05-06 01:26:56.651489	2020-05-06 01:26:56.651489
3088135	255	1	http://pix4.agoda.net/hotelimages/742/742/742_14101017390022679063.jpg?s=312x	5	2020-05-06 01:26:56.651489	2020-05-06 01:26:56.651489
3088136	302	1	http://pix3.agoda.net/hotelimages/879/879/879_17081109080055325347.jpg?s=312x	5	2020-05-06 01:26:56.651489	2020-05-06 01:26:56.651489
3088137	306	1	http://pix1.agoda.net/hotelimages/902/902/902_18010901460060915632.jpg?s=312x	5	2020-05-06 01:26:56.651489	2020-05-06 01:26:56.651489
3132308	26	1	http://pix4.agoda.net/hotelimages/78/78/78_16051514190042342614.jpg?s=312x	5	2020-05-06 01:26:58.586631	2020-05-06 01:26:58.586631
3132309	27	1	http://pix1.agoda.net/hotelimages/85/85/85_110630084151997.jpg?s=312x	5	2020-05-06 01:26:58.586631	2020-05-06 01:26:58.586631
3132313	165	1	http://pix3.agoda.net/hotelimages/476/476/476_0906011649001114090.jpg?s=312x	5	2020-05-06 01:26:58.586631	2020-05-06 01:26:58.586631
3132314	98	1	http://pix4.agoda.net/hotelimages/293/293/293_16051716410042408832.jpg?s=312x	5	2020-05-06 01:26:58.586631	2020-05-06 01:26:58.586631
3132315	113	1	http://pix2.agoda.net/hotelimages/340/340/340_17111703510059523579.jpg?s=312x	5	2020-05-06 01:26:58.586631	2020-05-06 01:26:58.586631
3132318	168	1	http://pix4.agoda.net/hotelimages/480/480/480_14061817350019911252.jpg?s=312x	5	2020-05-06 01:26:58.586631	2020-05-06 01:26:58.586631
3132322	206	1	http://pix2.agoda.net/hotelimages/610/0/fe39881e2dbe618f6a78baa360063f0c.jpg?s=312x	5	2020-05-06 01:26:58.587857	2020-05-06 01:26:58.587857
3132323	215	1	http://pix1.agoda.net/hotelimages/645/645/645_15021010290025230194.jpg?s=312x	5	2020-05-06 01:26:58.587857	2020-05-06 01:26:58.587857
3132325	249	1	http://pix3.agoda.net/hotelimages/725/725/725_16052019040042553289.jpg?s=312x	5	2020-05-06 01:26:58.587857	2020-05-06 01:26:58.587857
3176693	38	1	http://pix3.agoda.net/hotelimages/124/124/124_1008271021003233091.jpg?s=312x	5	2020-05-06 01:27:00.184431	2020-05-06 01:27:00.184431
3176703	248	1	http://pix4.agoda.net/hotelimages/724/724/724_120810144905365.jpg?s=312x	5	2020-05-06 01:27:00.185148	2020-05-06 01:27:00.185148
3176704	268	1	http://pix5.agoda.net/hotelimages/793/793/793_1112212023005293014.jpg?s=312x	5	2020-05-06 01:27:00.185148	2020-05-06 01:27:00.185148
3176708	314	1	http://pix4.agoda.net/hotelimages/934/0/36cf0018cb4ccfb8c2f9e45b5ee30f17.jpg?s=312x	5	2020-05-06 01:27:00.185148	2020-05-06 01:27:00.185148
3220917	18	1	http://pix4.agoda.net/hotelimages/38/38/38_0912190005001879683.jpg?s=312x	5	2020-05-06 01:27:01.769769	2020-05-06 01:27:01.769769
3220921	35	1	http://pix3.agoda.net/hotelimages/109/109/109_16052211270042588224.jpg?s=312x	5	2020-05-06 01:27:01.770523	2020-05-06 01:27:01.770523
3220934	204	1	http://pix5.agoda.net/hotelimages/602/602/602_130403141857.jpg?s=312x	5	2020-05-06 01:27:01.770523	2020-05-06 01:27:01.770523
3220935	211	1	http://pix2.agoda.net/hotelimages/634/634/634_14090917110021985612.jpg?s=312x	5	2020-05-06 01:27:01.770523	2020-05-06 01:27:01.770523
3220941	295	1	http://pix3.agoda.net/hotelimages/866/866/866_15030421590025805636.jpg?s=312x	5	2020-05-06 01:27:01.771374	2020-05-06 01:27:01.771374
3265167	3	1	http://pix1.agoda.net/hotelimages/1/-1/7952a908de348304417552246f9039de.jpg?s=312x	5	2020-05-06 01:27:03.486536	2020-05-06 01:27:03.486536
3265168	54	1	http://pix2.agoda.net/hotelimages/156/156/156_14100315190022564194.jpg?s=312x	5	2020-05-06 01:27:03.486536	2020-05-06 01:27:03.486536
3265174	106	1	http://pix5.agoda.net/hotelimages/312/312/312_1112181025005213008.jpg?s=312x	5	2020-05-06 01:27:03.486536	2020-05-06 01:27:03.486536
3265179	202	1	http://pix3.agoda.net/hotelimages/598/598/598_17091514410056405692.jpg?s=312x	5	2020-05-06 01:27:03.486536	2020-05-06 01:27:03.486536
3265185	256	1	http://pix4.agoda.net/hotelimages/747/747/747_1102161154003572027.jpg?s=312x	5	2020-05-06 01:27:03.487218	2020-05-06 01:27:03.487218
3265186	300	1	http://pix1.agoda.net/hotelimages/873/-1/f4be834540196bebedae99fbc08e0dfd.jpg?s=312x	5	2020-05-06 01:27:03.487218	2020-05-06 01:27:03.487218
3265187	307	1	http://pix1.agoda.net/hotelimages/910/910/910_17080813550054990933.jpg?s=312x	5	2020-05-06 01:27:03.487218	2020-05-06 01:27:03.487218
3309358	45	1	http://pix4.agoda.net/hotelimages/138/138/138_13123022340017985391.jpg?s=312x	5	2020-05-06 01:27:04.958545	2020-05-06 01:27:04.958545
3309364	134	1	http://pix3.agoda.net/hotelimages/393/393/393_1112181652005216468.jpg?s=312x	5	2020-05-06 01:27:04.958545	2020-05-06 01:27:04.958545
3309366	158	1	http://pix1.agoda.net/hotelimages/449/449/449_14030710510018592011.jpg?s=312x	5	2020-05-06 01:27:04.958545	2020-05-06 01:27:04.958545
3309367	192	1	http://pix3.agoda.net/hotelimages/554/554/554_15082620220035141737.jpg?s=312x	5	2020-05-06 01:27:04.958545	2020-05-06 01:27:04.958545
3309372	275	1	http://pix1.agoda.net/hotelimages/821/821/821_0906011652001115067.jpg?s=312x	5	2020-05-06 01:27:04.958545	2020-05-06 01:27:04.958545
3353402	61	1	http://pix2.agoda.net/hotelimages/179/179/179_17120709140060258452.jpg?s=312x	5	2020-05-06 01:27:06.528213	2020-05-06 01:27:06.528213
3353403	75	1	http://pix2.agoda.net/hotelimages/217/217/217_16042812570041886539.jpg?s=312x	5	2020-05-06 01:27:06.528213	2020-05-06 01:27:06.528213
3353405	159	1	http://pix5.agoda.net/hotelimages/453/453/453_15061120120029331456.jpg?s=312x	5	2020-05-06 01:27:06.528213	2020-05-06 01:27:06.528213
3353407	164	1	http://pix4.agoda.net/hotelimages/475/475/475_0906080659001352933.jpg?s=312x	5	2020-05-06 01:27:06.528213	2020-05-06 01:27:06.528213
3353408	170	1	http://pix3.agoda.net/hotelimages/484/-1/26e929ba3b93a8a0e61166642135f749.jpg?s=312x	5	2020-05-06 01:27:06.528213	2020-05-06 01:27:06.528213
3353411	224	1	http://pix3.agoda.net/hotelimages/666/666/666_17071308270054428762.jpg?s=312x	5	2020-05-06 01:27:06.528213	2020-05-06 01:27:06.528213
3353413	251	1	http://pix4.agoda.net/hotelimages/729/729/729_13041502040011901482.jpg?s=312x	5	2020-05-06 01:27:06.529133	2020-05-06 01:27:06.529133
3353414	285	1	http://pix3.agoda.net/hotelimages/841/841/841_16100504010047375510.jpg?s=312x	5	2020-05-06 01:27:06.529133	2020-05-06 01:27:06.529133
3397950	79	1	http://pix2.agoda.net/hotelimages/229/0/3d9627e15493717630e7dd4c390ed552.jpg?s=312x	5	2020-05-06 01:27:08.022037	2020-05-06 01:27:08.022037
3397952	105	1	http://pix3.agoda.net/hotelimages/308/308/308_16060210580043042196.jpg?s=312x	5	2020-05-06 01:27:08.022037	2020-05-06 01:27:08.022037
3397955	131	1	http://pix2.agoda.net/hotelimages/385/385/385_15072316130032893710.jpg?s=312x	5	2020-05-06 01:27:08.022037	2020-05-06 01:27:08.022037
3397956	141	1	http://pix2.agoda.net/hotelimages/411/411/411_14070613410020163240.jpg?s=312x	5	2020-05-06 01:27:08.022037	2020-05-06 01:27:08.022037
3397958	187	1	http://pix2.agoda.net/hotelimages/542/542/542_16090109180045987639.jpg?s=312x	5	2020-05-06 01:27:08.022037	2020-05-06 01:27:08.022037
3397960	201	1	http://pix4.agoda.net/hotelimages/597/597/597_14061216290019814086.jpg?s=312x	5	2020-05-06 01:27:08.022037	2020-05-06 01:27:08.022037
3397964	281	1	http://pix1.agoda.net/hotelimages/834/834/834_16032817380041125244.jpg?s=312x	5	2020-05-06 01:27:08.023028	2020-05-06 01:27:08.023028
3442210	42	1	http://pix5.agoda.net/hotelimages/132/132/132_0907060958001636685.jpg?s=312x	5	2020-05-06 01:27:09.499102	2020-05-06 01:27:09.499102
3442211	90	1	http://pix1.agoda.net/hotelimages/265/-1/ef2a9bc6e77f5befb7f7fc612dfa4ddc.jpg?s=312x	5	2020-05-06 01:27:09.499102	2020-05-06 01:27:09.499102
3442217	194	1	http://pix4.agoda.net/hotelimages/5501822/0/c98d30781f55bc7b0c5a305b13cedc9e.jpg?s=312x	5	2020-05-06 01:27:09.499791	2020-05-06 01:27:09.499791
3442222	243	1	http://pix5.agoda.net/hotelimages/715/715/715_17071105000054362571.jpg?s=312x	5	2020-05-06 01:27:09.499791	2020-05-06 01:27:09.499791
3442226	290	1	http://pix2.agoda.net/hotelimages/853/853/853_13081615010014352130.jpg?s=312x	5	2020-05-06 01:27:09.499791	2020-05-06 01:27:09.499791
3486161	4	1	http://pix4.agoda.net/hotelimages/6/6/6_0905131455001101930.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486163	31	1	http://pix1.agoda.net/hotelimages/102/102/102_16061314080043482545.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486165	64	1	http://pix2.agoda.net/hotelimages/184/0/e79a98233ae3f7cdaa57a1653040ce10.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486166	67	1	http://pix2.agoda.net/hotelimages/197/-1/c23fe1739c82c673a337448ab7b96694.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486167	84	1	http://pix1.agoda.net/hotelimages/253/253/253_120416201324.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486169	167	1	http://pix3.agoda.net/hotelimages/479/479/479_16062020010043856359.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486170	184	1	http://pix5.agoda.net/hotelimages/533/533/533_16060123520043026661.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486172	199	1	http://pix2.agoda.net/hotelimages/587/587/587_17032508180051840522.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3486176	293	1	http://pix3.agoda.net/hotelimages/861/861/861_14081214060021034329.jpg?s=312x	5	2020-05-06 01:27:10.964805	2020-05-06 01:27:10.964805
3529764	13	1	http://pix2.agoda.net/hotelimages/25/25/25_15062308460030331425.jpg?s=312x	5	2020-05-06 01:27:12.416569	2020-05-06 01:27:12.416569
3529765	23	1	http://pix5.agoda.net/hotelimages/69/69/69_17080817270055081910.jpg?s=312x	5	2020-05-06 01:27:12.416569	2020-05-06 01:27:12.416569
3529769	136	1	http://pix4.agoda.net/hotelimages/397/397/397_14110715060023240246.jpg?s=312x	5	2020-05-06 01:27:12.416569	2020-05-06 01:27:12.416569
3529776	216	1	http://pix1.agoda.net/hotelimages/646/0/eb1422e538627ced8e06be44be4978c4.jpg?s=312x	5	2020-05-06 01:27:12.417274	2020-05-06 01:27:12.417274
3529779	238	1	http://pix1.agoda.net/hotelimages/702/702/702_130107194001.jpg?s=312x	5	2020-05-06 01:27:12.417274	2020-05-06 01:27:12.417274
3529781	258	1	http://pix2.agoda.net/hotelimages/756/756/756_08091300010094965.jpg?s=312x	5	2020-05-06 01:27:12.417274	2020-05-06 01:27:12.417274
\.


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.rates (id, hotel_id, partner_id, roomtype_name, currency, daily_rate, actual_on, crossed_out_rate, discount_percentage, created_at, updated_at, star_rating, review_count, review_score) FROM stdin;
2	23	1	1 King Bed Evolution Room 	USD	119	2020-05-29	0	0	2020-05-28 10:00:59.039183	2020-05-28 10:00:59.039183	\N	\N	\N
3	45	1	Classic Double or Twin	USD	108.75	2020-05-29	0	0	2020-05-28 10:00:59.052351	2020-05-28 10:00:59.052351	\N	\N	\N
4	167	1	Twin Room	USD	58.46	2020-05-29	0	0	2020-05-28 10:00:59.056315	2020-05-28 10:00:59.056315	\N	\N	\N
5	115	1	Double Room	USD	62.57	2020-05-29	0	0	2020-05-28 10:00:59.064338	2020-05-28 10:00:59.064338	\N	\N	\N
6	158	1	Superior Twin Non-Smoking	USD	85.39	2020-05-29	0	0	2020-05-28 10:00:59.068644	2020-05-28 10:00:59.068644	\N	\N	\N
7	153	1	Standard Twin Room	USD	117.09	2020-05-29	0	0	2020-05-28 10:00:59.072602	2020-05-28 10:00:59.072602	\N	\N	\N
8	131	1	Superior Double Room	USD	60.72	2020-05-29	0	0	2020-05-28 10:00:59.076565	2020-05-28 10:00:59.076565	\N	\N	\N
9	113	1	Guestroom 1 King	USD	169	2020-05-29	0	0	2020-05-28 10:00:59.080379	2020-05-28 10:00:59.080379	\N	\N	\N
10	53	1	Superior Twin	USD	122.78	2020-05-29	0	0	2020-05-28 10:00:59.084305	2020-05-28 10:00:59.084305	\N	\N	\N
11	143	1	Standard Double Room	USD	163.15	2020-05-29	0	0	2020-05-28 10:00:59.088124	2020-05-28 10:00:59.088124	\N	\N	\N
12	108	1	Standard Double Room	USD	100.61	2020-05-29	0	0	2020-05-28 10:00:59.09198	2020-05-28 10:00:59.09198	\N	\N	\N
13	13	1	Premium Twin Room with Two Double Beds	USD	122.78	2020-05-29	0	0	2020-05-28 10:00:59.095975	2020-05-28 10:00:59.095975	\N	\N	\N
14	8	1	Double Room	USD	153.62	2020-05-29	0	0	2020-05-28 10:00:59.099936	2020-05-28 10:00:59.099936	\N	\N	\N
15	64	1	Basic Double or Twin Room	USD	54.87	2020-05-29	0	0	2020-05-28 10:00:59.103867	2020-05-28 10:00:59.103867	\N	\N	\N
16	125	1	Standard Double or Twin Room	USD	30	2020-05-29	0	0	2020-05-28 10:00:59.107876	2020-05-28 10:00:59.107876	\N	\N	\N
17	199	1	Standard Room with 1 double bed	USD	32.24	2020-05-29	0	0	2020-05-28 10:00:59.111653	2020-05-28 10:00:59.111653	\N	\N	\N
18	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-05-29	0	0	2020-05-28 10:00:59.115463	2020-05-28 10:00:59.115463	\N	\N	\N
19	194	1	Standard Small Double Room - Non-Smoking	USD	155.74	2020-05-29	0	0	2020-05-28 10:00:59.11959	2020-05-28 10:00:59.11959	\N	\N	\N
20	95	1	 Twin Guestroom	USD	174.51	2020-05-29	0	0	2020-05-28 10:00:59.123497	2020-05-28 10:00:59.123497	\N	\N	\N
21	157	1	Cosy Small Room	USD	118.4	2020-05-29	0	0	2020-05-28 10:00:59.127317	2020-05-28 10:00:59.127317	\N	\N	\N
22	26	1	Double	USD	62.12	2020-05-29	0	0	2020-05-28 10:00:59.164588	2020-05-28 10:00:59.164588	\N	\N	\N
23	61	1	Modern Double Room	USD	169.19	2020-05-29	0	0	2020-05-28 10:00:59.170034	2020-05-28 10:00:59.170034	\N	\N	\N
24	181	1	Superior Double Room	USD	61.94	2020-05-29	0	0	2020-05-28 10:00:59.174046	2020-05-28 10:00:59.174046	\N	\N	\N
25	49	1	Superior Twin Room	USD	111.8	2020-05-29	0	0	2020-05-28 10:00:59.17793	2020-05-28 10:00:59.17793	\N	\N	\N
26	42	1	Two-Bedroom Apartment	USD	175	2020-05-29	0	0	2020-05-28 10:00:59.181816	2020-05-28 10:00:59.181816	\N	\N	\N
27	90	1	Standard Room	USD	78.57	2020-05-29	438.98	0	2020-05-28 10:00:59.186701	2020-05-28 10:00:59.186701	\N	\N	\N
28	106	1	Double Room with Two Single Beds	USD	26.93	2020-05-29	0	0	2020-05-28 10:00:59.191478	2020-05-28 10:00:59.191478	\N	\N	\N
29	27	1	Standard Twin Room - Smoking	USD	165.7	2020-05-29	539.16	0	2020-05-28 10:00:59.195483	2020-05-28 10:00:59.195483	\N	\N	\N
30	139	1	Double Executive	USD	305.69	2020-05-29	768.22	20	2020-05-28 10:00:59.199367	2020-05-28 10:00:59.199367	\N	\N	\N
31	14	1	Classic Double Bed	USD	114.22	2020-05-29	0	0	2020-05-28 10:00:59.203397	2020-05-28 10:00:59.203397	\N	\N	\N
32	79	1	Standard Room	USD	56.41	2020-05-29	0	0	2020-05-28 10:00:59.20735	2020-05-28 10:00:59.20735	\N	\N	\N
33	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.26	2020-05-29	0	0	2020-05-28 10:00:59.211086	2020-05-28 10:00:59.211086	\N	\N	\N
34	67	1	Temptation Oceanfront Master Suite	USD	1079.54	2020-05-29	1909.34	45	2020-05-28 10:00:59.214843	2020-05-28 10:00:59.214843	\N	\N	\N
35	160	1	King Accesible with Bathtub	USD	89	2020-05-29	0	0	2020-05-28 10:00:59.218743	2020-05-28 10:00:59.218743	\N	\N	\N
36	54	1	Double Room	USD	138.34	2020-05-29	704.63	0	2020-05-28 10:00:59.222826	2020-05-28 10:00:59.222826	\N	\N	\N
37	47	1	Standard room half board	USD	188.43	2020-05-29	500	0	2020-05-28 10:00:59.226933	2020-05-28 10:00:59.226933	\N	\N	\N
38	38	1	Deluxe Double or Twin Room with Sea View	USD	246.16	2020-05-29	0	0	2020-05-28 10:00:59.264346	2020-05-28 10:00:59.264346	\N	\N	\N
39	192	1	Comfort Room	USD	65.64	2020-05-29	219.49	0	2020-05-28 10:00:59.268797	2020-05-28 10:00:59.268797	\N	\N	\N
40	165	1	Basic Room	USD	88.79	2020-05-29	0	0	2020-05-28 10:00:59.272857	2020-05-28 10:00:59.272857	\N	\N	\N
41	215	1	Deluxe Room	USD	38.69	2020-05-29	213.65	0	2020-05-28 10:00:59.815151	2020-05-28 10:00:59.815151	\N	\N	\N
43	243	1	Classic Twin Room	USD	58.52	2020-05-29	0	0	2020-05-28 10:00:59.822979	2020-05-28 10:00:59.822979	\N	\N	\N
44	256	1	Standard Double Room	USD	87.18	2020-05-29	0	0	2020-05-28 10:00:59.826796	2020-05-28 10:00:59.826796	\N	\N	\N
45	285	1	Superior Room king bed	USD	93.47	2020-05-29	0	0	2020-05-28 10:00:59.83061	2020-05-28 10:00:59.83061	\N	\N	\N
46	274	1	Double Room - Non-Smoking	USD	324.9	2020-05-29	0	0	2020-05-28 10:00:59.834401	2020-05-28 10:00:59.834401	\N	\N	\N
47	306	1	Deluxe King City View	USD	105.75	2020-05-29	300.09	30	2020-05-28 10:00:59.838324	2020-05-28 10:00:59.838324	\N	\N	\N
48	290	1	Standard	USD	91.29	2020-05-29	0	0	2020-05-28 10:00:59.842152	2020-05-28 10:00:59.842152	\N	\N	\N
51	258	1	Standard Double Room	USD	24.48	2020-05-29	0	0	2020-05-28 10:00:59.85357	2020-05-28 10:00:59.85357	\N	\N	\N
52	216	1	2 Double Accessible Roll in Shower	USD	109	2020-05-29	0	0	2020-05-28 10:00:59.864822	2020-05-28 10:00:59.864822	\N	\N	\N
54	275	1	Double or Twin Room	USD	82.31	2020-05-29	0	0	2020-05-28 10:00:59.872779	2020-05-28 10:00:59.872779	\N	\N	\N
55	204	1	King Bed	USD	187.86	2020-05-29	0	0	2020-05-28 10:00:59.876424	2020-05-28 10:00:59.876424	\N	\N	\N
56	295	1	Classic Double or Twin	USD	201.05	2020-05-29	449.96	0	2020-05-28 10:00:59.880246	2020-05-28 10:00:59.880246	\N	\N	\N
58	307	1	1 King Bed	USD	445.58	2020-05-29	0	0	2020-05-28 10:00:59.888062	2020-05-28 10:00:59.888062	\N	\N	\N
59	302	1	Accessible 1 King Bed	USD	79	2020-05-29	300	0	2020-05-28 10:00:59.892019	2020-05-28 10:00:59.892019	\N	\N	\N
64	263	1	Queen Hilton Guestroom	USD	129.96	2020-05-29	0	0	2020-05-28 10:00:59.915844	2020-05-28 10:00:59.915844	\N	\N	\N
86666	23	1	1 King Bed Evolution Room 	USD	119	2020-05-30	0	0	2020-05-29 11:49:00.544227	2020-05-29 11:49:00.544227	\N	\N	\N
86667	45	1	Classic Double or Twin	USD	109.81	2020-05-30	0	0	2020-05-29 11:49:00.565364	2020-05-29 11:49:00.565364	\N	\N	\N
86668	167	1	Twin Room	USD	58.32	2020-05-30	0	0	2020-05-29 11:49:00.569362	2020-05-29 11:49:00.569362	\N	\N	\N
86669	115	1	Double Room	USD	77.67	2020-05-30	0	0	2020-05-29 11:49:00.573297	2020-05-29 11:49:00.573297	\N	\N	\N
86670	158	1	Superior Twin Non-Smoking	USD	85.65	2020-05-30	0	0	2020-05-29 11:49:00.577448	2020-05-29 11:49:00.577448	\N	\N	\N
86671	153	1	Standard Twin Room	USD	118.37	2020-05-30	0	0	2020-05-29 11:49:00.581338	2020-05-29 11:49:00.581338	\N	\N	\N
86672	131	1	Superior Double Room	USD	53.71	2020-05-30	0	0	2020-05-29 11:49:00.585167	2020-05-29 11:49:00.585167	\N	\N	\N
86673	113	1	Guestroom 1 King	USD	169	2020-05-30	0	0	2020-05-29 11:49:00.589141	2020-05-29 11:49:00.589141	\N	\N	\N
86674	53	1	Superior Twin	USD	134.76	2020-05-30	0	0	2020-05-29 11:49:00.593684	2020-05-29 11:49:00.593684	\N	\N	\N
86675	143	1	Standard Double Room	USD	165.41	2020-05-30	0	0	2020-05-29 11:49:00.597762	2020-05-29 11:49:00.597762	\N	\N	\N
86676	108	1	Standard Double Room	USD	101.6	2020-05-30	0	0	2020-05-29 11:49:00.601709	2020-05-29 11:49:00.601709	\N	\N	\N
86677	8	1	Double Room	USD	155.75	2020-05-30	0	0	2020-05-29 11:49:00.605553	2020-05-29 11:49:00.605553	\N	\N	\N
86678	64	1	Basic Double or Twin Room	USD	60.45	2020-05-30	0	0	2020-05-29 11:49:00.60932	2020-05-29 11:49:00.60932	\N	\N	\N
86679	125	1	Standard Double or Twin Room	USD	30	2020-05-30	0	0	2020-05-29 11:49:00.613324	2020-05-29 11:49:00.613324	\N	\N	\N
86680	199	1	Standard Room with 1 double bed	USD	32.25	2020-05-30	0	0	2020-05-29 11:49:00.617162	2020-05-29 11:49:00.617162	\N	\N	\N
86681	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-05-30	0	0	2020-05-29 11:49:00.621047	2020-05-29 11:49:00.621047	\N	\N	\N
86682	194	1	Standard Small Double Room - Non-Smoking	USD	163.57	2020-05-30	0	0	2020-05-29 11:49:00.624909	2020-05-29 11:49:00.624909	\N	\N	\N
86683	95	1	 Twin Guestroom	USD	176.21	2020-05-30	0	0	2020-05-29 11:49:00.664413	2020-05-29 11:49:00.664413	\N	\N	\N
86684	157	1	Cosy Small Room	USD	123.17	2020-05-30	0	0	2020-05-29 11:49:00.669736	2020-05-29 11:49:00.669736	\N	\N	\N
86685	26	1	Double	USD	62.72	2020-05-30	0	0	2020-05-29 11:49:00.673825	2020-05-29 11:49:00.673825	\N	\N	\N
86686	61	1	Modern Double Room	USD	190.12	2020-05-30	0	0	2020-05-29 11:49:00.677914	2020-05-29 11:49:00.677914	\N	\N	\N
86687	181	1	Superior Double Room	USD	61.94	2020-05-30	0	0	2020-05-29 11:49:00.681815	2020-05-29 11:49:00.681815	\N	\N	\N
86688	49	1	Superior Twin Room	USD	112.89	2020-05-30	0	0	2020-05-29 11:49:00.685835	2020-05-29 11:49:00.685835	\N	\N	\N
86689	42	1	Two-Bedroom Apartment	USD	175	2020-05-30	0	0	2020-05-29 11:49:00.689695	2020-05-29 11:49:00.689695	\N	\N	\N
86690	90	1	Standard Room	USD	83.11	2020-05-30	443.26	0	2020-05-29 11:49:00.693638	2020-05-29 11:49:00.693638	\N	\N	\N
86691	106	1	Double Room with Two Single Beds	USD	26.86	2020-05-30	0	0	2020-05-29 11:49:00.697712	2020-05-29 11:49:00.697712	\N	\N	\N
86692	27	1	Standard Twin Room - Smoking	USD	165.86	2020-05-30	539.68	0	2020-05-29 11:49:00.701591	2020-05-29 11:49:00.701591	\N	\N	\N
86693	139	1	Double Executive	USD	308.67	2020-05-30	775.71	20	2020-05-29 11:49:00.705804	2020-05-29 11:49:00.705804	\N	\N	\N
86694	14	1	Classic Double Bed	USD	115.34	2020-05-30	0	0	2020-05-29 11:49:00.709712	2020-05-29 11:49:00.709712	\N	\N	\N
86695	79	1	Standard Room	USD	56.96	2020-05-30	0	0	2020-05-29 11:49:00.713677	2020-05-29 11:49:00.713677	\N	\N	\N
86696	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	92.92	2020-05-30	0	0	2020-05-29 11:49:00.717714	2020-05-29 11:49:00.717714	\N	\N	\N
86697	67	1	Temptation Oceanfront Master Suite	USD	1079.54	2020-05-30	1909.34	45	2020-05-29 11:49:00.721673	2020-05-29 11:49:00.721673	\N	\N	\N
86698	160	1	King Accesible with Bathtub	USD	89	2020-05-30	0	0	2020-05-29 11:49:00.725666	2020-05-29 11:49:00.725666	\N	\N	\N
86699	54	1	Double Room	USD	139.09	2020-05-30	708.44	0	2020-05-29 11:49:00.729742	2020-05-29 11:49:00.729742	\N	\N	\N
86700	47	1	Standard room half board	USD	188.43	2020-05-30	500	0	2020-05-29 11:49:00.767696	2020-05-29 11:49:00.767696	\N	\N	\N
86701	38	1	Deluxe Double or Twin Room with Sea View	USD	144.99	2020-05-30	0	0	2020-05-29 11:49:00.771857	2020-05-29 11:49:00.771857	\N	\N	\N
86702	192	1	Comfort Room	USD	66.28	2020-05-30	221.63	0	2020-05-29 11:49:00.779745	2020-05-29 11:49:00.779745	\N	\N	\N
86703	165	1	Basic Room	USD	89.66	2020-05-30	0	0	2020-05-29 11:49:00.783806	2020-05-29 11:49:00.783806	\N	\N	\N
86704	215	1	Deluxe Room	USD	41.3	2020-05-30	224.1	25	2020-05-29 11:49:01.155851	2020-05-29 11:49:01.155851	\N	\N	\N
86705	224	1	Family Room	USD	63.43	2020-05-30	0	0	2020-05-29 11:49:01.16022	2020-05-29 11:49:01.16022	\N	\N	\N
86707	243	1	Classic Twin Room	USD	59.09	2020-05-30	0	0	2020-05-29 11:49:01.183004	2020-05-29 11:49:01.183004	\N	\N	\N
86708	256	1	Standard Double Room	USD	88.03	2020-05-30	0	0	2020-05-29 11:49:01.188267	2020-05-29 11:49:01.188267	\N	\N	\N
86709	285	1	Superior Room king bed	USD	99.99	2020-05-30	0	0	2020-05-29 11:49:01.192259	2020-05-29 11:49:01.192259	\N	\N	\N
86710	274	1	Double Room - Non-Smoking	USD	325.22	2020-05-30	0	0	2020-05-29 11:49:01.196264	2020-05-29 11:49:01.196264	\N	\N	\N
86711	306	1	Deluxe King City View	USD	102.18	2020-05-30	300.3	30	2020-05-29 11:49:01.201245	2020-05-29 11:49:01.201245	\N	\N	\N
86712	290	1	Standard	USD	92.18	2020-05-30	0	0	2020-05-29 11:49:01.206105	2020-05-29 11:49:01.206105	\N	\N	\N
86715	258	1	Standard Double Room	USD	24.42	2020-05-30	0	0	2020-05-29 11:49:01.21845	2020-05-29 11:49:01.21845	\N	\N	\N
86716	216	1	2 Double Accessible with Bathtub	USD	109	2020-05-30	0	0	2020-05-29 11:49:01.222396	2020-05-29 11:49:01.222396	\N	\N	\N
86718	204	1	King Bed	USD	217.41	2020-05-30	0	0	2020-05-29 11:49:01.230652	2020-05-29 11:49:01.230652	\N	\N	\N
86719	295	1	Classic Double or Twin	USD	223.32	2020-05-30	454.34	0	2020-05-29 11:49:01.234619	2020-05-29 11:49:01.234619	\N	\N	\N
86721	307	1	1 King Bed	USD	473.89	2020-05-30	0	0	2020-05-29 11:49:01.243813	2020-05-29 11:49:01.243813	\N	\N	\N
86722	302	1	2 Queen Beds 	USD	79	2020-05-30	0	0	2020-05-29 11:49:01.264642	2020-05-29 11:49:01.264642	\N	\N	\N
86727	263	1	Queen Hilton Guestroom	USD	167.26	2020-05-30	0	0	2020-05-29 11:49:01.287425	2020-05-29 11:49:01.287425	\N	\N	\N
169897	23	1	1 King Bed Evolution Room 	USD	119	2020-05-31	0	0	2020-05-30 11:48:50.367266	2020-05-30 11:48:50.367266	\N	\N	\N
169898	45	1	Classic Double or Twin	USD	109.97	2020-05-31	0	0	2020-05-30 11:48:50.394455	2020-05-30 11:48:50.394455	\N	\N	\N
169899	167	1	Twin Room	USD	59.77	2020-05-31	0	0	2020-05-30 11:48:50.398665	2020-05-30 11:48:50.398665	\N	\N	\N
169900	115	1	Double Room	USD	66.37	2020-05-31	0	0	2020-05-30 11:48:50.402444	2020-05-30 11:48:50.402444	\N	\N	\N
169901	158	1	Superior Twin Non-Smoking	USD	85.76	2020-05-31	0	0	2020-05-30 11:48:50.406251	2020-05-30 11:48:50.406251	\N	\N	\N
169902	153	1	Standard Twin Room	USD	157.83	2020-05-31	0	0	2020-05-30 11:48:50.410117	2020-05-30 11:48:50.410117	\N	\N	\N
169903	131	1	Superior Double Room	USD	50.54	2020-05-31	0	0	2020-05-30 11:48:50.414046	2020-05-30 11:48:50.414046	\N	\N	\N
169904	113	1	2 Queen Beds 	USD	169	2020-05-31	0	0	2020-05-30 11:48:50.419813	2020-05-30 11:48:50.419813	\N	\N	\N
169905	53	1	Superior Twin	USD	117.82	2020-05-31	0	0	2020-05-30 11:48:50.42375	2020-05-30 11:48:50.42375	\N	\N	\N
169906	143	1	Standard Double Room	USD	165.89	2020-05-31	0	0	2020-05-30 11:48:50.42766	2020-05-30 11:48:50.42766	\N	\N	\N
169907	108	1	Standard Double Room	USD	83.08	2020-05-31	0	0	2020-05-30 11:48:50.43159	2020-05-30 11:48:50.43159	\N	\N	\N
169908	13	1	Premium Twin Room with Two Double Beds	USD	123.2	2020-05-31	0	0	2020-05-30 11:48:50.43542	2020-05-30 11:48:50.43542	\N	\N	\N
169909	8	1	Double Room	USD	186.73	2020-05-31	0	0	2020-05-30 11:48:50.439297	2020-05-30 11:48:50.439297	\N	\N	\N
169910	64	1	Basic Double or Twin Room	USD	48.43	2020-05-31	0	0	2020-05-30 11:48:50.443243	2020-05-30 11:48:50.443243	\N	\N	\N
169911	125	1	Standard Double or Twin Room	USD	30	2020-05-31	0	0	2020-05-30 11:48:50.447072	2020-05-30 11:48:50.447072	\N	\N	\N
169912	199	1	Standard Room with 1 double bed	USD	32.25	2020-05-31	0	0	2020-05-30 11:48:50.450917	2020-05-30 11:48:50.450917	\N	\N	\N
169913	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-05-31	0	0	2020-05-30 11:48:50.454936	2020-05-30 11:48:50.454936	\N	\N	\N
169914	194	1	Standard Small Double Room - Non-Smoking	USD	163.29	2020-05-31	0	0	2020-05-30 11:48:50.466321	2020-05-30 11:48:50.466321	\N	\N	\N
169915	95	1	 Twin Guestroom	USD	176.46	2020-05-31	0	0	2020-05-30 11:48:50.470396	2020-05-30 11:48:50.470396	\N	\N	\N
169916	157	1	Cosy Small Room	USD	100.16	2020-05-31	0	0	2020-05-30 11:48:50.474128	2020-05-30 11:48:50.474128	\N	\N	\N
169917	26	1	Double	USD	62.81	2020-05-31	0	0	2020-05-30 11:48:50.477978	2020-05-30 11:48:50.477978	\N	\N	\N
169918	61	1	Modern Double Room	USD	170.46	2020-05-31	0	0	2020-05-30 11:48:50.481787	2020-05-30 11:48:50.481787	\N	\N	\N
169919	181	1	Superior Double Room	USD	61.94	2020-05-31	0	0	2020-05-30 11:48:50.485591	2020-05-30 11:48:50.485591	\N	\N	\N
169920	49	1	Superior Twin Room	USD	102.67	2020-05-31	0	0	2020-05-30 11:48:50.489647	2020-05-30 11:48:50.489647	\N	\N	\N
169921	42	1	Two-Bedroom Apartment	USD	175	2020-05-31	0	0	2020-05-30 11:48:50.493805	2020-05-30 11:48:50.493805	\N	\N	\N
169922	90	1	Standard Room	USD	78.69	2020-05-31	443.9	0	2020-05-30 11:48:50.49762	2020-05-30 11:48:50.49762	\N	\N	\N
169923	106	1	Double Room with Two Single Beds	USD	26.37	2020-05-31	0	0	2020-05-30 11:48:50.501386	2020-05-30 11:48:50.501386	\N	\N	\N
169924	27	1	Standard Twin Room - Smoking	USD	165.57	2020-05-31	538.75	0	2020-05-30 11:48:50.505132	2020-05-30 11:48:50.505132	\N	\N	\N
169925	139	1	Double Executive	USD	309.12	2020-05-31	776.83	20	2020-05-30 11:48:50.508909	2020-05-30 11:48:50.508909	\N	\N	\N
169926	14	1	Classic Double Bed	USD	115.5	2020-05-31	0	0	2020-05-30 11:48:50.512781	2020-05-30 11:48:50.512781	\N	\N	\N
169927	79	1	Comfort Room	USD	67.42	2020-05-31	0	0	2020-05-30 11:48:50.51645	2020-05-30 11:48:50.51645	\N	\N	\N
169928	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.21	2020-05-31	0	0	2020-05-30 11:48:50.520175	2020-05-30 11:48:50.520175	\N	\N	\N
169929	67	1	Temptation Oceanfront Master Suite	USD	1079.54	2020-05-31	1909.34	45	2020-05-30 11:48:50.524063	2020-05-30 11:48:50.524063	\N	\N	\N
169930	160	1	King Accesible with Bathtub	USD	89	2020-05-31	0	0	2020-05-30 11:48:50.564571	2020-05-30 11:48:50.564571	\N	\N	\N
169931	54	1	Double Room	USD	139.38	2020-05-31	709.91	0	2020-05-30 11:48:50.569425	2020-05-30 11:48:50.569425	\N	\N	\N
169932	47	1	Standard room half board	USD	188.43	2020-05-31	500	0	2020-05-30 11:48:50.573314	2020-05-30 11:48:50.573314	\N	\N	\N
169933	38	1	Deluxe Double or Twin Room with Sea View	USD	145.2	2020-05-31	0	0	2020-05-30 11:48:50.581767	2020-05-30 11:48:50.581767	\N	\N	\N
169934	192	1	Comfort Room	USD	66.37	2020-05-31	221.95	0	2020-05-30 11:48:50.585526	2020-05-30 11:48:50.585526	\N	\N	\N
169935	165	1	Basic Room	USD	89.79	2020-05-31	0	0	2020-05-30 11:48:50.589545	2020-05-30 11:48:50.589545	\N	\N	\N
169936	215	1	Deluxe Room	USD	38.7	2020-05-31	213.69	0	2020-05-30 11:48:51.045729	2020-05-30 11:48:51.045729	\N	\N	\N
169938	243	1	Classic Twin Room	USD	59.17	2020-05-31	0	0	2020-05-30 11:48:51.054385	2020-05-30 11:48:51.054385	\N	\N	\N
169939	256	1	Standard Double Room	USD	88.16	2020-05-31	0	0	2020-05-30 11:48:51.058332	2020-05-30 11:48:51.058332	\N	\N	\N
169940	285	1	Superior Room king bed	USD	94.18	2020-05-31	0	0	2020-05-30 11:48:51.062107	2020-05-30 11:48:51.062107	\N	\N	\N
169941	274	1	Standard Twin Room - Non-Smoking	USD	324.66	2020-05-31	0	0	2020-05-30 11:48:51.066707	2020-05-30 11:48:51.066707	\N	\N	\N
169942	306	1	Deluxe King City View	USD	102.3	2020-05-31	300.65	30	2020-05-30 11:48:51.070463	2020-05-30 11:48:51.070463	\N	\N	\N
169943	290	1	Standard	USD	92.31	2020-05-31	0	0	2020-05-30 11:48:51.074272	2020-05-30 11:48:51.074272	\N	\N	\N
169946	258	1	Standard Double Room	USD	23.97	2020-05-31	0	0	2020-05-30 11:48:51.086644	2020-05-30 11:48:51.086644	\N	\N	\N
169947	216	1	2 Double Accessible Roll in Shower	USD	109	2020-05-31	0	0	2020-05-30 11:48:51.090452	2020-05-30 11:48:51.090452	\N	\N	\N
169949	204	1	King Bed	USD	216.51	2020-05-31	0	0	2020-05-30 11:48:51.098375	2020-05-30 11:48:51.098375	\N	\N	\N
169950	295	1	Classic Double or Twin	USD	223.64	2020-05-31	455	0	2020-05-30 11:48:51.102274	2020-05-30 11:48:51.102274	\N	\N	\N
169952	307	1	1 King Bed	USD	445.25	2020-05-31	0	0	2020-05-30 11:48:51.113861	2020-05-30 11:48:51.113861	\N	\N	\N
169953	302	1	2 Queen Beds 	USD	74	2020-05-31	0	0	2020-05-30 11:48:51.117865	2020-05-30 11:48:51.117865	\N	\N	\N
169958	263	1	Queen Hilton Guestroom	USD	129.86	2020-05-31	0	0	2020-05-30 11:48:51.167041	2020-05-30 11:48:51.167041	\N	\N	\N
256972	23	1	1 King Bed Evolution Room 	USD	119	2020-06-01	0	0	2020-05-31 11:48:50.348068	2020-05-31 11:48:50.348068	\N	\N	\N
256973	45	1	Classic Double or Twin	USD	109.97	2020-06-01	0	0	2020-05-31 11:48:50.382911	2020-05-31 11:48:50.382911	\N	\N	\N
256974	115	1	Double Room	USD	63.27	2020-06-01	0	0	2020-05-31 11:48:50.386986	2020-05-31 11:48:50.386986	\N	\N	\N
256975	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.7	2020-06-01	0	0	2020-05-31 11:48:50.390896	2020-05-31 11:48:50.390896	\N	\N	\N
256976	158	1	Superior Twin Non-Smoking	USD	86.88	2020-06-01	0	0	2020-05-31 11:48:50.398862	2020-05-31 11:48:50.398862	\N	\N	\N
256977	153	1	Standard Twin Room	USD	176.89	2020-06-01	0	0	2020-05-31 11:48:50.402752	2020-05-31 11:48:50.402752	\N	\N	\N
256978	131	1	Superior Double Room	USD	50.54	2020-06-01	0	0	2020-05-31 11:48:50.406523	2020-05-31 11:48:50.406523	\N	\N	\N
256979	113	1	2 Queen Beds 	USD	169	2020-06-01	0	0	2020-05-31 11:48:50.41047	2020-05-31 11:48:50.41047	\N	\N	\N
256980	53	1	Superior Twin	USD	117.82	2020-06-01	0	0	2020-05-31 11:48:50.414153	2020-05-31 11:48:50.414153	\N	\N	\N
256981	143	1	Standard Double Room	USD	176.07	2020-06-01	0	0	2020-05-31 11:48:50.41815	2020-05-31 11:48:50.41815	\N	\N	\N
256982	108	1	Standard Double Room	USD	83.08	2020-06-01	0	0	2020-05-31 11:48:50.422024	2020-05-31 11:48:50.422024	\N	\N	\N
256983	13	1	Premium Twin Room with Two Double Beds	USD	123.2	2020-06-01	0	0	2020-05-31 11:48:50.425948	2020-05-31 11:48:50.425948	\N	\N	\N
256984	64	1	Basic Double or Twin Room	USD	48.43	2020-06-01	0	0	2020-05-31 11:48:50.429788	2020-05-31 11:48:50.429788	\N	\N	\N
256985	125	1	Standard Double or Twin Room	USD	30	2020-06-01	0	0	2020-05-31 11:48:50.433574	2020-05-31 11:48:50.433574	\N	\N	\N
256986	199	1	Standard Room with 1 double bed	USD	32.25	2020-06-01	0	0	2020-05-31 11:48:50.437363	2020-05-31 11:48:50.437363	\N	\N	\N
256987	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-01	0	0	2020-05-31 11:48:50.441066	2020-05-31 11:48:50.441066	\N	\N	\N
256988	194	1	Standard Small Double Room - Non-Smoking	USD	163.29	2020-06-01	0	0	2020-05-31 11:48:50.444852	2020-05-31 11:48:50.444852	\N	\N	\N
256989	95	1	 Twin Guestroom	USD	156.86	2020-06-01	0	0	2020-05-31 11:48:50.464404	2020-05-31 11:48:50.464404	\N	\N	\N
256990	157	1	Cosy Small Room	USD	144.49	2020-06-01	0	0	2020-05-31 11:48:50.469107	2020-05-31 11:48:50.469107	\N	\N	\N
256991	26	1	Double	USD	68.05	2020-06-01	0	0	2020-05-31 11:48:50.47341	2020-05-31 11:48:50.47341	\N	\N	\N
256992	61	1	Modern Double Room	USD	170.46	2020-06-01	0	0	2020-05-31 11:48:50.477338	2020-05-31 11:48:50.477338	\N	\N	\N
256993	181	1	Superior Double Room	USD	61.94	2020-06-01	0	0	2020-05-31 11:48:50.481296	2020-05-31 11:48:50.481296	\N	\N	\N
256994	49	1	Superior Twin Room	USD	113.05	2020-06-01	0	0	2020-05-31 11:48:50.488896	2020-05-31 11:48:50.488896	\N	\N	\N
256995	159	1	Standard Room with 1 double bed and sofa	USD	81.93	2020-06-01	0	0	2020-05-31 11:48:50.492592	2020-05-31 11:48:50.492592	\N	\N	\N
256996	42	1	Two-Bedroom Apartment	USD	148.75	2020-06-01	0	0	2020-05-31 11:48:50.504327	2020-05-31 11:48:50.504327	\N	\N	\N
256997	141	1	Double or Twin Room	USD	92.23	2020-06-01	0	0	2020-05-31 11:48:50.508297	2020-05-31 11:48:50.508297	\N	\N	\N
256998	90	1	Standard Room	USD	78.69	2020-06-01	314.77	0	2020-05-31 11:48:50.512222	2020-05-31 11:48:50.512222	\N	\N	\N
256999	106	1	Double Room with Two Single Beds	USD	42.19	2020-06-01	0	0	2020-05-31 11:48:50.516053	2020-05-31 11:48:50.516053	\N	\N	\N
257000	27	1	Standard Twin Room - Smoking	USD	165.57	2020-06-01	538.75	0	2020-05-31 11:48:50.519774	2020-05-31 11:48:50.519774	\N	\N	\N
257001	18	1	Superior Room	USD	118.95	2020-06-01	530.39	0	2020-05-31 11:48:50.523493	2020-05-31 11:48:50.523493	\N	\N	\N
257002	139	1	Small Double	USD	100.08	2020-06-01	500.41	20	2020-05-31 11:48:50.527134	2020-05-31 11:48:50.527134	\N	\N	\N
257003	14	1	Classic Double Bed	USD	115.5	2020-06-01	0	0	2020-05-31 11:48:50.530973	2020-05-31 11:48:50.530973	\N	\N	\N
257004	79	1	Standard Room	USD	57.04	2020-06-01	0	0	2020-05-31 11:48:50.534936	2020-05-31 11:48:50.534936	\N	\N	\N
257005	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.21	2020-06-01	0	0	2020-05-31 11:48:50.538639	2020-05-31 11:48:50.538639	\N	\N	\N
257006	160	1	2 Double Beds	USD	119	2020-06-01	0	0	2020-05-31 11:48:50.567245	2020-05-31 11:48:50.567245	\N	\N	\N
257007	54	1	Double Room	USD	139.38	2020-06-01	709.91	0	2020-05-31 11:48:50.571098	2020-05-31 11:48:50.571098	\N	\N	\N
257008	47	1	Standard room half board	USD	188.43	2020-06-01	500	0	2020-05-31 11:48:50.57696	2020-05-31 11:48:50.57696	\N	\N	\N
257009	35	1	Twin - Non-Smoking	USD	97.4	2020-06-01	0	0	2020-05-31 11:48:50.580793	2020-05-31 11:48:50.580793	\N	\N	\N
257010	38	1	Deluxe Double or Twin Room with Sea View	USD	145.2	2020-06-01	0	0	2020-05-31 11:48:50.588149	2020-05-31 11:48:50.588149	\N	\N	\N
257011	192	1	Comfort Room	USD	66.37	2020-06-01	221.95	0	2020-05-31 11:48:50.591905	2020-05-31 11:48:50.591905	\N	\N	\N
257012	165	1	Basic Room	USD	89.79	2020-06-01	0	0	2020-05-31 11:48:50.595682	2020-05-31 11:48:50.595682	\N	\N	\N
257013	215	1	Deluxe Room	USD	36.09	2020-06-01	203.25	25	2020-05-31 11:48:51.100556	2020-05-31 11:48:51.100556	\N	\N	\N
257014	261	1	Superior Twin or Double Room	USD	62.2	2020-06-01	0	0	2020-05-31 11:48:51.104585	2020-05-31 11:48:51.104585	\N	\N	\N
257015	243	1	Executive Double Room	USD	59.17	2020-06-01	305.18	0	2020-05-31 11:48:51.108378	2020-05-31 11:48:51.108378	\N	\N	\N
257016	256	1	Standard Double Room	USD	93.34	2020-06-01	0	0	2020-05-31 11:48:51.112228	2020-05-31 11:48:51.112228	\N	\N	\N
257017	285	1	Superior Room king bed	USD	99.01	2020-06-01	0	0	2020-05-31 11:48:51.115936	2020-05-31 11:48:51.115936	\N	\N	\N
257018	248	1	Double Room	USD	131.15	2020-06-01	203.09	0	2020-05-31 11:48:51.119709	2020-05-31 11:48:51.119709	\N	\N	\N
257019	274	1	Small Double Room Non-Smoking	USD	223.85	2020-06-01	0	0	2020-05-31 11:48:51.123585	2020-05-31 11:48:51.123585	\N	\N	\N
257020	306	1	Deluxe King City View	USD	112.97	2020-06-01	300.65	30	2020-05-31 11:48:51.127529	2020-05-31 11:48:51.127529	\N	\N	\N
257021	290	1	Standard	USD	92.31	2020-06-01	0	0	2020-05-31 11:48:51.131323	2020-05-31 11:48:51.131323	\N	\N	\N
257024	258	1	Standard Double Room	USD	23.97	2020-06-01	0	0	2020-05-31 11:48:51.144386	2020-05-31 11:48:51.144386	\N	\N	\N
257025	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-01	0	0	2020-05-31 11:48:51.14843	2020-05-31 11:48:51.14843	\N	\N	\N
257027	204	1	King Bed	USD	216.51	2020-06-01	0	0	2020-05-31 11:48:51.156254	2020-05-31 11:48:51.156254	\N	\N	\N
257028	295	1	Classic Double or Twin	USD	223.64	2020-06-01	455	0	2020-05-31 11:48:51.160148	2020-05-31 11:48:51.160148	\N	\N	\N
257031	307	1	1 King Bed	USD	500.9	2020-06-01	0	0	2020-05-31 11:48:51.171996	2020-05-31 11:48:51.171996	\N	\N	\N
257032	302	1	2 Queen Beds 	USD	74	2020-06-01	0	0	2020-05-31 11:48:51.175863	2020-05-31 11:48:51.175863	\N	\N	\N
257033	279	1	Garden Room	USD	117.27	2020-06-01	291.54	0	2020-05-31 11:48:51.179683	2020-05-31 11:48:51.179683	\N	\N	\N
257039	249	1	Standard 1 Double 1 Single Bed	USD	95.84	2020-06-01	0	0	2020-05-31 11:48:51.202985	2020-05-31 11:48:51.202985	\N	\N	\N
257040	206	1	Standard	USD	70.82	2020-06-01	0	0	2020-05-31 11:48:51.206732	2020-05-31 11:48:51.206732	\N	\N	\N
257041	263	1	Queen Hilton Guestroom	USD	129.86	2020-06-01	0	0	2020-05-31 11:48:51.210587	2020-05-31 11:48:51.210587	\N	\N	\N
352560	23	1	1 King Bed Evolution Room 	USD	119	2020-06-02	0	0	2020-06-01 11:48:50.717672	2020-06-01 11:48:50.717672	\N	\N	\N
352561	45	1	Classic Double or Twin	USD	109.97	2020-06-02	0	0	2020-06-01 11:48:50.744515	2020-06-01 11:48:50.744515	\N	\N	\N
352562	115	1	Double Room	USD	63.27	2020-06-02	0	0	2020-06-01 11:48:50.748939	2020-06-01 11:48:50.748939	\N	\N	\N
352563	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.7	2020-06-02	0	0	2020-06-01 11:48:50.75322	2020-06-01 11:48:50.75322	\N	\N	\N
352564	158	1	Superior Twin Non-Smoking	USD	86.88	2020-06-02	0	0	2020-06-01 11:48:50.757483	2020-06-01 11:48:50.757483	\N	\N	\N
352565	153	1	Standard Twin Room	USD	187.61	2020-06-02	0	0	2020-06-01 11:48:50.765496	2020-06-01 11:48:50.765496	\N	\N	\N
352566	131	1	Superior Double Room	USD	50.54	2020-06-02	0	0	2020-06-01 11:48:50.769637	2020-06-01 11:48:50.769637	\N	\N	\N
352567	113	1	2 Queen Beds 	USD	169	2020-06-02	0	0	2020-06-01 11:48:50.773494	2020-06-01 11:48:50.773494	\N	\N	\N
352568	53	1	Superior Twin	USD	123.2	2020-06-02	0	0	2020-06-01 11:48:50.777173	2020-06-01 11:48:50.777173	\N	\N	\N
352569	143	1	Standard Double Room	USD	211.67	2020-06-02	0	0	2020-06-01 11:48:50.781684	2020-06-01 11:48:50.781684	\N	\N	\N
352570	108	1	Standard Double Room	USD	97.08	2020-06-02	0	0	2020-06-01 11:48:50.785502	2020-06-01 11:48:50.785502	\N	\N	\N
352571	13	1	Premium Twin Room with Two Double Beds	USD	128.58	2020-06-02	0	0	2020-06-01 11:48:50.789405	2020-06-01 11:48:50.789405	\N	\N	\N
352572	8	1	Double Room	USD	186.73	2020-06-02	0	0	2020-06-01 11:48:50.793327	2020-06-01 11:48:50.793327	\N	\N	\N
352573	64	1	Basic Double or Twin Room	USD	58.52	2020-06-02	0	0	2020-06-01 11:48:50.797204	2020-06-01 11:48:50.797204	\N	\N	\N
352574	125	1	Standard Double or Twin Room	USD	27	2020-06-02	0	0	2020-06-01 11:48:50.800936	2020-06-01 11:48:50.800936	\N	\N	\N
352575	199	1	Standard Room with 1 double bed	USD	32.25	2020-06-02	0	0	2020-06-01 11:48:50.804774	2020-06-01 11:48:50.804774	\N	\N	\N
352576	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-02	0	0	2020-06-01 11:48:50.808814	2020-06-01 11:48:50.808814	\N	\N	\N
352577	194	1	Standard Small Double Room - Non-Smoking	USD	163.29	2020-06-02	0	0	2020-06-01 11:48:50.812793	2020-06-01 11:48:50.812793	\N	\N	\N
352578	95	1	 Twin Guestroom	USD	156.86	2020-06-02	0	0	2020-06-01 11:48:50.81687	2020-06-01 11:48:50.81687	\N	\N	\N
352579	157	1	Cosy Small Room	USD	153.01	2020-06-02	0	0	2020-06-01 11:48:50.820761	2020-06-01 11:48:50.820761	\N	\N	\N
352580	26	1	Double	USD	68.05	2020-06-02	0	0	2020-06-01 11:48:50.824666	2020-06-01 11:48:50.824666	\N	\N	\N
352581	61	1	Modern Double Room	USD	210.58	2020-06-02	0	0	2020-06-01 11:48:50.828659	2020-06-01 11:48:50.828659	\N	\N	\N
352582	181	1	Superior Double Room	USD	61.94	2020-06-02	0	0	2020-06-01 11:48:50.868029	2020-06-01 11:48:50.868029	\N	\N	\N
352583	49	1	Superior Twin Room	USD	123.42	2020-06-02	0	0	2020-06-01 11:48:50.872387	2020-06-01 11:48:50.872387	\N	\N	\N
352584	159	1	Standard Room with 1 double bed and sofa	USD	81.93	2020-06-02	0	0	2020-06-01 11:48:50.877498	2020-06-01 11:48:50.877498	\N	\N	\N
352585	42	1	Two-Bedroom Apartment	USD	148.75	2020-06-02	0	0	2020-06-01 11:48:50.881684	2020-06-01 11:48:50.881684	\N	\N	\N
352586	141	1	Double or Twin Room	USD	92.23	2020-06-02	0	0	2020-06-01 11:48:50.885737	2020-06-01 11:48:50.885737	\N	\N	\N
352587	90	1	Standard Room	USD	78.69	2020-06-02	443.9	0	2020-06-01 11:48:50.889605	2020-06-01 11:48:50.889605	\N	\N	\N
352588	106	1	Double Room with Two Single Beds	USD	42.19	2020-06-02	0	0	2020-06-01 11:48:50.893477	2020-06-01 11:48:50.893477	\N	\N	\N
352589	27	1	Standard Twin Room - Smoking	USD	165.57	2020-06-02	538.75	0	2020-06-01 11:48:50.897399	2020-06-01 11:48:50.897399	\N	\N	\N
352590	77	1	Double Room - North Side	USD	144.39	2020-06-02	0	0	2020-06-01 11:48:50.901285	2020-06-01 11:48:50.901285	\N	\N	\N
352591	18	1	Superior Room	USD	118.95	2020-06-02	530.39	0	2020-06-01 11:48:50.905556	2020-06-01 11:48:50.905556	\N	\N	\N
352592	14	1	Classic Double Bed	USD	140.73	2020-06-02	0	0	2020-06-01 11:48:50.909556	2020-06-01 11:48:50.909556	\N	\N	\N
352593	79	1	Standard Room	USD	57.04	2020-06-02	0	0	2020-06-01 11:48:50.914268	2020-06-01 11:48:50.914268	\N	\N	\N
352594	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.21	2020-06-02	0	0	2020-06-01 11:48:50.918211	2020-06-01 11:48:50.918211	\N	\N	\N
352595	160	1	2 Double Beds	USD	119	2020-06-02	0	0	2020-06-01 11:48:50.922204	2020-06-01 11:48:50.922204	\N	\N	\N
352596	54	1	Double Room	USD	139.38	2020-06-02	709.91	0	2020-06-01 11:48:50.926242	2020-06-01 11:48:50.926242	\N	\N	\N
352597	47	1	Standard room half board	USD	188.43	2020-06-02	500	0	2020-06-01 11:48:50.931055	2020-06-01 11:48:50.931055	\N	\N	\N
352598	35	1	Twin - Non-Smoking	USD	97.4	2020-06-02	0	0	2020-06-01 11:48:50.967931	2020-06-01 11:48:50.967931	\N	\N	\N
352599	38	1	Deluxe Double or Twin Room with Sea View	USD	145.2	2020-06-02	0	0	2020-06-01 11:48:50.976274	2020-06-01 11:48:50.976274	\N	\N	\N
352600	192	1	Comfort Room	USD	87.12	2020-06-02	221.95	0	2020-06-01 11:48:50.980299	2020-06-01 11:48:50.980299	\N	\N	\N
352601	165	1	Basic Room	USD	89.79	2020-06-02	0	0	2020-06-01 11:48:50.984278	2020-06-01 11:48:50.984278	\N	\N	\N
352602	215	1	Deluxe - 3 persons	USD	38.7	2020-06-02	154.8	25	2020-06-01 11:48:51.344427	2020-06-01 11:48:51.344427	\N	\N	\N
352603	261	1	Superior Twin or Double Room	USD	62.2	2020-06-02	0	0	2020-06-01 11:48:51.348403	2020-06-01 11:48:51.348403	\N	\N	\N
352604	243	1	Executive Double Room	USD	59.17	2020-06-02	305.18	0	2020-06-01 11:48:51.352496	2020-06-01 11:48:51.352496	\N	\N	\N
352605	256	1	Standard Double Room	USD	103.72	2020-06-02	0	0	2020-06-01 11:48:51.356352	2020-06-01 11:48:51.356352	\N	\N	\N
352606	285	1	Superior Room king bed	USD	102.03	2020-06-02	0	0	2020-06-01 11:48:51.360351	2020-06-01 11:48:51.360351	\N	\N	\N
352607	248	1	Double Room	USD	131.15	2020-06-02	203.09	0	2020-06-01 11:48:51.364266	2020-06-01 11:48:51.364266	\N	\N	\N
352608	274	1	Small Double Room Non-Smoking	USD	223.85	2020-06-02	0	0	2020-06-01 11:48:51.368988	2020-06-01 11:48:51.368988	\N	\N	\N
352609	306	1	Deluxe King City View	USD	112.97	2020-06-02	300.65	30	2020-06-01 11:48:51.372921	2020-06-01 11:48:51.372921	\N	\N	\N
352610	290	1	Standard	USD	92.31	2020-06-02	0	0	2020-06-01 11:48:51.376932	2020-06-01 11:48:51.376932	\N	\N	\N
352613	258	1	Standard Double Room	USD	23.97	2020-06-02	0	0	2020-06-01 11:48:51.389981	2020-06-01 11:48:51.389981	\N	\N	\N
352614	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-02	0	0	2020-06-01 11:48:51.394033	2020-06-01 11:48:51.394033	\N	\N	\N
352616	275	1	Double or Twin Room	USD	83.23	2020-06-02	0	0	2020-06-01 11:48:51.401826	2020-06-01 11:48:51.401826	\N	\N	\N
352617	204	1	King Bed	USD	216.51	2020-06-02	0	0	2020-06-01 11:48:51.405768	2020-06-01 11:48:51.405768	\N	\N	\N
352618	295	1	Classic Double or Twin	USD	223.64	2020-06-02	455	0	2020-06-01 11:48:51.409715	2020-06-01 11:48:51.409715	\N	\N	\N
352621	307	1	1 King Bed	USD	500.9	2020-06-02	0	0	2020-06-01 11:48:51.421416	2020-06-01 11:48:51.421416	\N	\N	\N
352622	302	1	2 Queen Beds 	USD	74	2020-06-02	0	0	2020-06-01 11:48:51.425351	2020-06-01 11:48:51.425351	\N	\N	\N
352628	249	1	Standard 1 Double 1 Single Bed	USD	109.97	2020-06-02	0	0	2020-06-01 11:48:51.481144	2020-06-01 11:48:51.481144	\N	\N	\N
352629	206	1	Standard	USD	70.82	2020-06-02	0	0	2020-06-01 11:48:51.485001	2020-06-01 11:48:51.485001	\N	\N	\N
352630	263	1	Queen Hilton Guestroom	USD	148.42	2020-06-02	0	0	2020-06-01 11:48:51.488807	2020-06-01 11:48:51.488807	\N	\N	\N
448688	23	1	1 King Bed Evolution Room 	USD	119	2020-06-03	0	0	2020-06-02 11:48:50.600462	2020-06-02 11:48:50.600462	\N	\N	\N
448689	45	1	Classic Double or Twin	USD	110.26	2020-06-03	0	0	2020-06-02 11:48:50.617522	2020-06-02 11:48:50.617522	\N	\N	\N
448690	115	1	Double Room	USD	66.55	2020-06-03	0	0	2020-06-02 11:48:50.62171	2020-06-02 11:48:50.62171	\N	\N	\N
448691	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.83	2020-06-03	0	0	2020-06-02 11:48:50.625806	2020-06-02 11:48:50.625806	\N	\N	\N
448692	158	1	Superior Twin Non-Smoking	USD	86.99	2020-06-03	0	0	2020-06-02 11:48:50.629863	2020-06-02 11:48:50.629863	\N	\N	\N
448693	153	1	Standard Twin Room	USD	190.38	2020-06-03	0	0	2020-06-02 11:48:50.633793	2020-06-02 11:48:50.633793	\N	\N	\N
448694	131	1	Superior Double Room	USD	51.03	2020-06-03	0	0	2020-06-02 11:48:50.637725	2020-06-02 11:48:50.637725	\N	\N	\N
448695	113	1	2 Queen Beds 	USD	169	2020-06-03	0	0	2020-06-02 11:48:50.641923	2020-06-02 11:48:50.641923	\N	\N	\N
448696	53	1	Superior Twin	USD	125.05	2020-06-03	0	0	2020-06-02 11:48:50.645794	2020-06-02 11:48:50.645794	\N	\N	\N
448697	143	1	Standard Double Room	USD	213.94	2020-06-03	0	0	2020-06-02 11:48:50.649593	2020-06-02 11:48:50.649593	\N	\N	\N
448698	108	1	Standard Double Room	USD	83.3	2020-06-03	0	0	2020-06-02 11:48:50.664493	2020-06-02 11:48:50.664493	\N	\N	\N
448699	13	1	Premium Twin Room with Two Double Beds	USD	125.05	2020-06-03	0	0	2020-06-02 11:48:50.668663	2020-06-02 11:48:50.668663	\N	\N	\N
448700	8	1	Twin Room	USD	188.73	2020-06-03	0	0	2020-06-02 11:48:50.672736	2020-06-02 11:48:50.672736	\N	\N	\N
448701	64	1	Basic Double or Twin Room	USD	58.67	2020-06-03	0	0	2020-06-02 11:48:50.676681	2020-06-02 11:48:50.676681	\N	\N	\N
448702	125	1	Standard Double or Twin Room	USD	27	2020-06-03	0	0	2020-06-02 11:48:50.680822	2020-06-02 11:48:50.680822	\N	\N	\N
448703	199	1	Standard Room with 1 double bed	USD	32.25	2020-06-03	0	0	2020-06-02 11:48:50.684828	2020-06-02 11:48:50.684828	\N	\N	\N
448704	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-03	0	0	2020-06-02 11:48:50.688687	2020-06-02 11:48:50.688687	\N	\N	\N
448705	194	1	Standard Small Double Room - Non-Smoking	USD	163.62	2020-06-03	0	0	2020-06-02 11:48:50.692598	2020-06-02 11:48:50.692598	\N	\N	\N
448706	95	1	 Twin Guestroom	USD	157.28	2020-06-03	0	0	2020-06-02 11:48:50.696609	2020-06-02 11:48:50.696609	\N	\N	\N
448707	157	1	Cosy Small Room	USD	153.76	2020-06-03	0	0	2020-06-02 11:48:50.702556	2020-06-02 11:48:50.702556	\N	\N	\N
448708	26	1	Double	USD	68.23	2020-06-03	0	0	2020-06-02 11:48:50.706437	2020-06-02 11:48:50.706437	\N	\N	\N
448709	61	1	Modern Double Room	USD	210.64	2020-06-03	0	0	2020-06-02 11:48:50.710223	2020-06-02 11:48:50.710223	\N	\N	\N
448710	181	1	Superior Double Room	USD	61.94	2020-06-03	0	0	2020-06-02 11:48:50.714305	2020-06-02 11:48:50.714305	\N	\N	\N
448711	49	1	Superior Twin Room	USD	123.75	2020-06-03	0	0	2020-06-02 11:48:50.717937	2020-06-02 11:48:50.717937	\N	\N	\N
448712	159	1	Standard Room with 1 double bed and sofa	USD	82.15	2020-06-03	0	0	2020-06-02 11:48:50.722771	2020-06-02 11:48:50.722771	\N	\N	\N
448713	42	1	Two-Bedroom Apartment	USD	148.75	2020-06-03	0	0	2020-06-02 11:48:50.726611	2020-06-02 11:48:50.726611	\N	\N	\N
448714	141	1	Double or Twin Room	USD	92.77	2020-06-03	0	0	2020-06-02 11:48:50.764394	2020-06-02 11:48:50.764394	\N	\N	\N
448715	90	1	Standard Room	USD	78.9	2020-06-03	445.09	0	2020-06-02 11:48:50.769487	2020-06-02 11:48:50.769487	\N	\N	\N
448716	106	1	Double Room with Two Single Beds	USD	42.38	2020-06-03	0	0	2020-06-02 11:48:50.773589	2020-06-02 11:48:50.773589	\N	\N	\N
448717	27	1	Standard Twin Room - Smoking	USD	165.91	2020-06-03	539.85	0	2020-06-02 11:48:50.777845	2020-06-02 11:48:50.777845	\N	\N	\N
448718	77	1	Double Room - North Side	USD	144.44	2020-06-03	0	0	2020-06-02 11:48:50.784954	2020-06-02 11:48:50.784954	\N	\N	\N
448719	18	1	Superior Room	USD	118.95	2020-06-03	532.09	0	2020-06-02 11:48:50.788865	2020-06-02 11:48:50.788865	\N	\N	\N
448720	14	1	Classic Double Bed	USD	141.1	2020-06-03	0	0	2020-06-02 11:48:50.792828	2020-06-02 11:48:50.792828	\N	\N	\N
448721	79	1	Standard Room	USD	57.19	2020-06-03	0	0	2020-06-02 11:48:50.796563	2020-06-02 11:48:50.796563	\N	\N	\N
448722	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.36	2020-06-03	0	0	2020-06-02 11:48:50.800303	2020-06-02 11:48:50.800303	\N	\N	\N
448723	160	1	2 Double Beds	USD	119	2020-06-03	0	0	2020-06-02 11:48:50.804112	2020-06-02 11:48:50.804112	\N	\N	\N
448724	54	1	Double Room	USD	139.42	2020-06-03	710.13	0	2020-06-02 11:48:50.807901	2020-06-02 11:48:50.807901	\N	\N	\N
448725	47	1	Standard room half board	USD	188.43	2020-06-03	500	0	2020-06-02 11:48:50.813541	2020-06-02 11:48:50.813541	\N	\N	\N
448726	35	1	Twin - Non-Smoking	USD	97.6	2020-06-03	0	0	2020-06-02 11:48:50.820529	2020-06-02 11:48:50.820529	\N	\N	\N
448727	38	1	Deluxe Double or Twin Room with Sea View	USD	145.59	2020-06-03	0	0	2020-06-02 11:48:50.826032	2020-06-02 11:48:50.826032	\N	\N	\N
448728	192	1	Comfort Room	USD	87.35	2020-06-03	222.54	0	2020-06-02 11:48:50.829802	2020-06-02 11:48:50.829802	\N	\N	\N
448729	165	1	Basic Room	USD	90.03	2020-06-03	0	0	2020-06-02 11:48:50.833571	2020-06-02 11:48:50.833571	\N	\N	\N
448730	215	1	Deluxe - 3 persons	USD	36.1	2020-06-03	144.39	25	2020-06-02 11:48:51.178822	2020-06-02 11:48:51.178822	\N	\N	\N
448731	261	1	Superior Twin or Double Room	USD	62.2	2020-06-03	0	0	2020-06-02 11:48:51.182803	2020-06-02 11:48:51.182803	\N	\N	\N
448732	243	1	Executive Double Room	USD	73.08	2020-06-03	306	0	2020-06-02 11:48:51.186879	2020-06-02 11:48:51.186879	\N	\N	\N
448733	256	1	Standard Double Room	USD	103.99	2020-06-03	0	0	2020-06-02 11:48:51.190828	2020-06-02 11:48:51.190828	\N	\N	\N
448734	285	1	Superior Room king bed	USD	104.2	2020-06-03	0	0	2020-06-02 11:48:51.195701	2020-06-02 11:48:51.195701	\N	\N	\N
448735	274	1	Double Room - Non-Smoking	USD	261.18	2020-06-03	0	0	2020-06-02 11:48:51.199507	2020-06-02 11:48:51.199507	\N	\N	\N
448736	306	1	Deluxe King City View	USD	113.1	2020-06-03	301	30	2020-06-02 11:48:51.207853	2020-06-02 11:48:51.207853	\N	\N	\N
448737	290	1	Standard	USD	92.56	2020-06-03	0	0	2020-06-02 11:48:51.211675	2020-06-02 11:48:51.211675	\N	\N	\N
448740	258	1	Standard Double Room	USD	24.08	2020-06-03	0	0	2020-06-02 11:48:51.2257	2020-06-02 11:48:51.2257	\N	\N	\N
448741	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-03	0	0	2020-06-02 11:48:51.22967	2020-06-02 11:48:51.22967	\N	\N	\N
448743	275	1	Double or Twin Room	USD	83.45	2020-06-03	0	0	2020-06-02 11:48:51.237379	2020-06-02 11:48:51.237379	\N	\N	\N
448744	204	1	King Bed	USD	219.89	2020-06-03	0	0	2020-06-02 11:48:51.241141	2020-06-02 11:48:51.241141	\N	\N	\N
448745	295	1	Classic Double or Twin	USD	234.03	2020-06-03	456.21	0	2020-06-02 11:48:51.244928	2020-06-02 11:48:51.244928	\N	\N	\N
448748	307	1	1 King Bed	USD	501.93	2020-06-03	0	0	2020-06-02 11:48:51.274206	2020-06-02 11:48:51.274206	\N	\N	\N
448749	302	1	2 Queen Beds 	USD	74	2020-06-03	0	0	2020-06-02 11:48:51.278347	2020-06-02 11:48:51.278347	\N	\N	\N
448755	206	1	Standard	USD	71.66	2020-06-03	0	0	2020-06-02 11:48:51.302598	2020-06-02 11:48:51.302598	\N	\N	\N
448756	263	1	Queen Hilton Guestroom	USD	148.72	2020-06-03	0	0	2020-06-02 11:48:51.306334	2020-06-02 11:48:51.306334	\N	\N	\N
507087	23	1	1 King Bed Evolution Room 	USD	119	2020-06-04	0	0	2020-06-03 11:48:49.979589	2020-06-03 11:48:49.979589	\N	\N	\N
507088	45	1	Classic Double or Twin	USD	110.73	2020-06-04	0	0	2020-06-03 11:48:50.04174	2020-06-03 11:48:50.04174	\N	\N	\N
507089	115	1	Double Room	USD	66.83	2020-06-04	0	0	2020-06-03 11:48:50.046374	2020-06-03 11:48:50.046374	\N	\N	\N
507090	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.15	2020-06-04	0	0	2020-06-03 11:48:50.050461	2020-06-03 11:48:50.050461	\N	\N	\N
507091	158	1	Superior Twin Non-Smoking	USD	87.31	2020-06-04	0	0	2020-06-03 11:48:50.054692	2020-06-03 11:48:50.054692	\N	\N	\N
507092	153	1	Standard Twin Room	USD	179.28	2020-06-04	0	0	2020-06-03 11:48:50.058748	2020-06-03 11:48:50.058748	\N	\N	\N
507093	131	1	Superior Double Room	USD	51.78	2020-06-04	0	0	2020-06-03 11:48:50.062864	2020-06-03 11:48:50.062864	\N	\N	\N
507094	113	1	2 Queen Beds 	USD	169	2020-06-04	0	0	2020-06-03 11:48:50.06693	2020-06-03 11:48:50.06693	\N	\N	\N
507095	53	1	Superior Twin	USD	126.45	2020-06-04	0	0	2020-06-03 11:48:50.070876	2020-06-03 11:48:50.070876	\N	\N	\N
507096	143	1	Standard Double Room	USD	179.33	2020-06-04	0	0	2020-06-03 11:48:50.074988	2020-06-03 11:48:50.074988	\N	\N	\N
507097	108	1	Standard Double Room	USD	83.65	2020-06-04	0	0	2020-06-03 11:48:50.078982	2020-06-03 11:48:50.078982	\N	\N	\N
507098	13	1	Premium Twin Room with Two Double Beds	USD	126.45	2020-06-04	0	0	2020-06-03 11:48:50.083038	2020-06-03 11:48:50.083038	\N	\N	\N
507099	8	1	Double Room	USD	190.18	2020-06-04	0	0	2020-06-03 11:48:50.087002	2020-06-03 11:48:50.087002	\N	\N	\N
507100	64	1	Basic Double or Twin Room	USD	58.92	2020-06-04	0	0	2020-06-03 11:48:50.090893	2020-06-03 11:48:50.090893	\N	\N	\N
507101	125	1	Standard Double or Twin Room	USD	27	2020-06-04	0	0	2020-06-03 11:48:50.094876	2020-06-03 11:48:50.094876	\N	\N	\N
507102	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-04	0	0	2020-06-03 11:48:50.102822	2020-06-03 11:48:50.102822	\N	\N	\N
507103	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-04	0	0	2020-06-03 11:48:50.10702	2020-06-03 11:48:50.10702	\N	\N	\N
507104	194	1	Standard Small Double Room - Non-Smoking	USD	161.95	2020-06-04	0	0	2020-06-03 11:48:50.11124	2020-06-03 11:48:50.11124	\N	\N	\N
507105	95	1	 Twin Guestroom	USD	157.95	2020-06-04	0	0	2020-06-03 11:48:50.11768	2020-06-03 11:48:50.11768	\N	\N	\N
507106	157	1	Cosy Small Room	USD	145.84	2020-06-04	0	0	2020-06-03 11:48:50.122896	2020-06-03 11:48:50.122896	\N	\N	\N
507107	26	1	Double	USD	68.52	2020-06-04	0	0	2020-06-03 11:48:50.126853	2020-06-03 11:48:50.126853	\N	\N	\N
507108	61	1	Modern Double Room	USD	190.48	2020-06-04	0	0	2020-06-03 11:48:50.130887	2020-06-03 11:48:50.130887	\N	\N	\N
507109	181	1	Superior Double Room	USD	61.94	2020-06-04	0	0	2020-06-03 11:48:50.134943	2020-06-03 11:48:50.134943	\N	\N	\N
507110	49	1	Superior Twin Room	USD	113.83	2020-06-04	0	0	2020-06-03 11:48:50.164424	2020-06-03 11:48:50.164424	\N	\N	\N
507111	159	1	Standard Room with 1 double bed and sofa	USD	82.5	2020-06-04	0	0	2020-06-03 11:48:50.170413	2020-06-03 11:48:50.170413	\N	\N	\N
507112	42	1	Two-Bedroom Apartment	USD	175	2020-06-04	0	0	2020-06-03 11:48:50.17497	2020-06-03 11:48:50.17497	\N	\N	\N
507113	141	1	Double or Twin Room	USD	93.16	2020-06-04	0	0	2020-06-03 11:48:50.178947	2020-06-03 11:48:50.178947	\N	\N	\N
507114	90	1	Standard Room	USD	79.24	2020-06-04	446.98	0	2020-06-03 11:48:50.18299	2020-06-03 11:48:50.18299	\N	\N	\N
507115	106	1	Double Room with Two Single Beds	USD	41.95	2020-06-04	0	0	2020-06-03 11:48:50.186782	2020-06-03 11:48:50.186782	\N	\N	\N
507116	27	1	Standard Twin Room - Smoking	USD	164.22	2020-06-04	534.34	0	2020-06-03 11:48:50.191142	2020-06-03 11:48:50.191142	\N	\N	\N
507117	77	1	Double Room - North Side	USD	144.36	2020-06-04	0	0	2020-06-03 11:48:50.19516	2020-06-03 11:48:50.19516	\N	\N	\N
507118	18	1	Superior Room	USD	118.95	2020-06-04	542.48	0	2020-06-03 11:48:50.198987	2020-06-03 11:48:50.198987	\N	\N	\N
507119	139	1	Small Double	USD	117.03	2020-06-04	585.14	20	2020-06-03 11:48:50.202978	2020-06-03 11:48:50.202978	\N	\N	\N
507120	14	1	Classic Double Bed	USD	141.7	2020-06-04	0	0	2020-06-03 11:48:50.206883	2020-06-03 11:48:50.206883	\N	\N	\N
507121	79	1	Standard Room	USD	57.44	2020-06-04	0	0	2020-06-03 11:48:50.21092	2020-06-03 11:48:50.21092	\N	\N	\N
507122	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	73.6	2020-06-04	0	0	2020-06-03 11:48:50.214874	2020-06-03 11:48:50.214874	\N	\N	\N
507123	160	1	King Accesible with Bathtub	USD	109	2020-06-04	0	0	2020-06-03 11:48:50.219211	2020-06-03 11:48:50.219211	\N	\N	\N
507124	54	1	Double Room	USD	139.35	2020-06-04	709.76	0	2020-06-03 11:48:50.223126	2020-06-03 11:48:50.223126	\N	\N	\N
507125	47	1	Standard room half board	USD	188.43	2020-06-04	500	0	2020-06-03 11:48:50.229654	2020-06-03 11:48:50.229654	\N	\N	\N
507126	35	1	Twin - Non-Smoking	USD	96.6	2020-06-04	0	0	2020-06-03 11:48:50.235251	2020-06-03 11:48:50.235251	\N	\N	\N
507127	38	1	Deluxe Double or Twin Room with Sea View	USD	146.21	2020-06-04	0	0	2020-06-03 11:48:50.271675	2020-06-03 11:48:50.271675	\N	\N	\N
507128	192	1	Comfort Room	USD	77.28	2020-06-04	223.49	0	2020-06-03 11:48:50.27587	2020-06-03 11:48:50.27587	\N	\N	\N
507129	165	1	Basic Room	USD	90.41	2020-06-04	0	0	2020-06-03 11:48:50.279873	2020-06-03 11:48:50.279873	\N	\N	\N
507130	215	1	Deluxe - 3 persons	USD	36.1	2020-06-04	144.4	25	2020-06-03 11:48:50.694295	2020-06-03 11:48:50.694295	\N	\N	\N
507131	261	1	Superior Twin or Double Room	USD	62.2	2020-06-04	0	0	2020-06-03 11:48:50.698448	2020-06-03 11:48:50.698448	\N	\N	\N
507132	243	1	Executive Double Room	USD	73.39	2020-06-04	307.3	0	2020-06-03 11:48:50.702725	2020-06-03 11:48:50.702725	\N	\N	\N
507133	256	1	Standard Double Room	USD	104.44	2020-06-04	0	0	2020-06-03 11:48:50.706682	2020-06-03 11:48:50.706682	\N	\N	\N
507134	285	1	Superior Room king bed	USD	105.73	2020-06-04	0	0	2020-06-03 11:48:50.715834	2020-06-03 11:48:50.715834	\N	\N	\N
507135	274	1	Double Room - Non-Smoking	USD	258.51	2020-06-04	0	0	2020-06-03 11:48:50.722667	2020-06-03 11:48:50.722667	\N	\N	\N
507136	306	1	Deluxe King City View	USD	113.1	2020-06-04	301	30	2020-06-03 11:48:50.726674	2020-06-03 11:48:50.726674	\N	\N	\N
507137	290	1	Standard	USD	92.95	2020-06-04	0	0	2020-06-03 11:48:50.731086	2020-06-03 11:48:50.731086	\N	\N	\N
507140	258	1	Standard Double Room	USD	24.87	2020-06-04	0	0	2020-06-03 11:48:50.744519	2020-06-03 11:48:50.744519	\N	\N	\N
507141	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-04	0	0	2020-06-03 11:48:50.74858	2020-06-03 11:48:50.74858	\N	\N	\N
507143	275	1	Double or Twin Room	USD	83.81	2020-06-04	0	0	2020-06-03 11:48:50.75636	2020-06-03 11:48:50.75636	\N	\N	\N
507144	204	1	King Bed	USD	221.24	2020-06-04	0	0	2020-06-03 11:48:50.760419	2020-06-03 11:48:50.760419	\N	\N	\N
507145	295	1	Classic Double or Twin	USD	235.02	2020-06-04	458.15	0	2020-06-03 11:48:50.764561	2020-06-03 11:48:50.764561	\N	\N	\N
507148	307	1	1 King Bed	USD	496.8	2020-06-04	0	0	2020-06-03 11:48:50.776274	2020-06-03 11:48:50.776274	\N	\N	\N
507149	302	1	1 King Bed 	USD	74	2020-06-04	0	0	2020-06-03 11:48:50.780266	2020-06-03 11:48:50.780266	\N	\N	\N
507155	206	1	Standard	USD	72.11	2020-06-04	0	0	2020-06-03 11:48:50.806213	2020-06-03 11:48:50.806213	\N	\N	\N
507156	263	1	Queen Hilton Guestroom	USD	147.2	2020-06-04	0	0	2020-06-03 11:48:50.810207	2020-06-03 11:48:50.810207	\N	\N	\N
602413	23	1	1 King Bed Evolution Room 	USD	119	2020-06-05	0	0	2020-06-04 11:48:57.691983	2020-06-04 11:48:57.691983	\N	\N	\N
602414	45	1	Classic Double or Twin	USD	111.34	2020-06-05	0	0	2020-06-04 11:48:57.705532	2020-06-04 11:48:57.705532	\N	\N	\N
602415	115	1	Double Room	USD	64.06	2020-06-05	0	0	2020-06-04 11:48:57.709636	2020-06-04 11:48:57.709636	\N	\N	\N
602416	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.01	2020-06-05	0	0	2020-06-04 11:48:57.713436	2020-06-04 11:48:57.713436	\N	\N	\N
602417	158	1	Superior Twin Non-Smoking	USD	78.44	2020-06-05	0	0	2020-06-04 11:48:57.717228	2020-06-04 11:48:57.717228	\N	\N	\N
602418	153	1	Standard Twin Room	USD	119.96	2020-06-05	0	0	2020-06-04 11:48:57.721049	2020-06-04 11:48:57.721049	\N	\N	\N
602419	131	1	Superior Double Room	USD	52.59	2020-06-05	0	0	2020-06-04 11:48:57.724996	2020-06-04 11:48:57.724996	\N	\N	\N
602420	113	1	Guestroom 1 King	USD	169	2020-06-05	0	0	2020-06-04 11:48:57.731597	2020-06-04 11:48:57.731597	\N	\N	\N
602421	53	1	Superior Twin	USD	139.24	2020-06-05	0	0	2020-06-04 11:48:57.73529	2020-06-04 11:48:57.73529	\N	\N	\N
602422	143	1	Standard Double Room	USD	170.58	2020-06-05	0	0	2020-06-04 11:48:57.738999	2020-06-04 11:48:57.738999	\N	\N	\N
602423	108	1	Standard Double Room	USD	88.84	2020-06-05	0	0	2020-06-04 11:48:57.742773	2020-06-04 11:48:57.742773	\N	\N	\N
602424	13	1	Premium Twin Room with Two Double Beds	USD	133.65	2020-06-05	0	0	2020-06-04 11:48:57.746793	2020-06-04 11:48:57.746793	\N	\N	\N
602425	8	1	Double Room	USD	160.62	2020-06-05	0	0	2020-06-04 11:48:57.75073	2020-06-04 11:48:57.75073	\N	\N	\N
602426	64	1	Basic Double or Twin Room	USD	56.18	2020-06-05	0	0	2020-06-04 11:48:57.754912	2020-06-04 11:48:57.754912	\N	\N	\N
602427	125	1	Standard Double or Twin Room	USD	27	2020-06-05	0	0	2020-06-04 11:48:57.758858	2020-06-04 11:48:57.758858	\N	\N	\N
602428	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-05	0	0	2020-06-04 11:48:57.764491	2020-06-04 11:48:57.764491	\N	\N	\N
602429	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-05	0	0	2020-06-04 11:48:57.768231	2020-06-04 11:48:57.768231	\N	\N	\N
602430	194	1	Standard Small Double Room - Non-Smoking	USD	161.62	2020-06-05	0	0	2020-06-04 11:48:57.771998	2020-06-04 11:48:57.771998	\N	\N	\N
602431	95	1	 Twin Guestroom	USD	158.82	2020-06-05	0	0	2020-06-04 11:48:57.775723	2020-06-04 11:48:57.775723	\N	\N	\N
602432	157	1	Cosy Small Room	USD	101.92	2020-06-05	0	0	2020-06-04 11:48:57.779551	2020-06-04 11:48:57.779551	\N	\N	\N
602433	26	1	Double	USD	63.6	2020-06-05	0	0	2020-06-04 11:48:57.783528	2020-06-04 11:48:57.783528	\N	\N	\N
602434	61	1	Modern Double Room	USD	170.44	2020-06-05	0	0	2020-06-04 11:48:57.787264	2020-06-04 11:48:57.787264	\N	\N	\N
602435	181	1	Superior Double Room	USD	61.94	2020-06-05	0	0	2020-06-04 11:48:57.79089	2020-06-04 11:48:57.79089	\N	\N	\N
602436	49	1	Superior Twin Room	USD	103.96	2020-06-05	0	0	2020-06-04 11:48:57.794635	2020-06-04 11:48:57.794635	\N	\N	\N
602437	159	1	Standard Room with 1 double bed and sofa	USD	82.96	2020-06-05	0	0	2020-06-04 11:48:57.798598	2020-06-04 11:48:57.798598	\N	\N	\N
602438	42	1	Two-Bedroom Apartment	USD	148.75	2020-06-05	0	0	2020-06-04 11:48:57.8026	2020-06-04 11:48:57.8026	\N	\N	\N
602439	141	1	Double or Twin Room	USD	93.25	2020-06-05	0	0	2020-06-04 11:48:57.806366	2020-06-04 11:48:57.806366	\N	\N	\N
602440	90	1	Standard Room	USD	79.67	2020-06-05	449.44	0	2020-06-04 11:48:57.810228	2020-06-04 11:48:57.810228	\N	\N	\N
602441	106	1	Deluxe Double Room with Balcony	USD	48.48	2020-06-05	0	0	2020-06-04 11:48:57.814189	2020-06-04 11:48:57.814189	\N	\N	\N
602442	27	1	Standard Twin Room - Smoking	USD	163.88	2020-06-05	533.23	0	2020-06-04 11:48:57.818133	2020-06-04 11:48:57.818133	\N	\N	\N
602443	77	1	Double Room - North Side	USD	144.38	2020-06-05	0	0	2020-06-04 11:48:57.822184	2020-06-04 11:48:57.822184	\N	\N	\N
602444	18	1	Superior Room	USD	110.97	2020-06-05	511.56	0	2020-06-04 11:48:57.826064	2020-06-04 11:48:57.826064	\N	\N	\N
602445	139	1	Small Double	USD	117.67	2020-06-05	588.36	20	2020-06-04 11:48:57.872714	2020-06-04 11:48:57.872714	\N	\N	\N
602446	14	1	Classic Double Bed	USD	116.94	2020-06-05	0	0	2020-06-04 11:48:57.877057	2020-06-04 11:48:57.877057	\N	\N	\N
602447	79	1	Comfort Room	USD	68.26	2020-06-05	0	0	2020-06-04 11:48:57.881074	2020-06-04 11:48:57.881074	\N	\N	\N
602448	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	73.45	2020-06-05	0	0	2020-06-04 11:48:57.884928	2020-06-04 11:48:57.884928	\N	\N	\N
602449	160	1	1 King Bed	USD	109	2020-06-05	0	0	2020-06-04 11:48:57.888639	2020-06-04 11:48:57.888639	\N	\N	\N
602450	54	1	Double Room	USD	139.36	2020-06-05	709.84	0	2020-06-04 11:48:57.892571	2020-06-04 11:48:57.892571	\N	\N	\N
602451	47	1	Standard room half board	USD	188.43	2020-06-05	500	0	2020-06-04 11:48:57.897844	2020-06-04 11:48:57.897844	\N	\N	\N
602452	35	1	Twin - Non-Smoking	USD	96.4	2020-06-05	0	0	2020-06-04 11:48:57.903078	2020-06-04 11:48:57.903078	\N	\N	\N
602453	38	1	Superior Double or Twin Room	USD	147.01	2020-06-05	0	0	2020-06-04 11:48:57.907801	2020-06-04 11:48:57.907801	\N	\N	\N
602454	192	1	Comfort Room	USD	67.2	2020-06-05	224.72	0	2020-06-04 11:48:57.911659	2020-06-04 11:48:57.911659	\N	\N	\N
602455	165	1	Basic Room	USD	90.91	2020-06-05	0	0	2020-06-04 11:48:57.915771	2020-06-04 11:48:57.915771	\N	\N	\N
602456	215	1	Deluxe - 3 persons	USD	38.71	2020-06-05	154.84	25	2020-06-04 11:48:58.279604	2020-06-04 11:48:58.279604	\N	\N	\N
602457	261	1	Superior Twin or Double Room	USD	62.2	2020-06-05	0	0	2020-06-04 11:48:58.283599	2020-06-04 11:48:58.283599	\N	\N	\N
602458	224	1	Superior King	USD	57.92	2020-06-05	0	0	2020-06-04 11:48:58.287499	2020-06-04 11:48:58.287499	\N	\N	\N
602459	243	1	Classic Twin Room	USD	59.91	2020-06-05	0	0	2020-06-04 11:48:58.291334	2020-06-04 11:48:58.291334	\N	\N	\N
602460	256	1	Standard Double Room	USD	84.01	2020-06-05	0	0	2020-06-04 11:48:58.296559	2020-06-04 11:48:58.296559	\N	\N	\N
602462	285	1	Superior Room king bed	USD	106.6	2020-06-05	0	0	2020-06-04 11:48:58.308616	2020-06-04 11:48:58.308616	\N	\N	\N
602463	274	1	Standard Twin Room - Non-Smoking	USD	257.98	2020-06-05	385.6	0	2020-06-04 11:48:58.313541	2020-06-04 11:48:58.313541	\N	\N	\N
602464	306	1	Deluxe King City View	USD	109.43	2020-06-05	300.93	30	2020-06-04 11:48:58.317696	2020-06-04 11:48:58.317696	\N	\N	\N
602465	290	1	Standard	USD	93.46	2020-06-05	0	0	2020-06-04 11:48:58.324491	2020-06-04 11:48:58.324491	\N	\N	\N
602468	258	1	Standard Double Room	USD	25.62	2020-06-05	0	0	2020-06-04 11:48:58.336136	2020-06-04 11:48:58.336136	\N	\N	\N
602469	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-05	0	0	2020-06-04 11:48:58.339833	2020-06-04 11:48:58.339833	\N	\N	\N
602471	275	1	Double or Twin Room	USD	84.27	2020-06-05	0	0	2020-06-04 11:48:58.36623	2020-06-04 11:48:58.36623	\N	\N	\N
602472	204	1	King Bed	USD	221.65	2020-06-05	0	0	2020-06-04 11:48:58.370178	2020-06-04 11:48:58.370178	\N	\N	\N
602473	295	1	Classic Double or Twin	USD	246.2	2020-06-05	460.67	0	2020-06-04 11:48:58.374142	2020-06-04 11:48:58.374142	\N	\N	\N
602476	307	1	1 King Bed	USD	495.77	2020-06-05	0	0	2020-06-04 11:48:58.385884	2020-06-04 11:48:58.385884	\N	\N	\N
602477	302	1	King Suite - Non-Smoking	USD	94	2020-06-05	0	0	2020-06-04 11:48:58.389534	2020-06-04 11:48:58.389534	\N	\N	\N
602483	206	1	Standard	USD	72.41	2020-06-05	0	0	2020-06-04 11:48:58.418333	2020-06-04 11:48:58.418333	\N	\N	\N
602484	263	1	Hilton Room Queen	USD	128.53	2020-06-05	0	0	2020-06-04 11:48:58.422473	2020-06-04 11:48:58.422473	\N	\N	\N
695768	23	1	1 King Bed Evolution Room 	USD	119	2020-06-06	0	0	2020-06-05 11:48:53.205355	2020-06-05 11:48:53.205355	\N	\N	\N
695769	45	1	Classic Double or Twin	USD	112.27	2020-06-06	0	0	2020-06-05 11:48:53.224868	2020-06-05 11:48:53.224868	\N	\N	\N
695770	115	1	Double Room	USD	79.41	2020-06-06	0	0	2020-06-05 11:48:53.229012	2020-06-05 11:48:53.229012	\N	\N	\N
695771	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	81.15	2020-06-06	0	0	2020-06-05 11:48:53.233021	2020-06-05 11:48:53.233021	\N	\N	\N
695772	158	1	Superior Twin Non-Smoking	USD	78.47	2020-06-06	0	0	2020-06-05 11:48:53.237105	2020-06-05 11:48:53.237105	\N	\N	\N
695773	153	1	Standard Twin Room	USD	120.99	2020-06-06	0	0	2020-06-05 11:48:53.241	2020-06-05 11:48:53.241	\N	\N	\N
695774	131	1	Superior Double Room	USD	52.51	2020-06-06	0	0	2020-06-05 11:48:53.244827	2020-06-05 11:48:53.244827	\N	\N	\N
695775	113	1	Guestroom 1 King	USD	169	2020-06-06	0	0	2020-06-05 11:48:53.248854	2020-06-05 11:48:53.248854	\N	\N	\N
695776	53	1	Superior Twin	USD	139.53	2020-06-06	0	0	2020-06-05 11:48:53.252665	2020-06-05 11:48:53.252665	\N	\N	\N
695777	143	1	Standard Double Room	USD	172.84	2020-06-06	0	0	2020-06-05 11:48:53.267153	2020-06-05 11:48:53.267153	\N	\N	\N
695778	108	1	Standard Double Room	USD	89.59	2020-06-06	0	0	2020-06-05 11:48:53.271091	2020-06-05 11:48:53.271091	\N	\N	\N
695779	13	1	Premium Twin Room with Two Double Beds	USD	133.93	2020-06-06	0	0	2020-06-05 11:48:53.274962	2020-06-05 11:48:53.274962	\N	\N	\N
695780	8	1	Double Room	USD	162.75	2020-06-06	0	0	2020-06-05 11:48:53.279041	2020-06-05 11:48:53.279041	\N	\N	\N
695781	64	1	Basic Double or Twin Room	USD	61.81	2020-06-06	0	0	2020-06-05 11:48:53.283195	2020-06-05 11:48:53.283195	\N	\N	\N
695782	125	1	Standard Double or Twin Room	USD	27	2020-06-06	0	0	2020-06-05 11:48:53.287115	2020-06-05 11:48:53.287115	\N	\N	\N
695783	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-06	0	0	2020-06-05 11:48:53.292453	2020-06-05 11:48:53.292453	\N	\N	\N
695784	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-06	0	0	2020-06-05 11:48:53.296362	2020-06-05 11:48:53.296362	\N	\N	\N
695785	194	1	Standard Small Double Room - Non-Smoking	USD	161.55	2020-06-06	0	0	2020-06-05 11:48:53.300182	2020-06-05 11:48:53.300182	\N	\N	\N
695786	95	1	 Twin Guestroom	USD	160.15	2020-06-06	0	0	2020-06-05 11:48:53.303978	2020-06-05 11:48:53.303978	\N	\N	\N
695787	157	1	Cosy Small Room	USD	102.71	2020-06-06	0	0	2020-06-05 11:48:53.308215	2020-06-05 11:48:53.308215	\N	\N	\N
695788	26	1	Double	USD	64.13	2020-06-06	0	0	2020-06-05 11:48:53.312414	2020-06-05 11:48:53.312414	\N	\N	\N
695789	61	1	Modern Double Room	USD	171.53	2020-06-06	0	0	2020-06-05 11:48:53.316483	2020-06-05 11:48:53.316483	\N	\N	\N
695790	181	1	Superior Double Room	USD	61.94	2020-06-06	0	0	2020-06-05 11:48:53.320952	2020-06-05 11:48:53.320952	\N	\N	\N
695791	49	1	Superior Twin Room	USD	104.83	2020-06-06	0	0	2020-06-05 11:48:53.325012	2020-06-05 11:48:53.325012	\N	\N	\N
695792	159	1	Standard Room with 1 double bed and sofa	USD	83.65	2020-06-06	0	0	2020-06-05 11:48:53.331787	2020-06-05 11:48:53.331787	\N	\N	\N
695793	42	1	Two-Bedroom Apartment	USD	148.75	2020-06-06	0	0	2020-06-05 11:48:53.366563	2020-06-05 11:48:53.366563	\N	\N	\N
695794	141	1	Double or Twin Room	USD	93.78	2020-06-06	0	0	2020-06-05 11:48:53.371324	2020-06-05 11:48:53.371324	\N	\N	\N
695795	90	1	Standard Room	USD	81.88	2020-06-06	453.21	0	2020-06-05 11:48:53.375464	2020-06-05 11:48:53.375464	\N	\N	\N
695796	106	1	Double Room with Two Single Beds	USD	42.91	2020-06-06	0	0	2020-06-05 11:48:53.379681	2020-06-05 11:48:53.379681	\N	\N	\N
695797	27	1	Standard Twin Room - Smoking	USD	163.81	2020-06-06	533	0	2020-06-05 11:48:53.383778	2020-06-05 11:48:53.383778	\N	\N	\N
695798	77	1	Double Room - North Side	USD	145.3	2020-06-06	0	0	2020-06-05 11:48:53.387756	2020-06-05 11:48:53.387756	\N	\N	\N
695799	18	1	Superior Room	USD	110.97	2020-06-06	511.31	0	2020-06-05 11:48:53.391749	2020-06-05 11:48:53.391749	\N	\N	\N
695800	139	1	Small Double	USD	118.66	2020-06-06	593.29	20	2020-06-05 11:48:53.39574	2020-06-05 11:48:53.39574	\N	\N	\N
695801	14	1	Classic Double Bed	USD	117.92	2020-06-06	0	0	2020-06-05 11:48:53.399535	2020-06-05 11:48:53.399535	\N	\N	\N
695802	79	1	Standard Room	USD	58.24	2020-06-06	0	0	2020-06-05 11:48:53.403386	2020-06-05 11:48:53.403386	\N	\N	\N
695803	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	91.77	2020-06-06	0	0	2020-06-05 11:48:53.407212	2020-06-05 11:48:53.407212	\N	\N	\N
695804	160	1	1 King Bed	USD	109	2020-06-06	0	0	2020-06-05 11:48:53.411178	2020-06-05 11:48:53.411178	\N	\N	\N
695805	54	1	Double Room	USD	140.25	2020-06-06	714.37	0	2020-06-05 11:48:53.415099	2020-06-05 11:48:53.415099	\N	\N	\N
695806	47	1	Standard room half board	USD	188.43	2020-06-06	500	0	2020-06-05 11:48:53.421471	2020-06-05 11:48:53.421471	\N	\N	\N
695807	35	1	Twin - Non-Smoking	USD	106.04	2020-06-06	0	0	2020-06-05 11:48:53.426128	2020-06-05 11:48:53.426128	\N	\N	\N
695808	38	1	Superior Double or Twin Room	USD	148.24	2020-06-06	0	0	2020-06-05 11:48:53.430594	2020-06-05 11:48:53.430594	\N	\N	\N
695809	192	1	Comfort Room	USD	67.77	2020-06-06	226.6	0	2020-06-05 11:48:53.468132	2020-06-05 11:48:53.468132	\N	\N	\N
695810	165	1	Basic Room	USD	91.67	2020-06-06	0	0	2020-06-05 11:48:53.475181	2020-06-05 11:48:53.475181	\N	\N	\N
695811	215	1	Deluxe - 3 persons	USD	38.71	2020-06-06	154.84	25	2020-06-05 11:48:53.941733	2020-06-05 11:48:53.941733	\N	\N	\N
695812	261	1	Superior Twin or Double Room	USD	62.2	2020-06-06	0	0	2020-06-05 11:48:53.946295	2020-06-05 11:48:53.946295	\N	\N	\N
695813	224	1	Superior King	USD	69.47	2020-06-06	264.8	0	2020-06-05 11:48:53.950378	2020-06-05 11:48:53.950378	\N	\N	\N
695814	243	1	Classic Twin Room	USD	60.41	2020-06-06	0	0	2020-06-05 11:48:53.95455	2020-06-05 11:48:53.95455	\N	\N	\N
695815	256	1	Standard Double Room	USD	84.72	2020-06-06	0	0	2020-06-05 11:48:53.960751	2020-06-05 11:48:53.960751	\N	\N	\N
695816	285	1	Superior Room king bed	USD	95.16	2020-06-06	0	0	2020-06-05 11:48:53.964834	2020-06-05 11:48:53.964834	\N	\N	\N
695817	274	1	Standard Twin Room - Non-Smoking	USD	257.87	2020-06-06	385.43	0	2020-06-05 11:48:53.972361	2020-06-05 11:48:53.972361	\N	\N	\N
695818	306	1	Deluxe Twin Room	USD	102.37	2020-06-06	0	0	2020-06-05 11:48:53.978689	2020-06-05 11:48:53.978689	\N	\N	\N
695819	290	1	Standard	USD	104.83	2020-06-06	0	0	2020-06-05 11:48:53.987753	2020-06-05 11:48:53.987753	\N	\N	\N
695822	258	1	Standard Double Room	USD	25.44	2020-06-06	0	0	2020-06-05 11:48:54.000748	2020-06-05 11:48:54.000748	\N	\N	\N
695823	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-06	0	0	2020-06-05 11:48:54.035132	2020-06-05 11:48:54.035132	\N	\N	\N
695825	275	1	Double or Twin Room	USD	84.98	2020-06-06	0	0	2020-06-05 11:48:54.043716	2020-06-05 11:48:54.043716	\N	\N	\N
695826	204	1	King Bed	USD	221.25	2020-06-06	0	0	2020-06-05 11:48:54.047917	2020-06-05 11:48:54.047917	\N	\N	\N
695827	295	1	Classic Double or Twin	USD	256.47	2020-06-06	0	0	2020-06-05 11:48:54.051827	2020-06-05 11:48:54.051827	\N	\N	\N
695830	307	1	1 King Bed	USD	523.09	2020-06-06	0	0	2020-06-05 11:48:54.064168	2020-06-05 11:48:54.064168	\N	\N	\N
695831	302	1	2 Queen Beds 	USD	84	2020-06-06	0	0	2020-06-05 11:48:54.068165	2020-06-05 11:48:54.068165	\N	\N	\N
695837	249	1	Standard 1 Double 1 Single Bed	USD	97.85	2020-06-06	0	0	2020-06-05 11:48:54.091971	2020-06-05 11:48:54.091971	\N	\N	\N
695838	206	1	Standard	USD	72.46	2020-06-06	0	0	2020-06-05 11:48:54.09612	2020-06-05 11:48:54.09612	\N	\N	\N
695839	263	1	Hilton Room Queen	USD	151.42	2020-06-06	0	0	2020-06-05 11:48:54.099992	2020-06-05 11:48:54.099992	\N	\N	\N
785478	23	1	1 King Bed Evolution Room 	USD	119	2020-06-07	0	0	2020-06-06 11:48:53.747708	2020-06-06 11:48:53.747708	\N	\N	\N
785479	45	1	Classic Double or Twin	USD	111.88	2020-06-07	0	0	2020-06-06 11:48:53.768323	2020-06-06 11:48:53.768323	\N	\N	\N
785480	115	1	Double Room	USD	64.37	2020-06-07	0	0	2020-06-06 11:48:53.774987	2020-06-06 11:48:53.774987	\N	\N	\N
785481	158	1	Superior Twin Non-Smoking	USD	78.77	2020-06-07	0	0	2020-06-06 11:48:53.778903	2020-06-06 11:48:53.778903	\N	\N	\N
785482	153	1	Standard Twin Room	USD	160.48	2020-06-07	0	0	2020-06-06 11:48:53.783025	2020-06-06 11:48:53.783025	\N	\N	\N
785483	131	1	Superior Double Room	USD	53	2020-06-07	0	0	2020-06-06 11:48:53.78719	2020-06-06 11:48:53.78719	\N	\N	\N
785484	113	1	2 Queen Beds 	USD	169	2020-06-07	0	0	2020-06-06 11:48:53.791453	2020-06-06 11:48:53.791453	\N	\N	\N
785485	53	1	Superior Twin	USD	123.83	2020-06-07	0	0	2020-06-06 11:48:53.795711	2020-06-06 11:48:53.795711	\N	\N	\N
785486	143	1	Standard Double Room	USD	184.47	2020-06-07	0	0	2020-06-06 11:48:53.799955	2020-06-06 11:48:53.799955	\N	\N	\N
785487	108	1	Standard Double Room	USD	84.52	2020-06-07	0	0	2020-06-06 11:48:53.804232	2020-06-06 11:48:53.804232	\N	\N	\N
785488	13	1	Premium Twin Room with Two Double Beds	USD	135.15	2020-06-07	0	0	2020-06-06 11:48:53.808146	2020-06-06 11:48:53.808146	\N	\N	\N
785489	8	1	Double Room	USD	195.63	2020-06-07	0	0	2020-06-06 11:48:53.812272	2020-06-06 11:48:53.812272	\N	\N	\N
785490	64	1	Basic Double or Twin Room	USD	49.27	2020-06-07	0	0	2020-06-06 11:48:53.816499	2020-06-06 11:48:53.816499	\N	\N	\N
785491	125	1	Standard Double or Twin Room	USD	27	2020-06-07	0	0	2020-06-06 11:48:53.820625	2020-06-06 11:48:53.820625	\N	\N	\N
785492	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-07	0	0	2020-06-06 11:48:53.827539	2020-06-06 11:48:53.827539	\N	\N	\N
785493	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-07	0	0	2020-06-06 11:48:53.831617	2020-06-06 11:48:53.831617	\N	\N	\N
785494	194	1	Standard Small Double Room - Non-Smoking	USD	160.4	2020-06-07	0	0	2020-06-06 11:48:53.835577	2020-06-06 11:48:53.835577	\N	\N	\N
785495	95	1	 Twin Guestroom	USD	179.53	2020-06-07	0	0	2020-06-06 11:48:53.864327	2020-06-06 11:48:53.864327	\N	\N	\N
785496	157	1	Cosy Small Room	USD	102.75	2020-06-07	0	0	2020-06-06 11:48:53.868411	2020-06-06 11:48:53.868411	\N	\N	\N
785497	26	1	Double	USD	63.9	2020-06-07	0	0	2020-06-06 11:48:53.872879	2020-06-06 11:48:53.872879	\N	\N	\N
785498	61	1	Modern Double Room	USD	170.33	2020-06-07	0	0	2020-06-06 11:48:53.877041	2020-06-06 11:48:53.877041	\N	\N	\N
785499	181	1	Superior Double Room	USD	61.94	2020-06-07	0	0	2020-06-06 11:48:53.88111	2020-06-06 11:48:53.88111	\N	\N	\N
785500	49	1	Superior Twin Room	USD	104.46	2020-06-07	0	0	2020-06-06 11:48:53.885279	2020-06-06 11:48:53.885279	\N	\N	\N
785501	159	1	Standard Room with 1 double bed and sofa	USD	83.36	2020-06-07	0	0	2020-06-06 11:48:53.891659	2020-06-06 11:48:53.891659	\N	\N	\N
785502	42	1	Standard Twin Room	USD	63.18	2020-06-07	0	0	2020-06-06 11:48:53.895876	2020-06-06 11:48:53.895876	\N	\N	\N
785503	141	1	Double or Twin Room	USD	93.45	2020-06-07	0	0	2020-06-06 11:48:53.900056	2020-06-06 11:48:53.900056	\N	\N	\N
785504	90	1	Standard Room	USD	76.21	2020-06-07	451.62	0	2020-06-06 11:48:53.904135	2020-06-06 11:48:53.904135	\N	\N	\N
785505	106	1	Double Room with Two Single Beds	USD	44.09	2020-06-07	0	0	2020-06-06 11:48:53.908223	2020-06-06 11:48:53.908223	\N	\N	\N
785506	27	1	Standard Twin Room - Smoking	USD	162.65	2020-06-07	529.22	0	2020-06-06 11:48:53.912067	2020-06-06 11:48:53.912067	\N	\N	\N
785507	18	1	Superior Room	USD	110.97	2020-06-07	515.01	0	2020-06-06 11:48:53.915967	2020-06-06 11:48:53.915967	\N	\N	\N
785508	139	1	Small Double	USD	101.82	2020-06-07	509.11	20	2020-06-06 11:48:53.920064	2020-06-06 11:48:53.920064	\N	\N	\N
785509	14	1	Classic Double Bed	USD	117.51	2020-06-07	0	0	2020-06-06 11:48:53.924324	2020-06-06 11:48:53.924324	\N	\N	\N
785510	79	1	Standard Room	USD	58.03	2020-06-07	0	0	2020-06-06 11:48:53.928584	2020-06-06 11:48:53.928584	\N	\N	\N
785511	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	72.9	2020-06-07	0	0	2020-06-06 11:48:53.932719	2020-06-06 11:48:53.932719	\N	\N	\N
785512	160	1	1 King Bed	USD	109	2020-06-07	0	0	2020-06-06 11:48:53.967556	2020-06-06 11:48:53.967556	\N	\N	\N
785513	54	1	Double Room	USD	139.28	2020-06-07	709.39	0	2020-06-06 11:48:53.971695	2020-06-06 11:48:53.971695	\N	\N	\N
785514	47	1	Garden Facing Room	USD	154.79	2020-06-07	0	0	2020-06-06 11:48:53.978261	2020-06-06 11:48:53.978261	\N	\N	\N
785515	35	1	Twin - Non-Smoking	USD	95.68	2020-06-07	0	0	2020-06-06 11:48:53.984137	2020-06-06 11:48:53.984137	\N	\N	\N
785516	38	1	Superior Double or Twin Room	USD	147.72	2020-06-07	0	0	2020-06-06 11:48:53.99074	2020-06-06 11:48:53.99074	\N	\N	\N
785517	192	1	Comfort Room	USD	67.53	2020-06-07	225.81	0	2020-06-06 11:48:53.994727	2020-06-06 11:48:53.994727	\N	\N	\N
785518	165	1	Basic Room	USD	91.35	2020-06-07	0	0	2020-06-06 11:48:53.998717	2020-06-06 11:48:53.998717	\N	\N	\N
785519	215	1	Deluxe - 3 persons	USD	36.1	2020-06-07	144.41	25	2020-06-06 11:48:54.392331	2020-06-06 11:48:54.392331	\N	\N	\N
785520	261	1	Superior Twin or Double Room	USD	62.2	2020-06-07	0	0	2020-06-06 11:48:54.397093	2020-06-06 11:48:54.397093	\N	\N	\N
785521	224	1	Superior King	USD	57.99	2020-06-07	232.53	0	2020-06-06 11:48:54.401373	2020-06-06 11:48:54.401373	\N	\N	\N
785522	243	1	Classic Twin Room	USD	60.2	2020-06-07	0	0	2020-06-06 11:48:54.405468	2020-06-06 11:48:54.405468	\N	\N	\N
785523	256	1	Standard Double Room	USD	94.96	2020-06-07	0	0	2020-06-06 11:48:54.410518	2020-06-06 11:48:54.410518	\N	\N	\N
785524	285	1	Superior Room king bed	USD	95.69	2020-06-07	0	0	2020-06-06 11:48:54.414456	2020-06-06 11:48:54.414456	\N	\N	\N
785525	274	1	Double Room - Non-Smoking	USD	256.04	2020-06-07	0	0	2020-06-06 11:48:54.42054	2020-06-06 11:48:54.42054	\N	\N	\N
785526	306	1	Deluxe King City View	USD	102.39	2020-06-07	300.93	30	2020-06-06 11:48:54.428387	2020-06-06 11:48:54.428387	\N	\N	\N
785527	290	1	Standard	USD	93.91	2020-06-07	0	0	2020-06-06 11:48:54.432625	2020-06-06 11:48:54.432625	\N	\N	\N
785530	258	1	Standard Double Room	USD	26.14	2020-06-07	0	0	2020-06-06 11:48:54.446496	2020-06-06 11:48:54.446496	\N	\N	\N
785531	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-07	0	0	2020-06-06 11:48:54.450358	2020-06-06 11:48:54.450358	\N	\N	\N
785533	204	1	King Bed	USD	185.41	2020-06-07	0	0	2020-06-06 11:48:54.458627	2020-06-06 11:48:54.458627	\N	\N	\N
785534	295	1	Classic Double or Twin	USD	245.31	2020-06-07	0	0	2020-06-06 11:48:54.464323	2020-06-06 11:48:54.464323	\N	\N	\N
785537	307	1	1 King Bed	USD	492.05	2020-06-07	0	0	2020-06-06 11:48:54.476786	2020-06-06 11:48:54.476786	\N	\N	\N
785538	302	1	2 Queen Beds 	USD	74	2020-06-07	0	0	2020-06-06 11:48:54.481086	2020-06-06 11:48:54.481086	\N	\N	\N
785544	249	1	Standard Triple Room	USD	97.5	2020-06-07	0	0	2020-06-06 11:48:54.504431	2020-06-06 11:48:54.504431	\N	\N	\N
785545	206	1	Standard	USD	72.92	2020-06-07	0	0	2020-06-06 11:48:54.509829	2020-06-06 11:48:54.509829	\N	\N	\N
785546	263	1	Queen Hilton Guestroom	USD	127.57	2020-06-07	0	0	2020-06-06 11:48:54.515022	2020-06-06 11:48:54.515022	\N	\N	\N
878755	23	1	1 King Bed Evolution Room 	USD	119	2020-06-08	0	0	2020-06-07 11:48:49.109628	2020-06-07 11:48:49.109628	\N	\N	\N
878756	45	1	Classic Double or Twin	USD	111.88	2020-06-08	0	0	2020-06-07 11:48:49.145545	2020-06-07 11:48:49.145545	\N	\N	\N
878757	115	1	Double Room	USD	64.37	2020-06-08	0	0	2020-06-07 11:48:49.149592	2020-06-07 11:48:49.149592	\N	\N	\N
878758	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	65.52	2020-06-08	0	0	2020-06-07 11:48:49.15332	2020-06-07 11:48:49.15332	\N	\N	\N
878759	158	1	Superior Twin Non-Smoking	USD	87.52	2020-06-08	0	0	2020-06-07 11:48:49.157307	2020-06-07 11:48:49.157307	\N	\N	\N
878760	153	1	Standard Twin Room	USD	181.07	2020-06-08	0	0	2020-06-07 11:48:49.161327	2020-06-07 11:48:49.161327	\N	\N	\N
878761	131	1	Superior Double Room	USD	53	2020-06-08	0	0	2020-06-07 11:48:49.165235	2020-06-07 11:48:49.165235	\N	\N	\N
878762	176	1	Economy Twin Room	USD	122.14	2020-06-08	0	0	2020-06-07 11:48:49.177312	2020-06-07 11:48:49.177312	\N	\N	\N
878763	113	1	2 Queen Beds 	USD	169	2020-06-08	0	0	2020-06-07 11:48:49.181661	2020-06-07 11:48:49.181661	\N	\N	\N
878764	53	1	Superior Twin	USD	123.83	2020-06-08	0	0	2020-06-07 11:48:49.185562	2020-06-07 11:48:49.185562	\N	\N	\N
878765	143	1	Standard Double Room	USD	184.47	2020-06-08	0	0	2020-06-07 11:48:49.1893	2020-06-07 11:48:49.1893	\N	\N	\N
878766	108	1	Standard Double Room	USD	84.52	2020-06-08	0	0	2020-06-07 11:48:49.193171	2020-06-07 11:48:49.193171	\N	\N	\N
878767	13	1	Premium Twin Room with Two Double Beds	USD	135.15	2020-06-08	0	0	2020-06-07 11:48:49.19685	2020-06-07 11:48:49.19685	\N	\N	\N
878768	8	1	Double Room	USD	195.63	2020-06-08	0	0	2020-06-07 11:48:49.20064	2020-06-07 11:48:49.20064	\N	\N	\N
878769	64	1	Basic Double or Twin Room	USD	59.53	2020-06-08	0	0	2020-06-07 11:48:49.20431	2020-06-07 11:48:49.20431	\N	\N	\N
878770	125	1	Standard Double or Twin Room	USD	27	2020-06-08	0	0	2020-06-07 11:48:49.207975	2020-06-07 11:48:49.207975	\N	\N	\N
878771	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-08	0	0	2020-06-07 11:48:49.212419	2020-06-07 11:48:49.212419	\N	\N	\N
878772	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-08	0	0	2020-06-07 11:48:49.216248	2020-06-07 11:48:49.216248	\N	\N	\N
878773	194	1	Standard Small Double Room - Non-Smoking	USD	160.4	2020-06-08	0	0	2020-06-07 11:48:49.220693	2020-06-07 11:48:49.220693	\N	\N	\N
878774	95	1	 Twin Guestroom	USD	179.53	2020-06-08	0	0	2020-06-07 11:48:49.22445	2020-06-07 11:48:49.22445	\N	\N	\N
878775	157	1	Cosy Small Room	USD	148.21	2020-06-08	0	0	2020-06-07 11:48:49.228241	2020-06-07 11:48:49.228241	\N	\N	\N
878776	26	1	Double	USD	69.23	2020-06-08	0	0	2020-06-07 11:48:49.231951	2020-06-07 11:48:49.231951	\N	\N	\N
878777	61	1	Modern Double Room	USD	210.42	2020-06-08	0	0	2020-06-07 11:48:49.235756	2020-06-07 11:48:49.235756	\N	\N	\N
878778	181	1	Superior Double Room	USD	61.94	2020-06-08	0	0	2020-06-07 11:48:49.266344	2020-06-07 11:48:49.266344	\N	\N	\N
878779	49	1	Superior Twin Room	USD	125.56	2020-06-08	0	0	2020-06-07 11:48:49.270332	2020-06-07 11:48:49.270332	\N	\N	\N
878780	159	1	Standard Room with 1 double bed and sofa	USD	83.36	2020-06-08	0	0	2020-06-07 11:48:49.278444	2020-06-07 11:48:49.278444	\N	\N	\N
878781	42	1	Two-Bedroom Apartment	USD	148.75	2020-06-08	0	0	2020-06-07 11:48:49.28446	2020-06-07 11:48:49.28446	\N	\N	\N
878782	141	1	Double or Twin Room	USD	93.56	2020-06-08	0	0	2020-06-07 11:48:49.288485	2020-06-07 11:48:49.288485	\N	\N	\N
878783	90	1	Standard Room	USD	78.52	2020-06-08	451.62	0	2020-06-07 11:48:49.292402	2020-06-07 11:48:49.292402	\N	\N	\N
878784	106	1	Double Room with Two Single Beds	USD	44.09	2020-06-08	0	0	2020-06-07 11:48:49.296228	2020-06-07 11:48:49.296228	\N	\N	\N
878785	27	1	Standard Twin Room - Smoking	USD	162.65	2020-06-08	529.22	0	2020-06-07 11:48:49.300114	2020-06-07 11:48:49.300114	\N	\N	\N
878786	77	1	Double Room - North Side	USD	144.29	2020-06-08	0	0	2020-06-07 11:48:49.303977	2020-06-07 11:48:49.303977	\N	\N	\N
878787	18	1	Superior Room	USD	118.95	2020-06-08	552.06	0	2020-06-07 11:48:49.308021	2020-06-07 11:48:49.308021	\N	\N	\N
878788	139	1	Small Double	USD	101.82	2020-06-08	509.11	20	2020-06-07 11:48:49.311855	2020-06-07 11:48:49.311855	\N	\N	\N
878789	14	1	Classic Double Bed	USD	138.04	2020-06-08	0	0	2020-06-07 11:48:49.315865	2020-06-07 11:48:49.315865	\N	\N	\N
878790	79	1	Standard Room	USD	58.03	2020-06-08	0	0	2020-06-07 11:48:49.319881	2020-06-07 11:48:49.319881	\N	\N	\N
878791	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	72.9	2020-06-08	0	0	2020-06-07 11:48:49.323745	2020-06-07 11:48:49.323745	\N	\N	\N
878792	160	1	1 King Bed	USD	139	2020-06-08	0	0	2020-06-07 11:48:49.327649	2020-06-07 11:48:49.327649	\N	\N	\N
878793	54	1	Double Room	USD	161.33	2020-06-08	797.59	0	2020-06-07 11:48:49.332444	2020-06-07 11:48:49.332444	\N	\N	\N
878794	47	1	Garden Facing Room	USD	170.68	2020-06-08	0	0	2020-06-07 11:48:49.364452	2020-06-07 11:48:49.364452	\N	\N	\N
878795	35	1	Twin - Non-Smoking	USD	95.68	2020-06-08	0	0	2020-06-07 11:48:49.3727	2020-06-07 11:48:49.3727	\N	\N	\N
878796	38	1	Superior Double or Twin Room	USD	147.72	2020-06-08	0	0	2020-06-07 11:48:49.37971	2020-06-07 11:48:49.37971	\N	\N	\N
878797	192	1	Comfort Room	USD	88.63	2020-06-08	225.81	0	2020-06-07 11:48:49.383744	2020-06-07 11:48:49.383744	\N	\N	\N
878798	165	1	Basic Room	USD	91.35	2020-06-08	0	0	2020-06-07 11:48:49.387599	2020-06-07 11:48:49.387599	\N	\N	\N
878799	215	1	Deluxe - 3 persons	USD	36.1	2020-06-08	144.41	25	2020-06-07 11:48:49.910207	2020-06-07 11:48:49.910207	\N	\N	\N
878800	261	1	Superior Twin or Double Room	USD	62.2	2020-06-08	0	0	2020-06-07 11:48:49.914451	2020-06-07 11:48:49.914451	\N	\N	\N
878801	224	1	Superior King	USD	58.13	2020-06-08	244.15	0	2020-06-07 11:48:49.918346	2020-06-07 11:48:49.918346	\N	\N	\N
878802	243	1	Executive Double Room	USD	74.16	2020-06-08	310.49	0	2020-06-07 11:48:49.922566	2020-06-07 11:48:49.922566	\N	\N	\N
878803	256	1	Standard Double Room	USD	110.79	2020-06-08	0	0	2020-06-07 11:48:49.928221	2020-06-07 11:48:49.928221	\N	\N	\N
878805	285	1	Superior Room king bed	USD	95.69	2020-06-08	0	0	2020-06-07 11:48:49.936907	2020-06-07 11:48:49.936907	\N	\N	\N
878806	314	1	1 Double Bed Non-Smoking	USD	145.93	2020-06-08	0	0	2020-06-07 11:48:49.940688	2020-06-07 11:48:49.940688	\N	\N	\N
878807	274	1	Double Room - Non-Smoking	USD	256.04	2020-06-08	0	0	2020-06-07 11:48:49.947312	2020-06-07 11:48:49.947312	\N	\N	\N
878808	306	1	Deluxe King City View	USD	113.08	2020-06-08	300.93	30	2020-06-07 11:48:49.966104	2020-06-07 11:48:49.966104	\N	\N	\N
878809	290	1	Standard	USD	93.91	2020-06-08	0	0	2020-06-07 11:48:49.970068	2020-06-07 11:48:49.970068	\N	\N	\N
878812	258	1	Standard Double Room	USD	26.14	2020-06-08	0	0	2020-06-07 11:48:49.985677	2020-06-07 11:48:49.985677	\N	\N	\N
878813	216	1	2 Double Accessible Roll in Shower	USD	109	2020-06-08	0	0	2020-06-07 11:48:49.989508	2020-06-07 11:48:49.989508	\N	\N	\N
878815	204	1	King Bed	USD	185.41	2020-06-08	0	0	2020-06-07 11:48:49.996972	2020-06-07 11:48:49.996972	\N	\N	\N
878816	295	1	Classic Double or Twin	USD	245.31	2020-06-08	0	0	2020-06-07 11:48:50.000791	2020-06-07 11:48:50.000791	\N	\N	\N
878819	307	1	1 King Bed	USD	492.05	2020-06-08	0	0	2020-06-07 11:48:50.047778	2020-06-07 11:48:50.047778	\N	\N	\N
878820	302	1	2 Queen Beds 	USD	74	2020-06-08	0	0	2020-06-07 11:48:50.051659	2020-06-07 11:48:50.051659	\N	\N	\N
878826	249	1	Standard 1 Double 1 Single Bed	USD	111.88	2020-06-08	0	0	2020-06-07 11:48:50.077917	2020-06-07 11:48:50.077917	\N	\N	\N
878827	206	1	Standard	USD	72.92	2020-06-08	0	0	2020-06-07 11:48:50.081951	2020-06-07 11:48:50.081951	\N	\N	\N
878828	263	1	Queen Hilton Guestroom	USD	127.57	2020-06-08	0	0	2020-06-07 11:48:50.085865	2020-06-07 11:48:50.085865	\N	\N	\N
974729	23	1	1 King Bed Evolution Room 	USD	119	2020-06-09	0	0	2020-06-08 11:48:54.341173	2020-06-08 11:48:54.341173	\N	\N	\N
974730	45	1	Classic Double or Twin	USD	111.88	2020-06-09	0	0	2020-06-08 11:48:54.35887	2020-06-08 11:48:54.35887	\N	\N	\N
974731	115	1	Double Room	USD	64.37	2020-06-09	0	0	2020-06-08 11:48:54.362789	2020-06-08 11:48:54.362789	\N	\N	\N
974732	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	65.52	2020-06-09	0	0	2020-06-08 11:48:54.367199	2020-06-08 11:48:54.367199	\N	\N	\N
974733	158	1	Superior Twin Non-Smoking	USD	87.52	2020-06-09	0	0	2020-06-08 11:48:54.37105	2020-06-08 11:48:54.37105	\N	\N	\N
974734	153	1	Standard Twin Room	USD	193.19	2020-06-09	0	0	2020-06-08 11:48:54.374962	2020-06-08 11:48:54.374962	\N	\N	\N
974735	131	1	Superior Double Room	USD	53	2020-06-09	0	0	2020-06-08 11:48:54.378831	2020-06-08 11:48:54.378831	\N	\N	\N
974736	176	1	Economy Twin Room	USD	122.14	2020-06-09	0	0	2020-06-08 11:48:54.384393	2020-06-08 11:48:54.384393	\N	\N	\N
974737	113	1	2 Queen Beds 	USD	169	2020-06-09	0	0	2020-06-08 11:48:54.388187	2020-06-08 11:48:54.388187	\N	\N	\N
974738	53	1	Superior Twin	USD	129.49	2020-06-09	0	0	2020-06-08 11:48:54.392135	2020-06-08 11:48:54.392135	\N	\N	\N
974739	143	1	Standard Double Room	USD	211.11	2020-06-09	0	0	2020-06-08 11:48:54.395892	2020-06-08 11:48:54.395892	\N	\N	\N
974740	108	1	Standard Double Room	USD	84.52	2020-06-09	0	0	2020-06-08 11:48:54.399809	2020-06-08 11:48:54.399809	\N	\N	\N
974741	13	1	Premium Twin Room with Two Double Beds	USD	129.49	2020-06-09	0	0	2020-06-08 11:48:54.403552	2020-06-08 11:48:54.403552	\N	\N	\N
974742	8	1	Superior Double Room	USD	227.61	2020-06-09	0	0	2020-06-08 11:48:54.407371	2020-06-08 11:48:54.407371	\N	\N	\N
974743	64	1	Basic Double or Twin Room	USD	59.53	2020-06-09	0	0	2020-06-08 11:48:54.411135	2020-06-08 11:48:54.411135	\N	\N	\N
974744	125	1	Standard Double or Twin Room	USD	27	2020-06-09	0	0	2020-06-08 11:48:54.414865	2020-06-08 11:48:54.414865	\N	\N	\N
974745	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-09	0	0	2020-06-08 11:48:54.418943	2020-06-08 11:48:54.418943	\N	\N	\N
974746	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-09	0	0	2020-06-08 11:48:54.425996	2020-06-08 11:48:54.425996	\N	\N	\N
974747	194	1	Standard Small Double Room - Non-Smoking	USD	160.4	2020-06-09	0	0	2020-06-08 11:48:54.431442	2020-06-08 11:48:54.431442	\N	\N	\N
974748	95	1	 Twin Guestroom	USD	179.53	2020-06-09	0	0	2020-06-08 11:48:54.464399	2020-06-08 11:48:54.464399	\N	\N	\N
974749	157	1	Cosy Small Room	USD	156.96	2020-06-09	0	0	2020-06-08 11:48:54.468938	2020-06-08 11:48:54.468938	\N	\N	\N
974750	26	1	Double	USD	69.23	2020-06-09	0	0	2020-06-08 11:48:54.472811	2020-06-08 11:48:54.472811	\N	\N	\N
974751	61	1	Modern Double Room	USD	190.38	2020-06-09	0	0	2020-06-08 11:48:54.476657	2020-06-08 11:48:54.476657	\N	\N	\N
974752	181	1	Superior Double Room	USD	61.94	2020-06-09	0	0	2020-06-08 11:48:54.480947	2020-06-08 11:48:54.480947	\N	\N	\N
974753	49	1	Superior Twin Room	USD	125.56	2020-06-09	0	0	2020-06-08 11:48:54.48643	2020-06-08 11:48:54.48643	\N	\N	\N
974754	159	1	Standard Room with 1 double bed and sofa	USD	83.36	2020-06-09	0	0	2020-06-08 11:48:54.491878	2020-06-08 11:48:54.491878	\N	\N	\N
974755	141	1	Double or Twin Room	USD	93.56	2020-06-09	0	0	2020-06-08 11:48:54.49596	2020-06-08 11:48:54.49596	\N	\N	\N
974756	90	1	Standard Room	USD	80.06	2020-06-09	451.62	0	2020-06-08 11:48:54.49994	2020-06-08 11:48:54.49994	\N	\N	\N
974757	106	1	Double Room with Two Single Beds	USD	44.09	2020-06-09	0	0	2020-06-08 11:48:54.504029	2020-06-08 11:48:54.504029	\N	\N	\N
974758	27	1	Standard Twin Room - Smoking	USD	162.65	2020-06-09	529.22	0	2020-06-08 11:48:54.509589	2020-06-08 11:48:54.509589	\N	\N	\N
974759	77	1	Double Room - North Side	USD	144.29	2020-06-09	0	0	2020-06-08 11:48:54.515101	2020-06-08 11:48:54.515101	\N	\N	\N
974760	18	1	Superior Room	USD	118.95	2020-06-09	552.06	0	2020-06-08 11:48:54.519047	2020-06-08 11:48:54.519047	\N	\N	\N
974761	139	1	Small Double	USD	118.24	2020-06-09	591.22	20	2020-06-08 11:48:54.522831	2020-06-08 11:48:54.522831	\N	\N	\N
974762	14	1	Classic Double Bed	USD	143.17	2020-06-09	0	0	2020-06-08 11:48:54.526661	2020-06-08 11:48:54.526661	\N	\N	\N
974763	79	1	Standard Room	USD	58.03	2020-06-09	0	0	2020-06-08 11:48:54.530489	2020-06-08 11:48:54.530489	\N	\N	\N
974764	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	72.9	2020-06-09	0	0	2020-06-08 11:48:54.568295	2020-06-08 11:48:54.568295	\N	\N	\N
974765	160	1	2 Double Beds	USD	119	2020-06-09	0	0	2020-06-08 11:48:54.572998	2020-06-08 11:48:54.572998	\N	\N	\N
974766	54	1	Double Room	USD	161.33	2020-06-09	797.59	0	2020-06-08 11:48:54.576991	2020-06-08 11:48:54.576991	\N	\N	\N
974767	47	1	Garden Facing Room	USD	170.68	2020-06-09	0	0	2020-06-08 11:48:54.582184	2020-06-08 11:48:54.582184	\N	\N	\N
974768	35	1	Twin - Non-Smoking	USD	95.68	2020-06-09	0	0	2020-06-08 11:48:54.587982	2020-06-08 11:48:54.587982	\N	\N	\N
974769	38	1	Deluxe Double or Twin Room with Sea View	USD	147.72	2020-06-09	0	0	2020-06-08 11:48:54.593491	2020-06-08 11:48:54.593491	\N	\N	\N
974770	192	1	Comfort Room	USD	88.63	2020-06-09	225.81	0	2020-06-08 11:48:54.597386	2020-06-08 11:48:54.597386	\N	\N	\N
974771	165	1	Basic Room	USD	91.35	2020-06-09	0	0	2020-06-08 11:48:54.601511	2020-06-08 11:48:54.601511	\N	\N	\N
974772	215	1	Deluxe - 3 persons	USD	36.1	2020-06-09	144.41	25	2020-06-08 11:48:54.929722	2020-06-08 11:48:54.929722	\N	\N	\N
974773	261	1	Superior Twin or Double Room	USD	62.2	2020-06-09	0	0	2020-06-08 11:48:54.933958	2020-06-08 11:48:54.933958	\N	\N	\N
974774	224	1	Superior King	USD	58.13	2020-06-09	244.15	0	2020-06-08 11:48:54.937972	2020-06-08 11:48:54.937972	\N	\N	\N
974776	243	1	Classic Twin Room	USD	74.16	2020-06-09	0	0	2020-06-08 11:48:54.945758	2020-06-08 11:48:54.945758	\N	\N	\N
974777	256	1	Standard Double Room	USD	105.52	2020-06-09	0	0	2020-06-08 11:48:54.951174	2020-06-08 11:48:54.951174	\N	\N	\N
974779	285	1	Superior Room king bed	USD	107.1	2020-06-09	0	0	2020-06-08 11:48:54.958941	2020-06-08 11:48:54.958941	\N	\N	\N
974780	314	1	1 Double Bed Non-Smoking	USD	145.93	2020-06-09	0	0	2020-06-08 11:48:54.962911	2020-06-08 11:48:54.962911	\N	\N	\N
974781	274	1	Small Double Room Non-Smoking	USD	219.89	2020-06-09	0	0	2020-06-08 11:48:54.969643	2020-06-08 11:48:54.969643	\N	\N	\N
974782	306	1	Deluxe King City View	USD	113.08	2020-06-09	300.93	30	2020-06-08 11:48:54.976863	2020-06-08 11:48:54.976863	\N	\N	\N
974783	290	1	Standard	USD	93.91	2020-06-09	0	0	2020-06-08 11:48:54.980793	2020-06-08 11:48:54.980793	\N	\N	\N
974786	258	1	Standard Double Room	USD	26.14	2020-06-09	0	0	2020-06-08 11:48:54.992515	2020-06-08 11:48:54.992515	\N	\N	\N
974787	216	1	2 Double Accessible Roll in Shower	USD	109	2020-06-09	0	0	2020-06-08 11:48:54.996619	2020-06-08 11:48:54.996619	\N	\N	\N
974789	275	1	Double or Twin Room	USD	84.68	2020-06-09	0	0	2020-06-08 11:48:55.039639	2020-06-08 11:48:55.039639	\N	\N	\N
974790	204	1	King Bed	USD	185.41	2020-06-09	0	0	2020-06-08 11:48:55.043927	2020-06-08 11:48:55.043927	\N	\N	\N
974791	295	1	Classic Double or Twin	USD	237.46	2020-06-09	462.91	0	2020-06-08 11:48:55.047733	2020-06-08 11:48:55.047733	\N	\N	\N
974794	307	1	1 King Bed	USD	492.05	2020-06-09	0	0	2020-06-08 11:48:55.05907	2020-06-08 11:48:55.05907	\N	\N	\N
974795	302	1	2 Queen Beds 	USD	74	2020-06-09	0	0	2020-06-08 11:48:55.062777	2020-06-08 11:48:55.062777	\N	\N	\N
974801	249	1	Standard 1 Double 1 Single Bed	USD	122.14	2020-06-09	0	0	2020-06-08 11:48:55.086151	2020-06-08 11:48:55.086151	\N	\N	\N
974802	206	1	Standard	USD	72.92	2020-06-09	0	0	2020-06-08 11:48:55.089896	2020-06-08 11:48:55.089896	\N	\N	\N
974803	263	1	Hilton Room Queen	USD	141.23	2020-06-09	0	0	2020-06-08 11:48:55.093628	2020-06-08 11:48:55.093628	\N	\N	\N
1070533	23	1	1 King Bed Evolution Room 	USD	119	2020-06-10	0	0	2020-06-09 11:48:51.839084	2020-06-09 11:48:51.839084	\N	\N	\N
1070534	45	1	Classic Double or Twin	USD	111.88	2020-06-10	0	0	2020-06-09 11:48:51.855322	2020-06-09 11:48:51.855322	\N	\N	\N
1070535	115	1	Double Room	USD	64.37	2020-06-10	0	0	2020-06-09 11:48:51.859294	2020-06-09 11:48:51.859294	\N	\N	\N
1070536	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.39	2020-06-10	0	0	2020-06-09 11:48:51.86643	2020-06-09 11:48:51.86643	\N	\N	\N
1070537	158	1	Superior Twin Non-Smoking	USD	87.67	2020-06-10	0	0	2020-06-09 11:48:51.870302	2020-06-09 11:48:51.870302	\N	\N	\N
1070538	153	1	Standard Twin Room	USD	193.19	2020-06-10	0	0	2020-06-09 11:48:51.874236	2020-06-09 11:48:51.874236	\N	\N	\N
1070539	131	1	Superior Double Room	USD	52.83	2020-06-10	0	0	2020-06-09 11:48:51.879138	2020-06-09 11:48:51.879138	\N	\N	\N
1070540	176	1	Economy Twin Room	USD	122.14	2020-06-10	0	0	2020-06-09 11:48:51.88295	2020-06-09 11:48:51.88295	\N	\N	\N
1070541	113	1	2 Queen Beds 	USD	169	2020-06-10	0	0	2020-06-09 11:48:51.8868	2020-06-09 11:48:51.8868	\N	\N	\N
1070542	53	1	Superior Twin	USD	130.33	2020-06-10	0	0	2020-06-09 11:48:51.890813	2020-06-09 11:48:51.890813	\N	\N	\N
1070543	143	1	Standard Double Room	USD	222.19	2020-06-10	0	0	2020-06-09 11:48:51.895065	2020-06-09 11:48:51.895065	\N	\N	\N
1070544	108	1	Standard Double Room	USD	84.52	2020-06-10	0	0	2020-06-09 11:48:51.899004	2020-06-09 11:48:51.899004	\N	\N	\N
1070545	13	1	Premium Twin Room with Two Double Beds	USD	130.33	2020-06-10	0	0	2020-06-09 11:48:51.902999	2020-06-09 11:48:51.902999	\N	\N	\N
1070546	8	1	Double Room	USD	196	2020-06-10	0	0	2020-06-09 11:48:51.907037	2020-06-09 11:48:51.907037	\N	\N	\N
1070547	64	1	Basic Double or Twin Room	USD	59.53	2020-06-10	0	0	2020-06-09 11:48:51.910791	2020-06-09 11:48:51.910791	\N	\N	\N
1070548	125	1	Standard Double or Twin Room	USD	27	2020-06-10	0	0	2020-06-09 11:48:51.914583	2020-06-09 11:48:51.914583	\N	\N	\N
1070549	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-10	0	0	2020-06-09 11:48:51.918473	2020-06-09 11:48:51.918473	\N	\N	\N
1070550	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-10	0	0	2020-06-09 11:48:51.922235	2020-06-09 11:48:51.922235	\N	\N	\N
1070551	194	1	Standard Small Double Room - Non-Smoking	USD	162.55	2020-06-10	0	0	2020-06-09 11:48:51.92723	2020-06-09 11:48:51.92723	\N	\N	\N
1070552	95	1	 Twin Guestroom	USD	180.17	2020-06-10	0	0	2020-06-09 11:48:51.964488	2020-06-09 11:48:51.964488	\N	\N	\N
1070553	157	1	Standard Room	USD	146.89	2020-06-10	0	0	2020-06-09 11:48:51.969114	2020-06-09 11:48:51.969114	\N	\N	\N
1070554	26	1	Double	USD	69.23	2020-06-10	0	0	2020-06-09 11:48:51.973781	2020-06-09 11:48:51.973781	\N	\N	\N
1070555	61	1	Modern Double Room	USD	211.5	2020-06-10	0	0	2020-06-09 11:48:51.977622	2020-06-09 11:48:51.977622	\N	\N	\N
1070556	181	1	Superior Double Room	USD	61.94	2020-06-10	0	0	2020-06-09 11:48:51.981373	2020-06-09 11:48:51.981373	\N	\N	\N
1070557	49	1	Superior Twin Room	USD	125.56	2020-06-10	0	0	2020-06-09 11:48:51.985257	2020-06-09 11:48:51.985257	\N	\N	\N
1070558	159	1	Standard Room with 1 double bed and sofa	USD	83.36	2020-06-10	0	0	2020-06-09 11:48:51.990784	2020-06-09 11:48:51.990784	\N	\N	\N
1070559	42	1	Standard Twin Room	USD	63.18	2020-06-10	0	0	2020-06-09 11:48:51.994694	2020-06-09 11:48:51.994694	\N	\N	\N
1070560	141	1	Double or Twin Room	USD	93.86	2020-06-10	0	0	2020-06-09 11:48:51.998581	2020-06-09 11:48:51.998581	\N	\N	\N
1070561	90	1	Standard Room	USD	80.06	2020-06-10	320.24	0	2020-06-09 11:48:52.00464	2020-06-09 11:48:52.00464	\N	\N	\N
1070562	106	1	Double Room with Two Single Beds	USD	40.49	2020-06-10	0	0	2020-06-09 11:48:52.008484	2020-06-09 11:48:52.008484	\N	\N	\N
1070563	27	1	Standard Twin Room - Smoking	USD	164.82	2020-06-10	536.31	0	2020-06-09 11:48:52.012358	2020-06-09 11:48:52.012358	\N	\N	\N
1070564	77	1	Double Room - North Side	USD	145.02	2020-06-10	0	0	2020-06-09 11:48:52.016193	2020-06-09 11:48:52.016193	\N	\N	\N
1070565	18	1	Superior Room	USD	118.95	2020-06-10	548.27	0	2020-06-09 11:48:52.020223	2020-06-09 11:48:52.020223	\N	\N	\N
1070566	139	1	Small Double	USD	118.24	2020-06-10	591.22	20	2020-06-09 11:48:52.024177	2020-06-09 11:48:52.024177	\N	\N	\N
1070567	14	1	Classic Double Bed	USD	143.17	2020-06-10	0	0	2020-06-09 11:48:52.028201	2020-06-09 11:48:52.028201	\N	\N	\N
1070568	79	1	Standard Room	USD	58.03	2020-06-10	0	0	2020-06-09 11:48:52.064412	2020-06-09 11:48:52.064412	\N	\N	\N
1070569	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	73.87	2020-06-10	0	0	2020-06-09 11:48:52.072667	2020-06-09 11:48:52.072667	\N	\N	\N
1070570	67	1	Trendy Garden View Room	USD	213.1	2020-06-10	376.9	45	2020-06-09 11:48:52.076613	2020-06-09 11:48:52.076613	\N	\N	\N
1070571	160	1	2 Double Beds	USD	119	2020-06-10	0	0	2020-06-09 11:48:52.080402	2020-06-09 11:48:52.080402	\N	\N	\N
1070572	54	1	Double Room	USD	162.15	2020-06-10	801.67	0	2020-06-09 11:48:52.084329	2020-06-09 11:48:52.084329	\N	\N	\N
1070573	47	1	Garden Facing Room	USD	170.68	2020-06-10	0	0	2020-06-09 11:48:52.08991	2020-06-09 11:48:52.08991	\N	\N	\N
1070574	35	1	Twin - Non-Smoking	USD	96.96	2020-06-10	0	0	2020-06-09 11:48:52.095978	2020-06-09 11:48:52.095978	\N	\N	\N
1070575	38	1	Deluxe Double or Twin Room with Sea View	USD	147.72	2020-06-10	0	0	2020-06-09 11:48:52.100866	2020-06-09 11:48:52.100866	\N	\N	\N
1070576	192	1	Comfort Room	USD	88.63	2020-06-10	225.81	0	2020-06-09 11:48:52.104791	2020-06-09 11:48:52.104791	\N	\N	\N
1070577	165	1	Basic Room	USD	91.35	2020-06-10	0	0	2020-06-09 11:48:52.108731	2020-06-09 11:48:52.108731	\N	\N	\N
1070578	215	1	Deluxe - 3 persons	USD	38.71	2020-06-10	154.84	25	2020-06-09 11:48:52.567783	2020-06-09 11:48:52.567783	\N	\N	\N
1070579	261	1	Superior Twin or Double Room	USD	62.2	2020-06-10	0	0	2020-06-09 11:48:52.571793	2020-06-09 11:48:52.571793	\N	\N	\N
1070580	224	1	Superior King	USD	58.18	2020-06-10	244.35	0	2020-06-09 11:48:52.575772	2020-06-09 11:48:52.575772	\N	\N	\N
1070581	243	1	Classic Twin Room	USD	74.16	2020-06-10	0	0	2020-06-09 11:48:52.579569	2020-06-09 11:48:52.579569	\N	\N	\N
1070582	256	1	Standard Double Room	USD	105.52	2020-06-10	0	0	2020-06-09 11:48:52.585192	2020-06-09 11:48:52.585192	\N	\N	\N
1070584	285	1	Superior Room king bed	USD	107.48	2020-06-10	0	0	2020-06-09 11:48:52.595172	2020-06-09 11:48:52.595172	\N	\N	\N
1070585	314	1	1 Double Bed Non-Smoking	USD	145.93	2020-06-10	0	0	2020-06-09 11:48:52.600599	2020-06-09 11:48:52.600599	\N	\N	\N
1070586	274	1	Small Double Room Non-Smoking	USD	222.84	2020-06-10	0	0	2020-06-09 11:48:52.608157	2020-06-09 11:48:52.608157	\N	\N	\N
1070587	306	1	Deluxe King City View	USD	113.18	2020-06-10	301.21	30	2020-06-09 11:48:52.617233	2020-06-09 11:48:52.617233	\N	\N	\N
1070588	290	1	Standard	USD	93.91	2020-06-10	0	0	2020-06-09 11:48:52.621253	2020-06-09 11:48:52.621253	\N	\N	\N
1070591	258	1	Standard Double Room	USD	26.68	2020-06-10	0	0	2020-06-09 11:48:52.632813	2020-06-09 11:48:52.632813	\N	\N	\N
1070592	216	1	2 Double Accessible Roll in Shower	USD	114	2020-06-10	0	0	2020-06-09 11:48:52.636606	2020-06-09 11:48:52.636606	\N	\N	\N
1070594	275	1	Double or Twin Room	USD	90.32	2020-06-10	0	0	2020-06-09 11:48:52.66436	2020-06-09 11:48:52.66436	\N	\N	\N
1070595	204	1	King Bed	USD	223.23	2020-06-10	0	0	2020-06-09 11:48:52.668877	2020-06-09 11:48:52.668877	\N	\N	\N
1070596	295	1	Classic Double or Twin	USD	215.87	2020-06-10	462.91	0	2020-06-09 11:48:52.67283	2020-06-09 11:48:52.67283	\N	\N	\N
1070599	307	1	1 King Bed	USD	498.64	2020-06-10	0	0	2020-06-09 11:48:52.684563	2020-06-09 11:48:52.684563	\N	\N	\N
1070600	302	1	2 Queen Beds 	USD	74	2020-06-10	0	0	2020-06-09 11:48:52.688629	2020-06-09 11:48:52.688629	\N	\N	\N
1070606	249	1	Superior Room - 2 Single Beds	USD	122.14	2020-06-10	0	0	2020-06-09 11:48:52.715872	2020-06-09 11:48:52.715872	\N	\N	\N
1070607	206	1	Standard	USD	83.59	2020-06-10	0	0	2020-06-09 11:48:52.719926	2020-06-09 11:48:52.719926	\N	\N	\N
1070608	263	1	Hilton Room Queen	USD	143.12	2020-06-10	0	0	2020-06-09 11:48:52.723788	2020-06-09 11:48:52.723788	\N	\N	\N
1165538	23	1	1 King Bed Evolution Room 	USD	119	2020-06-11	0	0	2020-06-10 11:48:59.484523	2020-06-10 11:48:59.484523	\N	\N	\N
1165539	45	1	Classic Double or Twin	USD	112.39	2020-06-11	0	0	2020-06-10 11:48:59.507032	2020-06-10 11:48:59.507032	\N	\N	\N
1165540	115	1	Double Room	USD	67.83	2020-06-11	0	0	2020-06-10 11:48:59.5129	2020-06-10 11:48:59.5129	\N	\N	\N
1165541	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.75	2020-06-11	0	0	2020-06-10 11:48:59.517091	2020-06-10 11:48:59.517091	\N	\N	\N
1165542	158	1	Superior Twin Non-Smoking	USD	87.61	2020-06-11	0	0	2020-06-10 11:48:59.521292	2020-06-10 11:48:59.521292	\N	\N	\N
1165543	153	1	Standard Twin Room	USD	181.91	2020-06-11	0	0	2020-06-10 11:48:59.52534	2020-06-10 11:48:59.52534	\N	\N	\N
1165544	131	1	Superior Double Room	USD	52.54	2020-06-11	0	0	2020-06-10 11:48:59.531046	2020-06-10 11:48:59.531046	\N	\N	\N
1165545	176	1	Economy Twin Room	USD	127.86	2020-06-11	0	0	2020-06-10 11:48:59.537619	2020-06-10 11:48:59.537619	\N	\N	\N
1165546	113	1	2 Queen Beds 	USD	169	2020-06-11	0	0	2020-06-10 11:48:59.541863	2020-06-10 11:48:59.541863	\N	\N	\N
1165547	53	1	Superior Twin	USD	129.9	2020-06-11	0	0	2020-06-10 11:48:59.54596	2020-06-10 11:48:59.54596	\N	\N	\N
1165548	143	1	Standard Double Room	USD	200.64	2020-06-11	0	0	2020-06-10 11:48:59.550108	2020-06-10 11:48:59.550108	\N	\N	\N
1165549	108	1	Standard Double Room	USD	84.9	2020-06-11	0	0	2020-06-10 11:48:59.55437	2020-06-10 11:48:59.55437	\N	\N	\N
1165550	13	1	Premium Twin Room with Two Double Beds	USD	129.9	2020-06-11	0	0	2020-06-10 11:48:59.558571	2020-06-10 11:48:59.558571	\N	\N	\N
1165551	8	1	Double Room	USD	195.81	2020-06-11	0	0	2020-06-10 11:48:59.562677	2020-06-10 11:48:59.562677	\N	\N	\N
1165552	64	1	Comfort Room	USD	50.83	2020-06-11	181.47	0	2020-06-10 11:48:59.56655	2020-06-10 11:48:59.56655	\N	\N	\N
1165553	125	1	Standard Double or Twin Room	USD	27	2020-06-11	0	0	2020-06-10 11:48:59.570382	2020-06-10 11:48:59.570382	\N	\N	\N
1165554	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-11	0	0	2020-06-10 11:48:59.57424	2020-06-10 11:48:59.57424	\N	\N	\N
1165555	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-11	0	0	2020-06-10 11:48:59.57814	2020-06-10 11:48:59.57814	\N	\N	\N
1165556	194	1	Standard Small Double Room - Non-Smoking	USD	163.43	2020-06-11	0	0	2020-06-10 11:48:59.583245	2020-06-10 11:48:59.583245	\N	\N	\N
1165557	95	1	 Twin Guestroom	USD	180.98	2020-06-11	0	0	2020-06-10 11:48:59.592171	2020-06-10 11:48:59.592171	\N	\N	\N
1165558	157	1	Superior Room	USD	147.89	2020-06-11	0	0	2020-06-10 11:48:59.59927	2020-06-10 11:48:59.59927	\N	\N	\N
1165559	26	1	Double	USD	69.55	2020-06-11	0	0	2020-06-10 11:48:59.603334	2020-06-10 11:48:59.603334	\N	\N	\N
1165560	61	1	Modern Double Room	USD	192.96	2020-06-11	0	0	2020-06-10 11:48:59.608648	2020-06-10 11:48:59.608648	\N	\N	\N
1165561	181	1	Superior Double Room	USD	61.94	2020-06-11	0	0	2020-06-10 11:48:59.612502	2020-06-10 11:48:59.612502	\N	\N	\N
1165562	49	1	Superior Twin Room	USD	115.54	2020-06-11	0	0	2020-06-10 11:48:59.616284	2020-06-10 11:48:59.616284	\N	\N	\N
1165563	159	1	Standard Room with 1 double bed and sofa	USD	83.74	2020-06-11	0	0	2020-06-10 11:48:59.622195	2020-06-10 11:48:59.622195	\N	\N	\N
1165564	42	1	Standard Twin Room	USD	63.18	2020-06-11	0	0	2020-06-10 11:48:59.626361	2020-06-10 11:48:59.626361	\N	\N	\N
1165565	141	1	Double or Twin Room	USD	93.94	2020-06-11	0	0	2020-06-10 11:48:59.630258	2020-06-10 11:48:59.630258	\N	\N	\N
1165566	90	1	Standard Room	USD	80.42	2020-06-11	321.7	0	2020-06-10 11:48:59.634243	2020-06-10 11:48:59.634243	\N	\N	\N
1165567	106	1	Deluxe Double Room with Balcony	USD	45.12	2020-06-11	0	0	2020-06-10 11:48:59.637991	2020-06-10 11:48:59.637991	\N	\N	\N
1165568	27	1	Standard Twin Room - Smoking	USD	165.72	2020-06-11	539.21	0	2020-06-10 11:48:59.664573	2020-06-10 11:48:59.664573	\N	\N	\N
1165569	77	1	Double Room - North Side	USD	146.25	2020-06-11	0	0	2020-06-10 11:48:59.669465	2020-06-10 11:48:59.669465	\N	\N	\N
1165570	18	1	Superior Room	USD	118.95	2020-06-11	541	0	2020-06-10 11:48:59.673587	2020-06-10 11:48:59.673587	\N	\N	\N
1165571	139	1	Small Double	USD	102.28	2020-06-11	511.42	20	2020-06-10 11:48:59.677916	2020-06-10 11:48:59.677916	\N	\N	\N
1165572	14	1	Classic Double Bed	USD	143.82	2020-06-11	0	0	2020-06-10 11:48:59.682006	2020-06-10 11:48:59.682006	\N	\N	\N
1165573	79	1	Standard Room	USD	90.1	2020-06-11	0	0	2020-06-10 11:48:59.686007	2020-06-10 11:48:59.686007	\N	\N	\N
1165574	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.27	2020-06-11	0	0	2020-06-10 11:48:59.69034	2020-06-10 11:48:59.69034	\N	\N	\N
1165575	67	1	Trendy Garden View Room	USD	203.9	2020-06-11	0	0	2020-06-10 11:48:59.698189	2020-06-10 11:48:59.698189	\N	\N	\N
1165576	160	1	King Accessible with Roll In Shower	USD	109	2020-06-11	0	0	2020-06-10 11:48:59.702111	2020-06-10 11:48:59.702111	\N	\N	\N
1165577	54	1	Double Room	USD	163.52	2020-06-11	808.43	0	2020-06-10 11:48:59.706092	2020-06-10 11:48:59.706092	\N	\N	\N
1165578	47	1	Standard room half board	USD	188.43	2020-06-11	500	0	2020-06-10 11:48:59.711415	2020-06-10 11:48:59.711415	\N	\N	\N
1165579	35	1	Twin - Non-Smoking	USD	97.48	2020-06-11	0	0	2020-06-10 11:48:59.716942	2020-06-10 11:48:59.716942	\N	\N	\N
1165580	38	1	Deluxe Double or Twin Room with Sea View	USD	148.4	2020-06-11	0	0	2020-06-10 11:48:59.723998	2020-06-10 11:48:59.723998	\N	\N	\N
1165581	192	1	Comfort Room	USD	67.83	2020-06-11	226.83	0	2020-06-10 11:48:59.728492	2020-06-10 11:48:59.728492	\N	\N	\N
1165582	165	1	Basic Room	USD	91.77	2020-06-11	0	0	2020-06-10 11:48:59.732553	2020-06-10 11:48:59.732553	\N	\N	\N
1165583	215	1	Deluxe - 3 persons	USD	36.1	2020-06-11	144.41	25	2020-06-10 11:49:00.159749	2020-06-10 11:49:00.159749	\N	\N	\N
1165584	261	1	Superior Twin or Double Room	USD	62.2	2020-06-11	0	0	2020-06-10 11:49:00.164045	2020-06-10 11:49:00.164045	\N	\N	\N
1165585	224	1	Superior King	USD	58.16	2020-06-11	244.26	0	2020-06-10 11:49:00.1684	2020-06-10 11:49:00.1684	\N	\N	\N
1165586	243	1	Classic Twin Room	USD	74.49	2020-06-11	0	0	2020-06-10 11:49:00.172472	2020-06-10 11:49:00.172472	\N	\N	\N
1165587	256	1	Standard Double Room	USD	95.4	2020-06-11	0	0	2020-06-10 11:49:00.178522	2020-06-10 11:49:00.178522	\N	\N	\N
1165589	285	1	Superior Room king bed	USD	106.96	2020-06-11	0	0	2020-06-10 11:49:00.190321	2020-06-10 11:49:00.190321	\N	\N	\N
1165590	314	1	1 Double Bed Non-Smoking	USD	146.59	2020-06-11	0	0	2020-06-10 11:49:00.194445	2020-06-10 11:49:00.194445	\N	\N	\N
1165591	274	1	Double Room - Non-Smoking	USD	260.87	2020-06-11	0	0	2020-06-10 11:49:00.20134	2020-06-10 11:49:00.20134	\N	\N	\N
1165592	306	1	Deluxe King City View	USD	113.18	2020-06-11	301.21	30	2020-06-10 11:49:00.208384	2020-06-10 11:49:00.208384	\N	\N	\N
1165593	290	1	Standard	USD	94.34	2020-06-11	0	0	2020-06-10 11:49:00.215372	2020-06-10 11:49:00.215372	\N	\N	\N
1165596	258	1	Standard Double Room	USD	26.52	2020-06-11	0	0	2020-06-10 11:49:00.228507	2020-06-10 11:49:00.228507	\N	\N	\N
1165597	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-11	0	0	2020-06-10 11:49:00.232409	2020-06-10 11:49:00.232409	\N	\N	\N
1165599	275	1	Double or Twin Room	USD	90.73	2020-06-11	0	0	2020-06-10 11:49:00.241419	2020-06-10 11:49:00.241419	\N	\N	\N
1165600	204	1	King Bed	USD	222.82	2020-06-11	0	0	2020-06-10 11:49:00.245792	2020-06-10 11:49:00.245792	\N	\N	\N
1165601	295	1	Classic Double or Twin	USD	246.42	2020-06-11	0	0	2020-06-10 11:49:00.266827	2020-06-10 11:49:00.266827	\N	\N	\N
1165604	307	1	1 King Bed	USD	501.34	2020-06-11	0	0	2020-06-10 11:49:00.283143	2020-06-10 11:49:00.283143	\N	\N	\N
1165605	302	1	Accessible 1 King Bed	USD	74	2020-06-11	296	0	2020-06-10 11:49:00.28725	2020-06-10 11:49:00.28725	\N	\N	\N
1165608	255	1	Mountain-View Room	USD	370.55	2020-06-11	0	0	2020-06-10 11:49:00.299496	2020-06-10 11:49:00.299496	\N	\N	\N
1165612	249	1	Standard Triple Room	USD	122.69	2020-06-11	0	0	2020-06-10 11:49:00.317707	2020-06-10 11:49:00.317707	\N	\N	\N
1165613	206	1	Standard	USD	83.88	2020-06-11	0	0	2020-06-10 11:49:00.32198	2020-06-10 11:49:00.32198	\N	\N	\N
1165614	263	1	Hilton Room Queen	USD	143.9	2020-06-11	0	0	2020-06-10 11:49:00.326194	2020-06-10 11:49:00.326194	\N	\N	\N
1260121	23	1	1 King Bed Evolution Room 	USD	119	2020-06-12	0	0	2020-06-11 11:48:54.211331	2020-06-11 11:48:54.211331	\N	\N	\N
1260122	45	1	Classic Double or Twin	USD	122.79	2020-06-12	0	0	2020-06-11 11:48:54.229909	2020-06-11 11:48:54.229909	\N	\N	\N
1260123	115	1	Double Room	USD	67.89	2020-06-12	0	0	2020-06-11 11:48:54.239314	2020-06-11 11:48:54.239314	\N	\N	\N
1260124	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	67.05	2020-06-12	0	0	2020-06-11 11:48:54.243649	2020-06-11 11:48:54.243649	\N	\N	\N
1260125	158	1	Superior Twin Non-Smoking	USD	79.03	2020-06-12	0	0	2020-06-11 11:48:54.248	2020-06-11 11:48:54.248	\N	\N	\N
1260126	153	1	Standard Twin Room	USD	121.15	2020-06-12	0	0	2020-06-11 11:48:54.252132	2020-06-11 11:48:54.252132	\N	\N	\N
1260127	131	1	Superior Double Room	USD	52.51	2020-06-12	0	0	2020-06-11 11:48:54.25786	2020-06-11 11:48:54.25786	\N	\N	\N
1260128	176	1	Economy Twin Room	USD	112.47	2020-06-12	0	0	2020-06-11 11:48:54.264334	2020-06-11 11:48:54.264334	\N	\N	\N
1260129	113	1	2 Queen Beds 	USD	169	2020-06-12	0	0	2020-06-11 11:48:54.268462	2020-06-11 11:48:54.268462	\N	\N	\N
1260130	53	1	Superior Twin	USD	130.25	2020-06-12	0	0	2020-06-11 11:48:54.272683	2020-06-11 11:48:54.272683	\N	\N	\N
1260131	143	1	Standard Double Room	USD	173	2020-06-12	0	0	2020-06-11 11:48:54.276908	2020-06-11 11:48:54.276908	\N	\N	\N
1260132	108	1	Standard Double Room	USD	89.75	2020-06-12	0	0	2020-06-11 11:48:54.280922	2020-06-11 11:48:54.280922	\N	\N	\N
1260133	13	1	Premium Twin Room with Two Double Beds	USD	130.25	2020-06-12	0	0	2020-06-11 11:48:54.285054	2020-06-11 11:48:54.285054	\N	\N	\N
1260134	8	1	Double Room	USD	162.9	2020-06-12	0	0	2020-06-11 11:48:54.289141	2020-06-11 11:48:54.289141	\N	\N	\N
1260135	64	1	Comfort Room	USD	48.24	2020-06-12	0	0	2020-06-11 11:48:54.292972	2020-06-11 11:48:54.292972	\N	\N	\N
1260136	125	1	Standard Double or Twin Room	USD	27	2020-06-12	0	0	2020-06-11 11:48:54.296749	2020-06-11 11:48:54.296749	\N	\N	\N
1260137	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-12	0	0	2020-06-11 11:48:54.300961	2020-06-11 11:48:54.300961	\N	\N	\N
1260138	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-12	0	0	2020-06-11 11:48:54.307551	2020-06-11 11:48:54.307551	\N	\N	\N
1260139	194	1	Standard Small Double Room - Non-Smoking	USD	164.17	2020-06-12	0	0	2020-06-11 11:48:54.313586	2020-06-11 11:48:54.313586	\N	\N	\N
1260140	95	1	 Twin Guestroom	USD	181.13	2020-06-12	0	0	2020-06-11 11:48:54.320292	2020-06-11 11:48:54.320292	\N	\N	\N
1260141	157	1	Standard Room	USD	92.59	2020-06-12	108.37	0	2020-06-11 11:48:54.324554	2020-06-11 11:48:54.324554	\N	\N	\N
1260142	26	1	Double	USD	64.25	2020-06-12	0	0	2020-06-11 11:48:54.328779	2020-06-11 11:48:54.328779	\N	\N	\N
1260143	61	1	Modern Double Room	USD	173.36	2020-06-12	0	0	2020-06-11 11:48:54.332784	2020-06-11 11:48:54.332784	\N	\N	\N
1260144	181	1	Superior Double Room	USD	61.94	2020-06-12	0	0	2020-06-11 11:48:54.336974	2020-06-11 11:48:54.336974	\N	\N	\N
1260145	49	1	Superior Twin Room	USD	105.02	2020-06-12	0	0	2020-06-11 11:48:54.367651	2020-06-11 11:48:54.367651	\N	\N	\N
1260146	159	1	Standard Room with 1 double bed and sofa	USD	83.8	2020-06-12	0	0	2020-06-11 11:48:54.373374	2020-06-11 11:48:54.373374	\N	\N	\N
1260147	42	1	Standard Twin Room	USD	63.18	2020-06-12	0	0	2020-06-11 11:48:54.377679	2020-06-11 11:48:54.377679	\N	\N	\N
1260148	141	1	Double or Twin Room	USD	94.39	2020-06-12	0	0	2020-06-11 11:48:54.382288	2020-06-11 11:48:54.382288	\N	\N	\N
1260149	90	1	Standard Room	USD	85.85	2020-06-12	343.42	0	2020-06-11 11:48:54.386425	2020-06-11 11:48:54.386425	\N	\N	\N
1260150	106	1	Double Room with Two Single Beds	USD	40.2	2020-06-12	0	0	2020-06-11 11:48:54.390985	2020-06-11 11:48:54.390985	\N	\N	\N
1260151	27	1	Standard Twin Room - Smoking	USD	166.47	2020-06-12	541.65	0	2020-06-11 11:48:54.394867	2020-06-11 11:48:54.394867	\N	\N	\N
1260152	77	1	Double Room - North Side	USD	146.85	2020-06-12	0	0	2020-06-11 11:48:54.399273	2020-06-11 11:48:54.399273	\N	\N	\N
1260153	31	1	Classic Double or Twin Room with Hill View	USD	316.79	2020-06-12	0	0	2020-06-11 11:48:54.403742	2020-06-11 11:48:54.403742	\N	\N	\N
1260154	18	1	Superior Room	USD	110.97	2020-06-12	500.52	0	2020-06-11 11:48:54.407809	2020-06-11 11:48:54.407809	\N	\N	\N
1260155	139	1	Small Double	USD	102.36	2020-06-12	511.83	20	2020-06-11 11:48:54.412345	2020-06-11 11:48:54.412345	\N	\N	\N
1260156	14	1	Classic Double Bed	USD	118.14	2020-06-12	0	0	2020-06-11 11:48:54.417221	2020-06-11 11:48:54.417221	\N	\N	\N
1260157	79	1	Standard Room	USD	90.17	2020-06-12	0	0	2020-06-11 11:48:54.424151	2020-06-11 11:48:54.424151	\N	\N	\N
1260158	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.61	2020-06-12	0	0	2020-06-11 11:48:54.428248	2020-06-11 11:48:54.428248	\N	\N	\N
1260159	67	1	Trendy Garden View Room	USD	203.9	2020-06-12	0	0	2020-06-11 11:48:54.432327	2020-06-11 11:48:54.432327	\N	\N	\N
1260160	160	1	King Accessible with Roll In Shower	USD	109	2020-06-12	0	0	2020-06-11 11:48:54.464538	2020-06-11 11:48:54.464538	\N	\N	\N
1260161	54	1	Double Room	USD	141.75	2020-06-12	722	0	2020-06-11 11:48:54.469275	2020-06-11 11:48:54.469275	\N	\N	\N
1260162	47	1	Standard room half board	USD	188.43	2020-06-12	500	0	2020-06-11 11:48:54.477801	2020-06-11 11:48:54.477801	\N	\N	\N
1260163	35	1	Twin - Non-Smoking	USD	97.92	2020-06-12	0	0	2020-06-11 11:48:54.485266	2020-06-11 11:48:54.485266	\N	\N	\N
1260164	38	1	Deluxe Double or Twin Room with Sea View	USD	148.51	2020-06-12	0	0	2020-06-11 11:48:54.491276	2020-06-11 11:48:54.491276	\N	\N	\N
1260165	192	1	Comfort Room	USD	67.89	2020-06-12	227.01	0	2020-06-11 11:48:54.49546	2020-06-11 11:48:54.49546	\N	\N	\N
1260166	165	1	Basic Room	USD	91.84	2020-06-12	0	0	2020-06-11 11:48:54.499752	2020-06-11 11:48:54.499752	\N	\N	\N
1260167	215	1	Deluxe - 3 persons	USD	36.1	2020-06-12	144.41	25	2020-06-11 11:48:54.897985	2020-06-11 11:48:54.897985	\N	\N	\N
1260168	261	1	Superior Twin or Double Room	USD	62.2	2020-06-12	0	0	2020-06-11 11:48:54.9026	2020-06-11 11:48:54.9026	\N	\N	\N
1260169	224	1	Superior King	USD	58.41	2020-06-12	245.32	0	2020-06-11 11:48:54.906904	2020-06-11 11:48:54.906904	\N	\N	\N
1260170	243	1	Classic Twin Room	USD	60.52	2020-06-12	0	0	2020-06-11 11:48:54.910965	2020-06-11 11:48:54.910965	\N	\N	\N
1260171	256	1	Standard Double Room	USD	90.17	2020-06-12	0	0	2020-06-11 11:48:54.916927	2020-06-11 11:48:54.916927	\N	\N	\N
1260173	285	1	Superior Room king bed	USD	104.36	2020-06-12	0	0	2020-06-11 11:48:54.933764	2020-06-11 11:48:54.933764	\N	\N	\N
1260174	314	1	1 Double Bed Non-Smoking	USD	146.71	2020-06-12	0	0	2020-06-11 11:48:54.938009	2020-06-11 11:48:54.938009	\N	\N	\N
1260175	274	1	Standard Twin Room - Non-Smoking	USD	262.05	2020-06-12	391.69	0	2020-06-11 11:48:54.94612	2020-06-11 11:48:54.94612	\N	\N	\N
1260176	306	1	Deluxe King City View	USD	113.44	2020-06-12	301.91	30	2020-06-11 11:48:54.954367	2020-06-11 11:48:54.954367	\N	\N	\N
1260177	290	1	Standard	USD	94.42	2020-06-12	0	0	2020-06-11 11:48:54.95861	2020-06-11 11:48:54.95861	\N	\N	\N
1260180	258	1	Standard Double Room	USD	26.48	2020-06-12	0	0	2020-06-11 11:48:54.971265	2020-06-11 11:48:54.971265	\N	\N	\N
1260181	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-12	0	0	2020-06-11 11:48:54.975231	2020-06-11 11:48:54.975231	\N	\N	\N
1260183	275	1	Double or Twin Room	USD	90.81	2020-06-12	0	0	2020-06-11 11:48:54.985993	2020-06-11 11:48:54.985993	\N	\N	\N
1260184	204	1	King Bed	USD	223.2	2020-06-12	0	0	2020-06-11 11:48:54.990215	2020-06-11 11:48:54.990215	\N	\N	\N
1260185	295	1	Classic Double or Twin	USD	256.94	2020-06-12	0	0	2020-06-11 11:48:54.994176	2020-06-11 11:48:54.994176	\N	\N	\N
1260188	307	1	1 King Bed	USD	503.6	2020-06-12	0	0	2020-06-11 11:48:55.042008	2020-06-11 11:48:55.042008	\N	\N	\N
1260189	302	1	Accessible 1 King Bed	USD	84	2020-06-12	300	0	2020-06-11 11:48:55.045996	2020-06-11 11:48:55.045996	\N	\N	\N
1260195	249	1	Standard Triple Room	USD	98.02	2020-06-12	0	0	2020-06-11 11:48:55.071132	2020-06-11 11:48:55.071132	\N	\N	\N
1260196	206	1	Standard	USD	83.96	2020-06-12	0	0	2020-06-11 11:48:55.075055	2020-06-11 11:48:55.075055	\N	\N	\N
1260197	263	1	Queen Hilton Guestroom	USD	130.56	2020-06-12	0	0	2020-06-11 11:48:55.079115	2020-06-11 11:48:55.079115	\N	\N	\N
1352471	23	1	1 King Bed Evolution Room 	USD	119	2020-06-13	0	0	2020-06-12 10:00:49.953358	2020-06-12 10:00:49.953358	\N	\N	\N
1352472	115	1	Double Room	USD	83.83	2020-06-13	0	0	2020-06-12 10:00:49.975023	2020-06-12 10:00:49.975023	\N	\N	\N
1352473	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	82.87	2020-06-13	0	0	2020-06-12 10:00:49.980962	2020-06-12 10:00:49.980962	\N	\N	\N
1352474	158	1	Superior Twin Non-Smoking	USD	78.98	2020-06-13	0	0	2020-06-12 10:00:49.997419	2020-06-12 10:00:49.997419	\N	\N	\N
1352475	153	1	Standard Twin Room	USD	121.31	2020-06-13	0	0	2020-06-12 10:00:50.019664	2020-06-12 10:00:50.019664	\N	\N	\N
1352476	131	1	Superior Double Room	USD	51.86	2020-06-13	0	0	2020-06-12 10:00:50.047753	2020-06-12 10:00:50.047753	\N	\N	\N
1352477	176	1	Economy Twin Room	USD	107.36	2020-06-13	0	0	2020-06-12 10:00:50.054351	2020-06-12 10:00:50.054351	\N	\N	\N
1352478	113	1	2 Queen Beds 	USD	169	2020-06-13	0	0	2020-06-12 10:00:50.059891	2020-06-12 10:00:50.059891	\N	\N	\N
1352479	53	1	Superior Twin	USD	139.59	2020-06-13	0	0	2020-06-12 10:00:50.065846	2020-06-12 10:00:50.065846	\N	\N	\N
1352480	143	1	Standard Double Room	USD	168.96	2020-06-13	0	0	2020-06-12 10:00:50.072339	2020-06-12 10:00:50.072339	\N	\N	\N
1352481	108	1	Standard Double Room	USD	89.78	2020-06-13	0	0	2020-06-12 10:00:50.078234	2020-06-12 10:00:50.078234	\N	\N	\N
1352482	13	1	Premium Twin Room with Two Double Beds	USD	139.59	2020-06-13	0	0	2020-06-12 10:00:50.083831	2020-06-12 10:00:50.083831	\N	\N	\N
1352483	8	1	Double Room	USD	159.1	2020-06-13	0	0	2020-06-12 10:00:50.093292	2020-06-12 10:00:50.093292	\N	\N	\N
1352484	64	1	Comfort Room	USD	48.26	2020-06-13	0	0	2020-06-12 10:00:50.099082	2020-06-12 10:00:50.099082	\N	\N	\N
1352485	125	1	Standard Double or Twin Room	USD	30	2020-06-13	0	0	2020-06-12 10:00:50.104996	2020-06-12 10:00:50.104996	\N	\N	\N
1352486	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-13	0	0	2020-06-12 10:00:50.110617	2020-06-12 10:00:50.110617	\N	\N	\N
1352487	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-13	0	0	2020-06-12 10:00:50.116386	2020-06-12 10:00:50.116386	\N	\N	\N
1352488	194	1	Standard Small Double Room - Non-Smoking	USD	164.96	2020-06-13	0	0	2020-06-12 10:00:50.122453	2020-06-12 10:00:50.122453	\N	\N	\N
1352489	95	1	 Twin Guestroom	USD	181.19	2020-06-13	0	0	2020-06-12 10:00:50.131426	2020-06-12 10:00:50.131426	\N	\N	\N
1352490	157	1	Cosy Small Room	USD	101.74	2020-06-13	0	0	2020-06-12 10:00:50.137534	2020-06-12 10:00:50.137534	\N	\N	\N
1352491	26	1	Double	USD	64.27	2020-06-13	0	0	2020-06-12 10:00:50.143135	2020-06-12 10:00:50.143135	\N	\N	\N
1352492	61	1	Modern Double Room	USD	174.52	2020-06-13	0	0	2020-06-12 10:00:50.148803	2020-06-12 10:00:50.148803	\N	\N	\N
1352493	181	1	Superior Double Room	USD	61.94	2020-06-13	0	0	2020-06-12 10:00:50.169418	2020-06-12 10:00:50.169418	\N	\N	\N
1352494	49	1	Superior Twin Room	USD	115.67	2020-06-13	0	0	2020-06-12 10:00:50.175357	2020-06-12 10:00:50.175357	\N	\N	\N
1352495	159	1	Standard Room with 1 double bed and sofa	USD	83.83	2020-06-13	0	0	2020-06-12 10:00:50.181492	2020-06-12 10:00:50.181492	\N	\N	\N
1352496	42	1	Standard Twin Room	USD	63.18	2020-06-13	0	0	2020-06-12 10:00:50.187224	2020-06-12 10:00:50.187224	\N	\N	\N
1352497	141	1	Double or Twin Room	USD	93.61	2020-06-13	0	0	2020-06-12 10:00:50.193016	2020-06-12 10:00:50.193016	\N	\N	\N
1352498	90	1	Standard Room	USD	87.53	2020-06-13	350.13	0	2020-06-12 10:00:50.19913	2020-06-12 10:00:50.19913	\N	\N	\N
1352499	106	1	Double Room with Two Single Beds	USD	44.01	2020-06-13	0	0	2020-06-12 10:00:50.205445	2020-06-12 10:00:50.205445	\N	\N	\N
1352500	27	1	Standard Twin Room - Smoking	USD	167.27	2020-06-13	544.27	0	2020-06-12 10:00:50.212599	2020-06-12 10:00:50.212599	\N	\N	\N
1352501	77	1	Double Room - North Side	USD	147.83	2020-06-13	0	0	2020-06-12 10:00:50.21856	2020-06-12 10:00:50.21856	\N	\N	\N
1352502	31	1	Classic Double or Twin Room with Hill View	USD	328.25	2020-06-13	0	0	2020-06-12 10:00:50.224199	2020-06-12 10:00:50.224199	\N	\N	\N
1352503	18	1	Superior Room	USD	110.97	2020-06-13	490.13	0	2020-06-12 10:00:50.229891	2020-06-12 10:00:50.229891	\N	\N	\N
1352504	139	1	Small Double	USD	102.4	2020-06-13	512	20	2020-06-12 10:00:50.235599	2020-06-12 10:00:50.235599	\N	\N	\N
1352505	14	1	Classic Double Bed	USD	118.18	2020-06-13	0	0	2020-06-12 10:00:50.241383	2020-06-12 10:00:50.241383	\N	\N	\N
1352506	79	1	Standard Room	USD	100.82	2020-06-13	0	0	2020-06-12 10:00:50.267968	2020-06-12 10:00:50.267968	\N	\N	\N
1352507	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.71	2020-06-13	0	0	2020-06-12 10:00:50.274186	2020-06-12 10:00:50.274186	\N	\N	\N
1352508	67	1	Trendy Garden View Room	USD	203.9	2020-06-13	0	0	2020-06-12 10:00:50.280354	2020-06-12 10:00:50.280354	\N	\N	\N
1352509	160	1	King Accessible with Roll In Shower	USD	109	2020-06-13	0	0	2020-06-12 10:00:50.286259	2020-06-12 10:00:50.286259	\N	\N	\N
1352510	54	1	Double Room	USD	142.7	2020-06-13	726.84	0	2020-06-12 10:00:50.292166	2020-06-12 10:00:50.292166	\N	\N	\N
1352511	47	1	Standard room half board	USD	188.43	2020-06-13	500	0	2020-06-12 10:00:50.298606	2020-06-12 10:00:50.298606	\N	\N	\N
1352512	35	1	Twin - Non-Smoking	USD	108.28	2020-06-13	0	0	2020-06-12 10:00:50.304922	2020-06-12 10:00:50.304922	\N	\N	\N
1352513	38	1	Deluxe Double or Twin Room with Sea View	USD	148.56	2020-06-13	0	0	2020-06-12 10:00:50.311449	2020-06-12 10:00:50.311449	\N	\N	\N
1352514	192	1	Comfort Room	USD	67.91	2020-06-13	227.09	0	2020-06-12 10:00:50.318047	2020-06-12 10:00:50.318047	\N	\N	\N
1352515	165	1	Basic Room	USD	91.87	2020-06-13	0	0	2020-06-12 10:00:50.324039	2020-06-12 10:00:50.324039	\N	\N	\N
1352516	215	1	Deluxe - 3 persons	USD	38.71	2020-06-13	154.84	25	2020-06-12 10:00:50.626555	2020-06-12 10:00:50.626555	\N	\N	\N
1352517	261	1	Superior Twin or Double Room	USD	62.2	2020-06-13	0	0	2020-06-12 10:00:50.633543	2020-06-12 10:00:50.633543	\N	\N	\N
1352518	224	1	Corner Suite	USD	384.87	2020-06-13	0	0	2020-06-12 10:00:50.639197	2020-06-12 10:00:50.639197	\N	\N	\N
1352519	243	1	Classic Twin Room	USD	60.54	2020-06-13	0	0	2020-06-12 10:00:50.644985	2020-06-12 10:00:50.644985	\N	\N	\N
1352520	256	1	Standard Double Room	USD	84.9	2020-06-13	0	0	2020-06-12 10:00:50.651447	2020-06-12 10:00:50.651447	\N	\N	\N
1352521	285	1	Superior Room king bed	USD	102.47	2020-06-13	0	0	2020-06-12 10:00:50.658302	2020-06-12 10:00:50.658302	\N	\N	\N
1352522	314	1	1 Double Bed Non-Smoking	USD	146.76	2020-06-13	0	0	2020-06-12 10:00:50.665745	2020-06-12 10:00:50.665745	\N	\N	\N
1352523	274	1	Small Double Room Non-Smoking	USD	226.14	2020-06-13	0	0	2020-06-12 10:00:50.672961	2020-06-12 10:00:50.672961	\N	\N	\N
1352524	306	1	Deluxe King City View	USD	121.23	2020-06-13	301.77	30	2020-06-12 10:00:50.680209	2020-06-12 10:00:50.680209	\N	\N	\N
1352525	290	1	Standard	USD	94.45	2020-06-13	0	0	2020-06-12 10:00:50.686478	2020-06-12 10:00:50.686478	\N	\N	\N
1352528	258	1	Standard Double Room	USD	26.09	2020-06-13	0	0	2020-06-12 10:00:50.704337	2020-06-12 10:00:50.704337	\N	\N	\N
1352529	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-13	0	0	2020-06-12 10:00:50.710281	2020-06-12 10:00:50.710281	\N	\N	\N
1352531	275	1	Double or Twin Room	USD	90.84	2020-06-13	0	0	2020-06-12 10:00:50.721265	2020-06-12 10:00:50.721265	\N	\N	\N
1352532	204	1	King Bed	USD	220.39	2020-06-13	0	0	2020-06-12 10:00:50.727197	2020-06-12 10:00:50.727197	\N	\N	\N
1352533	295	1	Classic Double or Twin	USD	257.02	2020-06-13	0	0	2020-06-12 10:00:50.733012	2020-06-12 10:00:50.733012	\N	\N	\N
1352536	307	1	1 King Bed	USD	534.15	2020-06-13	0	0	2020-06-12 10:00:50.768236	2020-06-12 10:00:50.768236	\N	\N	\N
1352537	302	1	Accessible 1 King Bed	USD	84	2020-06-13	0	0	2020-06-12 10:00:50.774377	2020-06-12 10:00:50.774377	\N	\N	\N
1352540	255	1	Mountain-View Room	USD	201.68	2020-06-13	0	0	2020-06-12 10:00:50.791923	2020-06-12 10:00:50.791923	\N	\N	\N
1352543	249	1	Standard 1 Double 1 Single Bed	USD	98.06	2020-06-13	0	0	2020-06-12 10:00:50.810643	2020-06-12 10:00:50.810643	\N	\N	\N
1352544	206	1	Standard	USD	72.59	2020-06-13	0	0	2020-06-12 10:00:50.816522	2020-06-12 10:00:50.816522	\N	\N	\N
1352545	263	1	Queen Hilton Guestroom	USD	145.25	2020-06-13	0	0	2020-06-12 10:00:50.822507	2020-06-12 10:00:50.822507	\N	\N	\N
1374509	23	1	1 King Bed Evolution Room 	USD	119	2020-06-14	0	0	2020-06-13 10:00:47.135488	2020-06-13 10:00:47.135488	\N	\N	\N
1374510	45	1	Classic Double or Twin	USD	121.54	2020-06-14	0	0	2020-06-13 10:00:47.157607	2020-06-13 10:00:47.157607	\N	\N	\N
1374511	115	1	Double Room	USD	64.05	2020-06-14	0	0	2020-06-13 10:00:47.164498	2020-06-13 10:00:47.164498	\N	\N	\N
1374512	158	1	Superior Twin Non-Smoking	USD	78.77	2020-06-14	0	0	2020-06-13 10:00:47.180932	2020-06-13 10:00:47.180932	\N	\N	\N
1374513	153	1	Standard Twin Room	USD	159.74	2020-06-14	0	0	2020-06-13 10:00:47.187201	2020-06-13 10:00:47.187201	\N	\N	\N
1374514	131	1	Superior Double Room	USD	52.16	2020-06-14	0	0	2020-06-13 10:00:47.195437	2020-06-13 10:00:47.195437	\N	\N	\N
1374515	176	1	Economy Twin Room	USD	101.11	2020-06-14	0	0	2020-06-13 10:00:47.203087	2020-06-13 10:00:47.203087	\N	\N	\N
1374516	113	1	2 Queen Beds 	USD	169	2020-06-14	0	0	2020-06-13 10:00:47.209001	2020-06-13 10:00:47.209001	\N	\N	\N
1374517	53	1	Superior Twin	USD	116.73	2020-06-14	0	0	2020-06-13 10:00:47.214937	2020-06-13 10:00:47.214937	\N	\N	\N
1374518	143	1	Standard Double Room	USD	167.02	2020-06-14	0	0	2020-06-13 10:00:47.222364	2020-06-13 10:00:47.222364	\N	\N	\N
1374519	108	1	Standard Double Room	USD	84.1	2020-06-14	0	0	2020-06-13 10:00:47.230918	2020-06-13 10:00:47.230918	\N	\N	\N
1374520	13	1	Premium Twin Room with Two Double Beds	USD	127.9	2020-06-14	0	0	2020-06-13 10:00:47.236633	2020-06-13 10:00:47.236633	\N	\N	\N
1374521	8	1	Double Room	USD	188	2020-06-14	0	0	2020-06-13 10:00:47.242561	2020-06-13 10:00:47.242561	\N	\N	\N
1374522	64	1	Comfort Room	USD	41.67	2020-06-14	0	0	2020-06-13 10:00:47.273536	2020-06-13 10:00:47.273536	\N	\N	\N
1374523	125	1	Standard Double or Twin Room	USD	30	2020-06-14	0	0	2020-06-13 10:00:47.279783	2020-06-13 10:00:47.279783	\N	\N	\N
1374524	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-14	0	0	2020-06-13 10:00:47.285757	2020-06-13 10:00:47.285757	\N	\N	\N
1374525	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-14	0	0	2020-06-13 10:00:47.291645	2020-06-13 10:00:47.291645	\N	\N	\N
1374526	194	1	Standard Small Double Room - Non-Smoking	USD	163.75	2020-06-14	0	0	2020-06-13 10:00:47.298174	2020-06-13 10:00:47.298174	\N	\N	\N
1374527	95	1	 Twin Guestroom	USD	179.28	2020-06-14	0	0	2020-06-13 10:00:47.304868	2020-06-13 10:00:47.304868	\N	\N	\N
1374528	157	1	Cosy Small Room	USD	89.64	2020-06-14	0	0	2020-06-13 10:00:47.310643	2020-06-13 10:00:47.310643	\N	\N	\N
1374529	26	1	Double	USD	63.59	2020-06-14	0	0	2020-06-13 10:00:47.31644	2020-06-13 10:00:47.31644	\N	\N	\N
1374530	61	1	Modern Double Room	USD	172	2020-06-14	0	0	2020-06-13 10:00:47.322415	2020-06-13 10:00:47.322415	\N	\N	\N
1374531	181	1	Superior Double Room	USD	61.94	2020-06-14	0	0	2020-06-13 10:00:47.329023	2020-06-13 10:00:47.329023	\N	\N	\N
1374532	49	1	Superior Twin Room	USD	103.94	2020-06-14	0	0	2020-06-13 10:00:47.334725	2020-06-13 10:00:47.334725	\N	\N	\N
1374533	159	1	Standard Room with 1 double bed and sofa	USD	82.95	2020-06-14	0	0	2020-06-13 10:00:47.341044	2020-06-13 10:00:47.341044	\N	\N	\N
1374534	42	1	Standard Twin Room	USD	68.85	2020-06-14	0	0	2020-06-13 10:00:47.346874	2020-06-13 10:00:47.346874	\N	\N	\N
1374535	141	1	Double or Twin Room	USD	93.13	2020-06-14	0	0	2020-06-13 10:00:47.36601	2020-06-13 10:00:47.36601	\N	\N	\N
1374536	90	1	Standard Room	USD	83.34	2020-06-14	333.37	0	2020-06-13 10:00:47.372349	2020-06-13 10:00:47.372349	\N	\N	\N
1374537	106	1	Double Room with Two Single Beds	USD	39.03	2020-06-14	0	0	2020-06-13 10:00:47.378066	2020-06-13 10:00:47.378066	\N	\N	\N
1374538	27	1	Standard Twin Room - Smoking	USD	166.04	2020-06-14	540.26	0	2020-06-13 10:00:47.383734	2020-06-13 10:00:47.383734	\N	\N	\N
1374539	77	1	Double Room - North Side	USD	145.69	2020-06-14	0	0	2020-06-13 10:00:47.389719	2020-06-13 10:00:47.389719	\N	\N	\N
1374540	31	1	Classic Double or Twin Room with Hill View	USD	290.06	2020-06-14	0	0	2020-06-13 10:00:47.395781	2020-06-13 10:00:47.395781	\N	\N	\N
1374541	18	1	Superior Room	USD	110.97	2020-06-14	489.39	0	2020-06-13 10:00:47.401594	2020-06-13 10:00:47.401594	\N	\N	\N
1374542	139	1	Small Double	USD	96.41	2020-06-14	482.06	20	2020-06-13 10:00:47.407447	2020-06-13 10:00:47.407447	\N	\N	\N
1374543	14	1	Classic Double Bed	USD	116.93	2020-06-14	0	0	2020-06-13 10:00:47.4134	2020-06-13 10:00:47.4134	\N	\N	\N
1374544	79	1	Standard Room	USD	57.75	2020-06-14	0	0	2020-06-13 10:00:47.419245	2020-06-13 10:00:47.419245	\N	\N	\N
1374545	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.42	2020-06-14	0	0	2020-06-13 10:00:47.425026	2020-06-13 10:00:47.425026	\N	\N	\N
1374546	67	1	Trendy Garden View Room	USD	213.1	2020-06-14	376.9	45	2020-06-13 10:00:47.431258	2020-06-13 10:00:47.431258	\N	\N	\N
1374547	160	1	King Accessible with Roll In Shower	USD	109	2020-06-14	0	0	2020-06-13 10:00:47.437275	2020-06-13 10:00:47.437275	\N	\N	\N
1374548	54	1	Double Room	USD	140.64	2020-06-14	716.32	0	2020-06-13 10:00:47.443386	2020-06-13 10:00:47.443386	\N	\N	\N
1374549	47	1	Standard room half board	USD	188.43	2020-06-14	500	0	2020-06-13 10:00:47.47107	2020-06-13 10:00:47.47107	\N	\N	\N
1374550	35	1	Twin - Non-Smoking	USD	97.67	2020-06-14	0	0	2020-06-13 10:00:47.477752	2020-06-13 10:00:47.477752	\N	\N	\N
1374551	38	1	Deluxe Double or Twin Room with Sea View	USD	146.99	2020-06-14	0	0	2020-06-13 10:00:47.48429	2020-06-13 10:00:47.48429	\N	\N	\N
1374552	192	1	Comfort Room	USD	67.19	2020-06-14	224.69	0	2020-06-13 10:00:47.490132	2020-06-13 10:00:47.490132	\N	\N	\N
1374553	215	1	Deluxe - 3 persons	USD	36.1	2020-06-14	144.41	25	2020-06-13 10:00:47.965332	2020-06-13 10:00:47.965332	\N	\N	\N
1374554	261	1	Superior Twin or Double Room	USD	62.2	2020-06-14	0	0	2020-06-13 10:00:47.971621	2020-06-13 10:00:47.971621	\N	\N	\N
1374555	224	1	Superior King	USD	58.23	2020-06-14	233.5	0	2020-06-13 10:00:47.97761	2020-06-13 10:00:47.97761	\N	\N	\N
1374556	243	1	Classic Twin Room	USD	59.9	2020-06-14	0	0	2020-06-13 10:00:47.983402	2020-06-13 10:00:47.983402	\N	\N	\N
1374557	256	1	Standard Double Room	USD	89.25	2020-06-14	0	0	2020-06-13 10:00:47.989009	2020-06-13 10:00:47.989009	\N	\N	\N
1374559	285	1	Superior Room king bed	USD	98.79	2020-06-14	0	0	2020-06-13 10:00:48.006398	2020-06-13 10:00:48.006398	\N	\N	\N
1374560	314	1	1 Double Bed Non-Smoking	USD	145.21	2020-06-14	0	0	2020-06-13 10:00:48.013084	2020-06-13 10:00:48.013084	\N	\N	\N
1374561	274	1	Small Double Room Non-Smoking	USD	196.8	2020-06-14	0	0	2020-06-13 10:00:48.020349	2020-06-13 10:00:48.020349	\N	\N	\N
1374562	306	1	Deluxe King City View	USD	121.23	2020-06-14	301.77	30	2020-06-13 10:00:48.027892	2020-06-13 10:00:48.027892	\N	\N	\N
1374563	290	1	Standard	USD	93.45	2020-06-14	0	0	2020-06-13 10:00:48.033909	2020-06-13 10:00:48.033909	\N	\N	\N
1374566	258	1	Standard Double Room	USD	25.71	2020-06-14	0	0	2020-06-13 10:00:48.052455	2020-06-13 10:00:48.052455	\N	\N	\N
1374567	216	1	2 Double Accessible Roll in Shower	USD	109	2020-06-14	0	0	2020-06-13 10:00:48.06684	2020-06-13 10:00:48.06684	\N	\N	\N
1374569	275	1	Double or Twin Room	USD	89.88	2020-06-14	0	0	2020-06-13 10:00:48.078976	2020-06-13 10:00:48.078976	\N	\N	\N
1374570	204	1	King Bed	USD	219.74	2020-06-14	0	0	2020-06-13 10:00:48.084538	2020-06-13 10:00:48.084538	\N	\N	\N
1374571	295	1	Classic Double or Twin	USD	244.1	2020-06-14	0	0	2020-06-13 10:00:48.090229	2020-06-13 10:00:48.090229	\N	\N	\N
1374574	307	1	1 King Bed	USD	502.31	2020-06-14	0	0	2020-06-13 10:00:48.110918	2020-06-13 10:00:48.110918	\N	\N	\N
1374575	302	1	Accessible 1 King Bed	USD	74	2020-06-14	296	0	2020-06-13 10:00:48.116563	2020-06-13 10:00:48.116563	\N	\N	\N
1374578	255	1	Pool-View Room	USD	222.2	2020-06-14	0	0	2020-06-13 10:00:48.134295	2020-06-13 10:00:48.134295	\N	\N	\N
1374581	206	1	Standard	USD	71.9	2020-06-14	0	0	2020-06-13 10:00:48.171712	2020-06-13 10:00:48.171712	\N	\N	\N
1374582	263	1	Queen Hilton Guestroom	USD	130.23	2020-06-14	0	0	2020-06-13 10:00:48.177416	2020-06-13 10:00:48.177416	\N	\N	\N
1398105	23	1	1 King Bed Evolution Room 	USD	119	2020-06-15	0	0	2020-06-14 10:00:44.787674	2020-06-14 10:00:44.787674	\N	\N	\N
1398106	45	1	Classic Double or Twin	USD	121.54	2020-06-15	0	0	2020-06-14 10:00:44.810159	2020-06-14 10:00:44.810159	\N	\N	\N
1398107	115	1	Double Room	USD	64.05	2020-06-15	0	0	2020-06-14 10:00:44.816773	2020-06-14 10:00:44.816773	\N	\N	\N
1398108	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.88	2020-06-15	0	0	2020-06-14 10:00:44.823848	2020-06-14 10:00:44.823848	\N	\N	\N
1398109	158	1	Superior Twin Non-Smoking	USD	87.52	2020-06-15	0	0	2020-06-14 10:00:44.829953	2020-06-14 10:00:44.829953	\N	\N	\N
1398110	153	1	Standard Twin Room	USD	180.24	2020-06-15	0	0	2020-06-14 10:00:44.84532	2020-06-14 10:00:44.84532	\N	\N	\N
1398111	131	1	Superior Double Room	USD	52.16	2020-06-15	0	0	2020-06-14 10:00:44.85101	2020-06-14 10:00:44.85101	\N	\N	\N
1398112	176	1	Economy Twin Room	USD	126.65	2020-06-15	0	0	2020-06-14 10:00:44.860696	2020-06-14 10:00:44.860696	\N	\N	\N
1398113	113	1	2 Queen Beds 	USD	169	2020-06-15	0	0	2020-06-14 10:00:44.866752	2020-06-14 10:00:44.866752	\N	\N	\N
1398114	53	1	Superior Twin	USD	122.31	2020-06-15	0	0	2020-06-14 10:00:44.872841	2020-06-14 10:00:44.872841	\N	\N	\N
1398115	143	1	Standard Double Room	USD	177.27	2020-06-15	0	0	2020-06-14 10:00:44.879374	2020-06-14 10:00:44.879374	\N	\N	\N
1398116	108	1	Standard Double Room	USD	84.1	2020-06-15	0	0	2020-06-14 10:00:44.885159	2020-06-14 10:00:44.885159	\N	\N	\N
1398117	13	1	Premium Twin Room with Two Double Beds	USD	127.9	2020-06-15	0	0	2020-06-14 10:00:44.890704	2020-06-14 10:00:44.890704	\N	\N	\N
1398118	8	1	Superior Double Room	USD	218.72	2020-06-15	0	0	2020-06-14 10:00:44.901031	2020-06-14 10:00:44.901031	\N	\N	\N
1398119	64	1	Comfort Room	USD	50.35	2020-06-15	179.76	0	2020-06-14 10:00:44.907011	2020-06-14 10:00:44.907011	\N	\N	\N
1398120	125	1	Standard Double or Twin Room	USD	30	2020-06-15	0	0	2020-06-14 10:00:44.912736	2020-06-14 10:00:44.912736	\N	\N	\N
1398121	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-15	0	0	2020-06-14 10:00:44.918577	2020-06-14 10:00:44.918577	\N	\N	\N
1398122	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-15	0	0	2020-06-14 10:00:44.924403	2020-06-14 10:00:44.924403	\N	\N	\N
1398123	194	1	Standard Small Double Room - Non-Smoking	USD	163.75	2020-06-15	0	0	2020-06-14 10:00:44.930044	2020-06-14 10:00:44.930044	\N	\N	\N
1398124	95	1	 Twin Guestroom	USD	179.28	2020-06-15	0	0	2020-06-14 10:00:44.935734	2020-06-14 10:00:44.935734	\N	\N	\N
1398125	157	1	Superior Room	USD	144.95	2020-06-15	0	0	2020-06-14 10:00:44.941532	2020-06-14 10:00:44.941532	\N	\N	\N
1398126	26	1	Double	USD	79.49	2020-06-15	0	0	2020-06-14 10:00:44.94764	2020-06-14 10:00:44.94764	\N	\N	\N
1398127	61	1	Modern Double Room	USD	192.24	2020-06-15	0	0	2020-06-14 10:00:44.969297	2020-06-14 10:00:44.969297	\N	\N	\N
1398128	181	1	Superior Double Room	USD	61.94	2020-06-15	0	0	2020-06-14 10:00:44.975251	2020-06-14 10:00:44.975251	\N	\N	\N
1398129	49	1	Superior Twin Room	USD	124.94	2020-06-15	0	0	2020-06-14 10:00:44.980948	2020-06-14 10:00:44.980948	\N	\N	\N
1398130	159	1	Standard Room with 1 double bed and sofa	USD	82.95	2020-06-15	0	0	2020-06-14 10:00:44.987277	2020-06-14 10:00:44.987277	\N	\N	\N
1398131	42	1	Standard Twin Room	USD	81	2020-06-15	0	0	2020-06-14 10:00:44.993017	2020-06-14 10:00:44.993017	\N	\N	\N
1398132	141	1	Double or Twin Room	USD	93.13	2020-06-15	0	0	2020-06-14 10:00:44.998788	2020-06-14 10:00:44.998788	\N	\N	\N
1398133	90	1	Standard Room	USD	83.34	2020-06-15	333.37	0	2020-06-14 10:00:45.107771	2020-06-14 10:00:45.107771	\N	\N	\N
1398134	106	1	Double Room with Two Single Beds	USD	39.03	2020-06-15	0	0	2020-06-14 10:00:45.14553	2020-06-14 10:00:45.14553	\N	\N	\N
1398135	27	1	Standard Twin Room - Smoking	USD	166.04	2020-06-15	540.26	0	2020-06-14 10:00:45.151717	2020-06-14 10:00:45.151717	\N	\N	\N
1398136	77	1	Double Room - North Side	USD	145.69	2020-06-15	0	0	2020-06-14 10:00:45.157658	2020-06-14 10:00:45.157658	\N	\N	\N
1398137	31	1	Classic Double or Twin Room with Hill View	USD	290.06	2020-06-15	0	0	2020-06-14 10:00:45.163447	2020-06-14 10:00:45.163447	\N	\N	\N
1398138	18	1	Superior Room	USD	118.95	2020-06-15	524.6	0	2020-06-14 10:00:45.169379	2020-06-14 10:00:45.169379	\N	\N	\N
1398139	139	1	Small Double	USD	96.41	2020-06-15	482.06	20	2020-06-14 10:00:45.175381	2020-06-14 10:00:45.175381	\N	\N	\N
1398140	14	1	Classic Double Bed	USD	157.79	2020-06-15	0	0	2020-06-14 10:00:45.181238	2020-06-14 10:00:45.181238	\N	\N	\N
1398141	79	1	Standard Room	USD	57.75	2020-06-15	0	0	2020-06-14 10:00:45.187202	2020-06-14 10:00:45.187202	\N	\N	\N
1398142	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.02	2020-06-15	0	0	2020-06-14 10:00:45.193141	2020-06-14 10:00:45.193141	\N	\N	\N
1398143	67	1	Trendy Garden View Room	USD	213.1	2020-06-15	376.9	45	2020-06-14 10:00:45.198974	2020-06-14 10:00:45.198974	\N	\N	\N
1398144	160	1	2 Double Beds	USD	119	2020-06-15	0	0	2020-06-14 10:00:45.20472	2020-06-14 10:00:45.20472	\N	\N	\N
1398145	54	1	Double Room	USD	151.77	2020-06-15	760.84	0	2020-06-14 10:00:45.210394	2020-06-14 10:00:45.210394	\N	\N	\N
1398146	47	1	Standard room half board	USD	188.43	2020-06-15	500	0	2020-06-14 10:00:45.216606	2020-06-14 10:00:45.216606	\N	\N	\N
1398147	35	1	Twin - Non-Smoking	USD	97.67	2020-06-15	0	0	2020-06-14 10:00:45.222273	2020-06-14 10:00:45.222273	\N	\N	\N
1398148	38	1	Deluxe Double or Twin Room with Sea View	USD	146.99	2020-06-15	0	0	2020-06-14 10:00:45.227769	2020-06-14 10:00:45.227769	\N	\N	\N
1398149	192	1	Comfort Room	USD	88.19	2020-06-15	224.69	0	2020-06-14 10:00:45.233335	2020-06-14 10:00:45.233335	\N	\N	\N
1398150	165	1	Basic Room	USD	90.9	2020-06-15	0	0	2020-06-14 10:00:45.23921	2020-06-14 10:00:45.23921	\N	\N	\N
1398151	215	1	Deluxe - 3 persons	USD	36.1	2020-06-15	144.41	25	2020-06-14 10:00:45.63865	2020-06-14 10:00:45.63865	\N	\N	\N
1398152	261	1	Superior Twin or Double Room	USD	62.2	2020-06-15	0	0	2020-06-14 10:00:45.644702	2020-06-14 10:00:45.644702	\N	\N	\N
1398153	224	1	Superior King	USD	58.38	2020-06-15	245.18	0	2020-06-14 10:00:45.650531	2020-06-14 10:00:45.650531	\N	\N	\N
1398154	293	1	Budget Double Room	USD	72.45	2020-06-15	0	0	2020-06-14 10:00:45.658104	2020-06-14 10:00:45.658104	\N	\N	\N
1398155	243	1	Classic Twin Room	USD	73.79	2020-06-15	0	0	2020-06-14 10:00:45.66415	2020-06-14 10:00:45.66415	\N	\N	\N
1398156	256	1	Standard Double Room	USD	105	2020-06-15	0	0	2020-06-14 10:00:45.670011	2020-06-14 10:00:45.670011	\N	\N	\N
1398158	285	1	Superior Room king bed	USD	101.9	2020-06-15	0	0	2020-06-14 10:00:45.681387	2020-06-14 10:00:45.681387	\N	\N	\N
1398160	314	1	1 Double Bed Non-Smoking	USD	145.21	2020-06-15	0	0	2020-06-14 10:00:45.693598	2020-06-14 10:00:45.693598	\N	\N	\N
1398161	274	1	Double Room - Non-Smoking	USD	229.09	2020-06-15	0	0	2020-06-14 10:00:45.699459	2020-06-14 10:00:45.699459	\N	\N	\N
1398162	306	1	Deluxe King City View	USD	116.01	2020-06-15	301.77	30	2020-06-14 10:00:45.706409	2020-06-14 10:00:45.706409	\N	\N	\N
1398163	290	1	Standard	USD	93.45	2020-06-15	0	0	2020-06-14 10:00:45.712298	2020-06-14 10:00:45.712298	\N	\N	\N
1398166	258	1	Standard Double Room	USD	25.71	2020-06-15	0	0	2020-06-14 10:00:45.732252	2020-06-14 10:00:45.732252	\N	\N	\N
1398167	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-15	0	0	2020-06-14 10:00:45.738036	2020-06-14 10:00:45.738036	\N	\N	\N
1398169	275	1	Double or Twin Room	USD	89.88	2020-06-15	0	0	2020-06-14 10:00:45.765627	2020-06-14 10:00:45.765627	\N	\N	\N
1398170	204	1	King Bed	USD	219.74	2020-06-15	0	0	2020-06-14 10:00:45.773397	2020-06-14 10:00:45.773397	\N	\N	\N
1398171	295	1	Classic Double or Twin	USD	244.1	2020-06-15	0	0	2020-06-14 10:00:45.77932	2020-06-14 10:00:45.77932	\N	\N	\N
1398174	307	1	1 King Bed	USD	502.31	2020-06-15	0	0	2020-06-14 10:00:45.798377	2020-06-14 10:00:45.798377	\N	\N	\N
1398175	302	1	Accessible 1 King Bed	USD	79	2020-06-15	300	0	2020-06-14 10:00:45.809124	2020-06-14 10:00:45.809124	\N	\N	\N
1398178	255	1	3rd Floor Mountain-View Double Room	USD	200.64	2020-06-15	0	0	2020-06-14 10:00:45.834261	2020-06-14 10:00:45.834261	\N	\N	\N
1398182	249	1	Standard 1 Double 1 Single Bed	USD	121.54	2020-06-15	0	0	2020-06-14 10:00:45.866379	2020-06-14 10:00:45.866379	\N	\N	\N
1398183	206	1	Standard	USD	82.32	2020-06-15	0	0	2020-06-14 10:00:45.874259	2020-06-14 10:00:45.874259	\N	\N	\N
1398184	263	1	Queen Hilton Guestroom	USD	130.23	2020-06-15	0	0	2020-06-14 10:00:45.879961	2020-06-14 10:00:45.879961	\N	\N	\N
1422645	23	1	1 King Bed Evolution Room 	USD	119	2020-06-16	0	0	2020-06-15 10:00:47.029169	2020-06-15 10:00:47.029169	\N	\N	\N
1422646	45	1	Classic Double or Twin	USD	121.54	2020-06-16	0	0	2020-06-15 10:00:47.05603	2020-06-15 10:00:47.05603	\N	\N	\N
1422647	115	1	Double Room	USD	69.3	2020-06-16	0	0	2020-06-15 10:00:47.064875	2020-06-15 10:00:47.064875	\N	\N	\N
1422648	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.88	2020-06-16	0	0	2020-06-15 10:00:47.071285	2020-06-15 10:00:47.071285	\N	\N	\N
1422649	158	1	Superior Twin Non-Smoking	USD	87.52	2020-06-16	0	0	2020-06-15 10:00:47.07945	2020-06-15 10:00:47.07945	\N	\N	\N
1422650	131	1	Superior Double Room	USD	52.16	2020-06-16	0	0	2020-06-15 10:00:47.09808	2020-06-15 10:00:47.09808	\N	\N	\N
1422651	184	1	Superior Room	USD	86.28	2020-06-16	450.61	0	2020-06-15 10:00:47.1099	2020-06-15 10:00:47.1099	\N	\N	\N
1422652	176	1	Economy Twin Room	USD	126.65	2020-06-16	0	0	2020-06-15 10:00:47.115642	2020-06-15 10:00:47.115642	\N	\N	\N
1422653	113	1	2 Queen Beds 	USD	169	2020-06-16	0	0	2020-06-15 10:00:47.121492	2020-06-15 10:00:47.121492	\N	\N	\N
1422654	53	1	Superior Twin	USD	122.31	2020-06-16	0	0	2020-06-15 10:00:47.127883	2020-06-15 10:00:47.127883	\N	\N	\N
1422655	143	1	Standard Double Room	USD	202.87	2020-06-16	0	0	2020-06-15 10:00:47.13382	2020-06-15 10:00:47.13382	\N	\N	\N
1422656	108	1	Standard Double Room	USD	84.1	2020-06-16	0	0	2020-06-15 10:00:47.139579	2020-06-15 10:00:47.139579	\N	\N	\N
1422657	13	1	Premium Twin Room with Two Double Beds	USD	127.9	2020-06-16	0	0	2020-06-15 10:00:47.166622	2020-06-15 10:00:47.166622	\N	\N	\N
1422658	8	1	Twin Room	USD	188	2020-06-16	0	0	2020-06-15 10:00:47.173165	2020-06-15 10:00:47.173165	\N	\N	\N
1422659	64	1	Comfort Room	USD	50.35	2020-06-16	179.76	0	2020-06-15 10:00:47.178947	2020-06-15 10:00:47.178947	\N	\N	\N
1422660	125	1	Standard Double or Twin Room	USD	30	2020-06-16	0	0	2020-06-15 10:00:47.184753	2020-06-15 10:00:47.184753	\N	\N	\N
1422661	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-16	0	0	2020-06-15 10:00:47.191943	2020-06-15 10:00:47.191943	\N	\N	\N
1422662	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-16	0	0	2020-06-15 10:00:47.19784	2020-06-15 10:00:47.19784	\N	\N	\N
1422663	194	1	Standard Small Double Room - Non-Smoking	USD	167.59	2020-06-16	0	0	2020-06-15 10:00:47.206086	2020-06-15 10:00:47.206086	\N	\N	\N
1422664	95	1	 Twin Guestroom	USD	179.28	2020-06-16	0	0	2020-06-15 10:00:47.212869	2020-06-15 10:00:47.212869	\N	\N	\N
1422665	157	1	Standard Room	USD	144.57	2020-06-16	0	0	2020-06-15 10:00:47.218865	2020-06-15 10:00:47.218865	\N	\N	\N
1422666	26	1	Double	USD	79.49	2020-06-16	0	0	2020-06-15 10:00:47.228616	2020-06-15 10:00:47.228616	\N	\N	\N
1422667	61	1	Modern Double Room	USD	192.24	2020-06-16	0	0	2020-06-15 10:00:47.235754	2020-06-15 10:00:47.235754	\N	\N	\N
1422668	181	1	Superior Double Room	USD	61.94	2020-06-16	0	0	2020-06-15 10:00:47.24152	2020-06-15 10:00:47.24152	\N	\N	\N
1422669	49	1	Superior Twin Room	USD	124.94	2020-06-16	0	0	2020-06-15 10:00:47.247193	2020-06-15 10:00:47.247193	\N	\N	\N
1422670	136	1	Standard Double or Twin Room	USD	118.63	2020-06-16	0	0	2020-06-15 10:00:47.265272	2020-06-15 10:00:47.265272	\N	\N	\N
1422671	159	1	Standard Room with 1 double bed and sofa	USD	82.95	2020-06-16	0	0	2020-06-15 10:00:47.275048	2020-06-15 10:00:47.275048	\N	\N	\N
1422672	42	1	Standard Twin Room	USD	68.85	2020-06-16	0	0	2020-06-15 10:00:47.28125	2020-06-15 10:00:47.28125	\N	\N	\N
1422673	90	1	Standard Room	USD	83.34	2020-06-16	333.37	0	2020-06-15 10:00:47.287123	2020-06-15 10:00:47.287123	\N	\N	\N
1422674	106	1	Double Room with Two Single Beds	USD	39.03	2020-06-16	0	0	2020-06-15 10:00:47.293139	2020-06-15 10:00:47.293139	\N	\N	\N
1422675	27	1	Standard Twin Room - Smoking	USD	166.04	2020-06-16	540.26	0	2020-06-15 10:00:47.299027	2020-06-15 10:00:47.299027	\N	\N	\N
1422676	31	1	Classic Double or Twin Room with Hill View	USD	290.06	2020-06-16	0	0	2020-06-15 10:00:47.304644	2020-06-15 10:00:47.304644	\N	\N	\N
1422677	18	1	Superior Room	USD	118.95	2020-06-16	524.6	0	2020-06-15 10:00:47.310283	2020-06-15 10:00:47.310283	\N	\N	\N
1422678	139	1	Small Double	USD	101.32	2020-06-16	506.59	20	2020-06-15 10:00:47.316191	2020-06-15 10:00:47.316191	\N	\N	\N
1422679	14	1	Classic Double Bed	USD	173.1	2020-06-16	0	0	2020-06-15 10:00:47.322241	2020-06-15 10:00:47.322241	\N	\N	\N
1422680	79	1	Standard Room	USD	57.75	2020-06-16	0	0	2020-06-15 10:00:47.32821	2020-06-15 10:00:47.32821	\N	\N	\N
1422681	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.02	2020-06-16	0	0	2020-06-15 10:00:47.334321	2020-06-15 10:00:47.334321	\N	\N	\N
1422682	67	1	Trendy Garden View Room	USD	213.1	2020-06-16	376.9	45	2020-06-15 10:00:47.340244	2020-06-15 10:00:47.340244	\N	\N	\N
1422683	160	1	King Accessible with Roll In Shower	USD	139	2020-06-16	0	0	2020-06-15 10:00:47.36462	2020-06-15 10:00:47.36462	\N	\N	\N
1422684	183	1	Business Deluxe, Guest room, 1 King	USD	103.7	2020-06-16	0	0	2020-06-15 10:00:47.371493	2020-06-15 10:00:47.371493	\N	\N	\N
1422685	54	1	Double Room	USD	162.9	2020-06-16	805.37	0	2020-06-15 10:00:47.377305	2020-06-15 10:00:47.377305	\N	\N	\N
1422686	47	1	Standard room half board	USD	188.43	2020-06-16	500	0	2020-06-15 10:00:47.388139	2020-06-15 10:00:47.388139	\N	\N	\N
1422687	35	1	Twin - Non-Smoking	USD	97.67	2020-06-16	0	0	2020-06-15 10:00:47.3967	2020-06-15 10:00:47.3967	\N	\N	\N
1422688	38	1	Deluxe Double or Twin Room with Sea View	USD	146.99	2020-06-16	0	0	2020-06-15 10:00:47.404937	2020-06-15 10:00:47.404937	\N	\N	\N
1422689	192	1	Comfort Room	USD	88.19	2020-06-16	224.69	0	2020-06-15 10:00:47.411266	2020-06-15 10:00:47.411266	\N	\N	\N
1422690	165	1	Basic Room	USD	90.9	2020-06-16	0	0	2020-06-15 10:00:47.417307	2020-06-15 10:00:47.417307	\N	\N	\N
1422691	215	1	Deluxe - 3 persons	USD	36.1	2020-06-16	144.41	25	2020-06-15 10:00:47.838533	2020-06-15 10:00:47.838533	\N	\N	\N
1422692	261	1	Superior Twin or Double Room	USD	62.2	2020-06-16	0	0	2020-06-15 10:00:47.84642	2020-06-15 10:00:47.84642	\N	\N	\N
1422693	224	1	Superior King	USD	58.38	2020-06-16	245.18	0	2020-06-15 10:00:47.852686	2020-06-15 10:00:47.852686	\N	\N	\N
1422694	293	1	Budget Double Room	USD	72.45	2020-06-16	0	0	2020-06-15 10:00:47.859831	2020-06-15 10:00:47.859831	\N	\N	\N
1422695	243	1	Classic Twin Room	USD	73.79	2020-06-16	0	0	2020-06-15 10:00:47.86558	2020-06-15 10:00:47.86558	\N	\N	\N
1422696	256	1	Standard Double Room	USD	105	2020-06-16	0	0	2020-06-15 10:00:47.872455	2020-06-15 10:00:47.872455	\N	\N	\N
1422698	285	1	Superior Room king bed	USD	105.01	2020-06-16	0	0	2020-06-15 10:00:47.887149	2020-06-15 10:00:47.887149	\N	\N	\N
1422700	314	1	1 Double Bed Non-Smoking	USD	145.21	2020-06-16	0	0	2020-06-15 10:00:47.899094	2020-06-15 10:00:47.899094	\N	\N	\N
1422701	274	1	Double Room - Non-Smoking	USD	229.09	2020-06-16	0	0	2020-06-15 10:00:47.9087	2020-06-15 10:00:47.9087	\N	\N	\N
1422702	306	1	Deluxe King City View	USD	123.84	2020-06-16	301.77	30	2020-06-15 10:00:47.91769	2020-06-15 10:00:47.91769	\N	\N	\N
1422703	290	1	Standard	USD	93.45	2020-06-16	0	0	2020-06-15 10:00:47.923543	2020-06-15 10:00:47.923543	\N	\N	\N
1422706	258	1	Standard Double Room	USD	25.71	2020-06-16	0	0	2020-06-15 10:00:47.940885	2020-06-15 10:00:47.940885	\N	\N	\N
1422707	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-16	0	0	2020-06-15 10:00:47.948401	2020-06-15 10:00:47.948401	\N	\N	\N
1422709	275	1	Double or Twin Room	USD	89.88	2020-06-16	0	0	2020-06-15 10:00:47.967569	2020-06-15 10:00:47.967569	\N	\N	\N
1422710	204	1	King Bed	USD	219.74	2020-06-16	0	0	2020-06-15 10:00:47.973567	2020-06-15 10:00:47.973567	\N	\N	\N
1422711	295	1	Classic Double or Twin	USD	214.81	2020-06-16	460.62	0	2020-06-15 10:00:47.979441	2020-06-15 10:00:47.979441	\N	\N	\N
1422714	307	1	1 King Bed	USD	502.31	2020-06-16	0	0	2020-06-15 10:00:48.000746	2020-06-15 10:00:48.000746	\N	\N	\N
1422715	302	1	Accessible 1 King Bed	USD	79	2020-06-16	300	0	2020-06-15 10:00:48.008882	2020-06-15 10:00:48.008882	\N	\N	\N
1422718	255	1	3rd Floor Mountain-View Double Room	USD	201.38	2020-06-16	0	0	2020-06-15 10:00:48.028691	2020-06-15 10:00:48.028691	\N	\N	\N
1422722	249	1	Superior Room - 2 Single Beds	USD	121.54	2020-06-16	0	0	2020-06-15 10:00:48.072072	2020-06-15 10:00:48.072072	\N	\N	\N
1422723	206	1	Standard	USD	82.32	2020-06-16	0	0	2020-06-15 10:00:48.078226	2020-06-15 10:00:48.078226	\N	\N	\N
1422724	263	1	Queen Hilton Guestroom	USD	144.18	2020-06-16	0	0	2020-06-15 10:00:48.084971	2020-06-15 10:00:48.084971	\N	\N	\N
1447212	23	1	1 King Bed Evolution Room 	USD	119	2020-06-17	0	0	2020-06-16 10:00:39.70073	2020-06-16 10:00:39.70073	\N	\N	\N
1447213	45	1	Classic Double or Twin	USD	122.1	2020-06-17	0	0	2020-06-16 10:00:39.724673	2020-06-16 10:00:39.724673	\N	\N	\N
1447214	115	1	Double Room	USD	69.62	2020-06-17	0	0	2020-06-16 10:00:39.73253	2020-06-16 10:00:39.73253	\N	\N	\N
1447215	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	67.05	2020-06-17	0	0	2020-06-16 10:00:39.748672	2020-06-16 10:00:39.748672	\N	\N	\N
1447216	158	1	Superior Twin Non-Smoking	USD	87.44	2020-06-17	0	0	2020-06-16 10:00:39.75617	2020-06-16 10:00:39.75617	\N	\N	\N
1447217	131	1	Superior Double Room	USD	52.15	2020-06-17	0	0	2020-06-16 10:00:39.766315	2020-06-16 10:00:39.766315	\N	\N	\N
1447218	184	1	Superior Room	USD	86.28	2020-06-17	450.61	0	2020-06-16 10:00:39.773859	2020-06-16 10:00:39.773859	\N	\N	\N
1447219	176	1	Economy Twin Room	USD	127.23	2020-06-17	0	0	2020-06-16 10:00:39.779949	2020-06-16 10:00:39.779949	\N	\N	\N
1447220	113	1	2 Queen Beds 	USD	169	2020-06-17	0	0	2020-06-16 10:00:39.785943	2020-06-16 10:00:39.785943	\N	\N	\N
1447221	53	1	Superior Twin	USD	122.88	2020-06-17	0	0	2020-06-16 10:00:39.792611	2020-06-16 10:00:39.792611	\N	\N	\N
1447222	143	1	Standard Double Room	USD	205.03	2020-06-17	0	0	2020-06-16 10:00:39.798655	2020-06-16 10:00:39.798655	\N	\N	\N
1447223	108	1	Standard Double Room	USD	84.49	2020-06-17	0	0	2020-06-16 10:00:39.804597	2020-06-16 10:00:39.804597	\N	\N	\N
1447224	13	1	Premium Twin Room with Two Double Beds	USD	128.5	2020-06-17	0	0	2020-06-16 10:00:39.811274	2020-06-16 10:00:39.811274	\N	\N	\N
1447225	8	1	Double Room	USD	190	2020-06-17	0	0	2020-06-16 10:00:39.817198	2020-06-16 10:00:39.817198	\N	\N	\N
1447226	64	1	Comfort Room	USD	50.59	2020-06-17	180.59	0	2020-06-16 10:00:39.822871	2020-06-16 10:00:39.822871	\N	\N	\N
1447227	125	1	Standard Double or Twin Room	USD	30	2020-06-17	0	0	2020-06-16 10:00:39.82867	2020-06-16 10:00:39.82867	\N	\N	\N
1447228	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-17	0	0	2020-06-16 10:00:39.83468	2020-06-16 10:00:39.83468	\N	\N	\N
1447229	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-17	0	0	2020-06-16 10:00:39.840583	2020-06-16 10:00:39.840583	\N	\N	\N
1447230	194	1	Standard Small Double Room - Non-Smoking	USD	171.86	2020-06-17	0	0	2020-06-16 10:00:39.847863	2020-06-16 10:00:39.847863	\N	\N	\N
1447231	95	1	 Twin Guestroom	USD	160.09	2020-06-17	0	0	2020-06-16 10:00:39.864364	2020-06-16 10:00:39.864364	\N	\N	\N
1447232	157	1	Standard Room	USD	145.33	2020-06-17	0	0	2020-06-16 10:00:39.87112	2020-06-16 10:00:39.87112	\N	\N	\N
1447233	26	1	Double	USD	79.85	2020-06-17	0	0	2020-06-16 10:00:39.876823	2020-06-16 10:00:39.876823	\N	\N	\N
1447234	61	1	Modern Double Room	USD	213.51	2020-06-17	0	0	2020-06-16 10:00:39.8825	2020-06-16 10:00:39.8825	\N	\N	\N
1447235	181	1	Superior Double Room	USD	61.94	2020-06-17	0	0	2020-06-16 10:00:39.888229	2020-06-16 10:00:39.888229	\N	\N	\N
1447236	49	1	Superior Twin Room	USD	125.52	2020-06-17	0	0	2020-06-16 10:00:39.893903	2020-06-16 10:00:39.893903	\N	\N	\N
1447237	136	1	Standard Double or Twin Room	USD	117.81	2020-06-17	0	0	2020-06-16 10:00:39.900421	2020-06-16 10:00:39.900421	\N	\N	\N
1447238	159	1	Standard Room with 1 double bed and sofa	USD	83.33	2020-06-17	0	0	2020-06-16 10:00:39.911389	2020-06-16 10:00:39.911389	\N	\N	\N
1447239	42	1	Standard Twin Room	USD	68.85	2020-06-17	0	0	2020-06-16 10:00:39.92054	2020-06-16 10:00:39.92054	\N	\N	\N
1447240	90	1	Standard Room	USD	83.73	2020-06-17	334.91	0	2020-06-16 10:00:39.926857	2020-06-16 10:00:39.926857	\N	\N	\N
1447241	106	1	Double Room with Two Single Beds	USD	38.09	2020-06-17	0	0	2020-06-16 10:00:39.93277	2020-06-16 10:00:39.93277	\N	\N	\N
1447242	27	1	Standard Twin Room - Smoking	USD	166.45	2020-06-17	541.6	0	2020-06-16 10:00:39.938543	2020-06-16 10:00:39.938543	\N	\N	\N
1447243	77	1	Double Room - North Side	USD	137.25	2020-06-17	0	0	2020-06-16 10:00:39.944303	2020-06-16 10:00:39.944303	\N	\N	\N
1447244	31	1	Classic Double or Twin Room with Hill View	USD	291.4	2020-06-17	0	0	2020-06-16 10:00:39.951353	2020-06-16 10:00:39.951353	\N	\N	\N
1447245	18	1	Superior Room	USD	118.95	2020-06-17	522.82	0	2020-06-16 10:00:39.966394	2020-06-16 10:00:39.966394	\N	\N	\N
1447246	139	1	Small Double	USD	101.79	2020-06-17	508.94	20	2020-06-16 10:00:39.978229	2020-06-16 10:00:39.978229	\N	\N	\N
1447247	14	1	Classic Double Bed	USD	173.91	2020-06-17	0	0	2020-06-16 10:00:39.984324	2020-06-16 10:00:39.984324	\N	\N	\N
1447248	79	1	Standard Room	USD	58.01	2020-06-17	0	0	2020-06-16 10:00:39.990607	2020-06-16 10:00:39.990607	\N	\N	\N
1447249	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.25	2020-06-17	0	0	2020-06-16 10:00:39.998767	2020-06-16 10:00:39.998767	\N	\N	\N
1447250	67	1	Trendy Garden View Room	USD	213.1	2020-06-17	376.9	45	2020-06-16 10:00:40.055096	2020-06-16 10:00:40.055096	\N	\N	\N
1447251	160	1	2 Double Beds	USD	119	2020-06-17	0	0	2020-06-16 10:00:40.061664	2020-06-16 10:00:40.061664	\N	\N	\N
1447252	183	1	Business Deluxe, Guest room, 1 King	USD	102.86	2020-06-17	0	0	2020-06-16 10:00:40.067622	2020-06-16 10:00:40.067622	\N	\N	\N
1447253	54	1	Double Room	USD	163.69	2020-06-17	809.28	0	2020-06-16 10:00:40.073951	2020-06-16 10:00:40.073951	\N	\N	\N
1447254	47	1	Standard room half board	USD	188.43	2020-06-17	500	0	2020-06-16 10:00:40.082552	2020-06-16 10:00:40.082552	\N	\N	\N
1447255	35	1	Twin - Non-Smoking	USD	97.91	2020-06-17	0	0	2020-06-16 10:00:40.090823	2020-06-16 10:00:40.090823	\N	\N	\N
1447256	38	1	Deluxe Double or Twin Room with Sea View	USD	147.67	2020-06-17	0	0	2020-06-16 10:00:40.098049	2020-06-16 10:00:40.098049	\N	\N	\N
1447257	192	1	Comfort Room	USD	88.6	2020-06-17	225.73	0	2020-06-16 10:00:40.103794	2020-06-16 10:00:40.103794	\N	\N	\N
1447258	165	1	Basic Room	USD	91.32	2020-06-17	0	0	2020-06-16 10:00:40.109585	2020-06-16 10:00:40.109585	\N	\N	\N
1447259	215	1	Deluxe - 3 persons	USD	34.84	2020-06-17	139.36	25	2020-06-16 10:00:40.579485	2020-06-16 10:00:40.579485	\N	\N	\N
1447260	261	1	Superior Twin or Double Room	USD	62.2	2020-06-17	0	0	2020-06-16 10:00:40.957896	2020-06-16 10:00:40.957896	\N	\N	\N
1447261	224	1	Superior King	USD	52.48	2020-06-17	244.91	0	2020-06-16 10:00:40.96388	2020-06-16 10:00:40.96388	\N	\N	\N
1447262	301	1	Comfort Double or Twin Room	USD	132.36	2020-06-17	0	0	2020-06-16 10:00:40.971128	2020-06-16 10:00:40.971128	\N	\N	\N
1447263	293	1	Budget Double Room	USD	72.79	2020-06-17	0	0	2020-06-16 10:00:40.977196	2020-06-16 10:00:40.977196	\N	\N	\N
1447264	243	1	Classic Twin Room	USD	74.13	2020-06-17	0	0	2020-06-16 10:00:40.982923	2020-06-16 10:00:40.982923	\N	\N	\N
1447265	256	1	Standard Double Room	USD	105.49	2020-06-17	0	0	2020-06-16 10:00:40.990229	2020-06-16 10:00:40.990229	\N	\N	\N
1447267	285	1	Superior Room king bed	USD	118.13	2020-06-17	0	0	2020-06-16 10:00:41.004254	2020-06-16 10:00:41.004254	\N	\N	\N
1447269	314	1	1 Double Bed Non-Smoking	USD	145.88	2020-06-17	0	0	2020-06-16 10:00:41.016429	2020-06-16 10:00:41.016429	\N	\N	\N
1447270	274	1	Small Double Room Non-Smoking	USD	197.29	2020-06-17	0	0	2020-06-16 10:00:41.025751	2020-06-16 10:00:41.025751	\N	\N	\N
1447271	306	1	Deluxe King City View	USD	123.73	2020-06-17	301.49	30	2020-06-16 10:00:41.03748	2020-06-16 10:00:41.03748	\N	\N	\N
1447272	290	1	Standard	USD	93.88	2020-06-17	0	0	2020-06-16 10:00:41.043472	2020-06-16 10:00:41.043472	\N	\N	\N
1447275	258	1	Standard Double Room	USD	25.09	2020-06-17	0	0	2020-06-16 10:00:41.064341	2020-06-16 10:00:41.064341	\N	\N	\N
1447276	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-17	0	0	2020-06-16 10:00:41.07116	2020-06-16 10:00:41.07116	\N	\N	\N
1447278	275	1	Double or Twin Room	USD	90.29	2020-06-17	0	0	2020-06-16 10:00:41.083471	2020-06-16 10:00:41.083471	\N	\N	\N
1447279	204	1	King Bed	USD	192.83	2020-06-17	0	0	2020-06-16 10:00:41.092271	2020-06-16 10:00:41.092271	\N	\N	\N
1447280	295	1	Classic Double or Twin	USD	215.8	2020-06-17	462.75	0	2020-06-16 10:00:41.098213	2020-06-16 10:00:41.098213	\N	\N	\N
1447283	307	1	1 King Bed	USD	503.55	2020-06-17	0	0	2020-06-16 10:00:41.11793	2020-06-16 10:00:41.11793	\N	\N	\N
1447284	302	1	2 Queen Beds 	USD	84	2020-06-17	0	0	2020-06-16 10:00:41.125727	2020-06-16 10:00:41.125727	\N	\N	\N
1447287	255	1	Mountain-View Room	USD	245.84	2020-06-17	0	0	2020-06-16 10:00:41.14403	2020-06-16 10:00:41.14403	\N	\N	\N
1447290	249	1	Standard 1 Double 1 Single Bed	USD	122.1	2020-06-17	0	0	2020-06-16 10:00:41.174701	2020-06-16 10:00:41.174701	\N	\N	\N
1447291	206	1	Standard	USD	82.72	2020-06-17	0	0	2020-06-16 10:00:41.180703	2020-06-16 10:00:41.180703	\N	\N	\N
1447292	263	1	Queen Hilton Guestroom	USD	144.53	2020-06-17	0	0	2020-06-16 10:00:41.186535	2020-06-16 10:00:41.186535	\N	\N	\N
1471815	23	1	1 King Bed Evolution Room 	USD	119	2020-06-18	0	0	2020-06-17 10:00:50.498105	2020-06-17 10:00:50.498105	\N	\N	\N
1471816	45	1	Classic Double or Twin	USD	121.89	2020-06-18	0	0	2020-06-17 10:00:50.530404	2020-06-17 10:00:50.530404	\N	\N	\N
1471817	115	1	Double Room	USD	64.24	2020-06-18	0	0	2020-06-17 10:00:50.548885	2020-06-17 10:00:50.548885	\N	\N	\N
1471818	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.99	2020-06-18	0	0	2020-06-17 10:00:50.555919	2020-06-17 10:00:50.555919	\N	\N	\N
1471819	158	1	Superior Twin Non-Smoking	USD	87.49	2020-06-18	0	0	2020-06-17 10:00:50.563917	2020-06-17 10:00:50.563917	\N	\N	\N
1471820	153	1	Standard Twin Room	USD	180.72	2020-06-18	0	0	2020-06-17 10:00:50.570441	2020-06-17 10:00:50.570441	\N	\N	\N
1471821	131	1	Superior Double Room	USD	52.38	2020-06-18	0	0	2020-06-17 10:00:50.581593	2020-06-17 10:00:50.581593	\N	\N	\N
1471822	184	1	Superior Room	USD	84.03	2020-06-18	441.61	0	2020-06-17 10:00:50.590212	2020-06-17 10:00:50.590212	\N	\N	\N
1471823	176	1	Economy Twin Room	USD	116.78	2020-06-18	0	0	2020-06-17 10:00:50.597193	2020-06-17 10:00:50.597193	\N	\N	\N
1471824	113	1	2 Queen Beds 	USD	169	2020-06-18	0	0	2020-06-17 10:00:50.60424	2020-06-17 10:00:50.60424	\N	\N	\N
1471825	53	1	Superior Twin	USD	128.56	2020-06-18	0	0	2020-06-17 10:00:50.611143	2020-06-17 10:00:50.611143	\N	\N	\N
1471826	143	1	Standard Double Room	USD	169.13	2020-06-18	0	0	2020-06-17 10:00:50.617935	2020-06-17 10:00:50.617935	\N	\N	\N
1471827	108	1	Standard Double Room	USD	84.35	2020-06-18	0	0	2020-06-17 10:00:50.624471	2020-06-17 10:00:50.624471	\N	\N	\N
1471828	13	1	Premium Twin Room with Two Double Beds	USD	120.76	2020-06-18	0	0	2020-06-17 10:00:50.631545	2020-06-17 10:00:50.631545	\N	\N	\N
1471829	8	1	Twin Room	USD	190.36	2020-06-18	0	0	2020-06-17 10:00:50.637984	2020-06-17 10:00:50.637984	\N	\N	\N
1471830	64	1	Comfort Room	USD	50.5	2020-06-18	180.28	0	2020-06-17 10:00:50.643813	2020-06-17 10:00:50.643813	\N	\N	\N
1471831	125	1	Standard Double or Twin Room	USD	30	2020-06-18	0	0	2020-06-17 10:00:50.650106	2020-06-17 10:00:50.650106	\N	\N	\N
1471832	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-18	0	0	2020-06-17 10:00:50.656672	2020-06-17 10:00:50.656672	\N	\N	\N
1471833	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-18	0	0	2020-06-17 10:00:50.662623	2020-06-17 10:00:50.662623	\N	\N	\N
1471834	95	1	 Twin Guestroom	USD	159.82	2020-06-18	0	0	2020-06-17 10:00:50.672145	2020-06-17 10:00:50.672145	\N	\N	\N
1471835	157	1	Standard Room	USD	91.18	2020-06-18	106.71	0	2020-06-17 10:00:50.678261	2020-06-17 10:00:50.678261	\N	\N	\N
1471836	26	1	Double	USD	79.72	2020-06-18	0	0	2020-06-17 10:00:50.68407	2020-06-17 10:00:50.68407	\N	\N	\N
1471837	61	1	Modern Double Room	USD	213.3	2020-06-18	0	0	2020-06-17 10:00:50.690104	2020-06-17 10:00:50.690104	\N	\N	\N
1471838	109	1	Classic Double Room	USD	187.45	2020-06-18	0	0	2020-06-17 10:00:50.696573	2020-06-17 10:00:50.696573	\N	\N	\N
1471839	181	1	Superior Double Room	USD	61.94	2020-06-18	0	0	2020-06-17 10:00:50.706394	2020-06-17 10:00:50.706394	\N	\N	\N
1471840	49	1	Superior Twin Room	USD	104.25	2020-06-18	0	0	2020-06-17 10:00:50.712305	2020-06-17 10:00:50.712305	\N	\N	\N
1471841	136	1	Standard Double or Twin Room	USD	212.87	2020-06-18	0	0	2020-06-17 10:00:50.718048	2020-06-17 10:00:50.718048	\N	\N	\N
1471842	159	1	Standard Room with 1 double bed and sofa	USD	83.19	2020-06-18	0	0	2020-06-17 10:00:50.730341	2020-06-17 10:00:50.730341	\N	\N	\N
1471843	42	1	Standard Twin Room	USD	68.85	2020-06-18	0	0	2020-06-17 10:00:50.736242	2020-06-17 10:00:50.736242	\N	\N	\N
1471844	90	1	Standard Room	USD	83.59	2020-06-18	334.34	0	2020-06-17 10:00:50.741996	2020-06-17 10:00:50.741996	\N	\N	\N
1471845	106	1	Double Room with Two Single Beds	USD	34.68	2020-06-18	0	0	2020-06-17 10:00:50.747774	2020-06-17 10:00:50.747774	\N	\N	\N
1471846	27	1	Standard Twin Room - Smoking	USD	166.3	2020-06-18	541.13	0	2020-06-17 10:00:50.753771	2020-06-17 10:00:50.753771	\N	\N	\N
1471847	77	1	Double Room - North Side	USD	137.12	2020-06-18	0	0	2020-06-17 10:00:50.759572	2020-06-17 10:00:50.759572	\N	\N	\N
1471848	31	1	Classic Double or Twin Room with Hill View	USD	290.91	2020-06-18	0	0	2020-06-17 10:00:50.768973	2020-06-17 10:00:50.768973	\N	\N	\N
1471849	18	1	Superior Room	USD	118.95	2020-06-18	527.09	0	2020-06-17 10:00:50.774891	2020-06-17 10:00:50.774891	\N	\N	\N
1471850	139	1	Small Double	USD	101.61	2020-06-18	508.08	20	2020-06-17 10:00:50.780611	2020-06-17 10:00:50.780611	\N	\N	\N
1471851	14	1	Classic Double Bed	USD	158.25	2020-06-18	0	0	2020-06-17 10:00:50.786294	2020-06-17 10:00:50.786294	\N	\N	\N
1471852	79	1	Standard Room	USD	57.92	2020-06-18	0	0	2020-06-17 10:00:50.791897	2020-06-17 10:00:50.791897	\N	\N	\N
1471853	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.17	2020-06-18	0	0	2020-06-17 10:00:50.797919	2020-06-17 10:00:50.797919	\N	\N	\N
1471854	67	1	Trendy Garden View Room	USD	213.1	2020-06-18	376.9	45	2020-06-17 10:00:50.803678	2020-06-17 10:00:50.803678	\N	\N	\N
1471855	160	1	King Accessible with Roll In Shower	USD	109	2020-06-18	0	0	2020-06-17 10:00:50.809393	2020-06-17 10:00:50.809393	\N	\N	\N
1471856	183	1	Business Deluxe, Guest room, 1 King	USD	102.86	2020-06-18	0	0	2020-06-17 10:00:50.815288	2020-06-17 10:00:50.815288	\N	\N	\N
1471857	54	1	Double Room	USD	163.53	2020-06-18	808.51	0	2020-06-17 10:00:50.820849	2020-06-17 10:00:50.820849	\N	\N	\N
1471858	47	1	Standard room half board	USD	188.43	2020-06-18	500	0	2020-06-17 10:00:50.828368	2020-06-17 10:00:50.828368	\N	\N	\N
1471859	35	1	Twin - Non-Smoking	USD	97.83	2020-06-18	0	0	2020-06-17 10:00:50.838545	2020-06-17 10:00:50.838545	\N	\N	\N
1471860	38	1	Deluxe Double or Twin Room with Sea View	USD	147.43	2020-06-18	0	0	2020-06-17 10:00:50.846079	2020-06-17 10:00:50.846079	\N	\N	\N
1471861	192	1	Comfort Room	USD	77.93	2020-06-18	225.35	0	2020-06-17 10:00:50.852051	2020-06-17 10:00:50.852051	\N	\N	\N
1471862	165	1	Basic Room	USD	91.17	2020-06-18	0	0	2020-06-17 10:00:50.869355	2020-06-17 10:00:50.869355	\N	\N	\N
1471863	215	1	Deluxe - 3 persons	USD	34.84	2020-06-18	139.36	25	2020-06-17 10:00:51.329231	2020-06-17 10:00:51.329231	\N	\N	\N
1471864	261	1	Superior Twin or Double Room	USD	62.2	2020-06-18	0	0	2020-06-17 10:00:51.33813	2020-06-17 10:00:51.33813	\N	\N	\N
1471865	224	1	Superior King	USD	52.52	2020-06-18	245.1	0	2020-06-17 10:00:51.343814	2020-06-17 10:00:51.343814	\N	\N	\N
1471866	301	1	Comfort Double or Twin Room	USD	132.14	2020-06-18	0	0	2020-06-17 10:00:51.351293	2020-06-17 10:00:51.351293	\N	\N	\N
1471867	293	1	Budget Double Room	USD	72.66	2020-06-18	0	0	2020-06-17 10:00:51.357259	2020-06-17 10:00:51.357259	\N	\N	\N
1471868	243	1	Classic Twin Room	USD	74.01	2020-06-18	0	0	2020-06-17 10:00:51.363288	2020-06-17 10:00:51.363288	\N	\N	\N
1471869	256	1	Standard Double Room	USD	105.31	2020-06-18	0	0	2020-06-17 10:00:51.37032	2020-06-17 10:00:51.37032	\N	\N	\N
1471871	285	1	Superior Room king bed	USD	118.41	2020-06-18	0	0	2020-06-17 10:00:51.388535	2020-06-17 10:00:51.388535	\N	\N	\N
1471873	314	1	1 Double Bed Non-Smoking	USD	145.63	2020-06-18	0	0	2020-06-17 10:00:51.405911	2020-06-17 10:00:51.405911	\N	\N	\N
1471874	274	1	Standard Twin Room - Non-Smoking	USD	229.46	2020-06-18	391.31	0	2020-06-17 10:00:51.413968	2020-06-17 10:00:51.413968	\N	\N	\N
1471875	306	1	Deluxe King City View	USD	123.79	2020-06-18	301.63	30	2020-06-17 10:00:51.423492	2020-06-17 10:00:51.423492	\N	\N	\N
1471876	290	1	Standard	USD	93.72	2020-06-18	0	0	2020-06-17 10:00:51.429287	2020-06-17 10:00:51.429287	\N	\N	\N
1471879	258	1	Standard Double Room	USD	33.37	2020-06-18	0	0	2020-06-17 10:00:51.446599	2020-06-17 10:00:51.446599	\N	\N	\N
1471880	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-18	0	0	2020-06-17 10:00:51.452338	2020-06-17 10:00:51.452338	\N	\N	\N
1471882	275	1	Double or Twin Room	USD	95.77	2020-06-18	0	0	2020-06-17 10:00:51.464302	2020-06-17 10:00:51.464302	\N	\N	\N
1471883	204	1	King Bed	USD	193.07	2020-06-18	0	0	2020-06-17 10:00:51.470132	2020-06-17 10:00:51.470132	\N	\N	\N
1471884	295	1	Classic Double or Twin	USD	215.44	2020-06-18	461.97	0	2020-06-17 10:00:51.47617	2020-06-17 10:00:51.47617	\N	\N	\N
1471887	307	1	1 King Bed	USD	503.12	2020-06-18	0	0	2020-06-17 10:00:51.499233	2020-06-17 10:00:51.499233	\N	\N	\N
1471888	302	1	2 Queen Beds 	USD	84	2020-06-18	0	0	2020-06-17 10:00:51.506111	2020-06-17 10:00:51.506111	\N	\N	\N
1471891	255	1	3rd Floor Mountain-View Double Room	USD	387.01	2020-06-18	0	0	2020-06-17 10:00:51.524444	2020-06-17 10:00:51.524444	\N	\N	\N
1471894	249	1	Standard Triple Room	USD	121.89	2020-06-18	0	0	2020-06-17 10:00:51.544191	2020-06-17 10:00:51.544191	\N	\N	\N
1471895	206	1	Standard	USD	82.89	2020-06-18	0	0	2020-06-17 10:00:51.550232	2020-06-17 10:00:51.550232	\N	\N	\N
1471896	263	1	Queen Hilton Guestroom	USD	130.44	2020-06-18	0	0	2020-06-17 10:00:51.569201	2020-06-17 10:00:51.569201	\N	\N	\N
1496571	23	1	1 King Bed Evolution Room 	USD	99	2020-06-19	0	0	2020-06-18 10:00:51.20149	2020-06-18 10:00:51.20149	\N	\N	\N
1496572	45	1	Classic Double or Twin	USD	121.51	2020-06-19	0	0	2020-06-18 10:00:51.2316	2020-06-18 10:00:51.2316	\N	\N	\N
1496573	115	1	Double Room	USD	64.03	2020-06-19	0	0	2020-06-18 10:00:51.24771	2020-06-18 10:00:51.24771	\N	\N	\N
1496574	75	1	Small Single Room - Non-Smoking (2 Adult)	USD	67.02	2020-06-19	0	0	2020-06-18 10:00:51.254109	2020-06-18 10:00:51.254109	\N	\N	\N
1496575	158	1	Superior Twin Non-Smoking	USD	78.75	2020-06-19	0	0	2020-06-18 10:00:51.261646	2020-06-18 10:00:51.261646	\N	\N	\N
1496576	153	1	Standard Twin Room	USD	119.88	2020-06-19	0	0	2020-06-18 10:00:51.267525	2020-06-18 10:00:51.267525	\N	\N	\N
1496577	131	1	Superior Double Room	USD	52.15	2020-06-19	0	0	2020-06-18 10:00:51.277148	2020-06-18 10:00:51.277148	\N	\N	\N
1496578	184	1	Superior Room	USD	79.05	2020-06-19	417.77	0	2020-06-18 10:00:51.285075	2020-06-18 10:00:51.285075	\N	\N	\N
1496579	176	1	Economy Twin Room	USD	116.41	2020-06-19	0	0	2020-06-18 10:00:51.290794	2020-06-18 10:00:51.290794	\N	\N	\N
1496580	113	1	2 Queen Beds 	USD	169	2020-06-19	0	0	2020-06-18 10:00:51.29714	2020-06-18 10:00:51.29714	\N	\N	\N
1496581	53	1	Superior Twin	USD	140.11	2020-06-19	0	0	2020-06-18 10:00:51.302973	2020-06-18 10:00:51.302973	\N	\N	\N
1496582	143	1	Standard Double Room	USD	152.97	2020-06-19	0	0	2020-06-18 10:00:51.308606	2020-06-18 10:00:51.308606	\N	\N	\N
1496583	108	1	Standard Double Room	USD	88.81	2020-06-19	0	0	2020-06-18 10:00:51.314435	2020-06-18 10:00:51.314435	\N	\N	\N
1496584	13	1	Premium Twin Room with Two Double Beds	USD	126.1	2020-06-19	0	0	2020-06-18 10:00:51.321765	2020-06-18 10:00:51.321765	\N	\N	\N
1496585	8	1	Twin Room	USD	159.86	2020-06-19	0	0	2020-06-18 10:00:51.327461	2020-06-18 10:00:51.327461	\N	\N	\N
1496586	64	1	Comfort Room	USD	47.74	2020-06-19	179.71	0	2020-06-18 10:00:51.333524	2020-06-18 10:00:51.333524	\N	\N	\N
1496587	125	1	Standard Double or Twin Room	USD	30	2020-06-19	0	0	2020-06-18 10:00:51.339553	2020-06-18 10:00:51.339553	\N	\N	\N
1496588	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-19	0	0	2020-06-18 10:00:51.345145	2020-06-18 10:00:51.345145	\N	\N	\N
1496589	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-19	0	0	2020-06-18 10:00:51.351103	2020-06-18 10:00:51.351103	\N	\N	\N
1496590	194	1	1 Small Double Standard Non-Smoking	USD	175.55	2020-06-19	0	0	2020-06-18 10:00:51.369565	2020-06-18 10:00:51.369565	\N	\N	\N
1496591	95	1	 Twin Guestroom	USD	159.32	2020-06-19	0	0	2020-06-18 10:00:51.376872	2020-06-18 10:00:51.376872	\N	\N	\N
1496592	157	1	Standard Room	USD	91.35	2020-06-19	106.92	0	2020-06-18 10:00:51.383316	2020-06-18 10:00:51.383316	\N	\N	\N
1496593	26	1	Double	USD	63.57	2020-06-19	0	0	2020-06-18 10:00:51.388948	2020-06-18 10:00:51.388948	\N	\N	\N
1496594	61	1	Modern Double Room	USD	192.76	2020-06-19	0	0	2020-06-18 10:00:51.394786	2020-06-18 10:00:51.394786	\N	\N	\N
1496595	109	1	Classic Double Room	USD	186.86	2020-06-19	0	0	2020-06-18 10:00:51.400981	2020-06-18 10:00:51.400981	\N	\N	\N
1496596	181	1	Superior Double Room	USD	61.94	2020-06-19	0	0	2020-06-18 10:00:51.407039	2020-06-18 10:00:51.407039	\N	\N	\N
1496597	49	1	Superior Twin Room	USD	114.42	2020-06-19	0	0	2020-06-18 10:00:51.413046	2020-06-18 10:00:51.413046	\N	\N	\N
1496598	159	1	Standard Room with 1 double bed and sofa	USD	82.93	2020-06-19	0	0	2020-06-18 10:00:51.423488	2020-06-18 10:00:51.423488	\N	\N	\N
1496599	42	1	Standard Twin Room	USD	68.85	2020-06-19	0	0	2020-06-18 10:00:51.43017	2020-06-18 10:00:51.43017	\N	\N	\N
1496600	90	1	Standard Room	USD	85.77	2020-06-19	343.09	0	2020-06-18 10:00:51.435964	2020-06-18 10:00:51.435964	\N	\N	\N
1496601	106	1	Deluxe Double Room with Balcony	USD	38.24	2020-06-19	0	0	2020-06-18 10:00:51.44192	2020-06-18 10:00:51.44192	\N	\N	\N
1496602	27	1	Standard Twin Room - Smoking	USD	166.38	2020-06-19	541.36	0	2020-06-18 10:00:51.451006	2020-06-18 10:00:51.451006	\N	\N	\N
1496603	77	1	Double Room - North Side	USD	136.96	2020-06-19	0	0	2020-06-18 10:00:51.465104	2020-06-18 10:00:51.465104	\N	\N	\N
1496604	31	1	Classic Double or Twin Room with Hill View	USD	313.48	2020-06-19	0	0	2020-06-18 10:00:51.471772	2020-06-18 10:00:51.471772	\N	\N	\N
1496605	18	1	Superior Room	USD	110.97	2020-06-19	490.22	0	2020-06-18 10:00:51.477767	2020-06-18 10:00:51.477767	\N	\N	\N
1496606	139	1	Small Double	USD	101.29	2020-06-19	506.48	20	2020-06-18 10:00:51.48355	2020-06-18 10:00:51.48355	\N	\N	\N
1496607	14	1	Classic Double Bed	USD	116.9	2020-06-19	0	0	2020-06-18 10:00:51.489328	2020-06-18 10:00:51.489328	\N	\N	\N
1496608	79	1	Standard Room	USD	57.73	2020-06-19	0	0	2020-06-18 10:00:51.496682	2020-06-18 10:00:51.496682	\N	\N	\N
1496609	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.21	2020-06-19	0	0	2020-06-18 10:00:51.50273	2020-06-18 10:00:51.50273	\N	\N	\N
1496610	67	1	Trendy Garden View Room	USD	213.1	2020-06-19	376.9	45	2020-06-18 10:00:51.508772	2020-06-18 10:00:51.508772	\N	\N	\N
1496611	160	1	1 King Bed	USD	94	2020-06-19	0	0	2020-06-18 10:00:51.514677	2020-06-18 10:00:51.514677	\N	\N	\N
1496612	183	1	Business Deluxe, Guest room, 1 King	USD	102.86	2020-06-19	0	0	2020-06-18 10:00:51.521058	2020-06-18 10:00:51.521058	\N	\N	\N
1496613	54	1	Double Room	USD	141.02	2020-06-19	718.27	0	2020-06-18 10:00:51.526965	2020-06-18 10:00:51.526965	\N	\N	\N
1496614	47	1	Standard room half board	USD	188.43	2020-06-19	500	0	2020-06-18 10:00:51.534515	2020-06-18 10:00:51.534515	\N	\N	\N
1496615	35	1	Twin - Non-Smoking	USD	97.87	2020-06-19	0	0	2020-06-18 10:00:51.54191	2020-06-18 10:00:51.54191	\N	\N	\N
1496616	38	1	Deluxe Double or Twin Room with Sea View	USD	146.96	2020-06-19	0	0	2020-06-18 10:00:51.56687	2020-06-18 10:00:51.56687	\N	\N	\N
1496617	192	1	Comfort Room	USD	67.18	2020-06-19	224.64	0	2020-06-18 10:00:51.573053	2020-06-18 10:00:51.573053	\N	\N	\N
1496618	165	1	Basic Room	USD	90.88	2020-06-19	0	0	2020-06-18 10:00:51.580285	2020-06-18 10:00:51.580285	\N	\N	\N
1496619	215	1	Deluxe - 3 persons	USD	36.1	2020-06-19	144.41	25	2020-06-18 10:00:51.967834	2020-06-18 10:00:51.967834	\N	\N	\N
1496620	261	1	Superior Twin or Double Room	USD	62.2	2020-06-19	0	0	2020-06-18 10:00:51.976555	2020-06-18 10:00:51.976555	\N	\N	\N
1496621	224	1	Superior King	USD	52.61	2020-06-19	245.51	0	2020-06-18 10:00:51.982506	2020-06-18 10:00:51.982506	\N	\N	\N
1496622	300	1	Deluxe Room, Guest room, 2 Twin/Single Bed(s)	USD	162.04	2020-06-19	0	0	2020-06-18 10:00:51.990251	2020-06-18 10:00:51.990251	\N	\N	\N
1496623	301	1	Comfort Double or Twin Room	USD	131.72	2020-06-19	0	0	2020-06-18 10:00:51.996597	2020-06-18 10:00:51.996597	\N	\N	\N
1496624	293	1	Budget Double Room	USD	72.44	2020-06-19	0	0	2020-06-18 10:00:52.0036	2020-06-18 10:00:52.0036	\N	\N	\N
1496625	243	1	Classic Twin Room	USD	59.89	2020-06-19	0	0	2020-06-18 10:00:52.00971	2020-06-18 10:00:52.00971	\N	\N	\N
1496626	256	1	Standard Double Room	USD	94.47	2020-06-19	0	0	2020-06-18 10:00:52.016942	2020-06-18 10:00:52.016942	\N	\N	\N
1496628	285	1	Superior Room king bed	USD	112.37	2020-06-19	0	0	2020-06-18 10:00:52.034412	2020-06-18 10:00:52.034412	\N	\N	\N
1496630	314	1	1 Double Bed Non-Smoking	USD	145.18	2020-06-19	0	0	2020-06-18 10:00:52.046018	2020-06-18 10:00:52.046018	\N	\N	\N
1496631	274	1	Standard Twin Room - Non-Smoking	USD	229.56	2020-06-19	391.48	0	2020-06-18 10:00:52.0555	2020-06-18 10:00:52.0555	\N	\N	\N
1496632	306	1	Deluxe King City View	USD	117.52	2020-06-19	301.63	30	2020-06-18 10:00:52.064313	2020-06-18 10:00:52.064313	\N	\N	\N
1496633	290	1	Standard	USD	93.43	2020-06-19	0	0	2020-06-18 10:00:52.07048	2020-06-18 10:00:52.07048	\N	\N	\N
1496636	258	1	Standard Double Room	USD	32.94	2020-06-19	0	0	2020-06-18 10:00:52.089499	2020-06-18 10:00:52.089499	\N	\N	\N
1496637	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-19	0	0	2020-06-18 10:00:52.095309	2020-06-18 10:00:52.095309	\N	\N	\N
1496639	275	1	Double or Twin Room	USD	95.47	2020-06-19	0	0	2020-06-18 10:00:52.108084	2020-06-18 10:00:52.108084	\N	\N	\N
1496640	204	1	King Bed	USD	193.3	2020-06-19	0	0	2020-06-18 10:00:52.114011	2020-06-18 10:00:52.114011	\N	\N	\N
1496641	295	1	Classic Double or Twin	USD	223.74	2020-06-19	460.52	0	2020-06-18 10:00:52.121585	2020-06-18 10:00:52.121585	\N	\N	\N
1496644	307	1	1 King Bed	USD	503.33	2020-06-19	0	0	2020-06-18 10:00:52.142595	2020-06-18 10:00:52.142595	\N	\N	\N
1496645	302	1	Accessible 1 King Bed	USD	89	2020-06-19	300	0	2020-06-18 10:00:52.164363	2020-06-18 10:00:52.164363	\N	\N	\N
1496650	206	1	Standard	USD	82.56	2020-06-19	0	0	2020-06-18 10:00:52.199542	2020-06-18 10:00:52.199542	\N	\N	\N
1496651	263	1	Queen Hilton Guestroom	USD	130.49	2020-06-19	0	0	2020-06-18 10:00:52.205366	2020-06-18 10:00:52.205366	\N	\N	\N
1520565	23	1	2 Queen Mobility Hearing Accessible with Roll in Shower	USD	104	2020-06-20	0	0	2020-06-19 10:00:43.742363	2020-06-19 10:00:43.742363	\N	\N	\N
1520566	45	1	Classic Double or Twin	USD	121.05	2020-06-20	0	0	2020-06-19 10:00:43.771536	2020-06-19 10:00:43.771536	\N	\N	\N
1520567	115	1	Double Room	USD	106.67	2020-06-20	0	0	2020-06-19 10:00:43.79448	2020-06-19 10:00:43.79448	\N	\N	\N
1520568	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	82.73	2020-06-20	0	0	2020-06-19 10:00:43.801477	2020-06-19 10:00:43.801477	\N	\N	\N
1520569	158	1	Superior Twin Non-Smoking	USD	78.71	2020-06-20	0	0	2020-06-19 10:00:43.809586	2020-06-19 10:00:43.809586	\N	\N	\N
1520570	153	1	Standard Twin Room	USD	112.28	2020-06-20	0	0	2020-06-19 10:00:43.816015	2020-06-19 10:00:43.816015	\N	\N	\N
1520571	131	1	Superior Double Room	USD	52.05	2020-06-20	0	0	2020-06-19 10:00:43.829338	2020-06-19 10:00:43.829338	\N	\N	\N
1520572	184	1	Superior Room	USD	78.03	2020-06-20	413.69	0	2020-06-19 10:00:43.837818	2020-06-19 10:00:43.837818	\N	\N	\N
1520573	176	1	Economy Twin Room	USD	115.97	2020-06-20	0	0	2020-06-19 10:00:43.843956	2020-06-19 10:00:43.843956	\N	\N	\N
1520574	113	1	2 Queen Beds 	USD	169	2020-06-20	0	0	2020-06-19 10:00:43.849711	2020-06-19 10:00:43.849711	\N	\N	\N
1520575	53	1	Superior Twin	USD	167	2020-06-20	0	0	2020-06-19 10:00:43.855462	2020-06-19 10:00:43.855462	\N	\N	\N
1520576	143	1	Business Room	USD	215.86	2020-06-20	0	0	2020-06-19 10:00:43.869209	2020-06-19 10:00:43.869209	\N	\N	\N
1520577	108	1	Standard Double Room	USD	88.47	2020-06-20	0	0	2020-06-19 10:00:43.875057	2020-06-19 10:00:43.875057	\N	\N	\N
1520578	13	1	Premium King Room	USD	165.38	2020-06-20	0	0	2020-06-19 10:00:43.883542	2020-06-19 10:00:43.883542	\N	\N	\N
1520579	8	1	Queen Room	USD	158.94	2020-06-20	0	0	2020-06-19 10:00:43.889877	2020-06-19 10:00:43.889877	\N	\N	\N
1520580	64	1	Comfort Room	USD	47.56	2020-06-20	0	0	2020-06-19 10:00:43.899648	2020-06-19 10:00:43.899648	\N	\N	\N
1520581	125	1	Standard Double or Twin Room	USD	30	2020-06-20	0	0	2020-06-19 10:00:43.906215	2020-06-19 10:00:43.906215	\N	\N	\N
1520582	199	1	Standard Room with 1 double bed	USD	34.84	2020-06-20	0	0	2020-06-19 10:00:43.912467	2020-06-19 10:00:43.912467	\N	\N	\N
1520583	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-20	0	0	2020-06-19 10:00:43.918445	2020-06-19 10:00:43.918445	\N	\N	\N
1520584	194	1	Standard Small Double Room - Non-Smoking	USD	168.56	2020-06-20	0	0	2020-06-19 10:00:43.927058	2020-06-19 10:00:43.927058	\N	\N	\N
1520585	95	1	 Twin Guestroom	USD	158.72	2020-06-20	0	0	2020-06-19 10:00:43.938828	2020-06-19 10:00:43.938828	\N	\N	\N
1520586	157	1	Standard Room	USD	90.35	2020-06-20	105.74	0	2020-06-19 10:00:43.94506	2020-06-19 10:00:43.94506	\N	\N	\N
1520587	26	1	Double	USD	63.33	2020-06-20	0	0	2020-06-19 10:00:43.950861	2020-06-19 10:00:43.950861	\N	\N	\N
1520588	61	1	Modern Double Room	USD	172.18	2020-06-20	0	0	2020-06-19 10:00:43.956838	2020-06-19 10:00:43.956838	\N	\N	\N
1520589	109	1	Classic Double Room	USD	197.34	2020-06-20	0	0	2020-06-19 10:00:43.966814	2020-06-19 10:00:43.966814	\N	\N	\N
1520590	181	1	Superior Double Room	USD	61.94	2020-06-20	0	0	2020-06-19 10:00:43.972956	2020-06-19 10:00:43.972956	\N	\N	\N
1520591	49	1	Superior Double Room	USD	113.99	2020-06-20	0	0	2020-06-19 10:00:43.978763	2020-06-19 10:00:43.978763	\N	\N	\N
1520592	136	1	Standard Double or Twin Room	USD	119.04	2020-06-20	0	0	2020-06-19 10:00:43.988466	2020-06-19 10:00:43.988466	\N	\N	\N
1520593	159	1	Standard Room with 1 double bed and sofa	USD	82.61	2020-06-20	0	0	2020-06-19 10:00:43.998504	2020-06-19 10:00:43.998504	\N	\N	\N
1520594	42	1	Standard Twin Room	USD	68.85	2020-06-20	0	0	2020-06-19 10:00:44.006524	2020-06-19 10:00:44.006524	\N	\N	\N
1520595	90	1	Standard Room	USD	86.26	2020-06-20	345.04	0	2020-06-19 10:00:44.012398	2020-06-19 10:00:44.012398	\N	\N	\N
1520596	106	1	Deluxe Double Room with Balcony	USD	45.95	2020-06-20	0	0	2020-06-19 10:00:44.018554	2020-06-19 10:00:44.018554	\N	\N	\N
1520597	27	1	Standard Twin Room - Smoking	USD	167	2020-06-20	543.4	0	2020-06-19 10:00:44.024568	2020-06-19 10:00:44.024568	\N	\N	\N
1520598	77	1	Double Room - North Side	USD	136.73	2020-06-20	0	0	2020-06-19 10:00:44.03038	2020-06-19 10:00:44.03038	\N	\N	\N
1520599	31	1	Classic Double or Twin Room with Hill View	USD	323.48	2020-06-20	0	0	2020-06-19 10:00:44.036265	2020-06-19 10:00:44.036265	\N	\N	\N
1520600	18	1	Superior Room	USD	110.97	2020-06-20	491.55	0	2020-06-19 10:00:44.042083	2020-06-19 10:00:44.042083	\N	\N	\N
1520601	139	1	Small Double	USD	100.91	2020-06-20	504.55	20	2020-06-19 10:00:44.047976	2020-06-19 10:00:44.047976	\N	\N	\N
1520602	14	1	Classic Double Bed	USD	116.46	2020-06-20	0	0	2020-06-19 10:00:44.064334	2020-06-19 10:00:44.064334	\N	\N	\N
1520603	79	1	Standard Room	USD	57.51	2020-06-20	0	0	2020-06-19 10:00:44.070713	2020-06-19 10:00:44.070713	\N	\N	\N
1520604	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.56	2020-06-20	0	0	2020-06-19 10:00:44.076846	2020-06-19 10:00:44.076846	\N	\N	\N
1520605	67	1	Trendy Garden View Room	USD	213.1	2020-06-20	376.9	45	2020-06-19 10:00:44.082791	2020-06-19 10:00:44.082791	\N	\N	\N
1520606	160	1	1 King Bed	USD	94	2020-06-20	0	0	2020-06-19 10:00:44.089295	2020-06-19 10:00:44.089295	\N	\N	\N
1520607	183	1	Business Deluxe, Guest room, 1 King	USD	102.86	2020-06-20	0	0	2020-06-19 10:00:44.095359	2020-06-19 10:00:44.095359	\N	\N	\N
1520608	54	1	Double Room	USD	140.78	2020-06-20	717.07	0	2020-06-19 10:00:44.103225	2020-06-19 10:00:44.103225	\N	\N	\N
1520609	47	1	Standard room half board	USD	188.43	2020-06-20	500	0	2020-06-19 10:00:44.111066	2020-06-19 10:00:44.111066	\N	\N	\N
1520610	35	1	Twin - Non-Smoking	USD	108.1	2020-06-20	0	0	2020-06-19 10:00:44.117967	2020-06-19 10:00:44.117967	\N	\N	\N
1520611	38	1	Deluxe Double or Twin Room with Sea View	USD	146.4	2020-06-20	0	0	2020-06-19 10:00:44.126176	2020-06-19 10:00:44.126176	\N	\N	\N
1520612	192	1	Comfort Room	USD	66.92	2020-06-20	223.79	0	2020-06-19 10:00:44.132607	2020-06-19 10:00:44.132607	\N	\N	\N
1520613	165	1	Basic Room	USD	90.53	2020-06-20	0	0	2020-06-19 10:00:44.138737	2020-06-19 10:00:44.138737	\N	\N	\N
1520614	215	1	Deluxe - 3 persons	USD	36.1	2020-06-20	144.4	25	2020-06-19 10:00:44.670951	2020-06-19 10:00:44.670951	\N	\N	\N
1520615	261	1	Superior Twin or Double Room	USD	62.2	2020-06-20	0	0	2020-06-19 10:00:44.680033	2020-06-19 10:00:44.680033	\N	\N	\N
1520616	224	1	Superior King	USD	52.63	2020-06-20	267.49	0	2020-06-19 10:00:44.685892	2020-06-19 10:00:44.685892	\N	\N	\N
1520617	300	1	Deluxe Room, Guest room, 2 Twin/Single Bed(s)	USD	162.04	2020-06-20	0	0	2020-06-19 10:00:44.693573	2020-06-19 10:00:44.693573	\N	\N	\N
1520618	301	1	Comfort Double or Twin Room	USD	131.22	2020-06-20	0	0	2020-06-19 10:00:44.699306	2020-06-19 10:00:44.699306	\N	\N	\N
1520619	293	1	Budget Double Room	USD	72.16	2020-06-20	0	0	2020-06-19 10:00:44.704996	2020-06-19 10:00:44.704996	\N	\N	\N
1520620	243	1	Classic Twin Room	USD	59.66	2020-06-20	0	0	2020-06-19 10:00:44.710838	2020-06-19 10:00:44.710838	\N	\N	\N
1520621	256	1	Standard Double Room	USD	94.11	2020-06-20	0	0	2020-06-19 10:00:44.7185	2020-06-19 10:00:44.7185	\N	\N	\N
1520622	285	1	Superior Room king bed	USD	114.43	2020-06-20	0	0	2020-06-19 10:00:44.727547	2020-06-19 10:00:44.727547	\N	\N	\N
1520624	314	1	1 Double Bed Non-Smoking	USD	202.67	2020-06-20	0	0	2020-06-19 10:00:44.741488	2020-06-19 10:00:44.741488	\N	\N	\N
1520625	274	1	Standard Twin Room - Non-Smoking	USD	278.36	2020-06-20	392.95	0	2020-06-19 10:00:44.750575	2020-06-19 10:00:44.750575	\N	\N	\N
1520626	306	1	Deluxe King City View	USD	117.55	2020-06-20	301.7	30	2020-06-19 10:00:44.760015	2020-06-19 10:00:44.760015	\N	\N	\N
1520627	290	1	Standard	USD	93.07	2020-06-20	0	0	2020-06-19 10:00:44.766469	2020-06-19 10:00:44.766469	\N	\N	\N
1520630	258	1	Standard Double Room	USD	32.22	2020-06-20	0	0	2020-06-19 10:00:44.790223	2020-06-19 10:00:44.790223	\N	\N	\N
1520631	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-20	0	0	2020-06-19 10:00:44.796301	2020-06-19 10:00:44.796301	\N	\N	\N
1520633	275	1	Double or Twin Room	USD	95.11	2020-06-20	0	0	2020-06-19 10:00:44.808794	2020-06-19 10:00:44.808794	\N	\N	\N
1520634	204	1	King Bed	USD	192.52	2020-06-20	0	0	2020-06-19 10:00:44.8147	2020-06-19 10:00:44.8147	\N	\N	\N
1520635	295	1	Classic Double or Twin	USD	222.89	2020-06-20	458.77	0	2020-06-19 10:00:44.82062	2020-06-19 10:00:44.82062	\N	\N	\N
1520638	307	1	1 King Bed	USD	533.29	2020-06-20	0	0	2020-06-19 10:00:44.843996	2020-06-19 10:00:44.843996	\N	\N	\N
1520639	302	1	Accessible 1 King Bed	USD	79	2020-06-20	300	0	2020-06-19 10:00:44.852539	2020-06-19 10:00:44.852539	\N	\N	\N
1520642	255	1	Mountain-View Room	USD	202.08	2020-06-20	0	0	2020-06-19 10:00:44.880119	2020-06-19 10:00:44.880119	\N	\N	\N
1520645	206	1	Standard	USD	71.34	2020-06-20	0	0	2020-06-19 10:00:44.906354	2020-06-19 10:00:44.906354	\N	\N	\N
1520646	263	1	Queen Hilton Guestroom	USD	154.38	2020-06-20	0	0	2020-06-19 10:00:44.912226	2020-06-19 10:00:44.912226	\N	\N	\N
1543436	23	1	1 King Bed Evolution Room 	USD	119	2020-06-21	0	0	2020-06-20 10:00:42.389287	2020-06-20 10:00:42.389287	\N	\N	\N
1543437	45	1	Classic Double or Twin	USD	121.07	2020-06-21	0	0	2020-06-20 10:00:42.414832	2020-06-20 10:00:42.414832	\N	\N	\N
1543438	115	1	Double Room	USD	63.81	2020-06-21	0	0	2020-06-20 10:00:42.436988	2020-06-20 10:00:42.436988	\N	\N	\N
1543439	158	1	Superior Twin Non-Smoking	USD	78.91	2020-06-21	0	0	2020-06-20 10:00:42.445621	2020-06-20 10:00:42.445621	\N	\N	\N
1543440	153	1	Standard Twin Room	USD	159.11	2020-06-21	0	0	2020-06-20 10:00:42.451374	2020-06-20 10:00:42.451374	\N	\N	\N
1543441	131	1	Superior Double Room	USD	52.15	2020-06-21	0	0	2020-06-20 10:00:42.459885	2020-06-20 10:00:42.459885	\N	\N	\N
1543442	184	1	Superior Room	USD	76.99	2020-06-21	409.51	0	2020-06-20 10:00:42.467554	2020-06-20 10:00:42.467554	\N	\N	\N
1543443	176	1	Economy Twin Room	USD	115.99	2020-06-21	0	0	2020-06-20 10:00:42.473649	2020-06-20 10:00:42.473649	\N	\N	\N
1543444	113	1	2 Queen Beds 	USD	169	2020-06-21	0	0	2020-06-20 10:00:42.480128	2020-06-20 10:00:42.480128	\N	\N	\N
1543445	53	1	Superior Twin	USD	127.86	2020-06-21	0	0	2020-06-20 10:00:42.486192	2020-06-20 10:00:42.486192	\N	\N	\N
1543446	143	1	Standard Double Room	USD	151.37	2020-06-21	0	0	2020-06-20 10:00:42.491922	2020-06-20 10:00:42.491922	\N	\N	\N
1543447	108	1	Standard Double Room	USD	83.78	2020-06-21	0	0	2020-06-20 10:00:42.498498	2020-06-20 10:00:42.498498	\N	\N	\N
1543448	13	1	Premium Twin Room with Two Double Beds	USD	120.1	2020-06-21	0	0	2020-06-20 10:00:42.506806	2020-06-20 10:00:42.506806	\N	\N	\N
1543449	8	1	Double Room	USD	189.09	2020-06-21	0	0	2020-06-20 10:00:42.51346	2020-06-20 10:00:42.51346	\N	\N	\N
1543450	64	1	Comfort Room	USD	41.51	2020-06-21	0	0	2020-06-20 10:00:42.519638	2020-06-20 10:00:42.519638	\N	\N	\N
1543451	125	1	Standard Double or Twin Room	USD	30	2020-06-21	0	0	2020-06-20 10:00:42.525376	2020-06-20 10:00:42.525376	\N	\N	\N
1543452	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-21	0	0	2020-06-20 10:00:42.531263	2020-06-20 10:00:42.531263	\N	\N	\N
1543453	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-21	0	0	2020-06-20 10:00:42.537371	2020-06-20 10:00:42.537371	\N	\N	\N
1543454	194	1	Standard Small Double Room - Non-Smoking	USD	168.63	2020-06-21	0	0	2020-06-20 10:00:42.546362	2020-06-20 10:00:42.546362	\N	\N	\N
1543455	95	1	 Twin Guestroom	USD	158.75	2020-06-21	0	0	2020-06-20 10:00:42.570019	2020-06-20 10:00:42.570019	\N	\N	\N
1543456	157	1	Cosy Small Room	USD	88.85	2020-06-21	0	0	2020-06-20 10:00:42.576268	2020-06-20 10:00:42.576268	\N	\N	\N
1543457	26	1	Double	USD	79.18	2020-06-21	0	0	2020-06-20 10:00:42.582093	2020-06-20 10:00:42.582093	\N	\N	\N
1543458	61	1	Modern Double Room	USD	172.3	2020-06-21	0	0	2020-06-20 10:00:42.587857	2020-06-20 10:00:42.587857	\N	\N	\N
1543459	109	1	Classic Double Room	USD	162.79	2020-06-21	0	0	2020-06-20 10:00:42.593731	2020-06-20 10:00:42.593731	\N	\N	\N
1543460	181	1	Superior Double Room	USD	61.94	2020-06-21	0	0	2020-06-20 10:00:42.599598	2020-06-20 10:00:42.599598	\N	\N	\N
1543461	49	1	Superior Twin Room	USD	103.55	2020-06-21	0	0	2020-06-20 10:00:42.605042	2020-06-20 10:00:42.605042	\N	\N	\N
1543462	136	1	Standard Double or Twin Room	USD	130.97	2020-06-21	0	0	2020-06-20 10:00:42.613652	2020-06-20 10:00:42.613652	\N	\N	\N
1543463	159	1	Standard Room with 1 double bed and sofa	USD	82.63	2020-06-21	0	0	2020-06-20 10:00:42.623099	2020-06-20 10:00:42.623099	\N	\N	\N
1543464	42	1	Standard Twin Room	USD	68.85	2020-06-21	0	0	2020-06-20 10:00:42.629487	2020-06-20 10:00:42.629487	\N	\N	\N
1543465	90	1	Standard Room	USD	83.02	2020-06-21	332.1	0	2020-06-20 10:00:42.635506	2020-06-20 10:00:42.635506	\N	\N	\N
1543466	106	1	Deluxe Double Room with Balcony	USD	46.19	2020-06-21	0	0	2020-06-20 10:00:42.643599	2020-06-20 10:00:42.643599	\N	\N	\N
1543467	27	1	Standard Twin Room - Smoking	USD	167.07	2020-06-21	543.63	0	2020-06-20 10:00:42.649328	2020-06-20 10:00:42.649328	\N	\N	\N
1543468	77	1	Double Room - North Side	USD	145.95	2020-06-21	0	0	2020-06-20 10:00:42.665245	2020-06-20 10:00:42.665245	\N	\N	\N
1543469	31	1	Classic Double or Twin Room with Hill View	USD	312.36	2020-06-21	0	0	2020-06-20 10:00:42.671395	2020-06-20 10:00:42.671395	\N	\N	\N
1543470	18	1	Superior Room	USD	110.97	2020-06-21	491.57	0	2020-06-20 10:00:42.677027	2020-06-20 10:00:42.677027	\N	\N	\N
1543471	139	1	Small Double	USD	96.05	2020-06-21	480.22	20	2020-06-20 10:00:42.683014	2020-06-20 10:00:42.683014	\N	\N	\N
1543472	14	1	Classic Double Bed	USD	116.49	2020-06-21	0	0	2020-06-20 10:00:42.688953	2020-06-20 10:00:42.688953	\N	\N	\N
1543473	79	1	Standard Room	USD	57.53	2020-06-21	0	0	2020-06-20 10:00:42.699899	2020-06-20 10:00:42.699899	\N	\N	\N
1543474	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.88	2020-06-21	0	0	2020-06-20 10:00:42.705755	2020-06-20 10:00:42.705755	\N	\N	\N
1543475	67	1	Trendy Garden View Room	USD	213.1	2020-06-21	376.9	45	2020-06-20 10:00:42.711624	2020-06-20 10:00:42.711624	\N	\N	\N
1543476	160	1	King Accessible with Roll In Shower	USD	109	2020-06-21	0	0	2020-06-20 10:00:42.717819	2020-06-20 10:00:42.717819	\N	\N	\N
1543477	183	1	Business Deluxe, Guest room, 1 Queen, Reforma Tower	USD	102.86	2020-06-21	0	0	2020-06-20 10:00:42.723467	2020-06-20 10:00:42.723467	\N	\N	\N
1543478	54	1	Double Room	USD	140.89	2020-06-21	717.6	0	2020-06-20 10:00:42.729832	2020-06-20 10:00:42.729832	\N	\N	\N
1543479	47	1	Standard room half board	USD	188.43	2020-06-21	500	0	2020-06-20 10:00:42.737296	2020-06-20 10:00:42.737296	\N	\N	\N
1543480	35	1	Twin - Non-Smoking	USD	98.28	2020-06-21	0	0	2020-06-20 10:00:42.745627	2020-06-20 10:00:42.745627	\N	\N	\N
1543481	38	1	Deluxe Double or Twin Room with Sea View	USD	146.44	2020-06-21	0	0	2020-06-20 10:00:42.76943	2020-06-20 10:00:42.76943	\N	\N	\N
1543482	192	1	Comfort Room	USD	66.94	2020-06-21	223.84	0	2020-06-20 10:00:42.775022	2020-06-20 10:00:42.775022	\N	\N	\N
1543483	165	1	Basic Room	USD	90.55	2020-06-21	0	0	2020-06-20 10:00:42.780599	2020-06-20 10:00:42.780599	\N	\N	\N
1543484	215	1	Deluxe - 3 persons	USD	33.57	2020-06-21	134.3	25	2020-06-20 10:00:43.166115	2020-06-20 10:00:43.166115	\N	\N	\N
1543485	261	1	Superior Twin or Double Room	USD	62.2	2020-06-21	0	0	2020-06-20 10:00:43.174911	2020-06-20 10:00:43.174911	\N	\N	\N
1543486	224	1	Superior King	USD	52.67	2020-06-21	245.77	0	2020-06-20 10:00:43.181676	2020-06-20 10:00:43.181676	\N	\N	\N
1543487	300	1	Deluxe Room, Guest room, 2 Double	USD	138.14	2020-06-21	0	0	2020-06-20 10:00:43.189627	2020-06-20 10:00:43.189627	\N	\N	\N
1543488	301	1	Comfort Double or Twin Room	USD	131.25	2020-06-21	0	0	2020-06-20 10:00:43.195531	2020-06-20 10:00:43.195531	\N	\N	\N
1543489	293	1	Budget Double Room	USD	72.18	2020-06-21	0	0	2020-06-20 10:00:43.20199	2020-06-20 10:00:43.20199	\N	\N	\N
1543490	243	1	Classic Twin Room	USD	59.68	2020-06-21	0	0	2020-06-20 10:00:43.208172	2020-06-20 10:00:43.208172	\N	\N	\N
1543491	256	1	Standard Double Room	USD	94.14	2020-06-21	0	0	2020-06-20 10:00:43.215681	2020-06-20 10:00:43.215681	\N	\N	\N
1543493	285	1	Superior Room king bed	USD	105.32	2020-06-21	0	0	2020-06-20 10:00:43.233888	2020-06-20 10:00:43.233888	\N	\N	\N
1543495	314	1	1 Double Bed Non-Smoking	USD	144.66	2020-06-21	0	0	2020-06-20 10:00:43.246055	2020-06-20 10:00:43.246055	\N	\N	\N
1543496	274	1	Small Double Room Non-Smoking	USD	198.03	2020-06-21	0	0	2020-06-20 10:00:43.254853	2020-06-20 10:00:43.254853	\N	\N	\N
1543497	306	1	Deluxe King City View	USD	117.52	2020-06-21	301.63	30	2020-06-20 10:00:43.263954	2020-06-20 10:00:43.263954	\N	\N	\N
1543498	290	1	Standard	USD	82.63	2020-06-21	0	0	2020-06-20 10:00:43.269922	2020-06-20 10:00:43.269922	\N	\N	\N
1543501	258	1	Standard Double Room	USD	32.39	2020-06-21	0	0	2020-06-20 10:00:43.290822	2020-06-20 10:00:43.290822	\N	\N	\N
1543502	216	1	2 Double Accessible Roll in Shower	USD	109	2020-06-21	0	0	2020-06-20 10:00:43.296705	2020-06-20 10:00:43.296705	\N	\N	\N
1543504	275	1	Double or Twin Room	USD	95.13	2020-06-21	0	0	2020-06-20 10:00:43.308703	2020-06-20 10:00:43.308703	\N	\N	\N
1543505	204	1	King Bed	USD	192.76	2020-06-21	0	0	2020-06-20 10:00:43.31465	2020-06-20 10:00:43.31465	\N	\N	\N
1543506	295	1	Classic Double or Twin	USD	213.99	2020-06-21	458.87	0	2020-06-20 10:00:43.320349	2020-06-20 10:00:43.320349	\N	\N	\N
1543509	307	1	1 King Bed	USD	505.44	2020-06-21	0	0	2020-06-20 10:00:43.341033	2020-06-20 10:00:43.341033	\N	\N	\N
1543510	302	1	Accessible 1 King Bed	USD	84	2020-06-21	300	0	2020-06-20 10:00:43.36845	2020-06-20 10:00:43.36845	\N	\N	\N
1543513	255	1	3rd Floor Mountain-View Double Room	USD	248.74	2020-06-21	0	0	2020-06-20 10:00:43.387015	2020-06-20 10:00:43.387015	\N	\N	\N
1543515	206	1	Standard	USD	71.1	2020-06-21	0	0	2020-06-20 10:00:43.4058	2020-06-20 10:00:43.4058	\N	\N	\N
1543516	263	1	Queen Hilton Guestroom	USD	107.64	2020-06-21	0	0	2020-06-20 10:00:43.418536	2020-06-20 10:00:43.418536	\N	\N	\N
1568058	23	1	1 King Bed Evolution Room 	USD	119	2020-06-22	0	0	2020-06-21 10:00:42.883506	2020-06-21 10:00:42.883506	\N	\N	\N
1568059	45	1	Classic Double or Twin	USD	121.07	2020-06-22	0	0	2020-06-21 10:00:42.911125	2020-06-21 10:00:42.911125	\N	\N	\N
1568060	115	1	Double Room	USD	63.81	2020-06-22	0	0	2020-06-21 10:00:42.929579	2020-06-21 10:00:42.929579	\N	\N	\N
1568061	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	67.3	2020-06-22	0	0	2020-06-21 10:00:42.936313	2020-06-21 10:00:42.936313	\N	\N	\N
1568062	158	1	Superior Twin Non-Smoking	USD	87.68	2020-06-22	0	0	2020-06-21 10:00:42.94395	2020-06-21 10:00:42.94395	\N	\N	\N
1568063	153	1	Standard Plus King	USD	189.13	2020-06-22	0	0	2020-06-21 10:00:42.950078	2020-06-21 10:00:42.950078	\N	\N	\N
1568064	131	1	Superior Double Room	USD	52.15	2020-06-22	0	0	2020-06-21 10:00:42.958773	2020-06-21 10:00:42.958773	\N	\N	\N
1568065	184	1	Superior Room	USD	84.03	2020-06-22	441.61	0	2020-06-21 10:00:42.965573	2020-06-21 10:00:42.965573	\N	\N	\N
1568066	176	1	Economy Twin Room	USD	115.99	2020-06-22	0	0	2020-06-21 10:00:42.971547	2020-06-21 10:00:42.971547	\N	\N	\N
1568067	113	1	2 Queen Beds 	USD	169	2020-06-22	0	0	2020-06-21 10:00:42.977558	2020-06-21 10:00:42.977558	\N	\N	\N
1568068	53	1	Superior Twin	USD	127.86	2020-06-22	0	0	2020-06-21 10:00:42.983397	2020-06-21 10:00:42.983397	\N	\N	\N
1568069	143	1	Standard Double Room	USD	151.37	2020-06-22	0	0	2020-06-21 10:00:42.989191	2020-06-21 10:00:42.989191	\N	\N	\N
1568070	108	1	Standard Double Room	USD	83.78	2020-06-22	0	0	2020-06-21 10:00:42.994981	2020-06-21 10:00:42.994981	\N	\N	\N
1568071	13	1	Premium Twin Room with Two Double Beds	USD	120.1	2020-06-22	0	0	2020-06-21 10:00:43.001586	2020-06-21 10:00:43.001586	\N	\N	\N
1568072	8	1	Double Room	USD	189.09	2020-06-22	0	0	2020-06-21 10:00:43.007264	2020-06-21 10:00:43.007264	\N	\N	\N
1568073	64	1	Comfort Room	USD	50.16	2020-06-22	179.07	0	2020-06-21 10:00:43.016204	2020-06-21 10:00:43.016204	\N	\N	\N
1568074	125	1	Standard Double or Twin Room	USD	30	2020-06-22	0	0	2020-06-21 10:00:43.022606	2020-06-21 10:00:43.022606	\N	\N	\N
1568075	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-22	0	0	2020-06-21 10:00:43.028529	2020-06-21 10:00:43.028529	\N	\N	\N
1568076	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-22	0	0	2020-06-21 10:00:43.034454	2020-06-21 10:00:43.034454	\N	\N	\N
1568077	194	1	Standard Small Double Room - Non-Smoking	USD	168.63	2020-06-22	0	0	2020-06-21 10:00:43.042493	2020-06-21 10:00:43.042493	\N	\N	\N
1568078	95	1	 Twin Guestroom	USD	158.75	2020-06-22	0	0	2020-06-21 10:00:43.049555	2020-06-21 10:00:43.049555	\N	\N	\N
1568079	157	1	Standard Room	USD	128.17	2020-06-22	0	0	2020-06-21 10:00:43.055428	2020-06-21 10:00:43.055428	\N	\N	\N
1568080	26	1	Double	USD	79.18	2020-06-22	0	0	2020-06-21 10:00:43.068983	2020-06-21 10:00:43.068983	\N	\N	\N
1568081	61	1	Modern Double Room	USD	212.85	2020-06-22	0	0	2020-06-21 10:00:43.074904	2020-06-21 10:00:43.074904	\N	\N	\N
1568082	109	1	Classic Double Room	USD	186.19	2020-06-22	0	0	2020-06-21 10:00:43.080671	2020-06-21 10:00:43.080671	\N	\N	\N
1568083	181	1	Superior Double Room	USD	61.94	2020-06-22	0	0	2020-06-21 10:00:43.086322	2020-06-21 10:00:43.086322	\N	\N	\N
1568084	49	1	Superior Twin Room	USD	124.47	2020-06-22	0	0	2020-06-21 10:00:43.092455	2020-06-21 10:00:43.092455	\N	\N	\N
1568085	136	1	Standard Double or Twin Room	USD	125.64	2020-06-22	0	0	2020-06-21 10:00:43.103468	2020-06-21 10:00:43.103468	\N	\N	\N
1568086	159	1	Standard Room with 1 double bed and sofa	USD	82.63	2020-06-22	0	0	2020-06-21 10:00:43.114189	2020-06-21 10:00:43.114189	\N	\N	\N
1568087	42	1	Standard Twin Room	USD	82	2020-06-22	0	0	2020-06-21 10:00:43.120292	2020-06-21 10:00:43.120292	\N	\N	\N
1568088	90	1	Standard Room	USD	83.02	2020-06-22	332.1	0	2020-06-21 10:00:43.126255	2020-06-21 10:00:43.126255	\N	\N	\N
1568089	106	1	Double Room with Two Single Beds	USD	33.66	2020-06-22	0	0	2020-06-21 10:00:43.132306	2020-06-21 10:00:43.132306	\N	\N	\N
1568090	27	1	Standard Twin Room - Smoking	USD	167.07	2020-06-22	543.63	0	2020-06-21 10:00:43.138391	2020-06-21 10:00:43.138391	\N	\N	\N
1568091	77	1	Double Room - North Side	USD	145.95	2020-06-22	0	0	2020-06-21 10:00:43.144545	2020-06-21 10:00:43.144545	\N	\N	\N
1568092	31	1	Classic Double or Twin Room with Hill View	USD	312.36	2020-06-22	0	0	2020-06-21 10:00:43.150969	2020-06-21 10:00:43.150969	\N	\N	\N
1568093	18	1	Superior Room	USD	118.95	2020-06-22	526.93	0	2020-06-21 10:00:43.167134	2020-06-21 10:00:43.167134	\N	\N	\N
1568094	139	1	Small Double	USD	96.05	2020-06-22	480.22	20	2020-06-21 10:00:43.173669	2020-06-21 10:00:43.173669	\N	\N	\N
1568095	14	1	Classic Double Bed	USD	105.3	2020-06-22	0	0	2020-06-21 10:00:43.181539	2020-06-21 10:00:43.181539	\N	\N	\N
1568096	79	1	Standard Room	USD	57.53	2020-06-22	0	0	2020-06-21 10:00:43.187748	2020-06-21 10:00:43.187748	\N	\N	\N
1568097	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.88	2020-06-22	0	0	2020-06-21 10:00:43.193643	2020-06-21 10:00:43.193643	\N	\N	\N
1568098	67	1	Trendy Garden View Room	USD	213.1	2020-06-22	376.9	45	2020-06-21 10:00:43.199294	2020-06-21 10:00:43.199294	\N	\N	\N
1568099	160	1	2 Double Beds	USD	119	2020-06-22	0	0	2020-06-21 10:00:43.205564	2020-06-21 10:00:43.205564	\N	\N	\N
1568100	54	1	Double Room	USD	163.19	2020-06-22	806.81	0	2020-06-21 10:00:43.211684	2020-06-21 10:00:43.211684	\N	\N	\N
1568101	47	1	Standard room half board	USD	188.43	2020-06-22	500	0	2020-06-21 10:00:43.221073	2020-06-21 10:00:43.221073	\N	\N	\N
1568102	35	1	Twin - Non-Smoking	USD	98.28	2020-06-22	0	0	2020-06-21 10:00:43.228428	2020-06-21 10:00:43.228428	\N	\N	\N
1568103	38	1	Deluxe Double or Twin Room with Sea View	USD	146.44	2020-06-22	0	0	2020-06-21 10:00:43.235816	2020-06-21 10:00:43.235816	\N	\N	\N
1568104	192	1	Comfort Room	USD	87.86	2020-06-22	223.84	0	2020-06-21 10:00:43.241617	2020-06-21 10:00:43.241617	\N	\N	\N
1568105	165	1	Basic Room	USD	90.55	2020-06-22	0	0	2020-06-21 10:00:43.247382	2020-06-21 10:00:43.247382	\N	\N	\N
1568106	215	1	Deluxe - 3 persons	USD	33.57	2020-06-22	134.3	25	2020-06-21 10:00:43.687235	2020-06-21 10:00:43.687235	\N	\N	\N
1568107	261	1	Superior Twin or Double Room	USD	62.2	2020-06-22	0	0	2020-06-21 10:00:43.695649	2020-06-21 10:00:43.695649	\N	\N	\N
1568108	224	1	Superior King	USD	52.67	2020-06-22	245.77	0	2020-06-21 10:00:43.705394	2020-06-21 10:00:43.705394	\N	\N	\N
1568109	300	1	Deluxe Room, Guest room, 2 Twin/Single Bed(s)	USD	162.11	2020-06-22	0	0	2020-06-21 10:00:43.712854	2020-06-21 10:00:43.712854	\N	\N	\N
1568110	301	1	Superior Double Room with Pool and Garden View	USD	156.69	2020-06-22	0	0	2020-06-21 10:00:43.71865	2020-06-21 10:00:43.71865	\N	\N	\N
1568111	293	1	Budget Double Room	USD	72.18	2020-06-22	0	0	2020-06-21 10:00:43.724592	2020-06-21 10:00:43.724592	\N	\N	\N
1568112	243	1	Classic Twin Room	USD	73.51	2020-06-22	0	0	2020-06-21 10:00:43.730414	2020-06-21 10:00:43.730414	\N	\N	\N
1568113	256	1	Standard Double Room	USD	104.6	2020-06-22	0	0	2020-06-21 10:00:43.738214	2020-06-21 10:00:43.738214	\N	\N	\N
1568115	285	1	Superior Room king bed	USD	111.55	2020-06-22	0	0	2020-06-21 10:00:43.757612	2020-06-21 10:00:43.757612	\N	\N	\N
1568117	314	1	1 Double Bed Non-Smoking	USD	144.66	2020-06-22	0	0	2020-06-21 10:00:43.770074	2020-06-21 10:00:43.770074	\N	\N	\N
1568118	274	1	Small Double Room Non-Smoking	USD	198.03	2020-06-22	0	0	2020-06-21 10:00:43.779581	2020-06-21 10:00:43.779581	\N	\N	\N
1568119	306	1	Deluxe King City View	USD	126.4	2020-06-22	301.63	30	2020-06-21 10:00:43.788244	2020-06-21 10:00:43.788244	\N	\N	\N
1568120	290	1	Standard	USD	93.09	2020-06-22	0	0	2020-06-21 10:00:43.794503	2020-06-21 10:00:43.794503	\N	\N	\N
1568123	258	1	Standard Double Room	USD	32.39	2020-06-22	0	0	2020-06-21 10:00:43.815911	2020-06-21 10:00:43.815911	\N	\N	\N
1568124	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-22	0	0	2020-06-21 10:00:43.822498	2020-06-21 10:00:43.822498	\N	\N	\N
1568126	275	1	Double or Twin Room	USD	95.13	2020-06-22	0	0	2020-06-21 10:00:43.835722	2020-06-21 10:00:43.835722	\N	\N	\N
1568127	204	1	King Bed	USD	192.76	2020-06-22	0	0	2020-06-21 10:00:43.842533	2020-06-21 10:00:43.842533	\N	\N	\N
1568128	295	1	Classic Double or Twin	USD	213.99	2020-06-22	458.87	0	2020-06-21 10:00:43.84909	2020-06-21 10:00:43.84909	\N	\N	\N
1568131	307	1	1 King Bed	USD	505.44	2020-06-22	0	0	2020-06-21 10:00:43.872695	2020-06-21 10:00:43.872695	\N	\N	\N
1568132	302	1	Accessible 1 King Bed	USD	84	2020-06-22	300	0	2020-06-21 10:00:43.880511	2020-06-21 10:00:43.880511	\N	\N	\N
1568135	255	1	3rd Floor Mountain-View Double Room	USD	202.61	2020-06-22	0	0	2020-06-21 10:00:43.897881	2020-06-21 10:00:43.897881	\N	\N	\N
1568138	206	1	Standard	USD	71.1	2020-06-22	0	0	2020-06-21 10:00:43.919626	2020-06-21 10:00:43.919626	\N	\N	\N
1568139	263	1	Queen Hilton Guestroom	USD	107.64	2020-06-22	0	0	2020-06-21 10:00:43.926158	2020-06-21 10:00:43.926158	\N	\N	\N
1593199	23	1	1 King Bed Evolution Room 	USD	119	2020-06-23	0	0	2020-06-22 10:00:38.756347	2020-06-22 10:00:38.756347	\N	\N	\N
1593200	45	1	Classic Double or Twin	USD	121.07	2020-06-23	0	0	2020-06-22 10:00:38.783661	2020-06-22 10:00:38.783661	\N	\N	\N
1593201	115	1	Double Room	USD	63.81	2020-06-23	0	0	2020-06-22 10:00:38.802995	2020-06-22 10:00:38.802995	\N	\N	\N
1593202	75	1	Small Double Bed Non-Smoking	USD	78.13	2020-06-23	235.39	0	2020-06-22 10:00:38.809245	2020-06-22 10:00:38.809245	\N	\N	\N
1593203	158	1	Superior Twin Non-Smoking	USD	87.68	2020-06-23	0	0	2020-06-22 10:00:38.817127	2020-06-22 10:00:38.817127	\N	\N	\N
1593204	153	1	Standard Twin Room	USD	191.53	2020-06-23	0	0	2020-06-22 10:00:38.826531	2020-06-22 10:00:38.826531	\N	\N	\N
1593205	131	1	Superior Double Room	USD	52.15	2020-06-23	0	0	2020-06-22 10:00:38.836091	2020-06-22 10:00:38.836091	\N	\N	\N
1593206	184	1	Superior Room	USD	86.28	2020-06-23	450.61	0	2020-06-22 10:00:38.842851	2020-06-22 10:00:38.842851	\N	\N	\N
1593207	176	1	Economy Twin Room	USD	121.07	2020-06-23	0	0	2020-06-22 10:00:38.849168	2020-06-22 10:00:38.849168	\N	\N	\N
1593208	113	1	2 Queen Beds 	USD	169	2020-06-23	0	0	2020-06-22 10:00:38.855453	2020-06-22 10:00:38.855453	\N	\N	\N
1593209	53	1	Superior Twin	USD	127.86	2020-06-23	0	0	2020-06-22 10:00:38.861068	2020-06-22 10:00:38.861068	\N	\N	\N
1593210	143	1	Standard Double Room	USD	160.43	2020-06-23	0	0	2020-06-22 10:00:38.86691	2020-06-22 10:00:38.86691	\N	\N	\N
1593211	108	1	Standard Double Room	USD	83.78	2020-06-23	0	0	2020-06-22 10:00:38.873503	2020-06-22 10:00:38.873503	\N	\N	\N
1593212	13	1	Premium Twin Room with Two Double Beds	USD	120.1	2020-06-23	0	0	2020-06-22 10:00:38.880529	2020-06-22 10:00:38.880529	\N	\N	\N
1593213	8	1	Superior Double Room	USD	219.99	2020-06-23	0	0	2020-06-22 10:00:38.886876	2020-06-22 10:00:38.886876	\N	\N	\N
1593214	64	1	Comfort Room	USD	50.16	2020-06-23	179.07	0	2020-06-22 10:00:38.893069	2020-06-22 10:00:38.893069	\N	\N	\N
1593215	125	1	Standard Double or Twin Room	USD	30	2020-06-23	0	0	2020-06-22 10:00:38.89931	2020-06-22 10:00:38.89931	\N	\N	\N
1593216	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-23	0	0	2020-06-22 10:00:38.905672	2020-06-22 10:00:38.905672	\N	\N	\N
1593217	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-23	0	0	2020-06-22 10:00:38.912224	2020-06-22 10:00:38.912224	\N	\N	\N
1593218	194	1	Standard Small Double Room - Non-Smoking	USD	172.5	2020-06-23	0	0	2020-06-22 10:00:38.921525	2020-06-22 10:00:38.921525	\N	\N	\N
1593219	95	1	 Twin Guestroom	USD	158.75	2020-06-23	0	0	2020-06-22 10:00:38.929929	2020-06-22 10:00:38.929929	\N	\N	\N
1593220	157	1	Standard Room	USD	135.74	2020-06-23	0	0	2020-06-22 10:00:38.936799	2020-06-22 10:00:38.936799	\N	\N	\N
1593221	26	1	Double	USD	79.18	2020-06-23	0	0	2020-06-22 10:00:38.942937	2020-06-22 10:00:38.942937	\N	\N	\N
1593222	61	1	Modern Double Room	USD	192.58	2020-06-23	0	0	2020-06-22 10:00:38.949007	2020-06-22 10:00:38.949007	\N	\N	\N
1593223	109	1	Classic Double Room	USD	186.19	2020-06-23	0	0	2020-06-22 10:00:38.969156	2020-06-22 10:00:38.969156	\N	\N	\N
1593224	181	1	Superior Double Room	USD	61.94	2020-06-23	0	0	2020-06-22 10:00:38.974775	2020-06-22 10:00:38.974775	\N	\N	\N
1593225	49	1	Superior Twin Room	USD	124.47	2020-06-23	0	0	2020-06-22 10:00:38.980926	2020-06-22 10:00:38.980926	\N	\N	\N
1593226	136	1	Standard Double or Twin Room	USD	125.64	2020-06-23	0	0	2020-06-22 10:00:38.989075	2020-06-22 10:00:38.989075	\N	\N	\N
1593227	159	1	Standard Room with 1 double bed and sofa	USD	82.63	2020-06-23	0	0	2020-06-22 10:00:38.998482	2020-06-22 10:00:38.998482	\N	\N	\N
1593228	42	1	Standard Twin Room	USD	69.7	2020-06-23	0	0	2020-06-22 10:00:39.005629	2020-06-22 10:00:39.005629	\N	\N	\N
1593229	90	1	Standard Room	USD	83.84	2020-06-23	335.36	0	2020-06-22 10:00:39.012007	2020-06-22 10:00:39.012007	\N	\N	\N
1593230	106	1	Double Room with Two Single Beds	USD	33.66	2020-06-23	0	0	2020-06-22 10:00:39.018054	2020-06-22 10:00:39.018054	\N	\N	\N
1593231	27	1	Standard Twin Room - Smoking	USD	167.08	2020-06-23	543.63	0	2020-06-22 10:00:39.024791	2020-06-22 10:00:39.024791	\N	\N	\N
1593232	77	1	Double Room - North Side	USD	145.95	2020-06-23	0	0	2020-06-22 10:00:39.03051	2020-06-22 10:00:39.03051	\N	\N	\N
1593233	31	1	Classic Double or Twin Room with Hill View	USD	312.36	2020-06-23	0	0	2020-06-22 10:00:39.036392	2020-06-22 10:00:39.036392	\N	\N	\N
1593234	18	1	Superior Room	USD	118.95	2020-06-23	526.93	0	2020-06-22 10:00:39.042846	2020-06-22 10:00:39.042846	\N	\N	\N
1593235	139	1	Small Double	USD	100.93	2020-06-23	504.67	20	2020-06-22 10:00:39.065377	2020-06-22 10:00:39.065377	\N	\N	\N
1593236	14	1	Classic Double Bed	USD	141.92	2020-06-23	0	0	2020-06-22 10:00:39.073025	2020-06-22 10:00:39.073025	\N	\N	\N
1593237	79	1	Standard Room	USD	57.53	2020-06-23	0	0	2020-06-22 10:00:39.079111	2020-06-22 10:00:39.079111	\N	\N	\N
1593238	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.88	2020-06-23	0	0	2020-06-22 10:00:39.085237	2020-06-22 10:00:39.085237	\N	\N	\N
1593239	67	1	Trendy Garden View Room	USD	213.1	2020-06-23	376.9	45	2020-06-22 10:00:39.091539	2020-06-22 10:00:39.091539	\N	\N	\N
1593240	160	1	2 Double Beds	USD	119	2020-06-23	0	0	2020-06-22 10:00:39.097662	2020-06-22 10:00:39.097662	\N	\N	\N
1593241	54	1	Double Room	USD	163.19	2020-06-23	806.81	0	2020-06-22 10:00:39.103411	2020-06-22 10:00:39.103411	\N	\N	\N
1593242	47	1	Standard room half board	USD	188.43	2020-06-23	500	0	2020-06-22 10:00:39.114022	2020-06-22 10:00:39.114022	\N	\N	\N
1593243	35	1	Twin - Non-Smoking	USD	98.28	2020-06-23	0	0	2020-06-22 10:00:39.121008	2020-06-22 10:00:39.121008	\N	\N	\N
1593244	38	1	Deluxe Double or Twin Room with Sea View	USD	146.44	2020-06-23	0	0	2020-06-22 10:00:39.128648	2020-06-22 10:00:39.128648	\N	\N	\N
1593245	192	1	Comfort Room	USD	87.86	2020-06-23	223.84	0	2020-06-22 10:00:39.134737	2020-06-22 10:00:39.134737	\N	\N	\N
1593246	165	1	Basic Room	USD	90.55	2020-06-23	0	0	2020-06-22 10:00:39.14047	2020-06-22 10:00:39.14047	\N	\N	\N
1593247	215	1	Deluxe - 3 persons	USD	33.57	2020-06-23	134.3	25	2020-06-22 10:00:39.741344	2020-06-22 10:00:39.741344	\N	\N	\N
1593248	261	1	Superior Twin or Double Room	USD	62.2	2020-06-23	0	0	2020-06-22 10:00:39.751173	2020-06-22 10:00:39.751173	\N	\N	\N
1593249	224	1	Superior King	USD	52.67	2020-06-23	245.77	0	2020-06-22 10:00:39.757011	2020-06-22 10:00:39.757011	\N	\N	\N
1593250	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-06-23	0	0	2020-06-22 10:00:39.764852	2020-06-22 10:00:39.764852	\N	\N	\N
1593251	301	1	Comfort Double or Twin Room	USD	131.25	2020-06-23	0	0	2020-06-22 10:00:39.770732	2020-06-22 10:00:39.770732	\N	\N	\N
1593252	293	1	Budget Double Room	USD	72.18	2020-06-23	0	0	2020-06-22 10:00:39.776677	2020-06-22 10:00:39.776677	\N	\N	\N
1593253	243	1	Classic Twin Room	USD	73.51	2020-06-23	0	0	2020-06-22 10:00:39.782418	2020-06-22 10:00:39.782418	\N	\N	\N
1593254	256	1	Standard Double Room	USD	115.05	2020-06-23	0	0	2020-06-22 10:00:39.78952	2020-06-22 10:00:39.78952	\N	\N	\N
1593256	285	1	Superior Room king bed	USD	108.43	2020-06-23	0	0	2020-06-22 10:00:39.806818	2020-06-22 10:00:39.806818	\N	\N	\N
1593258	248	1	Double Room	USD	132.27	2020-06-23	204.81	0	2020-06-22 10:00:39.818585	2020-06-22 10:00:39.818585	\N	\N	\N
1593259	314	1	1 Double Bed Non-Smoking	USD	144.66	2020-06-23	0	0	2020-06-22 10:00:39.824588	2020-06-22 10:00:39.824588	\N	\N	\N
1593260	274	1	Standard Twin Room - Non-Smoking	USD	230.52	2020-06-23	393.12	0	2020-06-22 10:00:39.832574	2020-06-22 10:00:39.832574	\N	\N	\N
1593261	306	1	Deluxe King City View	USD	126.4	2020-06-23	301.63	30	2020-06-22 10:00:39.841725	2020-06-22 10:00:39.841725	\N	\N	\N
1593262	290	1	Standard	USD	93.09	2020-06-23	0	0	2020-06-22 10:00:39.847794	2020-06-22 10:00:39.847794	\N	\N	\N
1593265	258	1	Standard Double Room	USD	32.39	2020-06-23	0	0	2020-06-22 10:00:39.873529	2020-06-22 10:00:39.873529	\N	\N	\N
1593266	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-23	0	0	2020-06-22 10:00:39.879538	2020-06-22 10:00:39.879538	\N	\N	\N
1593268	275	1	Double or Twin Room	USD	87.76	2020-06-23	0	0	2020-06-22 10:00:39.892368	2020-06-22 10:00:39.892368	\N	\N	\N
1593269	204	1	King Bed	USD	192.76	2020-06-23	0	0	2020-06-22 10:00:39.898455	2020-06-22 10:00:39.898455	\N	\N	\N
1593270	295	1	Classic Double or Twin	USD	213.99	2020-06-23	458.87	0	2020-06-22 10:00:39.904482	2020-06-22 10:00:39.904482	\N	\N	\N
1593273	307	1	1 King Bed	USD	429.62	2020-06-23	0	0	2020-06-22 10:00:39.925007	2020-06-22 10:00:39.925007	\N	\N	\N
1593274	302	1	Accessible 1 King Bed	USD	84	2020-06-23	300	0	2020-06-22 10:00:39.932762	2020-06-22 10:00:39.932762	\N	\N	\N
1593280	206	1	Standard	USD	71.1	2020-06-23	0	0	2020-06-22 10:00:39.986216	2020-06-22 10:00:39.986216	\N	\N	\N
1593281	263	1	Queen Hilton Guestroom	USD	80.73	2020-06-23	0	0	2020-06-22 10:00:39.992581	2020-06-22 10:00:39.992581	\N	\N	\N
1618116	23	1	1 King Bed Evolution Room 	USD	119	2020-06-24	0	0	2020-06-23 10:00:49.385036	2020-06-23 10:00:49.385036	\N	\N	\N
1618117	45	1	Classic Double or Twin	USD	121.82	2020-06-24	0	0	2020-06-23 10:00:49.413163	2020-06-23 10:00:49.413163	\N	\N	\N
1618118	115	1	Double Room	USD	64.2	2020-06-24	0	0	2020-06-23 10:00:49.431505	2020-06-23 10:00:49.431505	\N	\N	\N
1618119	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	67.27	2020-06-24	0	0	2020-06-23 10:00:49.437345	2020-06-23 10:00:49.437345	\N	\N	\N
1618120	158	1	Superior Twin Non-Smoking	USD	87.71	2020-06-24	0	0	2020-06-23 10:00:49.446554	2020-06-23 10:00:49.446554	\N	\N	\N
1618121	153	1	Standard Plus King	USD	194.01	2020-06-24	0	0	2020-06-23 10:00:49.452758	2020-06-23 10:00:49.452758	\N	\N	\N
1618122	131	1	Superior Double Room	USD	52.17	2020-06-24	0	0	2020-06-23 10:00:49.461822	2020-06-23 10:00:49.461822	\N	\N	\N
1618123	184	1	Superior Room	USD	86.28	2020-06-24	450.61	0	2020-06-23 10:00:49.469202	2020-06-23 10:00:49.469202	\N	\N	\N
1618124	176	1	Economy Twin Room	USD	121.82	2020-06-24	0	0	2020-06-23 10:00:49.475005	2020-06-23 10:00:49.475005	\N	\N	\N
1618125	113	1	2 Queen Beds 	USD	152.15	2020-06-24	0	0	2020-06-23 10:00:49.480695	2020-06-23 10:00:49.480695	\N	\N	\N
1618126	53	1	Superior Twin	USD	129.24	2020-06-24	0	0	2020-06-23 10:00:49.48659	2020-06-23 10:00:49.48659	\N	\N	\N
1618127	143	1	Superior Room	USD	188.35	2020-06-24	0	0	2020-06-23 10:00:49.492606	2020-06-23 10:00:49.492606	\N	\N	\N
1618128	108	1	Standard Double Room	USD	84.3	2020-06-24	0	0	2020-06-23 10:00:49.498526	2020-06-23 10:00:49.498526	\N	\N	\N
1618129	13	1	Premium Twin Room with Two Double Beds	USD	121.39	2020-06-24	0	0	2020-06-23 10:00:49.506213	2020-06-23 10:00:49.506213	\N	\N	\N
1618130	8	1	Twin Room	USD	189.82	2020-06-24	0	0	2020-06-23 10:00:49.516809	2020-06-23 10:00:49.516809	\N	\N	\N
1618131	64	1	Comfort Room	USD	50.47	2020-06-24	180.18	0	2020-06-23 10:00:49.522741	2020-06-23 10:00:49.522741	\N	\N	\N
1618132	125	1	Standard Double or Twin Room	USD	30	2020-06-24	0	0	2020-06-23 10:00:49.528525	2020-06-23 10:00:49.528525	\N	\N	\N
1618133	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-24	0	0	2020-06-23 10:00:49.535208	2020-06-23 10:00:49.535208	\N	\N	\N
1618134	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-24	0	0	2020-06-23 10:00:49.540774	2020-06-23 10:00:49.540774	\N	\N	\N
1618135	194	1	Single Deluxe Non-Smoking	USD	195.54	2020-06-24	0	0	2020-06-23 10:00:49.549662	2020-06-23 10:00:49.549662	\N	\N	\N
1618136	95	1	 Twin Guestroom	USD	159.73	2020-06-24	0	0	2020-06-23 10:00:49.557678	2020-06-23 10:00:49.557678	\N	\N	\N
1618137	157	1	Cosy Small Room	USD	129.3	2020-06-24	0	0	2020-06-23 10:00:49.571658	2020-06-23 10:00:49.571658	\N	\N	\N
1618138	26	1	Double	USD	79.67	2020-06-24	0	0	2020-06-23 10:00:49.581548	2020-06-23 10:00:49.581548	\N	\N	\N
1618139	61	1	Modern Double Room	USD	193.35	2020-06-24	0	0	2020-06-23 10:00:49.58745	2020-06-23 10:00:49.58745	\N	\N	\N
1618140	109	1	Classic Double Room	USD	187.34	2020-06-24	0	0	2020-06-23 10:00:49.593309	2020-06-23 10:00:49.593309	\N	\N	\N
1618141	181	1	Superior Double Room	USD	61.94	2020-06-24	0	0	2020-06-23 10:00:49.599205	2020-06-23 10:00:49.599205	\N	\N	\N
1618142	49	1	Superior Twin Room	USD	125.24	2020-06-24	0	0	2020-06-23 10:00:49.606029	2020-06-23 10:00:49.606029	\N	\N	\N
1618143	136	1	Standard Double or Twin Room	USD	125.78	2020-06-24	0	0	2020-06-23 10:00:49.613833	2020-06-23 10:00:49.613833	\N	\N	\N
1618144	159	1	Standard Room with 1 double bed and sofa	USD	83.14	2020-06-24	0	0	2020-06-23 10:00:49.623646	2020-06-23 10:00:49.623646	\N	\N	\N
1618145	42	1	Standard Twin Room	USD	69.7	2020-06-24	0	0	2020-06-23 10:00:49.630038	2020-06-23 10:00:49.630038	\N	\N	\N
1618146	90	1	Standard Room	USD	84.36	2020-06-24	337.43	0	2020-06-23 10:00:49.636057	2020-06-23 10:00:49.636057	\N	\N	\N
1618147	106	1	Double Room with Two Single Beds	USD	28.23	2020-06-24	0	0	2020-06-23 10:00:49.641989	2020-06-23 10:00:49.641989	\N	\N	\N
1618148	27	1	Standard Twin Room - Smoking	USD	167	2020-06-24	543.4	0	2020-06-23 10:00:49.647916	2020-06-23 10:00:49.647916	\N	\N	\N
1618149	77	1	Double Room - North Side	USD	146.54	2020-06-24	0	0	2020-06-23 10:00:49.6539	2020-06-23 10:00:49.6539	\N	\N	\N
1618150	31	1	Classic Double or Twin Room with Hill View	USD	314.29	2020-06-24	0	0	2020-06-23 10:00:49.869222	2020-06-23 10:00:49.869222	\N	\N	\N
1618151	18	1	Superior Room	USD	118.95	2020-06-24	529.7	0	2020-06-23 10:00:49.877689	2020-06-23 10:00:49.877689	\N	\N	\N
1618152	139	1	Small Double	USD	101.56	2020-06-24	507.79	20	2020-06-23 10:00:49.884721	2020-06-23 10:00:49.884721	\N	\N	\N
1618153	79	1	Standard Room	USD	57.88	2020-06-24	0	0	2020-06-23 10:00:49.892512	2020-06-23 10:00:49.892512	\N	\N	\N
1618154	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.85	2020-06-24	0	0	2020-06-23 10:00:49.898357	2020-06-23 10:00:49.898357	\N	\N	\N
1618155	67	1	Trendy Garden View Room	USD	213.1	2020-06-24	376.9	45	2020-06-23 10:00:49.904093	2020-06-23 10:00:49.904093	\N	\N	\N
1618156	160	1	1 King Bed	USD	139	2020-06-24	0	0	2020-06-23 10:00:49.910257	2020-06-23 10:00:49.910257	\N	\N	\N
1618157	54	1	Double Room	USD	163.85	2020-06-24	810.05	0	2020-06-23 10:00:49.916129	2020-06-23 10:00:49.916129	\N	\N	\N
1618158	47	1	Standard room half board	USD	188.43	2020-06-24	500	0	2020-06-23 10:00:49.922494	2020-06-23 10:00:49.922494	\N	\N	\N
1618159	35	1	Twin - Non-Smoking	USD	98.24	2020-06-24	0	0	2020-06-23 10:00:49.929804	2020-06-23 10:00:49.929804	\N	\N	\N
1618160	38	1	Deluxe Double or Twin Room with Sea View	USD	147.34	2020-06-24	0	0	2020-06-23 10:00:49.936942	2020-06-23 10:00:49.936942	\N	\N	\N
1618161	192	1	Comfort Room	USD	88.4	2020-06-24	225.23	0	2020-06-23 10:00:49.942848	2020-06-23 10:00:49.942848	\N	\N	\N
1618162	165	1	Basic Room	USD	91.11	2020-06-24	0	0	2020-06-23 10:00:49.948867	2020-06-23 10:00:49.948867	\N	\N	\N
1618163	215	1	Deluxe - 3 persons	USD	33.58	2020-06-24	134.31	25	2020-06-23 10:00:50.874308	2020-06-23 10:00:50.874308	\N	\N	\N
1618164	261	1	Superior Twin or Double Room	USD	62.2	2020-06-24	0	0	2020-06-23 10:00:50.883827	2020-06-23 10:00:50.883827	\N	\N	\N
1618165	224	1	Superior King	USD	52.62	2020-06-24	245.56	0	2020-06-23 10:00:50.889718	2020-06-23 10:00:50.889718	\N	\N	\N
1618166	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-06-24	0	0	2020-06-23 10:00:50.897192	2020-06-23 10:00:50.897192	\N	\N	\N
1618167	301	1	Comfort Double or Twin Room	USD	132.06	2020-06-24	0	0	2020-06-23 10:00:50.909637	2020-06-23 10:00:50.909637	\N	\N	\N
1618168	293	1	Budget Double Room	USD	72.62	2020-06-24	0	0	2020-06-23 10:00:50.915671	2020-06-23 10:00:50.915671	\N	\N	\N
1618169	243	1	Double Room with Two Single Beds	USD	73.96	2020-06-24	0	0	2020-06-23 10:00:50.921327	2020-06-23 10:00:50.921327	\N	\N	\N
1618170	256	1	Standard Double Room	USD	115.77	2020-06-24	0	0	2020-06-23 10:00:50.928547	2020-06-23 10:00:50.928547	\N	\N	\N
1618172	285	1	Superior Room king bed	USD	109.43	2020-06-24	0	0	2020-06-23 10:00:50.946034	2020-06-23 10:00:50.946034	\N	\N	\N
1618174	314	1	1 Double Bed Non-Smoking	USD	145.55	2020-06-24	0	0	2020-06-23 10:00:50.957612	2020-06-23 10:00:50.957612	\N	\N	\N
1618175	274	1	Standard Twin Room - Non-Smoking	USD	230.42	2020-06-24	392.95	0	2020-06-23 10:00:50.969269	2020-06-23 10:00:50.969269	\N	\N	\N
1618176	306	1	Deluxe King City View	USD	115.98	2020-06-24	301.7	0	2020-06-23 10:00:50.977721	2020-06-23 10:00:50.977721	\N	\N	\N
1618177	290	1	Standard	USD	93.67	2020-06-24	0	0	2020-06-23 10:00:50.983416	2020-06-23 10:00:50.983416	\N	\N	\N
1618180	258	1	Standard Double Room	USD	32.94	2020-06-24	0	0	2020-06-23 10:00:51.002255	2020-06-23 10:00:51.002255	\N	\N	\N
1618181	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-24	0	0	2020-06-23 10:00:51.010009	2020-06-23 10:00:51.010009	\N	\N	\N
1618183	275	1	Double or Twin Room	USD	88.3	2020-06-24	0	0	2020-06-23 10:00:51.024058	2020-06-23 10:00:51.024058	\N	\N	\N
1618184	204	1	King Bed	USD	220.91	2020-06-24	0	0	2020-06-23 10:00:51.029982	2020-06-23 10:00:51.029982	\N	\N	\N
1618185	295	1	Classic Double or Twin	USD	215.32	2020-06-24	461.71	0	2020-06-23 10:00:51.035815	2020-06-23 10:00:51.035815	\N	\N	\N
1618188	307	1	1 King Bed	USD	381.72	2020-06-24	0	0	2020-06-23 10:00:51.057319	2020-06-23 10:00:51.057319	\N	\N	\N
1618189	302	1	Accessible 1 King Bed	USD	84	2020-06-24	300	0	2020-06-23 10:00:51.069353	2020-06-23 10:00:51.069353	\N	\N	\N
1618195	206	1	Standard	USD	71.67	2020-06-24	0	0	2020-06-23 10:00:51.108175	2020-06-23 10:00:51.108175	\N	\N	\N
1618196	263	1	Queen Hilton Guestroom	USD	107.59	2020-06-24	0	0	2020-06-23 10:00:51.114056	2020-06-23 10:00:51.114056	\N	\N	\N
1642984	23	1	1 King Bed Evolution Room 	USD	119	2020-06-25	0	0	2020-06-24 10:00:43.685752	2020-06-24 10:00:43.685752	\N	\N	\N
1642985	45	1	Classic Double or Twin	USD	122.38	2020-06-25	0	0	2020-06-24 10:00:43.714653	2020-06-24 10:00:43.714653	\N	\N	\N
1642986	115	1	Double Room	USD	67.66	2020-06-25	0	0	2020-06-24 10:00:43.735258	2020-06-24 10:00:43.735258	\N	\N	\N
1642987	75	1	Small Single Room - Non-Smoking (2 Adult)	USD	67.54	2020-06-25	0	0	2020-06-24 10:00:43.741808	2020-06-24 10:00:43.741808	\N	\N	\N
1642988	158	1	Superior Twin Non-Smoking	USD	87.84	2020-06-25	0	0	2020-06-24 10:00:43.752503	2020-06-24 10:00:43.752503	\N	\N	\N
1642989	153	1	Standard Twin Room	USD	181.55	2020-06-25	0	0	2020-06-24 10:00:43.75878	2020-06-24 10:00:43.75878	\N	\N	\N
1642990	131	1	Superior Double Room	USD	52.35	2020-06-25	0	0	2020-06-24 10:00:43.770676	2020-06-24 10:00:43.770676	\N	\N	\N
1642991	184	1	Superior Room	USD	70.35	2020-06-25	386.91	0	2020-06-24 10:00:43.779173	2020-06-24 10:00:43.779173	\N	\N	\N
1642992	176	1	Economy Twin Room	USD	122.38	2020-06-25	0	0	2020-06-24 10:00:43.785194	2020-06-24 10:00:43.785194	\N	\N	\N
1642993	113	1	2 Queen Beds 	USD	152.15	2020-06-25	0	0	2020-06-24 10:00:43.791207	2020-06-24 10:00:43.791207	\N	\N	\N
1642994	53	1	Superior Twin	USD	129.52	2020-06-25	0	0	2020-06-24 10:00:43.797309	2020-06-24 10:00:43.797309	\N	\N	\N
1642995	143	1	Business Room	USD	217.51	2020-06-25	0	0	2020-06-24 10:00:43.802946	2020-06-24 10:00:43.802946	\N	\N	\N
1642996	108	1	Standard Double Room	USD	84.68	2020-06-25	0	0	2020-06-24 10:00:43.808785	2020-06-24 10:00:43.808785	\N	\N	\N
1642997	13	1	Premium Twin Room with Two Double Beds	USD	126.74	2020-06-25	0	0	2020-06-24 10:00:43.817474	2020-06-24 10:00:43.817474	\N	\N	\N
1642998	64	1	Comfort Room	USD	50.7	2020-06-25	181	0	2020-06-24 10:00:43.823522	2020-06-24 10:00:43.823522	\N	\N	\N
1642999	125	1	Standard Double or Twin Room	USD	30	2020-06-25	0	0	2020-06-24 10:00:43.82915	2020-06-24 10:00:43.82915	\N	\N	\N
1643000	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-25	0	0	2020-06-24 10:00:43.834637	2020-06-24 10:00:43.834637	\N	\N	\N
1643001	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-25	0	0	2020-06-24 10:00:43.840192	2020-06-24 10:00:43.840192	\N	\N	\N
1643002	194	1	Single Deluxe Non-Smoking	USD	196.31	2020-06-25	0	0	2020-06-24 10:00:43.849689	2020-06-24 10:00:43.849689	\N	\N	\N
1643003	95	1	 Twin Guestroom	USD	160.46	2020-06-25	0	0	2020-06-24 10:00:43.86141	2020-06-24 10:00:43.86141	\N	\N	\N
1643004	157	1	Cosy Small Room	USD	122.72	2020-06-25	0	0	2020-06-24 10:00:43.867402	2020-06-24 10:00:43.867402	\N	\N	\N
1643005	26	1	Double	USD	80.03	2020-06-25	0	0	2020-06-24 10:00:43.873412	2020-06-24 10:00:43.873412	\N	\N	\N
1643006	61	1	Modern Double Room	USD	193.97	2020-06-25	0	0	2020-06-24 10:00:43.878875	2020-06-24 10:00:43.878875	\N	\N	\N
1643007	109	1	Classic Double Room	USD	188.19	2020-06-25	0	0	2020-06-24 10:00:43.884638	2020-06-24 10:00:43.884638	\N	\N	\N
1643008	181	1	Superior Double Room	USD	61.94	2020-06-25	0	0	2020-06-24 10:00:43.890328	2020-06-24 10:00:43.890328	\N	\N	\N
1643009	49	1	Superior Twin Room	USD	115.24	2020-06-25	0	0	2020-06-24 10:00:43.896009	2020-06-24 10:00:43.896009	\N	\N	\N
1643010	136	1	Standard Double or Twin Room	USD	126.32	2020-06-25	0	0	2020-06-24 10:00:43.903212	2020-06-24 10:00:43.903212	\N	\N	\N
1643011	159	1	Standard Room with 1 double bed and sofa	USD	83.52	2020-06-25	0	0	2020-06-24 10:00:43.91258	2020-06-24 10:00:43.91258	\N	\N	\N
1643012	42	1	Standard Twin Room	USD	69.7	2020-06-25	0	0	2020-06-24 10:00:43.918148	2020-06-24 10:00:43.918148	\N	\N	\N
1643013	90	1	Standard Room	USD	82.27	2020-06-25	329.08	0	2020-06-24 10:00:43.923761	2020-06-24 10:00:43.923761	\N	\N	\N
1643014	106	1	Double Room with Two Single Beds	USD	28.62	2020-06-25	0	0	2020-06-24 10:00:43.929751	2020-06-24 10:00:43.929751	\N	\N	\N
1643015	27	1	Standard Twin Room - Smoking	USD	167.66	2020-06-25	545.55	0	2020-06-24 10:00:43.935608	2020-06-24 10:00:43.935608	\N	\N	\N
1643016	77	1	Double Room - North Side	USD	137.81	2020-06-25	0	0	2020-06-24 10:00:43.941064	2020-06-24 10:00:43.941064	\N	\N	\N
1643017	31	1	Classic Double or Twin Room with Hill View	USD	315.71	2020-06-25	0	0	2020-06-24 10:00:43.946619	2020-06-24 10:00:43.946619	\N	\N	\N
1643018	18	1	Superior Room	USD	118.95	2020-06-25	533.59	0	2020-06-24 10:00:43.968023	2020-06-24 10:00:43.968023	\N	\N	\N
1643019	139	1	Small Double	USD	102.02	2020-06-25	510.09	20	2020-06-24 10:00:43.974275	2020-06-24 10:00:43.974275	\N	\N	\N
1643020	14	1	Classic Double Bed	USD	143.45	2020-06-25	0	0	2020-06-24 10:00:43.982559	2020-06-24 10:00:43.982559	\N	\N	\N
1643021	79	1	Standard Room	USD	58.14	2020-06-25	0	0	2020-06-24 10:00:43.988794	2020-06-24 10:00:43.988794	\N	\N	\N
1643022	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	75.14	2020-06-25	0	0	2020-06-24 10:00:43.994703	2020-06-24 10:00:43.994703	\N	\N	\N
1643023	67	1	Trendy Garden View Room	USD	203.9	2020-06-25	0	0	2020-06-24 10:00:44.002151	2020-06-24 10:00:44.002151	\N	\N	\N
1643024	160	1	1 King Bed	USD	109	2020-06-25	0	0	2020-06-24 10:00:44.008421	2020-06-24 10:00:44.008421	\N	\N	\N
1643025	54	1	Double Room	USD	175.59	2020-06-25	857.55	0	2020-06-24 10:00:44.014433	2020-06-24 10:00:44.014433	\N	\N	\N
1643026	47	1	Standard room half board	USD	188.43	2020-06-25	500	0	2020-06-24 10:00:44.022205	2020-06-24 10:00:44.022205	\N	\N	\N
1643027	35	1	Twin - Non-Smoking	USD	98.63	2020-06-25	0	0	2020-06-24 10:00:44.029738	2020-06-24 10:00:44.029738	\N	\N	\N
1643028	38	1	Deluxe Double or Twin Room with Sea View	USD	169.15	2020-06-25	0	0	2020-06-24 10:00:44.037682	2020-06-24 10:00:44.037682	\N	\N	\N
1643029	192	1	Comfort Room	USD	78.23	2020-06-25	226.24	0	2020-06-24 10:00:44.043556	2020-06-24 10:00:44.043556	\N	\N	\N
1643030	165	1	Basic Room	USD	91.53	2020-06-25	0	0	2020-06-24 10:00:44.049528	2020-06-24 10:00:44.049528	\N	\N	\N
1643031	200	1	Double Standard	USD	122.38	2020-06-25	315.61	0	2020-06-24 10:00:44.069671	2020-06-24 10:00:44.069671	\N	\N	\N
1643032	215	1	Deluxe - 3 persons	USD	36.1	2020-06-25	144.41	25	2020-06-24 10:00:44.460832	2020-06-24 10:00:44.460832	\N	\N	\N
1643033	261	1	Superior Twin or Double Room	USD	62.2	2020-06-25	0	0	2020-06-24 10:00:44.471379	2020-06-24 10:00:44.471379	\N	\N	\N
1643034	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-06-25	0	0	2020-06-24 10:00:44.478107	2020-06-24 10:00:44.478107	\N	\N	\N
1643035	301	1	Comfort Double or Twin Room	USD	132.66	2020-06-25	0	0	2020-06-24 10:00:44.483898	2020-06-24 10:00:44.483898	\N	\N	\N
1643036	293	1	Budget Double Room	USD	72.95	2020-06-25	0	0	2020-06-24 10:00:44.489525	2020-06-24 10:00:44.489525	\N	\N	\N
1643037	243	1	Double Room with Two Single Beds	USD	74.3	2020-06-25	0	0	2020-06-24 10:00:44.495203	2020-06-24 10:00:44.495203	\N	\N	\N
1643038	256	1	Standard Double Room	USD	116.29	2020-06-25	0	0	2020-06-24 10:00:44.503156	2020-06-24 10:00:44.503156	\N	\N	\N
1643040	285	1	Superior Room king bed	USD	93.16	2020-06-25	0	0	2020-06-24 10:00:44.521243	2020-06-24 10:00:44.521243	\N	\N	\N
1643042	314	1	1 Double Bed Non-Smoking	USD	146.21	2020-06-25	0	0	2020-06-24 10:00:44.533328	2020-06-24 10:00:44.533328	\N	\N	\N
1643043	274	1	Small Double Room Non-Smoking	USD	198.73	2020-06-25	0	0	2020-06-24 10:00:44.542251	2020-06-24 10:00:44.542251	\N	\N	\N
1643044	306	1	Deluxe King City View	USD	117.55	2020-06-25	301.7	0	2020-06-24 10:00:44.550446	2020-06-24 10:00:44.550446	\N	\N	\N
1643045	290	1	Standard	USD	94.1	2020-06-25	0	0	2020-06-24 10:00:44.55643	2020-06-24 10:00:44.55643	\N	\N	\N
1643048	258	1	Standard Double Room	USD	33.41	2020-06-25	0	0	2020-06-24 10:00:44.577269	2020-06-24 10:00:44.577269	\N	\N	\N
1643049	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-25	0	0	2020-06-24 10:00:44.582941	2020-06-24 10:00:44.582941	\N	\N	\N
1643051	275	1	Double or Twin Room	USD	88.7	2020-06-25	0	0	2020-06-24 10:00:44.596851	2020-06-24 10:00:44.596851	\N	\N	\N
1643052	204	1	King Bed	USD	221.2	2020-06-25	0	0	2020-06-24 10:00:44.603115	2020-06-24 10:00:44.603115	\N	\N	\N
1643054	295	1	Classic Double or Twin	USD	221.21	2020-06-25	463.8	0	2020-06-24 10:00:44.615349	2020-06-24 10:00:44.615349	\N	\N	\N
1643057	307	1	1 King Bed	USD	383.23	2020-06-25	0	0	2020-06-24 10:00:44.635352	2020-06-24 10:00:44.635352	\N	\N	\N
1643058	302	1	2 Queen Beds 	USD	84	2020-06-25	0	0	2020-06-24 10:00:44.643032	2020-06-24 10:00:44.643032	\N	\N	\N
1643064	206	1	Standard	USD	71.96	2020-06-25	0	0	2020-06-24 10:00:44.694164	2020-06-24 10:00:44.694164	\N	\N	\N
1643065	263	1	Queen Hilton Guestroom	USD	131.5	2020-06-25	0	0	2020-06-24 10:00:44.70014	2020-06-24 10:00:44.70014	\N	\N	\N
1667924	23	1	1 King Bed Evolution Room 	USD	119	2020-06-26	0	0	2020-06-25 10:00:39.920941	2020-06-25 10:00:39.920941	\N	\N	\N
1667925	45	1	Classic Double or Twin	USD	121.99	2020-06-26	0	0	2020-06-25 10:00:39.955114	2020-06-25 10:00:39.955114	\N	\N	\N
1667926	115	1	Double Room	USD	69.55	2020-06-26	0	0	2020-06-25 10:00:39.964874	2020-06-25 10:00:39.964874	\N	\N	\N
1667927	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	67.29	2020-06-26	0	0	2020-06-25 10:00:39.971632	2020-06-25 10:00:39.971632	\N	\N	\N
1667928	158	1	Superior Twin Non-Smoking	USD	78.83	2020-06-26	0	0	2020-06-25 10:00:39.98068	2020-06-25 10:00:39.98068	\N	\N	\N
1667929	153	1	Standard Twin Room	USD	120.43	2020-06-26	0	0	2020-06-25 10:00:39.996063	2020-06-25 10:00:39.996063	\N	\N	\N
1667930	131	1	Superior Double Room	USD	52.33	2020-06-26	0	0	2020-06-25 10:00:40.058563	2020-06-25 10:00:40.058563	\N	\N	\N
1667931	184	1	Superior Room	USD	79.05	2020-06-26	417.77	0	2020-06-25 10:00:40.067069	2020-06-25 10:00:40.067069	\N	\N	\N
1667932	176	1	Economy Twin Room	USD	121.99	2020-06-26	0	0	2020-06-25 10:00:40.073195	2020-06-25 10:00:40.073195	\N	\N	\N
1667933	113	1	2 Queen Beds 	USD	169.15	2020-06-26	0	0	2020-06-25 10:00:40.079532	2020-06-25 10:00:40.079532	\N	\N	\N
1667934	53	1	Executive Room with Club Lounge Access	USD	250.77	2020-06-26	0	0	2020-06-25 10:00:40.085894	2020-06-25 10:00:40.085894	\N	\N	\N
1667935	143	1	Standard Double Room	USD	151.22	2020-06-26	0	0	2020-06-25 10:00:40.092392	2020-06-25 10:00:40.092392	\N	\N	\N
1667936	108	1	Standard Double Room	USD	89.16	2020-06-26	0	0	2020-06-25 10:00:40.098538	2020-06-25 10:00:40.098538	\N	\N	\N
1667937	13	1	Premium Twin Room with Two Double Beds	USD	125.17	2020-06-26	0	0	2020-06-25 10:00:40.106296	2020-06-25 10:00:40.106296	\N	\N	\N
1667938	8	1	Twin Room	USD	158.03	2020-06-26	0	0	2020-06-25 10:00:40.112599	2020-06-25 10:00:40.112599	\N	\N	\N
1667939	64	1	Comfort Room	USD	47.93	2020-06-26	0	0	2020-06-25 10:00:40.119497	2020-06-25 10:00:40.119497	\N	\N	\N
1667940	125	1	Standard Double or Twin Room	USD	30	2020-06-26	0	0	2020-06-25 10:00:40.125841	2020-06-25 10:00:40.125841	\N	\N	\N
1667941	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-26	0	0	2020-06-25 10:00:40.132128	2020-06-25 10:00:40.132128	\N	\N	\N
1667942	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-26	0	0	2020-06-25 10:00:40.138579	2020-06-25 10:00:40.138579	\N	\N	\N
1667943	194	1	Standard Small Double Room - Non-Smoking	USD	176.35	2020-06-26	0	0	2020-06-25 10:00:40.149234	2020-06-25 10:00:40.149234	\N	\N	\N
1667944	95	1	 Twin Guestroom	USD	159.95	2020-06-26	0	0	2020-06-25 10:00:40.156591	2020-06-25 10:00:40.156591	\N	\N	\N
1667945	157	1	Cosy Small Room	USD	111.49	2020-06-26	0	0	2020-06-25 10:00:40.162741	2020-06-25 10:00:40.162741	\N	\N	\N
1667946	26	1	Double	USD	79.78	2020-06-26	0	0	2020-06-25 10:00:40.168762	2020-06-25 10:00:40.168762	\N	\N	\N
1667947	61	1	Modern Double Room	USD	193.45	2020-06-26	0	0	2020-06-25 10:00:40.1747	2020-06-25 10:00:40.1747	\N	\N	\N
1667948	109	1	Classic Double Room	USD	187.6	2020-06-26	0	0	2020-06-25 10:00:40.180696	2020-06-25 10:00:40.180696	\N	\N	\N
1667949	181	1	Superior Double Room	USD	61.94	2020-06-26	0	0	2020-06-25 10:00:40.188296	2020-06-25 10:00:40.188296	\N	\N	\N
1667950	49	1	Superior Twin Room	USD	104.33	2020-06-26	0	0	2020-06-25 10:00:40.194387	2020-06-25 10:00:40.194387	\N	\N	\N
1667951	159	1	Standard Room with 1 double bed and sofa	USD	83.25	2020-06-26	0	0	2020-06-25 10:00:40.20533	2020-06-25 10:00:40.20533	\N	\N	\N
1667952	42	1	Standard Twin Room	USD	69.7	2020-06-26	0	0	2020-06-25 10:00:40.211648	2020-06-25 10:00:40.211648	\N	\N	\N
1667953	90	1	Standard Room	USD	83.65	2020-06-26	334.61	0	2020-06-25 10:00:40.217898	2020-06-25 10:00:40.217898	\N	\N	\N
1667954	106	1	Double Room with Two Single Beds	USD	27.86	2020-06-26	0	0	2020-06-25 10:00:40.223979	2020-06-25 10:00:40.223979	\N	\N	\N
1667955	27	1	Standard Twin Room - Smoking	USD	167.06	2020-06-26	543.57	0	2020-06-25 10:00:40.230128	2020-06-25 10:00:40.230128	\N	\N	\N
1667956	77	1	Double Room - North Side	USD	137.45	2020-06-26	0	0	2020-06-25 10:00:40.235697	2020-06-25 10:00:40.235697	\N	\N	\N
1667957	31	1	Classic Double or Twin Room with Hill View	USD	325.99	2020-06-26	0	0	2020-06-25 10:00:40.241496	2020-06-25 10:00:40.241496	\N	\N	\N
1667958	18	1	Superior Room	USD	98.99	2020-06-26	0	0	2020-06-25 10:00:40.247373	2020-06-25 10:00:40.247373	\N	\N	\N
1667959	139	1	Small Double	USD	127.12	2020-06-26	508.48	0	2020-06-25 10:00:40.265264	2020-06-25 10:00:40.265264	\N	\N	\N
1667960	14	1	Classic Double Bed	USD	122.49	2020-06-26	0	0	2020-06-25 10:00:40.273445	2020-06-25 10:00:40.273445	\N	\N	\N
1667961	79	1	Standard Room	USD	57.96	2020-06-26	0	0	2020-06-25 10:00:40.279695	2020-06-25 10:00:40.279695	\N	\N	\N
1667962	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.87	2020-06-26	0	0	2020-06-25 10:00:40.285609	2020-06-25 10:00:40.285609	\N	\N	\N
1667963	67	1	Bash Tower Ocean View Room	USD	182.7	2020-06-26	0	0	2020-06-25 10:00:40.291371	2020-06-25 10:00:40.291371	\N	\N	\N
1667964	160	1	1 King Bed	USD	94	2020-06-26	0	0	2020-06-25 10:00:40.297517	2020-06-25 10:00:40.297517	\N	\N	\N
1667965	54	1	Double Room	USD	152.73	2020-06-26	765.66	0	2020-06-25 10:00:40.303506	2020-06-25 10:00:40.303506	\N	\N	\N
1667966	47	1	Standard room half board	USD	188.43	2020-06-26	500	0	2020-06-25 10:00:40.310699	2020-06-25 10:00:40.310699	\N	\N	\N
1667967	35	1	Twin - Non-Smoking	USD	98.27	2020-06-26	0	0	2020-06-25 10:00:40.332949	2020-06-25 10:00:40.332949	\N	\N	\N
1667968	38	1	Deluxe Double or Twin Room with Sea View	USD	168.62	2020-06-26	0	0	2020-06-25 10:00:40.34087	2020-06-25 10:00:40.34087	\N	\N	\N
1667969	192	1	Comfort Room	USD	67.44	2020-06-26	225.53	0	2020-06-25 10:00:40.349751	2020-06-25 10:00:40.349751	\N	\N	\N
1667970	165	1	Basic Room	USD	91.24	2020-06-26	0	0	2020-06-25 10:00:40.355938	2020-06-25 10:00:40.355938	\N	\N	\N
1667971	200	1	Double Standard	USD	121.99	2020-06-26	314.61	0	2020-06-25 10:00:40.362054	2020-06-25 10:00:40.362054	\N	\N	\N
1667972	215	1	Deluxe - 3 persons	USD	33.58	2020-06-26	134.31	25	2020-06-25 10:00:41.746537	2020-06-25 10:00:41.746537	\N	\N	\N
1667973	261	1	Superior Twin or Double Room	USD	62.2	2020-06-26	0	0	2020-06-25 10:00:41.757161	2020-06-25 10:00:41.757161	\N	\N	\N
1667974	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-06-26	0	0	2020-06-25 10:00:41.765799	2020-06-25 10:00:41.765799	\N	\N	\N
1667975	301	1	Comfort Double or Twin Room	USD	137.37	2020-06-26	0	0	2020-06-25 10:00:41.771698	2020-06-25 10:00:41.771698	\N	\N	\N
1667976	293	1	Budget Double Room	USD	72.72	2020-06-26	0	0	2020-06-25 10:00:41.77765	2020-06-25 10:00:41.77765	\N	\N	\N
1667977	243	1	Double Room with Two Single Beds	USD	60.13	2020-06-26	0	0	2020-06-25 10:00:41.783431	2020-06-25 10:00:41.783431	\N	\N	\N
1667978	256	1	Standard Double Room	USD	94.85	2020-06-26	0	0	2020-06-25 10:00:41.790048	2020-06-25 10:00:41.790048	\N	\N	\N
1667979	285	1	Superior Room king bed	USD	100.9	2020-06-26	0	0	2020-06-25 10:00:41.797925	2020-06-25 10:00:41.797925	\N	\N	\N
1667981	314	1	1 Double Bed Non-Smoking	USD	145.75	2020-06-26	0	0	2020-06-25 10:00:41.813105	2020-06-25 10:00:41.813105	\N	\N	\N
1667982	274	1	Small Double Room Non-Smoking	USD	211.93	2020-06-26	0	0	2020-06-25 10:00:41.822375	2020-06-25 10:00:41.822375	\N	\N	\N
1667983	306	1	Deluxe King City View	USD	112.32	2020-06-26	301.7	30	2020-06-25 10:00:41.831438	2020-06-25 10:00:41.831438	\N	\N	\N
1667984	290	1	Standard	USD	93.8	2020-06-26	0	0	2020-06-25 10:00:41.837771	2020-06-25 10:00:41.837771	\N	\N	\N
1667987	258	1	Standard Double Room	USD	32.51	2020-06-26	0	0	2020-06-25 10:00:41.857452	2020-06-25 10:00:41.857452	\N	\N	\N
1667988	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-26	0	0	2020-06-25 10:00:41.869415	2020-06-25 10:00:41.869415	\N	\N	\N
1667990	275	1	Double or Twin Room	USD	88.42	2020-06-26	0	0	2020-06-25 10:00:41.883736	2020-06-25 10:00:41.883736	\N	\N	\N
1667991	204	1	King Bed	USD	183.24	2020-06-26	0	0	2020-06-25 10:00:41.88955	2020-06-25 10:00:41.88955	\N	\N	\N
1667993	295	1	Classic Double or Twin	USD	211.28	2020-06-26	462.34	0	2020-06-25 10:00:41.902991	2020-06-25 10:00:41.902991	\N	\N	\N
1667996	307	1	1 King Bed	USD	381.85	2020-06-26	0	0	2020-06-25 10:00:41.924542	2020-06-25 10:00:41.924542	\N	\N	\N
1667997	251	1	Standard Queen Room	USD	89.35	2020-06-26	0	0	2020-06-25 10:00:41.930598	2020-06-25 10:00:41.930598	\N	\N	\N
1667999	302	1	2 Queen Beds 	USD	89	2020-06-26	0	0	2020-06-25 10:00:41.945358	2020-06-25 10:00:41.945358	\N	\N	\N
1668005	206	1	Standard	USD	71.56	2020-06-26	0	0	2020-06-25 10:00:41.998323	2020-06-25 10:00:41.998323	\N	\N	\N
1668006	263	1	Queen Hilton Guestroom	USD	145.06	2020-06-26	0	0	2020-06-25 10:00:42.006925	2020-06-25 10:00:42.006925	\N	\N	\N
1691865	23	1	1 King Bed Evolution Room 	USD	119	2020-06-27	0	0	2020-06-26 10:00:39.334654	2020-06-26 10:00:39.334654	\N	\N	\N
1691866	45	1	Classic Double or Twin	USD	121.43	2020-06-27	0	0	2020-06-26 10:00:39.353429	2020-06-26 10:00:39.353429	\N	\N	\N
1691867	115	1	Double Room	USD	107	2020-06-27	0	0	2020-06-26 10:00:39.37203	2020-06-26 10:00:39.37203	\N	\N	\N
1691868	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	82.49	2020-06-27	0	0	2020-06-26 10:00:39.38294	2020-06-26 10:00:39.38294	\N	\N	\N
1691869	158	1	Superior Twin Non-Smoking	USD	78.83	2020-06-27	0	0	2020-06-26 10:00:39.390832	2020-06-26 10:00:39.390832	\N	\N	\N
1691870	153	1	Standard Twin Room	USD	119.88	2020-06-27	0	0	2020-06-26 10:00:39.396877	2020-06-26 10:00:39.396877	\N	\N	\N
1691871	131	1	Superior Double Room	USD	52.05	2020-06-27	0	0	2020-06-26 10:00:39.404935	2020-06-26 10:00:39.404935	\N	\N	\N
1691872	184	1	Superior Room	USD	61.91	2020-06-27	349.19	0	2020-06-26 10:00:39.411531	2020-06-26 10:00:39.411531	\N	\N	\N
1691873	176	1	Economy Twin Room	USD	121.43	2020-06-27	0	0	2020-06-26 10:00:39.417309	2020-06-26 10:00:39.417309	\N	\N	\N
1691874	113	1	2 Queen Beds 	USD	169.15	2020-06-27	0	0	2020-06-26 10:00:39.42307	2020-06-26 10:00:39.42307	\N	\N	\N
1691875	53	1	Superior King	USD	139.2	2020-06-27	0	0	2020-06-26 10:00:39.42929	2020-06-26 10:00:39.42929	\N	\N	\N
1691876	143	1	Standard Double Room	USD	150.49	2020-06-27	0	0	2020-06-26 10:00:39.435405	2020-06-26 10:00:39.435405	\N	\N	\N
1691877	108	1	Standard Double Room	USD	88.75	2020-06-27	0	0	2020-06-26 10:00:39.441287	2020-06-26 10:00:39.441287	\N	\N	\N
1691878	13	1	Premium Plus King	USD	170.56	2020-06-27	0	0	2020-06-26 10:00:39.466318	2020-06-26 10:00:39.466318	\N	\N	\N
1691879	8	1	Twin Room	USD	157.27	2020-06-27	0	0	2020-06-26 10:00:39.472839	2020-06-26 10:00:39.472839	\N	\N	\N
1691880	64	1	Comfort Room	USD	47.7	2020-06-27	0	0	2020-06-26 10:00:39.478767	2020-06-26 10:00:39.478767	\N	\N	\N
1691881	125	1	Standard Double or Twin Room	USD	30	2020-06-27	0	0	2020-06-26 10:00:39.484679	2020-06-26 10:00:39.484679	\N	\N	\N
1691882	199	1	Standard Room with 1 double bed	USD	34.84	2020-06-27	0	0	2020-06-26 10:00:39.490706	2020-06-26 10:00:39.490706	\N	\N	\N
1691883	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-27	0	0	2020-06-26 10:00:39.497117	2020-06-26 10:00:39.497117	\N	\N	\N
1691884	194	1	Standard Small Double Room - Non-Smoking	USD	168.06	2020-06-27	0	0	2020-06-26 10:00:39.50658	2020-06-26 10:00:39.50658	\N	\N	\N
1691885	95	1	 Twin Guestroom	USD	159.21	2020-06-27	0	0	2020-06-26 10:00:39.514476	2020-06-26 10:00:39.514476	\N	\N	\N
1691886	157	1	Cosy Small Room	USD	105.74	2020-06-27	0	0	2020-06-26 10:00:39.525172	2020-06-26 10:00:39.525172	\N	\N	\N
1691887	26	1	Double	USD	79.41	2020-06-27	0	0	2020-06-26 10:00:39.531348	2020-06-26 10:00:39.531348	\N	\N	\N
1691888	61	1	Modern Double Room	USD	213.57	2020-06-27	0	0	2020-06-26 10:00:39.537527	2020-06-26 10:00:39.537527	\N	\N	\N
1691889	109	1	Classic Double Room	USD	197.96	2020-06-27	0	0	2020-06-26 10:00:39.543696	2020-06-26 10:00:39.543696	\N	\N	\N
1691890	181	1	Superior Double Room	USD	61.94	2020-06-27	0	0	2020-06-26 10:00:39.549854	2020-06-26 10:00:39.549854	\N	\N	\N
1691891	49	1	Superior Double Room	USD	103.85	2020-06-27	0	0	2020-06-26 10:00:39.555872	2020-06-26 10:00:39.555872	\N	\N	\N
1691892	136	1	Standard Double or Twin Room	USD	125.9	2020-06-27	0	0	2020-06-26 10:00:39.571087	2020-06-26 10:00:39.571087	\N	\N	\N
1691893	159	1	Standard Room with 1 double bed and sofa	USD	82.87	2020-06-27	0	0	2020-06-26 10:00:39.57926	2020-06-26 10:00:39.57926	\N	\N	\N
1691894	42	1	Standard Twin Room	USD	69.7	2020-06-27	0	0	2020-06-26 10:00:39.585213	2020-06-26 10:00:39.585213	\N	\N	\N
1691895	90	1	Standard Room	USD	83.27	2020-06-27	333.07	0	2020-06-26 10:00:39.595123	2020-06-26 10:00:39.595123	\N	\N	\N
1691896	106	1	Double Room with Two Single Beds	USD	27.5	2020-06-27	0	0	2020-06-26 10:00:39.601047	2020-06-26 10:00:39.601047	\N	\N	\N
1691897	27	1	Standard Twin Room - Smoking	USD	166.5	2020-06-27	541.77	0	2020-06-26 10:00:39.606823	2020-06-26 10:00:39.606823	\N	\N	\N
1691898	77	1	Double Room - North Side	USD	137.29	2020-06-27	0	0	2020-06-26 10:00:39.612844	2020-06-26 10:00:39.612844	\N	\N	\N
1691899	31	1	Classic Double or Twin Room with Hill View	USD	333.67	2020-06-27	0	0	2020-06-26 10:00:39.61863	2020-06-26 10:00:39.61863	\N	\N	\N
1691900	18	1	Superior Room	USD	98.74	2020-06-27	0	0	2020-06-26 10:00:39.624809	2020-06-26 10:00:39.624809	\N	\N	\N
1691901	139	1	Small Double	USD	126.53	2020-06-27	506.14	0	2020-06-26 10:00:39.630503	2020-06-26 10:00:39.630503	\N	\N	\N
1691902	14	1	Classic Double Bed	USD	121.93	2020-06-27	0	0	2020-06-26 10:00:39.63766	2020-06-26 10:00:39.63766	\N	\N	\N
1691903	79	1	Standard Room	USD	57.69	2020-06-27	0	0	2020-06-26 10:00:39.643275	2020-06-26 10:00:39.643275	\N	\N	\N
1691904	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.28	2020-06-27	0	0	2020-06-26 10:00:39.649089	2020-06-26 10:00:39.649089	\N	\N	\N
1691905	67	1	Bash Tower Ocean View Room	USD	182.7	2020-06-27	0	0	2020-06-26 10:00:39.665306	2020-06-26 10:00:39.665306	\N	\N	\N
1691906	160	1	1 King Bed	USD	94	2020-06-27	0	0	2020-06-26 10:00:39.675025	2020-06-26 10:00:39.675025	\N	\N	\N
1691907	54	1	Double Room	USD	152.55	2020-06-27	764.78	0	2020-06-26 10:00:39.682067	2020-06-26 10:00:39.682067	\N	\N	\N
1691908	47	1	Standard room half board	USD	188.43	2020-06-27	500	0	2020-06-26 10:00:39.689653	2020-06-26 10:00:39.689653	\N	\N	\N
1691909	35	1	Twin - Non-Smoking	USD	107.78	2020-06-27	0	0	2020-06-26 10:00:39.696556	2020-06-26 10:00:39.696556	\N	\N	\N
1691910	38	1	Deluxe Double or Twin Room with Sea View	USD	167.84	2020-06-27	0	0	2020-06-26 10:00:39.704123	2020-06-26 10:00:39.704123	\N	\N	\N
1691911	192	1	Comfort Room	USD	67.13	2020-06-27	224.49	0	2020-06-26 10:00:39.710956	2020-06-26 10:00:39.710956	\N	\N	\N
1691912	165	1	Basic Room	USD	90.82	2020-06-27	0	0	2020-06-26 10:00:39.716718	2020-06-26 10:00:39.716718	\N	\N	\N
1691913	200	1	Double Standard	USD	121.43	2020-06-27	313.17	0	2020-06-26 10:00:39.722954	2020-06-26 10:00:39.722954	\N	\N	\N
1691914	215	1	Deluxe - 3 persons	USD	36.1	2020-06-27	144.4	25	2020-06-26 10:00:40.067578	2020-06-26 10:00:40.067578	\N	\N	\N
1691915	261	1	Superior Twin or Double Room	USD	62.2	2020-06-27	0	0	2020-06-26 10:00:40.07607	2020-06-26 10:00:40.07607	\N	\N	\N
1691916	224	1	Superior King	USD	76.24	2020-06-27	268.24	0	2020-06-26 10:00:40.082182	2020-06-26 10:00:40.082182	\N	\N	\N
1691917	300	1	Deluxe Room, Guestroom, 1 King	USD	138.13	2020-06-27	0	0	2020-06-26 10:00:40.09031	2020-06-26 10:00:40.09031	\N	\N	\N
1691918	293	1	Budget Double Room	USD	72.39	2020-06-27	0	0	2020-06-26 10:00:40.096851	2020-06-26 10:00:40.096851	\N	\N	\N
1691919	243	1	Double Room with Two Single Beds	USD	59.85	2020-06-27	0	0	2020-06-26 10:00:40.103254	2020-06-26 10:00:40.103254	\N	\N	\N
1691920	256	1	Standard Double Room	USD	94.41	2020-06-27	0	0	2020-06-26 10:00:40.109875	2020-06-26 10:00:40.109875	\N	\N	\N
1691921	285	1	Superior Room king bed	USD	97.86	2020-06-27	0	0	2020-06-26 10:00:40.117198	2020-06-26 10:00:40.117198	\N	\N	\N
1691923	314	1	1 Double Bed Non-Smoking	USD	145.08	2020-06-27	0	0	2020-06-26 10:00:40.131694	2020-06-26 10:00:40.131694	\N	\N	\N
1691924	274	1	Standard Twin Room - Non-Smoking	USD	277.53	2020-06-27	391.78	0	2020-06-26 10:00:40.138747	2020-06-26 10:00:40.138747	\N	\N	\N
1691925	306	1	Deluxe King City View	USD	104.51	2020-06-27	301.77	30	2020-06-26 10:00:40.146822	2020-06-26 10:00:40.146822	\N	\N	\N
1691926	290	1	Standard	USD	93.37	2020-06-27	0	0	2020-06-26 10:00:40.152882	2020-06-26 10:00:40.152882	\N	\N	\N
1691929	258	1	Standard Double Room	USD	32.1	2020-06-27	0	0	2020-06-26 10:00:40.179959	2020-06-26 10:00:40.179959	\N	\N	\N
1691930	216	1	2 Double Accessible Roll in Shower	USD	109	2020-06-27	0	0	2020-06-26 10:00:40.186097	2020-06-26 10:00:40.186097	\N	\N	\N
1691932	275	1	Double or Twin Room	USD	87.75	2020-06-27	0	0	2020-06-26 10:00:40.198548	2020-06-26 10:00:40.198548	\N	\N	\N
1691933	204	1	Two Queen Beds	USD	187.6	2020-06-27	0	0	2020-06-26 10:00:40.204653	2020-06-26 10:00:40.204653	\N	\N	\N
1691935	295	1	Classic Double or Twin	USD	210.31	2020-06-27	460.21	0	2020-06-26 10:00:40.2167	2020-06-26 10:00:40.2167	\N	\N	\N
1691938	307	1	1 King Bed	USD	380.58	2020-06-27	0	0	2020-06-26 10:00:40.235459	2020-06-26 10:00:40.235459	\N	\N	\N
1691939	251	1	Standard Queen Room	USD	88.98	2020-06-27	0	0	2020-06-26 10:00:40.241275	2020-06-26 10:00:40.241275	\N	\N	\N
1691941	302	1	2 Queen Beds 	USD	89	2020-06-27	0	0	2020-06-26 10:00:40.272037	2020-06-26 10:00:40.272037	\N	\N	\N
1691947	206	1	Standard	USD	71.39	2020-06-27	0	0	2020-06-26 10:00:40.30879	2020-06-26 10:00:40.30879	\N	\N	\N
1691948	263	1	Queen Hilton Guestroom	USD	153.92	2020-06-27	0	0	2020-06-26 10:00:40.315125	2020-06-26 10:00:40.315125	\N	\N	\N
1714367	23	1	1 King Bed Evolution Room 	USD	119	2020-06-28	0	0	2020-06-27 10:00:44.947656	2020-06-27 10:00:44.947656	\N	\N	\N
1714368	45	1	Classic Double or Twin	USD	121.48	2020-06-28	0	0	2020-06-27 10:00:44.967839	2020-06-27 10:00:44.967839	\N	\N	\N
1714369	115	1	Double Room	USD	64.02	2020-06-28	0	0	2020-06-27 10:00:44.985115	2020-06-27 10:00:44.985115	\N	\N	\N
1714370	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	59.39	2020-06-28	0	0	2020-06-27 10:00:44.991735	2020-06-27 10:00:44.991735	\N	\N	\N
1714371	158	1	Superior Twin Non-Smoking	USD	78.83	2020-06-28	0	0	2020-06-27 10:00:44.999122	2020-06-27 10:00:44.999122	\N	\N	\N
1714372	153	1	Standard Twin Room	USD	159.74	2020-06-28	0	0	2020-06-27 10:00:45.10249	2020-06-27 10:00:45.10249	\N	\N	\N
1714373	131	1	Superior Double Room	USD	51.65	2020-06-28	0	0	2020-06-27 10:00:45.150593	2020-06-27 10:00:45.150593	\N	\N	\N
1714374	184	1	Superior Room	USD	76.99	2020-06-28	409.51	0	2020-06-27 10:00:45.157621	2020-06-27 10:00:45.157621	\N	\N	\N
1714375	176	1	Economy Twin Room	USD	121.48	2020-06-28	0	0	2020-06-27 10:00:45.163506	2020-06-27 10:00:45.163506	\N	\N	\N
1714376	113	1	2 Queen Beds 	USD	152.15	2020-06-28	0	0	2020-06-27 10:00:45.169298	2020-06-27 10:00:45.169298	\N	\N	\N
1714377	53	1	Superior Twin	USD	128	2020-06-28	0	0	2020-06-27 10:00:45.17517	2020-06-27 10:00:45.17517	\N	\N	\N
1714378	143	1	Standard Double Room	USD	150.06	2020-06-28	0	0	2020-06-27 10:00:45.180813	2020-06-27 10:00:45.180813	\N	\N	\N
1714379	108	1	Standard Double Room	USD	84.07	2020-06-28	0	0	2020-06-27 10:00:45.186509	2020-06-27 10:00:45.186509	\N	\N	\N
1714380	13	1	Premium Twin Room with Two Double Beds	USD	120.23	2020-06-28	0	0	2020-06-27 10:00:45.193186	2020-06-27 10:00:45.193186	\N	\N	\N
1714381	8	1	Twin Room	USD	156.81	2020-06-28	0	0	2020-06-27 10:00:45.198734	2020-06-27 10:00:45.198734	\N	\N	\N
1714382	64	1	Comfort Room	USD	41.65	2020-06-28	0	0	2020-06-27 10:00:45.204279	2020-06-27 10:00:45.204279	\N	\N	\N
1714383	125	1	Standard Double or Twin Room	USD	30	2020-06-28	0	0	2020-06-27 10:00:45.210049	2020-06-27 10:00:45.210049	\N	\N	\N
1714384	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-28	0	0	2020-06-27 10:00:45.218218	2020-06-27 10:00:45.218218	\N	\N	\N
1714385	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-06-28	0	0	2020-06-27 10:00:45.223813	2020-06-27 10:00:45.223813	\N	\N	\N
1714386	194	1	Standard Small Double Room - Non-Smoking	USD	168.13	2020-06-28	0	0	2020-06-27 10:00:45.232036	2020-06-27 10:00:45.232036	\N	\N	\N
1714387	95	1	 Twin Guestroom	USD	159.29	2020-06-28	0	0	2020-06-27 10:00:45.238637	2020-06-27 10:00:45.238637	\N	\N	\N
1714388	157	1	Cosy Small Room	USD	99.12	2020-06-28	0	0	2020-06-27 10:00:45.246589	2020-06-27 10:00:45.246589	\N	\N	\N
1714389	26	1	Double	USD	79.45	2020-06-28	0	0	2020-06-27 10:00:45.265319	2020-06-27 10:00:45.265319	\N	\N	\N
1714390	61	1	Modern Double Room	USD	173.07	2020-06-28	0	0	2020-06-27 10:00:45.27178	2020-06-27 10:00:45.27178	\N	\N	\N
1714391	109	1	Classic Double Room	USD	163.34	2020-06-28	0	0	2020-06-27 10:00:45.277636	2020-06-27 10:00:45.277636	\N	\N	\N
1714392	181	1	Superior Double Room	USD	61.94	2020-06-28	0	0	2020-06-27 10:00:45.283351	2020-06-27 10:00:45.283351	\N	\N	\N
1714393	49	1	Superior Twin Room	USD	103.9	2020-06-28	0	0	2020-06-27 10:00:45.28915	2020-06-27 10:00:45.28915	\N	\N	\N
1714394	136	1	Standard Double or Twin Room	USD	131.58	2020-06-28	0	0	2020-06-27 10:00:45.296042	2020-06-27 10:00:45.296042	\N	\N	\N
1714395	159	1	Standard Room with 1 double bed and sofa	USD	82.91	2020-06-28	0	0	2020-06-27 10:00:45.303646	2020-06-27 10:00:45.303646	\N	\N	\N
1714396	42	1	Standard Twin Room	USD	69.7	2020-06-28	0	0	2020-06-27 10:00:45.310121	2020-06-27 10:00:45.310121	\N	\N	\N
1714397	90	1	Standard Room	USD	83.3	2020-06-28	333.22	0	2020-06-27 10:00:45.315932	2020-06-27 10:00:45.315932	\N	\N	\N
1714398	106	1	Double Room with Two Single Beds	USD	27.06	2020-06-28	0	0	2020-06-27 10:00:45.322011	2020-06-27 10:00:45.322011	\N	\N	\N
1714399	27	1	Standard Twin Room - Smoking	USD	166.58	2020-06-28	542	0	2020-06-27 10:00:45.327877	2020-06-27 10:00:45.327877	\N	\N	\N
1714400	77	1	Double Room - North Side	USD	137.44	2020-06-28	0	0	2020-06-27 10:00:45.333806	2020-06-27 10:00:45.333806	\N	\N	\N
1714401	31	1	Classic Double or Twin Room with Hill View	USD	324.64	2020-06-28	0	0	2020-06-27 10:00:45.339593	2020-06-27 10:00:45.339593	\N	\N	\N
1714402	18	1	Superior Room	USD	97.98	2020-06-28	0	0	2020-06-27 10:00:45.366327	2020-06-27 10:00:45.366327	\N	\N	\N
1714403	139	1	Small Double	USD	120.46	2020-06-28	481.85	0	2020-06-27 10:00:45.373017	2020-06-27 10:00:45.373017	\N	\N	\N
1714404	14	1	Classic Double Bed	USD	121.98	2020-06-28	0	0	2020-06-27 10:00:45.38015	2020-06-27 10:00:45.38015	\N	\N	\N
1714405	79	1	Standard Room	USD	57.72	2020-06-28	0	0	2020-06-27 10:00:45.386136	2020-06-27 10:00:45.386136	\N	\N	\N
1714406	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.66	2020-06-28	0	0	2020-06-27 10:00:45.391876	2020-06-27 10:00:45.391876	\N	\N	\N
1714407	67	1	Bash Tower Ocean View Room	USD	182.7	2020-06-28	0	0	2020-06-27 10:00:45.397718	2020-06-27 10:00:45.397718	\N	\N	\N
1714408	160	1	King Accessible with Roll In Shower	USD	109	2020-06-28	0	0	2020-06-27 10:00:45.403505	2020-06-27 10:00:45.403505	\N	\N	\N
1714409	54	1	Double Room	USD	152.71	2020-06-28	765.58	0	2020-06-27 10:00:45.409685	2020-06-27 10:00:45.409685	\N	\N	\N
1714410	47	1	Standard room half board	USD	188.43	2020-06-28	500	0	2020-06-27 10:00:45.417334	2020-06-27 10:00:45.417334	\N	\N	\N
1714411	35	1	Twin - Non-Smoking	USD	97.99	2020-06-28	0	0	2020-06-27 10:00:45.424253	2020-06-27 10:00:45.424253	\N	\N	\N
1714412	38	1	Deluxe Double or Twin Room with Sea View	USD	167.92	2020-06-28	0	0	2020-06-27 10:00:45.431976	2020-06-27 10:00:45.431976	\N	\N	\N
1714413	192	1	Comfort Room	USD	67.16	2020-06-28	224.59	0	2020-06-27 10:00:45.438048	2020-06-27 10:00:45.438048	\N	\N	\N
1714414	165	1	Basic Room	USD	90.86	2020-06-28	0	0	2020-06-27 10:00:45.443996	2020-06-27 10:00:45.443996	\N	\N	\N
1714415	215	1	Deluxe - 3 persons	USD	33.58	2020-06-28	134.31	25	2020-06-27 10:00:45.799814	2020-06-27 10:00:45.799814	\N	\N	\N
1714416	261	1	Superior Twin or Double Room	USD	62.2	2020-06-28	0	0	2020-06-27 10:00:45.807005	2020-06-27 10:00:45.807005	\N	\N	\N
1714417	224	1	Superior King	USD	52.78	2020-06-28	246.32	0	2020-06-27 10:00:45.813148	2020-06-27 10:00:45.813148	\N	\N	\N
1714418	300	1	Deluxe Room, Guestroom, 1 King	USD	138.11	2020-06-28	0	0	2020-06-27 10:00:45.819903	2020-06-27 10:00:45.819903	\N	\N	\N
1714419	301	1	Comfort Double or Twin Room	USD	131.69	2020-06-28	0	0	2020-06-27 10:00:45.826224	2020-06-27 10:00:45.826224	\N	\N	\N
1714420	293	1	Budget Double Room	USD	72.42	2020-06-28	0	0	2020-06-27 10:00:45.832135	2020-06-27 10:00:45.832135	\N	\N	\N
1714421	243	1	Double Room with Two Single Beds	USD	59.88	2020-06-28	0	0	2020-06-27 10:00:45.838268	2020-06-27 10:00:45.838268	\N	\N	\N
1714422	256	1	Standard Double Room	USD	94.45	2020-06-28	0	0	2020-06-27 10:00:45.845366	2020-06-27 10:00:45.845366	\N	\N	\N
1714424	285	1	Superior Room king bed	USD	89.35	2020-06-28	0	0	2020-06-27 10:00:45.859112	2020-06-27 10:00:45.859112	\N	\N	\N
1714426	314	1	1 Double Bed Non-Smoking	USD	145.14	2020-06-28	0	0	2020-06-27 10:00:45.87216	2020-06-27 10:00:45.87216	\N	\N	\N
1714427	274	1	Standard Twin Room - Non-Smoking	USD	212.86	2020-06-28	391.94	0	2020-06-27 10:00:45.880747	2020-06-27 10:00:45.880747	\N	\N	\N
1714428	306	1	Deluxe King City View	USD	104.41	2020-06-28	301.49	30	2020-06-27 10:00:45.88856	2020-06-27 10:00:45.88856	\N	\N	\N
1714429	290	1	Standard	USD	82.91	2020-06-28	0	0	2020-06-27 10:00:45.894109	2020-06-27 10:00:45.894109	\N	\N	\N
1714432	258	1	Standard Double Room	USD	31.58	2020-06-28	0	0	2020-06-27 10:00:45.912892	2020-06-27 10:00:45.912892	\N	\N	\N
1714433	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-28	0	0	2020-06-27 10:00:45.919453	2020-06-27 10:00:45.919453	\N	\N	\N
1714435	275	1	Double or Twin Room	USD	87.79	2020-06-28	0	0	2020-06-27 10:00:45.932242	2020-06-27 10:00:45.932242	\N	\N	\N
1714436	204	1	King Bed	USD	174.85	2020-06-28	0	0	2020-06-27 10:00:45.93814	2020-06-27 10:00:45.93814	\N	\N	\N
1714438	295	1	Classic Double or Twin	USD	164.46	2020-06-28	460.42	0	2020-06-27 10:00:45.950186	2020-06-27 10:00:45.950186	\N	\N	\N
1714441	307	1	1 King Bed	USD	380.75	2020-06-28	0	0	2020-06-27 10:00:45.979997	2020-06-27 10:00:45.979997	\N	\N	\N
1714442	251	1	Standard Queen Room	USD	88.77	2020-06-28	0	0	2020-06-27 10:00:45.986203	2020-06-27 10:00:45.986203	\N	\N	\N
1714444	302	1	2 Queen Beds 	USD	79	2020-06-28	0	0	2020-06-27 10:00:45.998311	2020-06-27 10:00:45.998311	\N	\N	\N
1714449	206	1	Standard	USD	71	2020-06-28	0	0	2020-06-27 10:00:46.031098	2020-06-27 10:00:46.031098	\N	\N	\N
1714450	263	1	Queen Hilton Guestroom	USD	130.65	2020-06-28	0	0	2020-06-27 10:00:46.037272	2020-06-27 10:00:46.037272	\N	\N	\N
1739530	23	1	1 King Bed Evolution Room 	USD	119	2020-06-29	0	0	2020-06-28 10:00:40.210799	2020-06-28 10:00:40.210799	\N	\N	\N
1739531	45	1	Classic Double or Twin	USD	121.48	2020-06-29	0	0	2020-06-28 10:00:40.229256	2020-06-28 10:00:40.229256	\N	\N	\N
1739532	115	1	Double Room	USD	69.26	2020-06-29	0	0	2020-06-28 10:00:40.245569	2020-06-28 10:00:40.245569	\N	\N	\N
1739533	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	67.1	2020-06-29	0	0	2020-06-28 10:00:40.251537	2020-06-28 10:00:40.251537	\N	\N	\N
1739534	158	1	Superior Twin Non-Smoking	USD	87.59	2020-06-29	0	0	2020-06-28 10:00:40.259201	2020-06-28 10:00:40.259201	\N	\N	\N
1739535	153	1	Standard Twin Room	USD	156.13	2020-06-29	0	0	2020-06-28 10:00:40.26532	2020-06-28 10:00:40.26532	\N	\N	\N
1739536	131	1	Superior Double Room	USD	51.65	2020-06-29	0	0	2020-06-28 10:00:40.273787	2020-06-28 10:00:40.273787	\N	\N	\N
1739537	184	1	Superior Room	USD	84.03	2020-06-29	441.61	0	2020-06-28 10:00:40.28038	2020-06-28 10:00:40.28038	\N	\N	\N
1739538	176	1	Economy Twin Room	USD	116.38	2020-06-29	0	0	2020-06-28 10:00:40.286357	2020-06-28 10:00:40.286357	\N	\N	\N
1739539	113	1	2 Queen Beds 	USD	152.15	2020-06-29	0	0	2020-06-28 10:00:40.29376	2020-06-28 10:00:40.29376	\N	\N	\N
1739540	53	1	Superior Twin	USD	128	2020-06-29	0	0	2020-06-28 10:00:40.299646	2020-06-28 10:00:40.299646	\N	\N	\N
1739541	143	1	Standard Double Room	USD	150.06	2020-06-29	0	0	2020-06-28 10:00:40.305384	2020-06-28 10:00:40.305384	\N	\N	\N
1739542	108	1	Standard Double Room	USD	84.07	2020-06-29	0	0	2020-06-28 10:00:40.311045	2020-06-28 10:00:40.311045	\N	\N	\N
1739543	13	1	Premium Twin Room with Two Double Beds	USD	120.23	2020-06-29	0	0	2020-06-28 10:00:40.317362	2020-06-28 10:00:40.317362	\N	\N	\N
1739544	8	1	Twin Room	USD	156.81	2020-06-29	0	0	2020-06-28 10:00:40.323305	2020-06-28 10:00:40.323305	\N	\N	\N
1739545	64	1	Comfort Room	USD	50.33	2020-06-29	179.67	0	2020-06-28 10:00:40.329216	2020-06-28 10:00:40.329216	\N	\N	\N
1739546	125	1	Standard Double or Twin Room	USD	30	2020-06-29	0	0	2020-06-28 10:00:40.335641	2020-06-28 10:00:40.335641	\N	\N	\N
1739547	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-29	0	0	2020-06-28 10:00:40.341546	2020-06-28 10:00:40.341546	\N	\N	\N
1739548	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-29	0	0	2020-06-28 10:00:40.347424	2020-06-28 10:00:40.347424	\N	\N	\N
1739549	194	1	Standard Small Double Room - Non-Smoking	USD	168.13	2020-06-29	0	0	2020-06-28 10:00:40.366806	2020-06-28 10:00:40.366806	\N	\N	\N
1739550	95	1	 Twin Guestroom	USD	159.29	2020-06-29	0	0	2020-06-28 10:00:40.373177	2020-06-28 10:00:40.373177	\N	\N	\N
1739551	157	1	Cosy Small Room	USD	99.12	2020-06-29	0	0	2020-06-28 10:00:40.379007	2020-06-28 10:00:40.379007	\N	\N	\N
1739552	26	1	Double	USD	84.75	2020-06-29	0	0	2020-06-28 10:00:40.38517	2020-06-28 10:00:40.38517	\N	\N	\N
1739553	164	1	Standard Twin Room	USD	139.96	2020-06-29	0	0	2020-06-28 10:00:40.391079	2020-06-28 10:00:40.391079	\N	\N	\N
1739554	61	1	Modern Double Room	USD	213.8	2020-06-29	0	0	2020-06-28 10:00:40.397063	2020-06-28 10:00:40.397063	\N	\N	\N
1739555	109	1	Classic Double Room	USD	186.82	2020-06-29	0	0	2020-06-28 10:00:40.402813	2020-06-28 10:00:40.402813	\N	\N	\N
1739556	181	1	Superior Double Room	USD	61.94	2020-06-29	0	0	2020-06-28 10:00:40.408719	2020-06-28 10:00:40.408719	\N	\N	\N
1739557	49	1	Superior Twin Room	USD	124.88	2020-06-29	0	0	2020-06-28 10:00:40.4145	2020-06-28 10:00:40.4145	\N	\N	\N
1739558	136	1	Standard Double or Twin Room	USD	126.19	2020-06-29	0	0	2020-06-28 10:00:40.421942	2020-06-28 10:00:40.421942	\N	\N	\N
1739559	159	1	Standard Room with 1 double bed and sofa	USD	82.91	2020-06-29	0	0	2020-06-28 10:00:40.429701	2020-06-28 10:00:40.429701	\N	\N	\N
1739560	42	1	Standard Twin Room	USD	82	2020-06-29	0	0	2020-06-28 10:00:40.435449	2020-06-28 10:00:40.435449	\N	\N	\N
1739561	90	1	Standard Room	USD	83.3	2020-06-29	333.22	0	2020-06-28 10:00:40.441218	2020-06-28 10:00:40.441218	\N	\N	\N
1739562	106	1	Double Room with Two Single Beds	USD	27.06	2020-06-29	0	0	2020-06-28 10:00:40.447009	2020-06-28 10:00:40.447009	\N	\N	\N
1739563	27	1	Standard Twin Room - Smoking	USD	166.58	2020-06-29	542	0	2020-06-28 10:00:40.465451	2020-06-28 10:00:40.465451	\N	\N	\N
1739564	77	1	Double Room - North Side	USD	137.44	2020-06-29	0	0	2020-06-28 10:00:40.471858	2020-06-28 10:00:40.471858	\N	\N	\N
1739565	31	1	Classic Double or Twin Room with Hill View	USD	324.64	2020-06-29	0	0	2020-06-28 10:00:40.478165	2020-06-28 10:00:40.478165	\N	\N	\N
1739566	18	1	Superior Room	USD	105.58	2020-06-29	0	0	2020-06-28 10:00:40.484355	2020-06-28 10:00:40.484355	\N	\N	\N
1739567	139	1	Small Double	USD	120.46	2020-06-29	481.85	0	2020-06-28 10:00:40.490132	2020-06-28 10:00:40.490132	\N	\N	\N
1739568	79	1	Standard Room	USD	57.72	2020-06-29	0	0	2020-06-28 10:00:40.496238	2020-06-28 10:00:40.496238	\N	\N	\N
1739569	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.66	2020-06-29	0	0	2020-06-28 10:00:40.501974	2020-06-28 10:00:40.501974	\N	\N	\N
1739570	67	1	Bash Tower Ocean View Room	USD	182.7	2020-06-29	0	0	2020-06-28 10:00:40.507677	2020-06-28 10:00:40.507677	\N	\N	\N
1739571	160	1	2 Double Beds	USD	119	2020-06-29	0	0	2020-06-28 10:00:40.514155	2020-06-28 10:00:40.514155	\N	\N	\N
1739572	54	1	Double Room	USD	152.71	2020-06-29	765.58	0	2020-06-28 10:00:40.520274	2020-06-28 10:00:40.520274	\N	\N	\N
1739573	47	1	Standard room half board	USD	188.43	2020-06-29	500	0	2020-06-28 10:00:40.527766	2020-06-28 10:00:40.527766	\N	\N	\N
1739574	35	1	Twin - Non-Smoking	USD	97.99	2020-06-29	0	0	2020-06-28 10:00:40.53542	2020-06-28 10:00:40.53542	\N	\N	\N
1739575	38	1	Deluxe Double or Twin Room with Sea View	USD	167.92	2020-06-29	0	0	2020-06-28 10:00:40.545508	2020-06-28 10:00:40.545508	\N	\N	\N
1739576	192	1	Comfort Room	USD	88.15	2020-06-29	224.59	0	2020-06-28 10:00:40.570478	2020-06-28 10:00:40.570478	\N	\N	\N
1739577	165	1	Basic Room	USD	90.86	2020-06-29	0	0	2020-06-28 10:00:40.57675	2020-06-28 10:00:40.57675	\N	\N	\N
1739578	215	1	Deluxe - 3 persons	USD	33.58	2020-06-29	134.31	25	2020-06-28 10:00:40.905945	2020-06-28 10:00:40.905945	\N	\N	\N
1739579	261	1	Superior Twin or Double Room	USD	62.2	2020-06-29	0	0	2020-06-28 10:00:40.913388	2020-06-28 10:00:40.913388	\N	\N	\N
1739580	224	1	Superior King	USD	52.78	2020-06-29	246.32	0	2020-06-28 10:00:40.919428	2020-06-28 10:00:40.919428	\N	\N	\N
1739581	300	1	Deluxe Room, Guestroom, 1 King	USD	138.11	2020-06-29	0	0	2020-06-28 10:00:40.925787	2020-06-28 10:00:40.925787	\N	\N	\N
1739582	301	1	Comfort Double or Twin Room	USD	131.69	2020-06-29	0	0	2020-06-28 10:00:40.931844	2020-06-28 10:00:40.931844	\N	\N	\N
1739583	293	1	Budget Double Room	USD	72.42	2020-06-29	0	0	2020-06-28 10:00:40.937575	2020-06-28 10:00:40.937575	\N	\N	\N
1739584	243	1	Twin Room	USD	71.15	2020-06-29	0	0	2020-06-28 10:00:40.943479	2020-06-28 10:00:40.943479	\N	\N	\N
1739585	256	1	Standard Double Room	USD	104.95	2020-06-29	0	0	2020-06-28 10:00:40.949831	2020-06-28 10:00:40.949831	\N	\N	\N
1739587	285	1	Superior Room king bed	USD	94.97	2020-06-29	0	0	2020-06-28 10:00:40.965331	2020-06-28 10:00:40.965331	\N	\N	\N
1739589	314	1	1 Double Bed Non-Smoking	USD	145.14	2020-06-29	0	0	2020-06-28 10:00:40.977714	2020-06-28 10:00:40.977714	\N	\N	\N
1739590	274	1	Standard Twin Room - Non-Smoking	USD	212.86	2020-06-29	391.94	0	2020-06-28 10:00:40.984726	2020-06-28 10:00:40.984726	\N	\N	\N
1739591	306	1	Deluxe King City View	USD	115.9	2020-06-29	301.49	30	2020-06-28 10:00:40.992238	2020-06-28 10:00:40.992238	\N	\N	\N
1739592	290	1	Standard	USD	93.41	2020-06-29	0	0	2020-06-28 10:00:40.997985	2020-06-28 10:00:40.997985	\N	\N	\N
1739595	258	1	Standard Double Room	USD	23.81	2020-06-29	0	0	2020-06-28 10:00:41.015771	2020-06-28 10:00:41.015771	\N	\N	\N
1739596	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-29	0	0	2020-06-28 10:00:41.021745	2020-06-28 10:00:41.021745	\N	\N	\N
1739598	275	1	Double or Twin Room	USD	87.79	2020-06-29	0	0	2020-06-28 10:00:41.03383	2020-06-28 10:00:41.03383	\N	\N	\N
1739599	204	1	King Bed	USD	174.85	2020-06-29	0	0	2020-06-28 10:00:41.039397	2020-06-28 10:00:41.039397	\N	\N	\N
1739601	295	1	Classic Double or Twin	USD	164.46	2020-06-29	460.42	0	2020-06-28 10:00:41.064528	2020-06-28 10:00:41.064528	\N	\N	\N
1739604	307	1	1 King Bed	USD	380.75	2020-06-29	0	0	2020-06-28 10:00:41.08828	2020-06-28 10:00:41.08828	\N	\N	\N
1739605	251	1	Standard Queen Room	USD	88.77	2020-06-29	0	0	2020-06-28 10:00:41.094186	2020-06-28 10:00:41.094186	\N	\N	\N
1739607	302	1	Accessible 1 King Bed	USD	79	2020-06-29	300	0	2020-06-28 10:00:41.106213	2020-06-28 10:00:41.106213	\N	\N	\N
1739612	206	1	Standard	USD	71	2020-06-29	0	0	2020-06-28 10:00:41.138169	2020-06-28 10:00:41.138169	\N	\N	\N
1739613	263	1	Queen Hilton Guestroom	USD	144.64	2020-06-29	0	0	2020-06-28 10:00:41.144522	2020-06-28 10:00:41.144522	\N	\N	\N
1765333	23	1	1 King Bed Evolution Room 	USD	119	2020-06-30	0	0	2020-06-29 10:00:41.329305	2020-06-29 10:00:41.329305	\N	\N	\N
1765334	45	1	Classic Double or Twin	USD	121.48	2020-06-30	0	0	2020-06-29 10:00:41.3489	2020-06-29 10:00:41.3489	\N	\N	\N
1765335	115	1	Double Room	USD	58.78	2020-06-30	0	0	2020-06-29 10:00:41.365756	2020-06-29 10:00:41.365756	\N	\N	\N
1765336	75	1	Small Single Room - Non-Smoking (2 Adult)	USD	67.1	2020-06-30	0	0	2020-06-29 10:00:41.37212	2020-06-29 10:00:41.37212	\N	\N	\N
1765337	158	1	Superior Twin Non-Smoking	USD	87.59	2020-06-30	0	0	2020-06-29 10:00:41.378651	2020-06-29 10:00:41.378651	\N	\N	\N
1765338	131	1	Superior Double Room	USD	51.65	2020-06-30	0	0	2020-06-29 10:00:41.38664	2020-06-29 10:00:41.38664	\N	\N	\N
1765339	184	1	Superior Room	USD	86.28	2020-06-30	450.61	0	2020-06-29 10:00:41.394567	2020-06-29 10:00:41.394567	\N	\N	\N
1765340	176	1	Economy Twin Room	USD	116.38	2020-06-30	0	0	2020-06-29 10:00:41.401513	2020-06-29 10:00:41.401513	\N	\N	\N
1765341	113	1	2 Queen Beds 	USD	152.15	2020-06-30	0	0	2020-06-29 10:00:41.407948	2020-06-29 10:00:41.407948	\N	\N	\N
1765342	53	1	Superior Twin	USD	139.18	2020-06-30	0	0	2020-06-29 10:00:41.414643	2020-06-29 10:00:41.414643	\N	\N	\N
1765343	143	1	Standard Double Room	USD	150.06	2020-06-30	0	0	2020-06-29 10:00:41.420328	2020-06-29 10:00:41.420328	\N	\N	\N
1765344	108	1	Standard Double Room	USD	84.07	2020-06-30	0	0	2020-06-29 10:00:41.425993	2020-06-29 10:00:41.425993	\N	\N	\N
1765345	13	1	Premium Twin Room with Two Double Beds	USD	120.23	2020-06-30	0	0	2020-06-29 10:00:41.432347	2020-06-29 10:00:41.432347	\N	\N	\N
1765346	8	1	Double Room	USD	156.81	2020-06-30	0	0	2020-06-29 10:00:41.443001	2020-06-29 10:00:41.443001	\N	\N	\N
1765347	64	1	Comfort Room	USD	50.33	2020-06-30	179.67	0	2020-06-29 10:00:41.44866	2020-06-29 10:00:41.44866	\N	\N	\N
1765348	125	1	Standard Double or Twin Room	USD	30	2020-06-30	0	0	2020-06-29 10:00:41.46727	2020-06-29 10:00:41.46727	\N	\N	\N
1765349	199	1	Standard Room with 1 double bed	USD	32.26	2020-06-30	0	0	2020-06-29 10:00:41.473301	2020-06-29 10:00:41.473301	\N	\N	\N
1765350	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-06-30	0	0	2020-06-29 10:00:41.478737	2020-06-29 10:00:41.478737	\N	\N	\N
1765351	194	1	Standard Small Double Room - Non-Smoking	USD	171.99	2020-06-30	0	0	2020-06-29 10:00:41.488959	2020-06-29 10:00:41.488959	\N	\N	\N
1765352	95	1	 Twin Guestroom	USD	159.29	2020-06-30	0	0	2020-06-29 10:00:41.495709	2020-06-29 10:00:41.495709	\N	\N	\N
1765353	157	1	Cosy Small Room	USD	99.12	2020-06-30	0	0	2020-06-29 10:00:41.501838	2020-06-29 10:00:41.501838	\N	\N	\N
1765354	26	1	Double	USD	84.75	2020-06-30	0	0	2020-06-29 10:00:41.507341	2020-06-29 10:00:41.507341	\N	\N	\N
1765355	164	1	Standard Twin Room	USD	193.46	2020-06-30	0	0	2020-06-29 10:00:41.513071	2020-06-29 10:00:41.513071	\N	\N	\N
1765356	61	1	Modern Double Room	USD	213.8	2020-06-30	0	0	2020-06-29 10:00:41.518578	2020-06-29 10:00:41.518578	\N	\N	\N
1765357	109	1	Classic Double Room	USD	186.82	2020-06-30	0	0	2020-06-29 10:00:41.52395	2020-06-29 10:00:41.52395	\N	\N	\N
1765358	181	1	Superior Double Room	USD	61.94	2020-06-30	0	0	2020-06-29 10:00:41.529674	2020-06-29 10:00:41.529674	\N	\N	\N
1765359	49	1	Superior Twin Room	USD	135.38	2020-06-30	0	0	2020-06-29 10:00:41.535442	2020-06-29 10:00:41.535442	\N	\N	\N
1765360	136	1	Standard Double or Twin Room	USD	126.19	2020-06-30	0	0	2020-06-29 10:00:41.542067	2020-06-29 10:00:41.542067	\N	\N	\N
1765361	159	1	Standard Room with 1 double bed and sofa	USD	82.91	2020-06-30	0	0	2020-06-29 10:00:41.553933	2020-06-29 10:00:41.553933	\N	\N	\N
1765362	42	1	Standard Twin Room	USD	69.7	2020-06-30	0	0	2020-06-29 10:00:41.569408	2020-06-29 10:00:41.569408	\N	\N	\N
1765363	90	1	Standard Room	USD	83.3	2020-06-30	333.22	0	2020-06-29 10:00:41.575633	2020-06-29 10:00:41.575633	\N	\N	\N
1765364	106	1	Double Room with Two Single Beds	USD	27.06	2020-06-30	0	0	2020-06-29 10:00:41.584758	2020-06-29 10:00:41.584758	\N	\N	\N
1765365	27	1	Standard Twin Room - Smoking	USD	166.58	2020-06-30	542	0	2020-06-29 10:00:41.590323	2020-06-29 10:00:41.590323	\N	\N	\N
1765366	77	1	Double Room - North Side	USD	137.44	2020-06-30	0	0	2020-06-29 10:00:41.596107	2020-06-29 10:00:41.596107	\N	\N	\N
1765367	31	1	Classic Double or Twin Room with Hill View	USD	324.64	2020-06-30	0	0	2020-06-29 10:00:41.601929	2020-06-29 10:00:41.601929	\N	\N	\N
1765368	18	1	Superior Room	USD	105.58	2020-06-30	0	0	2020-06-29 10:00:41.60837	2020-06-29 10:00:41.60837	\N	\N	\N
1765369	139	1	Small Double	USD	126.59	2020-06-30	506.37	0	2020-06-29 10:00:41.614761	2020-06-29 10:00:41.614761	\N	\N	\N
1765370	14	1	Classic Double Bed	USD	132.19	2020-06-30	0	0	2020-06-29 10:00:41.620887	2020-06-29 10:00:41.620887	\N	\N	\N
1765371	79	1	Standard Room	USD	57.72	2020-06-30	0	0	2020-06-29 10:00:41.627364	2020-06-29 10:00:41.627364	\N	\N	\N
1765372	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.66	2020-06-30	0	0	2020-06-29 10:00:41.633548	2020-06-29 10:00:41.633548	\N	\N	\N
1765373	67	1	Bash Tower Ocean View Room	USD	182.7	2020-06-30	0	0	2020-06-29 10:00:41.639868	2020-06-29 10:00:41.639868	\N	\N	\N
1765374	160	1	2 Double Beds	USD	119	2020-06-30	0	0	2020-06-29 10:00:41.666299	2020-06-29 10:00:41.666299	\N	\N	\N
1765375	54	1	Double Room	USD	163.91	2020-06-30	810.39	0	2020-06-29 10:00:41.672268	2020-06-29 10:00:41.672268	\N	\N	\N
1765376	47	1	Standard room half board	USD	188.43	2020-06-30	500	0	2020-06-29 10:00:41.678657	2020-06-29 10:00:41.678657	\N	\N	\N
1765377	35	1	Twin - Non-Smoking	USD	97.99	2020-06-30	0	0	2020-06-29 10:00:41.684871	2020-06-29 10:00:41.684871	\N	\N	\N
1765378	38	1	Deluxe Double or Twin Room with Sea View	USD	167.92	2020-06-30	0	0	2020-06-29 10:00:41.692439	2020-06-29 10:00:41.692439	\N	\N	\N
1765379	192	1	Comfort Room	USD	88.15	2020-06-30	224.59	0	2020-06-29 10:00:41.698219	2020-06-29 10:00:41.698219	\N	\N	\N
1765380	165	1	Basic Room	USD	90.86	2020-06-30	0	0	2020-06-29 10:00:41.704054	2020-06-29 10:00:41.704054	\N	\N	\N
1765381	215	1	Deluxe - 3 persons	USD	33.58	2020-06-30	134.31	25	2020-06-29 10:00:42.019444	2020-06-29 10:00:42.019444	\N	\N	\N
1765382	261	1	Superior Twin or Double Room	USD	62.2	2020-06-30	0	0	2020-06-29 10:00:42.02681	2020-06-29 10:00:42.02681	\N	\N	\N
1765383	224	1	Superior King	USD	52.78	2020-06-30	246.32	0	2020-06-29 10:00:42.032468	2020-06-29 10:00:42.032468	\N	\N	\N
1765384	300	1	Deluxe Room, Guestroom, 1 King	USD	138.11	2020-06-30	0	0	2020-06-29 10:00:42.039458	2020-06-29 10:00:42.039458	\N	\N	\N
1765385	301	1	Comfort Double or Twin Room	USD	131.69	2020-06-30	0	0	2020-06-29 10:00:42.046254	2020-06-29 10:00:42.046254	\N	\N	\N
1765386	293	1	Budget Double Room	USD	72.42	2020-06-30	0	0	2020-06-29 10:00:42.052056	2020-06-29 10:00:42.052056	\N	\N	\N
1765387	243	1	Twin Room	USD	74.62	2020-06-30	0	0	2020-06-29 10:00:42.05766	2020-06-29 10:00:42.05766	\N	\N	\N
1765388	256	1	Standard Double Room	USD	104.95	2020-06-30	0	0	2020-06-29 10:00:42.063795	2020-06-29 10:00:42.063795	\N	\N	\N
1765390	285	1	Superior Room king bed	USD	97.77	2020-06-30	0	0	2020-06-29 10:00:42.080149	2020-06-29 10:00:42.080149	\N	\N	\N
1765392	314	1	1 Double Bed Non-Smoking	USD	145.14	2020-06-30	0	0	2020-06-29 10:00:42.092794	2020-06-29 10:00:42.092794	\N	\N	\N
1765393	274	1	Small Double Room Non-Smoking	USD	182.01	2020-06-30	226.35	0	2020-06-29 10:00:42.101139	2020-06-29 10:00:42.101139	\N	\N	\N
1765394	306	1	Deluxe King City View	USD	115.9	2020-06-30	301.49	30	2020-06-29 10:00:42.109572	2020-06-29 10:00:42.109572	\N	\N	\N
1765395	290	1	Standard	USD	93.41	2020-06-30	0	0	2020-06-29 10:00:42.115391	2020-06-29 10:00:42.115391	\N	\N	\N
1765398	258	1	Standard Double Room	USD	23.81	2020-06-30	0	0	2020-06-29 10:00:42.13343	2020-06-29 10:00:42.13343	\N	\N	\N
1765399	216	1	2 Double Accessible with Bathtub	USD	109	2020-06-30	0	0	2020-06-29 10:00:42.139421	2020-06-29 10:00:42.139421	\N	\N	\N
1765401	275	1	Double or Twin Room	USD	87.79	2020-06-30	0	0	2020-06-29 10:00:42.151806	2020-06-29 10:00:42.151806	\N	\N	\N
1765402	204	1	King Bed	USD	174.85	2020-06-30	0	0	2020-06-29 10:00:42.16598	2020-06-29 10:00:42.16598	\N	\N	\N
1765404	295	1	Classic Double or Twin	USD	164.46	2020-06-30	460.42	0	2020-06-29 10:00:42.177302	2020-06-29 10:00:42.177302	\N	\N	\N
1765407	307	1	1 King Bed	USD	380.75	2020-06-30	0	0	2020-06-29 10:00:42.198129	2020-06-29 10:00:42.198129	\N	\N	\N
1765408	251	1	Standard Queen Room	USD	88.77	2020-06-30	0	0	2020-06-29 10:00:42.203651	2020-06-29 10:00:42.203651	\N	\N	\N
1765409	302	1	Accessible 1 King Bed	USD	79	2020-06-30	300	0	2020-06-29 10:00:42.209926	2020-06-29 10:00:42.209926	\N	\N	\N
1765414	206	1	Standard	USD	71	2020-06-30	0	0	2020-06-29 10:00:42.243003	2020-06-29 10:00:42.243003	\N	\N	\N
1765415	263	1	Queen Hilton Guestroom	USD	144.64	2020-06-30	0	0	2020-06-29 10:00:42.248874	2020-06-29 10:00:42.248874	\N	\N	\N
1791145	23	1	1 King Bed Evolution Room 	USD	119	2020-07-01	0	0	2020-06-30 10:00:41.928285	2020-06-30 10:00:41.928285	\N	\N	\N
1791146	45	1	Classic Double or Twin	USD	101.06	2020-07-01	0	0	2020-06-30 10:00:41.951675	2020-06-30 10:00:41.951675	\N	\N	\N
1791147	115	1	Double Room	USD	58.77	2020-07-01	0	0	2020-06-30 10:00:41.970313	2020-06-30 10:00:41.970313	\N	\N	\N
1791148	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	74.37	2020-07-01	0	0	2020-06-30 10:00:41.977983	2020-06-30 10:00:41.977983	\N	\N	\N
1791149	158	1	Superior Twin Non-Smoking	USD	98.85	2020-07-01	0	0	2020-06-30 10:00:41.98699	2020-06-30 10:00:41.98699	\N	\N	\N
1791150	131	1	Superior Double Room	USD	51.7	2020-07-01	0	0	2020-06-30 10:00:41.99411	2020-06-30 10:00:41.99411	\N	\N	\N
1791151	184	1	Superior Room	USD	76.17	2020-07-01	450.61	0	2020-06-30 10:00:42.000857	2020-06-30 10:00:42.000857	\N	\N	\N
1791152	176	1	Economy Twin Room	USD	116.37	2020-07-01	0	0	2020-06-30 10:00:42.010088	2020-06-30 10:00:42.010088	\N	\N	\N
1791153	113	1	2 Queen Beds 	USD	152.15	2020-07-01	0	0	2020-06-30 10:00:42.016369	2020-06-30 10:00:42.016369	\N	\N	\N
1791154	53	1	Superior Twin	USD	127.62	2020-07-01	0	0	2020-06-30 10:00:42.022491	2020-06-30 10:00:42.022491	\N	\N	\N
1791155	143	1	Standard Double Room	USD	150.06	2020-07-01	0	0	2020-06-30 10:00:42.028973	2020-06-30 10:00:42.028973	\N	\N	\N
1791156	108	1	Standard Double Room	USD	65.38	2020-07-01	0	0	2020-06-30 10:00:42.036392	2020-06-30 10:00:42.036392	\N	\N	\N
1791157	13	1	Premium Twin Room with Two Double Beds	USD	124.89	2020-07-01	0	0	2020-06-30 10:00:42.044836	2020-06-30 10:00:42.044836	\N	\N	\N
1791158	8	1	Double Room	USD	156.81	2020-07-01	0	0	2020-06-30 10:00:42.05104	2020-06-30 10:00:42.05104	\N	\N	\N
1791159	64	1	Comfort Room	USD	50.33	2020-07-01	179.65	0	2020-06-30 10:00:42.06781	2020-06-30 10:00:42.06781	\N	\N	\N
1791160	125	1	Standard Double or Twin Room	USD	35	2020-07-01	0	0	2020-06-30 10:00:42.076771	2020-06-30 10:00:42.076771	\N	\N	\N
1791161	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-01	0	0	2020-06-30 10:00:42.083063	2020-06-30 10:00:42.083063	\N	\N	\N
1791162	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-01	0	0	2020-06-30 10:00:42.089184	2020-06-30 10:00:42.089184	\N	\N	\N
1791163	194	1	Standard Small Double Room - Non-Smoking	USD	174.81	2020-07-01	0	0	2020-06-30 10:00:42.097037	2020-06-30 10:00:42.097037	\N	\N	\N
1791164	95	1	 Twin Guestroom	USD	146.92	2020-07-01	0	0	2020-06-30 10:00:42.105197	2020-06-30 10:00:42.105197	\N	\N	\N
1791165	157	1	Cosy Small Room	USD	99.12	2020-07-01	0	0	2020-06-30 10:00:42.111587	2020-06-30 10:00:42.111587	\N	\N	\N
1791166	26	1	Double	USD	84.74	2020-07-01	0	0	2020-06-30 10:00:42.117813	2020-06-30 10:00:42.117813	\N	\N	\N
1791167	164	1	Standard Twin Room	USD	173.03	2020-07-01	0	0	2020-06-30 10:00:42.123961	2020-06-30 10:00:42.123961	\N	\N	\N
1791168	61	1	Modern Double Room	USD	192.44	2020-07-01	0	0	2020-06-30 10:00:42.135589	2020-06-30 10:00:42.135589	\N	\N	\N
1791169	109	1	Classic Double Room	USD	186.8	2020-07-01	0	0	2020-06-30 10:00:42.141653	2020-06-30 10:00:42.141653	\N	\N	\N
1791170	181	1	Superior Double Room	USD	61.94	2020-07-01	0	0	2020-06-30 10:00:42.148039	2020-06-30 10:00:42.148039	\N	\N	\N
1791171	168	1	Privilege Double or Twin	USD	120.45	2020-07-01	190.88	0	2020-06-30 10:00:42.154067	2020-06-30 10:00:42.154067	\N	\N	\N
1791172	49	1	Superior Twin Room	USD	114.38	2020-07-01	0	0	2020-06-30 10:00:42.166774	2020-06-30 10:00:42.166774	\N	\N	\N
1791173	136	1	Standard Double or Twin Room	USD	125.35	2020-07-01	0	0	2020-06-30 10:00:42.174843	2020-06-30 10:00:42.174843	\N	\N	\N
1791174	98	1	Double or Twin	USD	81.66	2020-07-01	0	0	2020-06-30 10:00:42.181279	2020-06-30 10:00:42.181279	\N	\N	\N
1791175	159	1	Standard Room with 1 double bed and sofa	USD	82.9	2020-07-01	0	0	2020-06-30 10:00:42.188068	2020-06-30 10:00:42.188068	\N	\N	\N
1791176	42	1	Standard Twin Room	USD	69.7	2020-07-01	0	0	2020-06-30 10:00:42.197191	2020-06-30 10:00:42.197191	\N	\N	\N
1791177	3	1	Deluxe 	USD	176.91	2020-07-01	339.8	0	2020-06-30 10:00:42.203169	2020-06-30 10:00:42.203169	\N	\N	\N
1791178	90	1	Standard Room	USD	84.11	2020-07-01	336.45	0	2020-06-30 10:00:42.209489	2020-06-30 10:00:42.209489	\N	\N	\N
1791179	106	1	Double Room with Two Single Beds	USD	27.06	2020-07-01	0	0	2020-06-30 10:00:42.216434	2020-06-30 10:00:42.216434	\N	\N	\N
1791180	27	1	Standard Twin Room - Smoking	USD	165.59	2020-07-01	538.81	0	2020-06-30 10:00:42.223051	2020-06-30 10:00:42.223051	\N	\N	\N
1791181	77	1	Double Room - North Side	USD	136.73	2020-07-01	0	0	2020-06-30 10:00:42.232756	2020-06-30 10:00:42.232756	\N	\N	\N
1791182	31	1	Classic Double or Twin Room with Hill View	USD	333.79	2020-07-01	0	0	2020-06-30 10:00:42.239167	2020-06-30 10:00:42.239167	\N	\N	\N
1791183	18	1	Superior Room	USD	105.91	2020-07-01	0	0	2020-06-30 10:00:42.246498	2020-06-30 10:00:42.246498	\N	\N	\N
1791184	139	1	Small Double	USD	120.45	2020-07-01	481.8	0	2020-06-30 10:00:42.253097	2020-06-30 10:00:42.253097	\N	\N	\N
1791185	14	1	Classic Double Bed	USD	142.39	2020-07-01	0	0	2020-06-30 10:00:42.265998	2020-06-30 10:00:42.265998	\N	\N	\N
1791186	79	1	Standard Room	USD	78.7	2020-07-01	0	0	2020-06-30 10:00:42.272943	2020-06-30 10:00:42.272943	\N	\N	\N
1791187	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.22	2020-07-01	0	0	2020-06-30 10:00:42.279342	2020-06-30 10:00:42.279342	\N	\N	\N
1791188	67	1	Trendy Garden View Room	USD	213.59	2020-07-01	0	0	2020-06-30 10:00:42.286061	2020-06-30 10:00:42.286061	\N	\N	\N
1791189	160	1	2 Double Beds	USD	119	2020-07-01	0	0	2020-06-30 10:00:42.293107	2020-06-30 10:00:42.293107	\N	\N	\N
1791190	183	1	Business Deluxe, Guest room, 2 Double, Reforma Avenue view	USD	189	2020-07-01	0	0	2020-06-30 10:00:42.299921	2020-06-30 10:00:42.299921	\N	\N	\N
1791191	54	1	Double Room	USD	163.07	2020-07-01	806.22	0	2020-06-30 10:00:42.306226	2020-06-30 10:00:42.306226	\N	\N	\N
1791192	47	1	Standard room half board	USD	188.43	2020-07-01	500	0	2020-06-30 10:00:42.313017	2020-06-30 10:00:42.313017	\N	\N	\N
1791193	35	1	Twin - Non-Smoking	USD	97.41	2020-07-01	0	0	2020-06-30 10:00:42.320633	2020-06-30 10:00:42.320633	\N	\N	\N
1791194	38	1	Superior Double or Twin Room	USD	171.05	2020-07-01	0	0	2020-06-30 10:00:42.328076	2020-06-30 10:00:42.328076	\N	\N	\N
1791195	192	1	Comfort Room	USD	88.14	2020-07-01	224.57	0	2020-06-30 10:00:42.334659	2020-06-30 10:00:42.334659	\N	\N	\N
1791196	165	1	Basic Room	USD	90.85	2020-07-01	0	0	2020-06-30 10:00:42.340925	2020-06-30 10:00:42.340925	\N	\N	\N
1791197	215	1	Deluxe Room	USD	33.55	2020-07-01	0	0	2020-06-30 10:00:42.83131	2020-06-30 10:00:42.83131	\N	\N	\N
1791199	261	1	Superior Twin or Double Room	USD	62.2	2020-07-01	0	0	2020-06-30 10:00:42.848813	2020-06-30 10:00:42.848813	\N	\N	\N
1791200	224	1	Standard King	USD	72.33	2020-07-01	283.45	0	2020-06-30 10:00:42.855111	2020-06-30 10:00:42.855111	\N	\N	\N
1791201	300	1	Deluxe Room, Guestroom, 1 King	USD	138.11	2020-07-01	0	0	2020-06-30 10:00:42.86125	2020-06-30 10:00:42.86125	\N	\N	\N
1791203	301	1	Comfort Double or Twin Room	USD	131.68	2020-07-01	0	0	2020-06-30 10:00:42.873456	2020-06-30 10:00:42.873456	\N	\N	\N
1791204	293	1	Budget Double Room	USD	72.41	2020-07-01	0	0	2020-06-30 10:00:42.879041	2020-06-30 10:00:42.879041	\N	\N	\N
1791205	243	1	Twin Room	USD	76.35	2020-07-01	0	0	2020-06-30 10:00:42.884942	2020-06-30 10:00:42.884942	\N	\N	\N
1791206	256	1	Standard Double Room	USD	104.94	2020-07-01	0	0	2020-06-30 10:00:42.891234	2020-06-30 10:00:42.891234	\N	\N	\N
1791208	240	1	Twin Room	USD	70.59	2020-07-01	0	0	2020-06-30 10:00:42.903321	2020-06-30 10:00:42.903321	\N	\N	\N
1791209	285	1	Superior Room king bed	USD	100.36	2020-07-01	0	0	2020-06-30 10:00:42.910201	2020-06-30 10:00:42.910201	\N	\N	\N
1791211	314	1	1 Double Bed Non-Smoking	USD	145.13	2020-07-01	0	0	2020-06-30 10:00:42.923098	2020-06-30 10:00:42.923098	\N	\N	\N
1791212	274	1	Double Room - Non-Smoking	USD	179.41	2020-07-01	0	0	2020-06-30 10:00:42.931518	2020-06-30 10:00:42.931518	\N	\N	\N
1791213	306	1	Deluxe King City View	USD	116.03	2020-07-01	301.84	30	2020-06-30 10:00:42.939551	2020-06-30 10:00:42.939551	\N	\N	\N
1791214	290	1	Standard	USD	93.4	2020-07-01	0	0	2020-06-30 10:00:42.94584	2020-06-30 10:00:42.94584	\N	\N	\N
1791218	258	1	Standard Double Room	USD	23.81	2020-07-01	0	0	2020-06-30 10:00:42.982367	2020-06-30 10:00:42.982367	\N	\N	\N
1791219	216	1	2 Double Accessible with Bathtub	USD	109	2020-07-01	0	0	2020-06-30 10:00:42.989642	2020-06-30 10:00:42.989642	\N	\N	\N
1791222	275	1	Double or Twin Room	USD	87.78	2020-07-01	0	0	2020-06-30 10:00:43.008798	2020-06-30 10:00:43.008798	\N	\N	\N
1791223	204	1	King Bed	USD	152.82	2020-07-01	0	0	2020-06-30 10:00:43.01474	2020-06-30 10:00:43.01474	\N	\N	\N
1791225	295	1	Classic Double or Twin	USD	164.44	2020-07-01	460.36	0	2020-06-30 10:00:43.027047	2020-06-30 10:00:43.027047	\N	\N	\N
1791228	307	1	1 King Bed	USD	378.5	2020-07-01	0	0	2020-06-30 10:00:43.048328	2020-06-30 10:00:43.048328	\N	\N	\N
1791229	251	1	Standard Queen Room	USD	88.68	2020-07-01	0	0	2020-06-30 10:00:43.069691	2020-06-30 10:00:43.069691	\N	\N	\N
1791231	302	1	Accessible 1 King Bed	USD	79	2020-07-01	300	0	2020-06-30 10:00:43.083216	2020-06-30 10:00:43.083216	\N	\N	\N
1791234	255	1	Presidential Suite	USD	1940.45	2020-07-01	0	0	2020-06-30 10:00:43.10803	2020-06-30 10:00:43.10803	\N	\N	\N
1791237	206	1	Standard	USD	70.63	2020-07-01	0	0	2020-06-30 10:00:43.133562	2020-06-30 10:00:43.133562	\N	\N	\N
1791238	263	1	Queen Hilton Guestroom	USD	153.07	2020-07-01	0	0	2020-06-30 10:00:43.139758	2020-06-30 10:00:43.139758	\N	\N	\N
1818201	23	1	1 King Bed Evolution Room 	USD	144	2020-07-02	0	0	2020-07-01 10:00:51.713731	2020-07-01 10:00:51.713731	\N	\N	\N
1818202	45	1	Classic Double or Twin	USD	101.19	2020-07-02	0	0	2020-07-01 10:00:51.732407	2020-07-01 10:00:51.732407	\N	\N	\N
1818203	115	1	Double Room	USD	59.96	2020-07-02	0	0	2020-07-01 10:00:51.748778	2020-07-01 10:00:51.748778	\N	\N	\N
1818204	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	74.35	2020-07-02	0	0	2020-07-01 10:00:51.755087	2020-07-01 10:00:51.755087	\N	\N	\N
1818205	158	1	Superior Twin Non-Smoking	USD	99.07	2020-07-02	0	0	2020-07-01 10:00:51.762054	2020-07-01 10:00:51.762054	\N	\N	\N
1818206	153	1	Standard Twin Room	USD	156.33	2020-07-02	0	0	2020-07-01 10:00:51.767722	2020-07-01 10:00:51.767722	\N	\N	\N
1818207	131	1	Superior Double Room	USD	51.37	2020-07-02	0	0	2020-07-01 10:00:51.775046	2020-07-01 10:00:51.775046	\N	\N	\N
1818208	184	1	Superior Room	USD	74.24	2020-07-02	441.61	0	2020-07-01 10:00:51.781113	2020-07-01 10:00:51.781113	\N	\N	\N
1818209	176	1	Economy Twin Room	USD	116.53	2020-07-02	0	0	2020-07-01 10:00:51.787448	2020-07-01 10:00:51.787448	\N	\N	\N
1818210	113	1	2 Queen Beds 	USD	152.15	2020-07-02	0	0	2020-07-01 10:00:51.793105	2020-07-01 10:00:51.793105	\N	\N	\N
1818211	53	1	Superior Twin	USD	139.5	2020-07-02	0	0	2020-07-01 10:00:51.798814	2020-07-01 10:00:51.798814	\N	\N	\N
1818212	143	1	Standard Double Room	USD	159.97	2020-07-02	0	0	2020-07-01 10:00:51.804671	2020-07-01 10:00:51.804671	\N	\N	\N
1818213	108	1	Standard Double Room	USD	66.71	2020-07-02	0	0	2020-07-01 10:00:51.810245	2020-07-01 10:00:51.810245	\N	\N	\N
1818214	13	1	Premium Twin Room with Two Double Beds	USD	125.55	2020-07-02	0	0	2020-07-01 10:00:51.817327	2020-07-01 10:00:51.817327	\N	\N	\N
1818215	8	1	Double Room	USD	157.73	2020-07-02	0	0	2020-07-01 10:00:51.82284	2020-07-01 10:00:51.82284	\N	\N	\N
1818216	64	1	Comfort Room	USD	50.39	2020-07-02	179.9	0	2020-07-01 10:00:51.829677	2020-07-01 10:00:51.829677	\N	\N	\N
1818217	125	1	Standard Double or Twin Room	USD	35	2020-07-02	0	0	2020-07-01 10:00:51.836201	2020-07-01 10:00:51.836201	\N	\N	\N
1818218	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-02	0	0	2020-07-01 10:00:51.841972	2020-07-01 10:00:51.841972	\N	\N	\N
1818219	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-02	0	0	2020-07-01 10:00:51.847888	2020-07-01 10:00:51.847888	\N	\N	\N
1818220	194	1	Standard Small Double Room - Non-Smoking	USD	174.75	2020-07-02	0	0	2020-07-01 10:00:51.871372	2020-07-01 10:00:51.871372	\N	\N	\N
1818221	95	1	 Twin Guestroom	USD	147.12	2020-07-02	0	0	2020-07-01 10:00:51.877543	2020-07-01 10:00:51.877543	\N	\N	\N
1818222	157	1	Cosy Small Room	USD	99.37	2020-07-02	0	0	2020-07-01 10:00:51.883709	2020-07-01 10:00:51.883709	\N	\N	\N
1818223	26	1	Double	USD	84.85	2020-07-02	0	0	2020-07-01 10:00:51.890711	2020-07-01 10:00:51.890711	\N	\N	\N
1818224	164	1	Standard Twin Room	USD	126.1	2020-07-02	0	0	2020-07-01 10:00:51.896751	2020-07-01 10:00:51.896751	\N	\N	\N
1818225	61	1	Modern Double Room	USD	193.45	2020-07-02	0	0	2020-07-01 10:00:51.902217	2020-07-01 10:00:51.902217	\N	\N	\N
1818226	109	1	Classic Double Room	USD	168.35	2020-07-02	0	0	2020-07-01 10:00:51.907706	2020-07-01 10:00:51.907706	\N	\N	\N
1818227	181	1	Superior Double Room	USD	61.94	2020-07-02	0	0	2020-07-01 10:00:51.917307	2020-07-01 10:00:51.917307	\N	\N	\N
1818228	168	1	Privilege Double or Twin	USD	111.41	2020-07-02	191.14	0	2020-07-01 10:00:51.923329	2020-07-01 10:00:51.923329	\N	\N	\N
1818229	49	1	Superior Twin Room	USD	116.72	2020-07-02	0	0	2020-07-01 10:00:51.929268	2020-07-01 10:00:51.929268	\N	\N	\N
1818230	136	1	Standard Double or Twin Room	USD	125.08	2020-07-02	0	0	2020-07-01 10:00:51.937149	2020-07-01 10:00:51.937149	\N	\N	\N
1818231	98	1	Double or Twin	USD	81.77	2020-07-02	0	0	2020-07-01 10:00:51.944186	2020-07-01 10:00:51.944186	\N	\N	\N
1818232	159	1	Standard Room with 1 double bed and sofa	USD	84.59	2020-07-02	0	0	2020-07-01 10:00:51.951223	2020-07-01 10:00:51.951223	\N	\N	\N
1818233	42	1	Standard Twin Room	USD	69.7	2020-07-02	0	0	2020-07-01 10:00:51.969511	2020-07-01 10:00:51.969511	\N	\N	\N
1818234	3	1	Deluxe 	USD	175.26	2020-07-02	340.04	0	2020-07-01 10:00:51.976759	2020-07-01 10:00:51.976759	\N	\N	\N
1818235	90	1	Standard Room	USD	84.22	2020-07-02	336.9	0	2020-07-01 10:00:51.982833	2020-07-01 10:00:51.982833	\N	\N	\N
1818236	106	1	Double Room with Two Single Beds	USD	27.01	2020-07-02	0	0	2020-07-01 10:00:51.989044	2020-07-01 10:00:51.989044	\N	\N	\N
1818237	27	1	Standard Twin Room - Smoking	USD	165.54	2020-07-02	538.63	0	2020-07-01 10:00:51.995103	2020-07-01 10:00:51.995103	\N	\N	\N
1818238	77	1	Double Room - North Side	USD	146.62	2020-07-02	0	0	2020-07-01 10:00:52.000835	2020-07-01 10:00:52.000835	\N	\N	\N
1818239	31	1	Classic Double or Twin Room with Hill View	USD	334.24	2020-07-02	0	0	2020-07-01 10:00:52.033142	2020-07-01 10:00:52.033142	\N	\N	\N
1818240	18	1	Superior Room	USD	105.72	2020-07-02	0	0	2020-07-01 10:00:52.046294	2020-07-01 10:00:52.046294	\N	\N	\N
1818241	139	1	Small Double	USD	120.61	2020-07-02	482.45	0	2020-07-01 10:00:52.05298	2020-07-01 10:00:52.05298	\N	\N	\N
1818242	14	1	Classic Double Bed	USD	142.58	2020-07-02	0	0	2020-07-01 10:00:52.060989	2020-07-01 10:00:52.060989	\N	\N	\N
1818243	79	1	Standard Room	USD	80.31	2020-07-02	0	0	2020-07-01 10:00:52.067663	2020-07-01 10:00:52.067663	\N	\N	\N
1818244	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.19	2020-07-02	0	0	2020-07-01 10:00:52.073772	2020-07-01 10:00:52.073772	\N	\N	\N
1818245	67	1	Trendy Garden View Room	USD	223.23	2020-07-02	394.81	45	2020-07-01 10:00:52.079612	2020-07-01 10:00:52.079612	\N	\N	\N
1818246	160	1	King Accesible with Bathtub	USD	109	2020-07-02	0	0	2020-07-01 10:00:52.08522	2020-07-01 10:00:52.08522	\N	\N	\N
1818247	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	159	2020-07-02	0	0	2020-07-01 10:00:52.090773	2020-07-01 10:00:52.090773	\N	\N	\N
1818248	54	1	Double Room	USD	152.73	2020-07-02	765.66	0	2020-07-01 10:00:52.096429	2020-07-01 10:00:52.096429	\N	\N	\N
1818249	47	1	Standard room half board	USD	188.43	2020-07-02	500	0	2020-07-01 10:00:52.102868	2020-07-01 10:00:52.102868	\N	\N	\N
1818250	35	1	Twin - Non-Smoking	USD	97.38	2020-07-02	0	0	2020-07-01 10:00:52.109021	2020-07-01 10:00:52.109021	\N	\N	\N
1818251	38	1	Superior Double or Twin Room	USD	192.3	2020-07-02	0	0	2020-07-01 10:00:52.117129	2020-07-01 10:00:52.117129	\N	\N	\N
1818252	192	1	Comfort Room	USD	74.29	2020-07-02	224.87	0	2020-07-01 10:00:52.122797	2020-07-01 10:00:52.122797	\N	\N	\N
1818253	165	1	Basic Room	USD	90.97	2020-07-02	0	0	2020-07-01 10:00:52.128298	2020-07-01 10:00:52.128298	\N	\N	\N
1818254	215	1	Deluxe - 3 persons	USD	33.57	2020-07-02	134.3	25	2020-07-01 10:00:52.454062	2020-07-01 10:00:52.454062	\N	\N	\N
1818256	261	1	Superior Twin or Double Room	USD	62.2	2020-07-02	0	0	2020-07-01 10:00:52.467383	2020-07-01 10:00:52.467383	\N	\N	\N
1818257	224	1	Standard King	USD	72.16	2020-07-02	282.78	0	2020-07-01 10:00:52.473432	2020-07-01 10:00:52.473432	\N	\N	\N
1818258	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-07-02	0	0	2020-07-01 10:00:52.479416	2020-07-01 10:00:52.479416	\N	\N	\N
1818260	301	1	Comfort Double or Twin Room	USD	136.97	2020-07-02	0	0	2020-07-01 10:00:52.49217	2020-07-01 10:00:52.49217	\N	\N	\N
1818261	293	1	Budget Double Room	USD	73.88	2020-07-02	0	0	2020-07-01 10:00:52.497903	2020-07-01 10:00:52.497903	\N	\N	\N
1818262	243	1	Twin Room	USD	71.24	2020-07-02	0	0	2020-07-01 10:00:52.50334	2020-07-01 10:00:52.50334	\N	\N	\N
1818263	256	1	Standard Double Room	USD	107.08	2020-07-02	0	0	2020-07-01 10:00:52.509689	2020-07-01 10:00:52.509689	\N	\N	\N
1818265	240	1	Twin Room	USD	70.59	2020-07-02	0	0	2020-07-01 10:00:52.521153	2020-07-01 10:00:52.521153	\N	\N	\N
1818266	285	1	Superior Room king bed	USD	98.08	2020-07-02	0	0	2020-07-01 10:00:52.529116	2020-07-01 10:00:52.529116	\N	\N	\N
1818268	314	1	1 Double Bed Non-Smoking	USD	145.32	2020-07-02	0	0	2020-07-01 10:00:52.541057	2020-07-01 10:00:52.541057	\N	\N	\N
1818269	274	1	Standard Twin Room - Non-Smoking	USD	179.35	2020-07-02	389.51	0	2020-07-01 10:00:52.547971	2020-07-01 10:00:52.547971	\N	\N	\N
1818270	306	1	Deluxe King City View	USD	109.5	2020-07-02	301.84	30	2020-07-01 10:00:52.572317	2020-07-01 10:00:52.572317	\N	\N	\N
1818271	290	1	Standard	USD	95.3	2020-07-02	0	0	2020-07-01 10:00:52.578098	2020-07-01 10:00:52.578098	\N	\N	\N
1818275	258	1	Standard Double Room	USD	23.77	2020-07-02	0	0	2020-07-01 10:00:52.60224	2020-07-01 10:00:52.60224	\N	\N	\N
1818276	216	1	2 Double Accessible with Bathtub	USD	109	2020-07-02	0	0	2020-07-01 10:00:52.608176	2020-07-01 10:00:52.608176	\N	\N	\N
1818279	275	1	Double or Twin Room	USD	87.9	2020-07-02	0	0	2020-07-01 10:00:52.625591	2020-07-01 10:00:52.625591	\N	\N	\N
1818280	204	1	King Bed	USD	153.48	2020-07-02	0	0	2020-07-01 10:00:52.631178	2020-07-01 10:00:52.631178	\N	\N	\N
1818281	211	1	Standard	USD	290.47	2020-07-02	0	0	2020-07-01 10:00:52.636848	2020-07-01 10:00:52.636848	\N	\N	\N
1818283	295	1	Classic Double or Twin	USD	164.67	2020-07-02	460.98	0	2020-07-01 10:00:52.666781	2020-07-01 10:00:52.666781	\N	\N	\N
1818286	307	1	1 King Bed	USD	378.38	2020-07-02	0	0	2020-07-01 10:00:52.687685	2020-07-01 10:00:52.687685	\N	\N	\N
1818287	251	1	Standard Queen Room	USD	89.3	2020-07-02	0	0	2020-07-01 10:00:52.693424	2020-07-01 10:00:52.693424	\N	\N	\N
1818289	302	1	Accessible 1 King Bed	USD	79	2020-07-02	300	0	2020-07-01 10:00:52.705469	2020-07-01 10:00:52.705469	\N	\N	\N
1818294	206	1	Standard	USD	71.16	2020-07-02	0	0	2020-07-01 10:00:52.764467	2020-07-01 10:00:52.764467	\N	\N	\N
1818295	263	1	Queen Hilton Guestroom	USD	171.57	2020-07-02	0	0	2020-07-01 10:00:52.770513	2020-07-01 10:00:52.770513	\N	\N	\N
1845297	23	1	1 King Bed Evolution Room 	USD	144	2020-07-03	0	0	2020-07-02 10:00:41.200688	2020-07-02 10:00:41.200688	\N	\N	\N
1845298	45	1	Classic Double or Twin	USD	101.37	2020-07-03	0	0	2020-07-02 10:00:41.222922	2020-07-02 10:00:41.222922	\N	\N	\N
1845299	115	1	Double Room	USD	55.78	2020-07-03	0	0	2020-07-02 10:00:41.234971	2020-07-02 10:00:41.234971	\N	\N	\N
1845300	162	1	Standard Double Room	USD	216.57	2020-07-03	0	0	2020-07-02 10:00:41.245009	2020-07-02 10:00:41.245009	\N	\N	\N
1904378	224	1	Standard King	USD	72.43	2020-07-04	283.82	0	2020-07-03 10:00:41.51414	2020-07-03 10:00:41.51414	\N	\N	\N
1845301	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	74.63	2020-07-03	0	0	2020-07-02 10:00:41.260893	2020-07-02 10:00:41.260893	\N	\N	\N
1845302	158	1	Superior Twin Non-Smoking	USD	89.1	2020-07-03	0	0	2020-07-02 10:00:41.269842	2020-07-02 10:00:41.269842	\N	\N	\N
1845303	153	1	Standard Twin Room	USD	120.35	2020-07-03	0	0	2020-07-02 10:00:41.276122	2020-07-02 10:00:41.276122	\N	\N	\N
1845304	131	1	Superior Double Room	USD	51.45	2020-07-03	0	0	2020-07-02 10:00:41.283725	2020-07-02 10:00:41.283725	\N	\N	\N
1845305	184	1	Superior Room	USD	66.3	2020-07-03	417.77	0	2020-07-02 10:00:41.290069	2020-07-02 10:00:41.290069	\N	\N	\N
1845306	176	1	Economy Twin Room	USD	116.74	2020-07-03	0	0	2020-07-02 10:00:41.296894	2020-07-02 10:00:41.296894	\N	\N	\N
1845307	113	1	2 Queen Beds 	USD	169.15	2020-07-03	0	0	2020-07-02 10:00:41.303311	2020-07-02 10:00:41.303311	\N	\N	\N
1845308	53	1	Superior Twin	USD	140.26	2020-07-03	0	0	2020-07-02 10:00:41.30929	2020-07-02 10:00:41.30929	\N	\N	\N
1845309	143	1	Standard Double Room	USD	139.09	2020-07-03	0	0	2020-07-02 10:00:41.315073	2020-07-02 10:00:41.315073	\N	\N	\N
1845310	108	1	Standard Double Room	USD	70.59	2020-07-03	0	0	2020-07-02 10:00:41.32129	2020-07-02 10:00:41.32129	\N	\N	\N
1845311	13	1	Premium Twin Room with Two Double Beds	USD	131.31	2020-07-03	0	0	2020-07-02 10:00:41.329531	2020-07-02 10:00:41.329531	\N	\N	\N
1845312	8	1	Double Room	USD	159.86	2020-07-03	0	0	2020-07-02 10:00:41.335526	2020-07-02 10:00:41.335526	\N	\N	\N
1845313	64	1	Comfort Room	USD	56.58	2020-07-03	0	0	2020-07-02 10:00:41.342092	2020-07-02 10:00:41.342092	\N	\N	\N
1845314	125	1	Standard Double or Twin Room	USD	27	2020-07-03	0	0	2020-07-02 10:00:41.348438	2020-07-02 10:00:41.348438	\N	\N	\N
1845315	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-03	0	0	2020-07-02 10:00:41.366352	2020-07-02 10:00:41.366352	\N	\N	\N
1845316	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-03	0	0	2020-07-02 10:00:41.372259	2020-07-02 10:00:41.372259	\N	\N	\N
1845317	194	1	Standard Small Double Room - Non-Smoking	USD	175.41	2020-07-03	0	0	2020-07-02 10:00:41.379831	2020-07-02 10:00:41.379831	\N	\N	\N
1845318	95	1	 Twin Guestroom	USD	147.38	2020-07-03	0	0	2020-07-02 10:00:41.386223	2020-07-02 10:00:41.386223	\N	\N	\N
1845319	157	1	Cosy Small Room	USD	102.99	2020-07-03	0	0	2020-07-02 10:00:41.393656	2020-07-02 10:00:41.393656	\N	\N	\N
1845320	26	1	Double	USD	85.01	2020-07-03	0	0	2020-07-02 10:00:41.399495	2020-07-02 10:00:41.399495	\N	\N	\N
1845321	164	1	Standard Twin Room	USD	127.81	2020-07-03	0	0	2020-07-02 10:00:41.404984	2020-07-02 10:00:41.404984	\N	\N	\N
1845322	61	1	Modern Double Room	USD	173.32	2020-07-03	0	0	2020-07-02 10:00:41.410528	2020-07-02 10:00:41.410528	\N	\N	\N
1845323	109	1	Classic Double Room	USD	168.65	2020-07-03	0	0	2020-07-02 10:00:41.416216	2020-07-02 10:00:41.416216	\N	\N	\N
1845324	181	1	Superior Double Room	USD	61.94	2020-07-03	0	0	2020-07-02 10:00:41.421844	2020-07-02 10:00:41.421844	\N	\N	\N
1845325	168	1	Standard Room	USD	76.8	2020-07-03	0	0	2020-07-02 10:00:41.427718	2020-07-02 10:00:41.427718	\N	\N	\N
1845326	49	1	Superior Twin Room	USD	106.21	2020-07-03	0	0	2020-07-02 10:00:41.433291	2020-07-02 10:00:41.433291	\N	\N	\N
1845327	98	1	Double or Twin	USD	87.04	2020-07-03	0	0	2020-07-02 10:00:41.439024	2020-07-02 10:00:41.439024	\N	\N	\N
1845328	159	1	Standard Room with 1 double bed and sofa	USD	84.75	2020-07-03	0	0	2020-07-02 10:00:41.447143	2020-07-02 10:00:41.447143	\N	\N	\N
1845329	42	1	Standard Twin Room	USD	69.7	2020-07-03	0	0	2020-07-02 10:00:41.469839	2020-07-02 10:00:41.469839	\N	\N	\N
1845330	90	1	Standard Room	USD	89.65	2020-07-03	358.59	0	2020-07-02 10:00:41.476052	2020-07-02 10:00:41.476052	\N	\N	\N
1845331	106	1	Double Room with Two Single Beds	USD	27.69	2020-07-03	0	0	2020-07-02 10:00:41.481867	2020-07-02 10:00:41.481867	\N	\N	\N
1845332	27	1	Standard Twin Room - Smoking	USD	166.17	2020-07-03	540.67	0	2020-07-02 10:00:41.487526	2020-07-02 10:00:41.487526	\N	\N	\N
1845333	77	1	Double Room - North Side	USD	146.82	2020-07-03	0	0	2020-07-02 10:00:41.493479	2020-07-02 10:00:41.493479	\N	\N	\N
1845334	31	1	Classic Double or Twin Room with Hill View	USD	361.47	2020-07-03	0	0	2020-07-02 10:00:41.499235	2020-07-02 10:00:41.499235	\N	\N	\N
1845335	18	1	Superior Room	USD	98.99	2020-07-03	0	0	2020-07-02 10:00:41.505772	2020-07-02 10:00:41.505772	\N	\N	\N
1845336	202	1	2 Queen Beds, Pool Area	USD	95.72	2020-07-03	220.91	0	2020-07-02 10:00:41.511416	2020-07-02 10:00:41.511416	\N	\N	\N
1845337	139	1	Small Double	USD	120.83	2020-07-03	483.32	0	2020-07-02 10:00:41.517354	2020-07-02 10:00:41.517354	\N	\N	\N
1845338	14	1	Classic Double Bed	USD	122.36	2020-07-03	0	0	2020-07-02 10:00:41.524689	2020-07-02 10:00:41.524689	\N	\N	\N
1845339	79	1	Standard Room	USD	80.46	2020-07-03	0	0	2020-07-02 10:00:41.530232	2020-07-02 10:00:41.530232	\N	\N	\N
1845340	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.47	2020-07-03	0	0	2020-07-02 10:00:41.535733	2020-07-02 10:00:41.535733	\N	\N	\N
1845341	67	1	Trendy Garden View Room	USD	224.07	2020-07-03	0	0	2020-07-02 10:00:41.54126	2020-07-02 10:00:41.54126	\N	\N	\N
1845342	160	1	King Accessible with Roll In Shower	USD	109	2020-07-03	0	0	2020-07-02 10:00:41.568702	2020-07-02 10:00:41.568702	\N	\N	\N
1845343	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	109	2020-07-03	0	0	2020-07-02 10:00:41.57463	2020-07-02 10:00:41.57463	\N	\N	\N
1845344	54	1	Double Room	USD	152.94	2020-07-03	766.72	0	2020-07-02 10:00:41.580682	2020-07-02 10:00:41.580682	\N	\N	\N
1845345	47	1	Standard room half board	USD	188.43	2020-07-03	500	0	2020-07-02 10:00:41.586689	2020-07-02 10:00:41.586689	\N	\N	\N
1845346	35	1	Twin - Non-Smoking	USD	97.74	2020-07-03	0	0	2020-07-02 10:00:41.593261	2020-07-02 10:00:41.593261	\N	\N	\N
1845347	38	1	Superior Double or Twin Room	USD	192.64	2020-07-03	0	0	2020-07-02 10:00:41.601796	2020-07-02 10:00:41.601796	\N	\N	\N
1845348	192	1	Comfort Room	USD	68.65	2020-07-03	225.28	0	2020-07-02 10:00:41.607525	2020-07-02 10:00:41.607525	\N	\N	\N
1845349	165	1	Basic Room	USD	91.14	2020-07-03	0	0	2020-07-02 10:00:41.614882	2020-07-02 10:00:41.614882	\N	\N	\N
1845350	215	1	Deluxe - 3 persons	USD	33.57	2020-07-03	134.3	25	2020-07-02 10:00:41.982563	2020-07-02 10:00:41.982563	\N	\N	\N
1845352	261	1	Superior Twin or Double Room	USD	62.2	2020-07-03	0	0	2020-07-02 10:00:41.998857	2020-07-02 10:00:41.998857	\N	\N	\N
1845353	224	1	Standard King	USD	72.33	2020-07-03	283.45	0	2020-07-02 10:00:42.007587	2020-07-02 10:00:42.007587	\N	\N	\N
1845354	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-07-03	0	0	2020-07-02 10:00:42.014813	2020-07-02 10:00:42.014813	\N	\N	\N
1845356	301	1	Comfort Double or Twin Room	USD	137.22	2020-07-03	0	0	2020-07-02 10:00:42.027592	2020-07-02 10:00:42.027592	\N	\N	\N
1845357	293	1	Comfort Double Room	USD	76.17	2020-07-03	0	0	2020-07-02 10:00:42.033103	2020-07-02 10:00:42.033103	\N	\N	\N
1845358	243	1	Twin Room	USD	56.58	2020-07-03	0	0	2020-07-02 10:00:42.038851	2020-07-02 10:00:42.038851	\N	\N	\N
1845359	256	1	Standard Double Room	USD	91.18	2020-07-03	0	0	2020-07-02 10:00:42.045865	2020-07-02 10:00:42.045865	\N	\N	\N
1845360	240	1	Twin Room	USD	70.59	2020-07-03	0	0	2020-07-02 10:00:42.052822	2020-07-02 10:00:42.052822	\N	\N	\N
1845361	285	1	Superior Room king bed	USD	98.48	2020-07-03	0	0	2020-07-02 10:00:42.06236	2020-07-02 10:00:42.06236	\N	\N	\N
1845363	314	1	1 Double Bed Non-Smoking	USD	145.58	2020-07-03	0	0	2020-07-02 10:00:42.075811	2020-07-02 10:00:42.075811	\N	\N	\N
1845364	274	1	Small Double Room Non-Smoking	USD	167.72	2020-07-03	225.79	0	2020-07-02 10:00:42.083482	2020-07-02 10:00:42.083482	\N	\N	\N
1845365	306	1	Deluxe King City View	USD	104.22	2020-07-03	301.7	0	2020-07-02 10:00:42.091307	2020-07-02 10:00:42.091307	\N	\N	\N
1845366	290	1	Standard	USD	95.47	2020-07-03	0	0	2020-07-02 10:00:42.097753	2020-07-02 10:00:42.097753	\N	\N	\N
1845370	258	1	Standard Double Room	USD	24.36	2020-07-03	0	0	2020-07-02 10:00:42.121899	2020-07-02 10:00:42.121899	\N	\N	\N
1845371	216	1	2 Double Accessible Roll in Shower	USD	109	2020-07-03	0	0	2020-07-02 10:00:42.127993	2020-07-02 10:00:42.127993	\N	\N	\N
1845374	275	1	Double or Twin Room	USD	88.06	2020-07-03	0	0	2020-07-02 10:00:42.150876	2020-07-02 10:00:42.150876	\N	\N	\N
1845375	204	1	King Bed	USD	153.9	2020-07-03	0	0	2020-07-02 10:00:42.166729	2020-07-02 10:00:42.166729	\N	\N	\N
1845377	295	1	Classic Double or Twin	USD	174.18	2020-07-03	461.82	0	2020-07-02 10:00:42.180744	2020-07-02 10:00:42.180744	\N	\N	\N
1845380	307	1	1 King Bed	USD	403.55	2020-07-03	0	0	2020-07-02 10:00:42.202798	2020-07-02 10:00:42.202798	\N	\N	\N
1845381	251	1	Standard Queen Room	USD	89.53	2020-07-03	0	0	2020-07-02 10:00:42.211203	2020-07-02 10:00:42.211203	\N	\N	\N
1845383	302	1	2 Queen Beds 	USD	89	2020-07-03	0	0	2020-07-02 10:00:42.224275	2020-07-02 10:00:42.224275	\N	\N	\N
1845388	206	1	Standard	USD	71.79	2020-07-03	0	0	2020-07-02 10:00:42.267317	2020-07-02 10:00:42.267317	\N	\N	\N
1845389	263	1	Queen Hilton Guestroom	USD	130.33	2020-07-03	0	0	2020-07-02 10:00:42.279511	2020-07-02 10:00:42.279511	\N	\N	\N
1904322	23	1	1 King Bed Evolution Room 	USD	129	2020-07-04	0	0	2020-07-03 10:00:40.533486	2020-07-03 10:00:40.533486	\N	\N	\N
1904323	45	1	Classic Double or Twin	USD	101.06	2020-07-04	0	0	2020-07-03 10:00:40.558829	2020-07-03 10:00:40.558829	\N	\N	\N
1904324	115	1	Double Room	USD	65.24	2020-07-04	0	0	2020-07-03 10:00:40.576786	2020-07-03 10:00:40.576786	\N	\N	\N
1904325	162	1	Flexible Room	USD	172.51	2020-07-04	0	0	2020-07-03 10:00:40.584219	2020-07-03 10:00:40.584219	\N	\N	\N
1904326	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	89.88	2020-07-04	0	0	2020-07-03 10:00:40.590101	2020-07-03 10:00:40.590101	\N	\N	\N
1904327	158	1	Superior Twin Non-Smoking	USD	89.15	2020-07-04	0	0	2020-07-03 10:00:40.596682	2020-07-03 10:00:40.596682	\N	\N	\N
1904328	153	1	Standard Twin Room	USD	119.96	2020-07-04	0	0	2020-07-03 10:00:40.602757	2020-07-03 10:00:40.602757	\N	\N	\N
1904329	201	1	Classic Double Room	USD	124.63	2020-07-04	0	0	2020-07-03 10:00:40.608548	2020-07-03 10:00:40.608548	\N	\N	\N
1904330	131	1	Superior Double Room	USD	51.25	2020-07-04	0	0	2020-07-03 10:00:40.616324	2020-07-03 10:00:40.616324	\N	\N	\N
1904331	184	1	Superior Room	USD	64.22	2020-07-04	413.69	0	2020-07-03 10:00:40.621951	2020-07-03 10:00:40.621951	\N	\N	\N
1904332	176	1	Economy Twin Room	USD	116.37	2020-07-04	0	0	2020-07-03 10:00:40.628015	2020-07-03 10:00:40.628015	\N	\N	\N
1904333	113	1	2 Queen Beds 	USD	152.15	2020-07-04	0	0	2020-07-03 10:00:40.633814	2020-07-03 10:00:40.633814	\N	\N	\N
1904334	53	1	Superior Twin	USD	191.79	2020-07-04	0	0	2020-07-03 10:00:40.665891	2020-07-03 10:00:40.665891	\N	\N	\N
1904335	143	1	Standard Double Room	USD	138.69	2020-07-04	0	0	2020-07-03 10:00:40.672717	2020-07-03 10:00:40.672717	\N	\N	\N
1904336	108	1	Standard Double Room	USD	70.37	2020-07-04	0	0	2020-07-03 10:00:40.6786	2020-07-03 10:00:40.6786	\N	\N	\N
1904337	13	1	Premium Twin Room with Two Double Beds	USD	152.24	2020-07-04	0	0	2020-07-03 10:00:40.685249	2020-07-03 10:00:40.685249	\N	\N	\N
1904338	8	1	Twin Room	USD	159.4	2020-07-04	0	0	2020-07-03 10:00:40.691237	2020-07-03 10:00:40.691237	\N	\N	\N
1904339	64	1	Comfort Room	USD	60.73	2020-07-04	0	0	2020-07-03 10:00:40.698418	2020-07-03 10:00:40.698418	\N	\N	\N
1904340	125	1	Standard Double or Twin Room	USD	27	2020-07-04	0	0	2020-07-03 10:00:40.70451	2020-07-03 10:00:40.70451	\N	\N	\N
1904341	199	1	Standard Room with 1 double bed	USD	34.84	2020-07-04	0	0	2020-07-03 10:00:40.710214	2020-07-03 10:00:40.710214	\N	\N	\N
1904342	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-04	0	0	2020-07-03 10:00:40.716522	2020-07-03 10:00:40.716522	\N	\N	\N
1904343	194	1	Standard Small Double Room - Non-Smoking	USD	167.46	2020-07-04	0	0	2020-07-03 10:00:40.725172	2020-07-03 10:00:40.725172	\N	\N	\N
1904344	95	1	 Twin Guestroom	USD	146.92	2020-07-04	0	0	2020-07-03 10:00:40.731473	2020-07-03 10:00:40.731473	\N	\N	\N
1904345	157	1	Cosy Small Room	USD	102.58	2020-07-04	0	0	2020-07-03 10:00:40.739688	2020-07-03 10:00:40.739688	\N	\N	\N
1904346	26	1	Double	USD	84.74	2020-07-04	0	0	2020-07-03 10:00:40.745426	2020-07-03 10:00:40.745426	\N	\N	\N
1904347	164	1	Standard Twin Room	USD	127.44	2020-07-04	0	0	2020-07-03 10:00:40.751131	2020-07-03 10:00:40.751131	\N	\N	\N
1904348	61	1	Modern Double Room	USD	173.25	2020-07-04	0	0	2020-07-03 10:00:40.769187	2020-07-03 10:00:40.769187	\N	\N	\N
1904349	109	1	Classic Double Room	USD	178.23	2020-07-04	0	0	2020-07-03 10:00:40.774827	2020-07-03 10:00:40.774827	\N	\N	\N
1904350	181	1	Superior Double Room	USD	61.94	2020-07-04	0	0	2020-07-03 10:00:40.780351	2020-07-03 10:00:40.780351	\N	\N	\N
1904351	168	1	Standard Room	USD	90.85	2020-07-04	0	0	2020-07-03 10:00:40.786022	2020-07-03 10:00:40.786022	\N	\N	\N
1904352	49	1	Superior Twin Room	USD	105.87	2020-07-04	0	0	2020-07-03 10:00:40.791821	2020-07-03 10:00:40.791821	\N	\N	\N
1904353	136	1	Standard Double or Twin Room	USD	125.72	2020-07-04	0	0	2020-07-03 10:00:40.800138	2020-07-03 10:00:40.800138	\N	\N	\N
1904354	98	1	Double or Twin	USD	86.76	2020-07-04	0	0	2020-07-03 10:00:40.806079	2020-07-03 10:00:40.806079	\N	\N	\N
1904355	159	1	Standard Room with 1 double bed and sofa	USD	84.48	2020-07-04	0	0	2020-07-03 10:00:40.813515	2020-07-03 10:00:40.813515	\N	\N	\N
1904356	90	1	Standard Room	USD	89.37	2020-07-04	357.47	0	2020-07-03 10:00:40.819229	2020-07-03 10:00:40.819229	\N	\N	\N
1904357	106	1	Double Room with Two Single Beds	USD	41.2	2020-07-04	0	0	2020-07-03 10:00:40.825213	2020-07-03 10:00:40.825213	\N	\N	\N
1904358	27	1	Standard Twin Room - Smoking	USD	165.92	2020-07-04	539.85	0	2020-07-03 10:00:40.83099	2020-07-03 10:00:40.83099	\N	\N	\N
1904359	77	1	Double Room - North Side	USD	146.76	2020-07-04	0	0	2020-07-03 10:00:40.836759	2020-07-03 10:00:40.836759	\N	\N	\N
1904360	31	1	Classic Double or Twin Room with Hill View	USD	384.83	2020-07-04	0	0	2020-07-03 10:00:40.843881	2020-07-03 10:00:40.843881	\N	\N	\N
1904361	18	1	Superior Room	USD	100.93	2020-07-04	0	0	2020-07-03 10:00:40.865203	2020-07-03 10:00:40.865203	\N	\N	\N
1904362	202	1	2 Queen Beds, Pool Area	USD	95.62	2020-07-04	220.69	0	2020-07-03 10:00:40.871551	2020-07-03 10:00:40.871551	\N	\N	\N
1904363	139	1	Small Double	USD	120.45	2020-07-04	481.8	0	2020-07-03 10:00:40.877578	2020-07-03 10:00:40.877578	\N	\N	\N
1904364	14	1	Classic Double Bed	USD	121.97	2020-07-04	0	0	2020-07-03 10:00:40.88378	2020-07-03 10:00:40.88378	\N	\N	\N
1904365	79	1	Standard Room	USD	80.2	2020-07-04	0	0	2020-07-03 10:00:40.889623	2020-07-03 10:00:40.889623	\N	\N	\N
1904366	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	92.95	2020-07-04	0	0	2020-07-03 10:00:40.895418	2020-07-03 10:00:40.895418	\N	\N	\N
1904367	67	1	Trendy Garden View Room	USD	224.07	2020-07-04	0	0	2020-07-03 10:00:40.901034	2020-07-03 10:00:40.901034	\N	\N	\N
1904368	160	1	King Accessible with Roll In Shower	USD	109	2020-07-04	0	0	2020-07-03 10:00:40.906654	2020-07-03 10:00:40.906654	\N	\N	\N
1904369	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	109	2020-07-04	0	0	2020-07-03 10:00:40.912573	2020-07-03 10:00:40.912573	\N	\N	\N
1904370	54	1	Double Room	USD	152.87	2020-07-04	766.39	0	2020-07-03 10:00:40.918404	2020-07-03 10:00:40.918404	\N	\N	\N
1904371	47	1	Standard room half board	USD	188.43	2020-07-04	500	0	2020-07-03 10:00:40.925722	2020-07-03 10:00:40.925722	\N	\N	\N
1904372	35	1	Twin - Non-Smoking	USD	107.4	2020-07-04	0	0	2020-07-03 10:00:40.931932	2020-07-03 10:00:40.931932	\N	\N	\N
1904373	38	1	Superior Double or Twin Room	USD	192.04	2020-07-04	0	0	2020-07-03 10:00:40.939251	2020-07-03 10:00:40.939251	\N	\N	\N
1904374	192	1	Comfort Room	USD	68.44	2020-07-04	224.57	0	2020-07-03 10:00:40.945194	2020-07-03 10:00:40.945194	\N	\N	\N
1904375	215	1	Deluxe - 3 persons	USD	33.57	2020-07-04	134.3	25	2020-07-03 10:00:41.491625	2020-07-03 10:00:41.491625	\N	\N	\N
1904377	261	1	Superior Twin or Double Room	USD	62.2	2020-07-04	0	0	2020-07-03 10:00:41.50833	2020-07-03 10:00:41.50833	\N	\N	\N
1904379	300	1	Deluxe Room, Guestroom, 1 King	USD	138.13	2020-07-04	0	0	2020-07-03 10:00:41.520358	2020-07-03 10:00:41.520358	\N	\N	\N
1904380	301	1	Comfort Double or Twin Room	USD	136.78	2020-07-04	0	0	2020-07-03 10:00:41.526398	2020-07-03 10:00:41.526398	\N	\N	\N
1904381	293	1	Budget Double Room	USD	73.78	2020-07-04	0	0	2020-07-03 10:00:41.531991	2020-07-03 10:00:41.531991	\N	\N	\N
1904382	243	1	Twin Room	USD	56.4	2020-07-04	0	0	2020-07-03 10:00:41.537594	2020-07-03 10:00:41.537594	\N	\N	\N
1904383	256	1	Standard Double Room	USD	90.89	2020-07-04	0	0	2020-07-03 10:00:41.544003	2020-07-03 10:00:41.544003	\N	\N	\N
1904384	285	1	Superior Room king bed	USD	101.31	2020-07-04	0	0	2020-07-03 10:00:41.553147	2020-07-03 10:00:41.553147	\N	\N	\N
1904386	314	1	1 Double Bed Non-Smoking	USD	145.13	2020-07-04	0	0	2020-07-03 10:00:41.566995	2020-07-03 10:00:41.566995	\N	\N	\N
1904387	274	1	Standard Twin Room - Non-Smoking	USD	261.18	2020-07-04	390.39	0	2020-07-03 10:00:41.573824	2020-07-03 10:00:41.573824	\N	\N	\N
1904388	306	1	Deluxe King City View	USD	102.11	2020-07-04	301.63	0	2020-07-03 10:00:41.581251	2020-07-03 10:00:41.581251	\N	\N	\N
1904389	290	1	Standard	USD	95.17	2020-07-04	0	0	2020-07-03 10:00:41.596181	2020-07-03 10:00:41.596181	\N	\N	\N
1904393	258	1	Standard Double Room	USD	24.43	2020-07-04	0	0	2020-07-03 10:00:41.621961	2020-07-03 10:00:41.621961	\N	\N	\N
1904394	216	1	2 Double Accessible Roll in Shower	USD	109	2020-07-04	0	0	2020-07-03 10:00:41.627909	2020-07-03 10:00:41.627909	\N	\N	\N
1904397	275	1	Double or Twin Room	USD	87.78	2020-07-04	0	0	2020-07-03 10:00:41.646146	2020-07-03 10:00:41.646146	\N	\N	\N
1904398	204	1	King Bed	USD	153.74	2020-07-04	0	0	2020-07-03 10:00:41.651896	2020-07-03 10:00:41.651896	\N	\N	\N
1904400	295	1	Classic Double or Twin	USD	173.63	2020-07-04	460.36	0	2020-07-03 10:00:41.671745	2020-07-03 10:00:41.671745	\N	\N	\N
1904403	307	1	1 King Bed	USD	402.94	2020-07-04	0	0	2020-07-03 10:00:41.692664	2020-07-03 10:00:41.692664	\N	\N	\N
1904404	251	1	Standard Room with 2 Single Beds	USD	89.37	2020-07-04	0	0	2020-07-03 10:00:41.699881	2020-07-03 10:00:41.699881	\N	\N	\N
1904406	302	1	2 Queen Beds 	USD	89	2020-07-04	0	0	2020-07-03 10:00:41.712416	2020-07-03 10:00:41.712416	\N	\N	\N
1904411	249	1	Standard 1 Double 1 Single Bed	USD	96.97	2020-07-04	0	0	2020-07-03 10:00:41.767551	2020-07-03 10:00:41.767551	\N	\N	\N
1904412	206	1	Standard	USD	71.66	2020-07-04	0	0	2020-07-03 10:00:41.77348	2020-07-03 10:00:41.77348	\N	\N	\N
1904413	263	1	Queen Hilton Guestroom	USD	130.13	2020-07-04	0	0	2020-07-03 10:00:41.779151	2020-07-03 10:00:41.779151	\N	\N	\N
1959391	23	1	2 Queen Mobility Hearing Accessible with Roll in Shower	USD	119	2020-07-05	0	0	2020-07-04 10:00:40.498932	2020-07-04 10:00:40.498932	\N	\N	\N
1959392	45	1	Classic Double or Twin	USD	101.19	2020-07-05	0	0	2020-07-04 10:00:40.518204	2020-07-04 10:00:40.518204	\N	\N	\N
1959393	115	1	Double Room	USD	55.68	2020-07-05	0	0	2020-07-04 10:00:40.536853	2020-07-04 10:00:40.536853	\N	\N	\N
1959394	162	1	Flexible Room	USD	172.75	2020-07-05	0	0	2020-07-04 10:00:40.544499	2020-07-04 10:00:40.544499	\N	\N	\N
1959395	75	1	Small Single Room - Smoking Lower floor (2 Adult)	USD	66.88	2020-07-05	0	0	2020-07-04 10:00:40.55089	2020-07-04 10:00:40.55089	\N	\N	\N
1959396	158	1	Superior Twin Non-Smoking	USD	89.16	2020-07-05	0	0	2020-07-04 10:00:40.570455	2020-07-04 10:00:40.570455	\N	\N	\N
1959397	153	1	Standard Twin Room	USD	144.26	2020-07-05	0	0	2020-07-04 10:00:40.577094	2020-07-04 10:00:40.577094	\N	\N	\N
1959398	201	1	Feature Double Room	USD	116.58	2020-07-05	0	0	2020-07-04 10:00:40.583028	2020-07-04 10:00:40.583028	\N	\N	\N
1959399	131	1	Superior Double Room	USD	51.07	2020-07-05	0	0	2020-07-04 10:00:40.592634	2020-07-04 10:00:40.592634	\N	\N	\N
1959400	184	1	Superior Room	USD	64.61	2020-07-05	409.51	0	2020-07-04 10:00:40.599109	2020-07-04 10:00:40.599109	\N	\N	\N
1959401	176	1	Economy Twin Room	USD	116.53	2020-07-05	0	0	2020-07-04 10:00:40.605561	2020-07-04 10:00:40.605561	\N	\N	\N
1959402	113	1	2 Queen Beds 	USD	152.15	2020-07-05	0	0	2020-07-04 10:00:40.611441	2020-07-04 10:00:40.611441	\N	\N	\N
1959403	53	1	Superior Twin	USD	130.09	2020-07-05	0	0	2020-07-04 10:00:40.617439	2020-07-04 10:00:40.617439	\N	\N	\N
1959404	143	1	Standard Double Room	USD	139.48	2020-07-05	0	0	2020-07-04 10:00:40.623507	2020-07-04 10:00:40.623507	\N	\N	\N
1959405	108	1	Standard Double Room	USD	66.71	2020-07-05	0	0	2020-07-04 10:00:40.629847	2020-07-04 10:00:40.629847	\N	\N	\N
1959406	13	1	Premium Twin Room with Two Double Beds	USD	127.31	2020-07-05	0	0	2020-07-04 10:00:40.637408	2020-07-04 10:00:40.637408	\N	\N	\N
1959407	8	1	Double Room	USD	160.31	2020-07-05	0	0	2020-07-04 10:00:40.643836	2020-07-04 10:00:40.643836	\N	\N	\N
1959408	64	1	Comfort Room	USD	41.7	2020-07-05	0	0	2020-07-04 10:00:40.652186	2020-07-04 10:00:40.652186	\N	\N	\N
1959409	125	1	Standard Double or Twin Room	USD	35	2020-07-05	0	0	2020-07-04 10:00:40.667653	2020-07-04 10:00:40.667653	\N	\N	\N
1959410	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-05	0	0	2020-07-04 10:00:40.674384	2020-07-04 10:00:40.674384	\N	\N	\N
1959411	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-05	0	0	2020-07-04 10:00:40.680605	2020-07-04 10:00:40.680605	\N	\N	\N
1959412	194	1	Standard Small Double Room - Non-Smoking	USD	163.75	2020-07-05	0	0	2020-07-04 10:00:40.688274	2020-07-04 10:00:40.688274	\N	\N	\N
1959413	95	1	 Twin Guestroom	USD	147.12	2020-07-05	0	0	2020-07-04 10:00:40.694939	2020-07-04 10:00:40.694939	\N	\N	\N
1959414	157	1	Cosy Small Room	USD	99.37	2020-07-05	0	0	2020-07-04 10:00:40.702092	2020-07-04 10:00:40.702092	\N	\N	\N
1959415	26	1	Double	USD	84.85	2020-07-05	0	0	2020-07-04 10:00:40.708221	2020-07-04 10:00:40.708221	\N	\N	\N
1959416	164	1	Standard Twin Room	USD	128.17	2020-07-05	0	0	2020-07-04 10:00:40.714277	2020-07-04 10:00:40.714277	\N	\N	\N
1959417	61	1	Modern Double Room	USD	173.47	2020-07-05	0	0	2020-07-04 10:00:40.720383	2020-07-04 10:00:40.720383	\N	\N	\N
1959418	109	1	Classic Double Room	USD	147.19	2020-07-05	0	0	2020-07-04 10:00:40.726627	2020-07-04 10:00:40.726627	\N	\N	\N
1959419	181	1	Superior Double Room	USD	61.94	2020-07-05	0	0	2020-07-04 10:00:40.732711	2020-07-04 10:00:40.732711	\N	\N	\N
1959420	168	1	Standard Room	USD	90.97	2020-07-05	0	0	2020-07-04 10:00:40.738897	2020-07-04 10:00:40.738897	\N	\N	\N
1959421	49	1	Superior Twin Room	USD	95.3	2020-07-05	0	0	2020-07-04 10:00:40.744841	2020-07-04 10:00:40.744841	\N	\N	\N
1959422	136	1	Standard Double or Twin Room	USD	125.95	2020-07-05	0	0	2020-07-04 10:00:40.766316	2020-07-04 10:00:40.766316	\N	\N	\N
1959423	98	1	Double or Twin	USD	76.66	2020-07-05	0	0	2020-07-04 10:00:40.772568	2020-07-04 10:00:40.772568	\N	\N	\N
1959424	159	1	Standard Room with 1 double bed and sofa	USD	84.59	2020-07-05	0	0	2020-07-04 10:00:40.7806	2020-07-04 10:00:40.7806	\N	\N	\N
1959425	90	1	Standard Room	USD	89.49	2020-07-05	357.95	0	2020-07-04 10:00:40.786923	2020-07-04 10:00:40.786923	\N	\N	\N
1959426	106	1	Double Room with Two Single Beds	USD	36.98	2020-07-05	0	0	2020-07-04 10:00:40.792859	2020-07-04 10:00:40.792859	\N	\N	\N
1959427	27	1	Standard Twin Room - Smoking	USD	166.04	2020-07-05	540.26	0	2020-07-04 10:00:40.798591	2020-07-04 10:00:40.798591	\N	\N	\N
1959428	77	1	Double Room - North Side	USD	146.94	2020-07-05	0	0	2020-07-04 10:00:40.804273	2020-07-04 10:00:40.804273	\N	\N	\N
1959429	31	1	Classic Double or Twin Room with Hill View	USD	385.35	2020-07-05	0	0	2020-07-04 10:00:40.810151	2020-07-04 10:00:40.810151	\N	\N	\N
1959430	18	1	Superior Room	USD	101.04	2020-07-05	0	0	2020-07-04 10:00:40.815872	2020-07-04 10:00:40.815872	\N	\N	\N
1959431	202	1	2 Queen Beds, Pool Area	USD	84.79	2020-07-05	221.22	0	2020-07-04 10:00:40.825054	2020-07-04 10:00:40.825054	\N	\N	\N
1959432	139	1	Small Double	USD	116.52	2020-07-05	466.11	0	2020-07-04 10:00:40.831445	2020-07-04 10:00:40.831445	\N	\N	\N
1959433	14	1	Classic Double Bed	USD	117.02	2020-07-05	0	0	2020-07-04 10:00:40.838155	2020-07-04 10:00:40.838155	\N	\N	\N
1959434	79	1	Standard Room	USD	80.31	2020-07-05	0	0	2020-07-04 10:00:40.844288	2020-07-04 10:00:40.844288	\N	\N	\N
1959435	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.42	2020-07-05	0	0	2020-07-04 10:00:40.850443	2020-07-04 10:00:40.850443	\N	\N	\N
1959436	67	1	Trendy Garden View Room	USD	255.46	2020-07-05	415.46	40	2020-07-04 10:00:40.869517	2020-07-04 10:00:40.869517	\N	\N	\N
1959437	160	1	King Accessible with Roll In Shower	USD	109	2020-07-05	0	0	2020-07-04 10:00:40.875907	2020-07-04 10:00:40.875907	\N	\N	\N
1959438	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	149	2020-07-05	0	0	2020-07-04 10:00:40.881999	2020-07-04 10:00:40.881999	\N	\N	\N
1959439	54	1	Double Room	USD	153.07	2020-07-05	767.37	0	2020-07-04 10:00:40.887856	2020-07-04 10:00:40.887856	\N	\N	\N
1959440	47	1	Standard room half board	USD	188.43	2020-07-05	500	0	2020-07-04 10:00:40.895008	2020-07-04 10:00:40.895008	\N	\N	\N
1959441	35	1	Twin - Non-Smoking	USD	97.67	2020-07-05	0	0	2020-07-04 10:00:40.901376	2020-07-04 10:00:40.901376	\N	\N	\N
1959442	38	1	Superior Double or Twin Room	USD	192.3	2020-07-05	0	0	2020-07-04 10:00:40.908466	2020-07-04 10:00:40.908466	\N	\N	\N
1959443	192	1	Comfort Room	USD	68.53	2020-07-05	224.87	0	2020-07-04 10:00:40.914342	2020-07-04 10:00:40.914342	\N	\N	\N
1959444	165	1	Basic Room	USD	90.97	2020-07-05	0	0	2020-07-04 10:00:40.921024	2020-07-04 10:00:40.921024	\N	\N	\N
1959445	215	1	Deluxe - 3 persons	USD	33.58	2020-07-05	134.31	25	2020-07-04 10:00:41.509077	2020-07-04 10:00:41.509077	\N	\N	\N
1959447	261	1	Superior Twin or Double Room	USD	62.2	2020-07-05	0	0	2020-07-04 10:00:41.525502	2020-07-04 10:00:41.525502	\N	\N	\N
1959448	224	1	Standard King	USD	72.41	2020-07-05	283.76	0	2020-07-04 10:00:41.531456	2020-07-04 10:00:41.531456	\N	\N	\N
1959449	300	1	Deluxe Room, Guestroom, 1 King	USD	138.13	2020-07-05	0	0	2020-07-04 10:00:41.537927	2020-07-04 10:00:41.537927	\N	\N	\N
1959450	301	1	Comfort Double or Twin Room	USD	136.97	2020-07-05	0	0	2020-07-04 10:00:41.543851	2020-07-04 10:00:41.543851	\N	\N	\N
1959451	293	1	Budget Double Room	USD	73.88	2020-07-05	0	0	2020-07-04 10:00:41.549712	2020-07-04 10:00:41.549712	\N	\N	\N
1959452	243	1	Twin Room	USD	56.48	2020-07-05	0	0	2020-07-04 10:00:41.555749	2020-07-04 10:00:41.555749	\N	\N	\N
1959453	256	1	Standard Double Room	USD	91.02	2020-07-05	0	0	2020-07-04 10:00:41.562569	2020-07-04 10:00:41.562569	\N	\N	\N
1959455	285	1	Superior Room king bed	USD	93.14	2020-07-05	0	0	2020-07-04 10:00:41.577694	2020-07-04 10:00:41.577694	\N	\N	\N
1959458	314	1	1 Double Bed Non-Smoking	USD	145.32	2020-07-05	0	0	2020-07-04 10:00:41.598771	2020-07-04 10:00:41.598771	\N	\N	\N
1959459	274	1	Standard Twin Room - Non-Smoking	USD	179.89	2020-07-05	390.68	0	2020-07-04 10:00:41.605924	2020-07-04 10:00:41.605924	\N	\N	\N
1959460	306	1	Deluxe King City View	USD	102.13	2020-07-05	301.7	0	2020-07-04 10:00:41.61364	2020-07-04 10:00:41.61364	\N	\N	\N
1959461	290	1	Standard	USD	84.59	2020-07-05	0	0	2020-07-04 10:00:41.619861	2020-07-04 10:00:41.619861	\N	\N	\N
1959465	258	1	Standard Double Room	USD	24.36	2020-07-05	0	0	2020-07-04 10:00:41.644217	2020-07-04 10:00:41.644217	\N	\N	\N
1959466	216	1	2 Double Accessible with Bathtub	USD	109	2020-07-05	0	0	2020-07-04 10:00:41.650487	2020-07-04 10:00:41.650487	\N	\N	\N
1959469	275	1	Double or Twin Room	USD	87.9	2020-07-05	0	0	2020-07-04 10:00:41.677964	2020-07-04 10:00:41.677964	\N	\N	\N
1959470	204	1	King Bed	USD	154.12	2020-07-05	0	0	2020-07-04 10:00:41.683972	2020-07-04 10:00:41.683972	\N	\N	\N
1959472	295	1	Classic Double or Twin	USD	164.67	2020-07-05	460.98	0	2020-07-04 10:00:41.698183	2020-07-04 10:00:41.698183	\N	\N	\N
1959475	307	1	1 King Bed	USD	379.52	2020-07-05	0	0	2020-07-04 10:00:41.719261	2020-07-04 10:00:41.719261	\N	\N	\N
1959476	251	1	Standard Room with 2 Single Beds	USD	89.18	2020-07-05	0	0	2020-07-04 10:00:41.725916	2020-07-04 10:00:41.725916	\N	\N	\N
1959478	302	1	2 Queen Beds 	USD	79	2020-07-05	0	0	2020-07-04 10:00:41.738528	2020-07-04 10:00:41.738528	\N	\N	\N
1959479	279	1	Loft Suite	USD	377.97	2020-07-05	0	0	2020-07-04 10:00:41.744218	2020-07-04 10:00:41.744218	\N	\N	\N
1959484	249	1	Standard 1 Double 1 Single Bed	USD	97.1	2020-07-05	0	0	2020-07-04 10:00:41.798188	2020-07-04 10:00:41.798188	\N	\N	\N
1959486	206	1	Standard	USD	71.7	2020-07-05	0	0	2020-07-04 10:00:41.809589	2020-07-04 10:00:41.809589	\N	\N	\N
1959487	263	1	Queen Hilton Guestroom	USD	172.09	2020-07-05	0	0	2020-07-04 10:00:41.815486	2020-07-04 10:00:41.815486	\N	\N	\N
2020646	23	1	1 King Bed Evolution Room 	USD	129	2020-07-06	0	0	2020-07-05 10:00:41.295527	2020-07-05 10:00:41.295527	\N	\N	\N
2020647	45	1	Classic Double or Twin	USD	101.19	2020-07-06	0	0	2020-07-05 10:00:41.316283	2020-07-05 10:00:41.316283	\N	\N	\N
2020648	115	1	Double Room	USD	63.18	2020-07-06	0	0	2020-07-05 10:00:41.323627	2020-07-05 10:00:41.323627	\N	\N	\N
2020649	162	1	Standard Double Room	USD	216.18	2020-07-06	0	0	2020-07-05 10:00:41.331342	2020-07-05 10:00:41.331342	\N	\N	\N
2020650	75	1	Small Single Room - Non-Smoking (2 Adult)	USD	74.57	2020-07-06	0	0	2020-07-05 10:00:41.346662	2020-07-05 10:00:41.346662	\N	\N	\N
2020651	158	1	Superior Twin Non-Smoking	USD	99.06	2020-07-06	0	0	2020-07-05 10:00:41.35376	2020-07-05 10:00:41.35376	\N	\N	\N
2020652	153	1	Standard Twin Room	USD	156.33	2020-07-06	0	0	2020-07-05 10:00:41.359768	2020-07-05 10:00:41.359768	\N	\N	\N
2020653	201	1	Classic Double Room	USD	104.01	2020-07-06	0	0	2020-07-05 10:00:41.365357	2020-07-05 10:00:41.365357	\N	\N	\N
2020654	131	1	Superior Double Room	USD	51.07	2020-07-06	0	0	2020-07-05 10:00:41.372102	2020-07-05 10:00:41.372102	\N	\N	\N
2020655	184	1	Superior Room	USD	74.52	2020-07-06	441.61	0	2020-07-05 10:00:41.37817	2020-07-05 10:00:41.37817	\N	\N	\N
2020656	176	1	Economy Twin Room	USD	116.53	2020-07-06	0	0	2020-07-05 10:00:41.384755	2020-07-05 10:00:41.384755	\N	\N	\N
2020657	113	1	2 Queen Beds 	USD	152.15	2020-07-06	0	0	2020-07-05 10:00:41.391248	2020-07-05 10:00:41.391248	\N	\N	\N
2020658	53	1	Superior Twin	USD	130.09	2020-07-06	0	0	2020-07-05 10:00:41.398355	2020-07-05 10:00:41.398355	\N	\N	\N
2020659	143	1	Standard Double Room	USD	139.48	2020-07-06	0	0	2020-07-05 10:00:41.404782	2020-07-05 10:00:41.404782	\N	\N	\N
2020660	108	1	Standard Double Room	USD	66.71	2020-07-06	0	0	2020-07-05 10:00:41.410615	2020-07-05 10:00:41.410615	\N	\N	\N
2020661	13	1	Premium Twin Room with Two Double Beds	USD	127.31	2020-07-06	0	0	2020-07-05 10:00:41.419025	2020-07-05 10:00:41.419025	\N	\N	\N
2020662	8	1	Double Room	USD	160.31	2020-07-06	0	0	2020-07-05 10:00:41.424782	2020-07-05 10:00:41.424782	\N	\N	\N
2020663	64	1	Comfort Room	USD	50.39	2020-07-06	179.9	0	2020-07-05 10:00:41.434386	2020-07-05 10:00:41.434386	\N	\N	\N
2020664	125	1	Standard Double or Twin Room	USD	35	2020-07-06	0	0	2020-07-05 10:00:41.440593	2020-07-05 10:00:41.440593	\N	\N	\N
2020665	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-06	0	0	2020-07-05 10:00:41.446268	2020-07-05 10:00:41.446268	\N	\N	\N
2020666	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-06	0	0	2020-07-05 10:00:41.465266	2020-07-05 10:00:41.465266	\N	\N	\N
2020667	194	1	Standard Small Double Room - Non-Smoking	USD	163.75	2020-07-06	0	0	2020-07-05 10:00:41.47275	2020-07-05 10:00:41.47275	\N	\N	\N
2020668	95	1	 Twin Guestroom	USD	156.09	2020-07-06	0	0	2020-07-05 10:00:41.479023	2020-07-05 10:00:41.479023	\N	\N	\N
2020669	157	1	Cosy Small Room	USD	99.37	2020-07-06	0	0	2020-07-05 10:00:41.485211	2020-07-05 10:00:41.485211	\N	\N	\N
2020670	26	1	Double	USD	90.16	2020-07-06	0	0	2020-07-05 10:00:41.49082	2020-07-05 10:00:41.49082	\N	\N	\N
2020671	164	1	Standard Twin Room	USD	187.83	2020-07-06	0	0	2020-07-05 10:00:41.496457	2020-07-05 10:00:41.496457	\N	\N	\N
2020672	61	1	Modern Double Room	USD	193.88	2020-07-06	0	0	2020-07-05 10:00:41.502149	2020-07-05 10:00:41.502149	\N	\N	\N
2020673	109	1	Classic Double Room	USD	168.35	2020-07-06	0	0	2020-07-05 10:00:41.507782	2020-07-05 10:00:41.507782	\N	\N	\N
2020674	181	1	Superior Double Room	USD	61.94	2020-07-06	0	0	2020-07-05 10:00:41.51365	2020-07-05 10:00:41.51365	\N	\N	\N
2020675	168	1	Privilege Double or Twin	USD	101.29	2020-07-06	191.14	0	2020-07-05 10:00:41.519227	2020-07-05 10:00:41.519227	\N	\N	\N
2020676	49	1	Superior Twin Room	USD	116.72	2020-07-06	0	0	2020-07-05 10:00:41.525487	2020-07-05 10:00:41.525487	\N	\N	\N
2020677	136	1	Standard Double or Twin Room	USD	126	2020-07-06	0	0	2020-07-05 10:00:41.532701	2020-07-05 10:00:41.532701	\N	\N	\N
2020678	98	1	Double or Twin	USD	76.66	2020-07-06	0	0	2020-07-05 10:00:41.538454	2020-07-05 10:00:41.538454	\N	\N	\N
2020679	159	1	Standard Room with 1 double bed and sofa	USD	84.59	2020-07-06	0	0	2020-07-05 10:00:41.545139	2020-07-05 10:00:41.545139	\N	\N	\N
2020680	90	1	Standard Room	USD	89.49	2020-07-06	357.95	0	2020-07-05 10:00:41.567578	2020-07-05 10:00:41.567578	\N	\N	\N
2020681	106	1	Double Room with Two Single Beds	USD	27.69	2020-07-06	0	0	2020-07-05 10:00:41.573463	2020-07-05 10:00:41.573463	\N	\N	\N
2020682	27	1	Standard Twin Room - Smoking	USD	166.04	2020-07-06	540.26	0	2020-07-05 10:00:41.579377	2020-07-05 10:00:41.579377	\N	\N	\N
2020683	77	1	Double Room - North Side	USD	146.94	2020-07-06	0	0	2020-07-05 10:00:41.585122	2020-07-05 10:00:41.585122	\N	\N	\N
2020684	31	1	Classic Double or Twin Room with Hill View	USD	385.35	2020-07-06	0	0	2020-07-05 10:00:41.592174	2020-07-05 10:00:41.592174	\N	\N	\N
2020685	18	1	Superior Room	USD	108.87	2020-07-06	0	0	2020-07-05 10:00:41.597748	2020-07-05 10:00:41.597748	\N	\N	\N
2020686	202	1	2 Queen Beds, Pool Area	USD	84.79	2020-07-06	221.22	0	2020-07-05 10:00:41.603588	2020-07-05 10:00:41.603588	\N	\N	\N
2020687	139	1	Small Double	USD	116.52	2020-07-06	466.11	0	2020-07-05 10:00:41.609233	2020-07-05 10:00:41.609233	\N	\N	\N
2020688	14	1	Classic Double Bed	USD	142.58	2020-07-06	0	0	2020-07-05 10:00:41.616207	2020-07-05 10:00:41.616207	\N	\N	\N
2020689	79	1	Standard Room	USD	80.31	2020-07-06	0	0	2020-07-05 10:00:41.622119	2020-07-05 10:00:41.622119	\N	\N	\N
2020690	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.42	2020-07-06	0	0	2020-07-05 10:00:41.627965	2020-07-05 10:00:41.627965	\N	\N	\N
2020691	67	1	Trendy Garden View Room	USD	213.59	2020-07-06	0	0	2020-07-05 10:00:41.633857	2020-07-05 10:00:41.633857	\N	\N	\N
2020692	160	1	King Accessible with Roll In Shower	USD	139	2020-07-06	0	0	2020-07-05 10:00:41.63955	2020-07-05 10:00:41.63955	\N	\N	\N
2020693	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	159	2020-07-06	0	0	2020-07-05 10:00:41.665723	2020-07-05 10:00:41.665723	\N	\N	\N
2020694	54	1	Double Room	USD	153.07	2020-07-06	767.37	0	2020-07-05 10:00:41.671908	2020-07-05 10:00:41.671908	\N	\N	\N
2020695	47	1	Standard room half board	USD	188.43	2020-07-06	500	0	2020-07-05 10:00:41.678274	2020-07-05 10:00:41.678274	\N	\N	\N
2020696	35	1	Twin - Non-Smoking	USD	97.67	2020-07-06	0	0	2020-07-05 10:00:41.684404	2020-07-05 10:00:41.684404	\N	\N	\N
2020697	38	1	Superior Double or Twin Room	USD	192.3	2020-07-06	0	0	2020-07-05 10:00:41.691156	2020-07-05 10:00:41.691156	\N	\N	\N
2020698	192	1	Comfort Room	USD	89.95	2020-07-06	224.87	0	2020-07-05 10:00:41.697029	2020-07-05 10:00:41.697029	\N	\N	\N
2020699	165	1	Basic Room	USD	90.97	2020-07-06	0	0	2020-07-05 10:00:41.70334	2020-07-05 10:00:41.70334	\N	\N	\N
2020700	200	1	Double Standard	USD	142.07	2020-07-06	313.69	0	2020-07-05 10:00:41.708936	2020-07-05 10:00:41.708936	\N	\N	\N
2020701	215	1	Deluxe - 3 persons	USD	33.58	2020-07-06	134.31	25	2020-07-05 10:00:42.159181	2020-07-05 10:00:42.159181	\N	\N	\N
2020703	261	1	Superior Twin or Double Room	USD	62.2	2020-07-06	0	0	2020-07-05 10:00:42.177188	2020-07-05 10:00:42.177188	\N	\N	\N
2020704	224	1	Standard King	USD	72.41	2020-07-06	283.76	0	2020-07-05 10:00:42.183057	2020-07-05 10:00:42.183057	\N	\N	\N
2020705	300	1	Deluxe Room, Guestroom, 1 King	USD	138.13	2020-07-06	0	0	2020-07-05 10:00:42.190212	2020-07-05 10:00:42.190212	\N	\N	\N
2020706	301	1	Comfort Double or Twin Room	USD	136.97	2020-07-06	0	0	2020-07-05 10:00:42.196802	2020-07-05 10:00:42.196802	\N	\N	\N
2020707	293	1	Budget Double Room	USD	73.88	2020-07-06	0	0	2020-07-05 10:00:42.202453	2020-07-05 10:00:42.202453	\N	\N	\N
2020708	243	1	Twin Room	USD	71.24	2020-07-06	0	0	2020-07-05 10:00:42.208146	2020-07-05 10:00:42.208146	\N	\N	\N
2020709	256	1	Standard Double Room	USD	107.08	2020-07-06	0	0	2020-07-05 10:00:42.214909	2020-07-05 10:00:42.214909	\N	\N	\N
2020710	285	1	Superior Room king bed	USD	93.14	2020-07-06	0	0	2020-07-05 10:00:42.222352	2020-07-05 10:00:42.222352	\N	\N	\N
2020713	314	1	1 Double Bed Non-Smoking	USD	145.32	2020-07-06	0	0	2020-07-05 10:00:42.241734	2020-07-05 10:00:42.241734	\N	\N	\N
2020714	274	1	Double Room - Non-Smoking	USD	179.89	2020-07-06	0	0	2020-07-05 10:00:42.249275	2020-07-05 10:00:42.249275	\N	\N	\N
2020715	306	1	Deluxe King City View	USD	114.67	2020-07-06	301.7	0	2020-07-05 10:00:42.258351	2020-07-05 10:00:42.258351	\N	\N	\N
2020716	290	1	Standard	USD	95.3	2020-07-06	0	0	2020-07-05 10:00:42.271845	2020-07-05 10:00:42.271845	\N	\N	\N
2020720	258	1	Standard Double Room	USD	24.36	2020-07-06	0	0	2020-07-05 10:00:42.298293	2020-07-05 10:00:42.298293	\N	\N	\N
2020721	216	1	2 Double Accessible with Bathtub	USD	129	2020-07-06	0	0	2020-07-05 10:00:42.304007	2020-07-05 10:00:42.304007	\N	\N	\N
2020724	204	1	King Bed	USD	154.12	2020-07-06	0	0	2020-07-05 10:00:42.32302	2020-07-05 10:00:42.32302	\N	\N	\N
2020726	295	1	Classic Double or Twin	USD	164.67	2020-07-06	460.98	0	2020-07-05 10:00:42.336622	2020-07-05 10:00:42.336622	\N	\N	\N
2020729	307	1	1 King Bed	USD	379.52	2020-07-06	0	0	2020-07-05 10:00:42.367148	2020-07-05 10:00:42.367148	\N	\N	\N
2020730	251	1	Standard Room with 2 Single Beds	USD	89.18	2020-07-06	0	0	2020-07-05 10:00:42.376588	2020-07-05 10:00:42.376588	\N	\N	\N
2020732	302	1	2 Queen Beds 	USD	79	2020-07-06	0	0	2020-07-05 10:00:42.389075	2020-07-05 10:00:42.389075	\N	\N	\N
2020737	249	1	Standard 1 Double 1 Single Bed	USD	111.41	2020-07-06	0	0	2020-07-05 10:00:42.424928	2020-07-05 10:00:42.424928	\N	\N	\N
2020739	206	1	Standard	USD	71.7	2020-07-06	0	0	2020-07-05 10:00:42.446563	2020-07-05 10:00:42.446563	\N	\N	\N
2020740	263	1	Queen Hilton Guestroom	USD	172.09	2020-07-06	0	0	2020-07-05 10:00:42.465207	2020-07-05 10:00:42.465207	\N	\N	\N
2083104	23	1	1 King Bed Evolution Room 	USD	129	2020-07-07	0	0	2020-07-06 10:00:40.068758	2020-07-06 10:00:40.068758	\N	\N	\N
2083105	45	1	Classic Double or Twin	USD	101.19	2020-07-07	0	0	2020-07-06 10:00:40.091762	2020-07-06 10:00:40.091762	\N	\N	\N
2083106	115	1	Double Room	USD	63.18	2020-07-07	0	0	2020-07-06 10:00:40.108559	2020-07-06 10:00:40.108559	\N	\N	\N
2083107	162	1	Standard Double Room	USD	216.18	2020-07-07	0	0	2020-07-06 10:00:40.116255	2020-07-06 10:00:40.116255	\N	\N	\N
2083108	75	1	Low Floor Small Single Room - Smoking	USD	71.85	2020-07-07	211.83	0	2020-07-06 10:00:40.122528	2020-07-06 10:00:40.122528	\N	\N	\N
2083109	158	1	Superior Twin Non-Smoking	USD	99.06	2020-07-07	0	0	2020-07-06 10:00:40.129734	2020-07-06 10:00:40.129734	\N	\N	\N
2083110	201	1	Classic Double Room	USD	103.9	2020-07-07	0	0	2020-07-06 10:00:40.135478	2020-07-06 10:00:40.135478	\N	\N	\N
2083111	131	1	Superior Double Room	USD	51.07	2020-07-07	0	0	2020-07-06 10:00:40.151663	2020-07-06 10:00:40.151663	\N	\N	\N
2083112	184	1	Superior Room	USD	70.15	2020-07-07	386.11	0	2020-07-06 10:00:40.157648	2020-07-06 10:00:40.157648	\N	\N	\N
2083113	176	1	Economy Twin Room	USD	116.53	2020-07-07	0	0	2020-07-06 10:00:40.164109	2020-07-06 10:00:40.164109	\N	\N	\N
2083114	113	1	2 Queen Beds 	USD	152.15	2020-07-07	0	0	2020-07-06 10:00:40.170079	2020-07-06 10:00:40.170079	\N	\N	\N
2083115	53	1	Superior Twin	USD	141.45	2020-07-07	0	0	2020-07-06 10:00:40.175819	2020-07-06 10:00:40.175819	\N	\N	\N
2083116	143	1	Standard Double Room	USD	139.48	2020-07-07	0	0	2020-07-06 10:00:40.181888	2020-07-06 10:00:40.181888	\N	\N	\N
2083117	108	1	Standard Double Room	USD	66.71	2020-07-07	0	0	2020-07-06 10:00:40.187872	2020-07-06 10:00:40.187872	\N	\N	\N
2083118	13	1	Premium Twin Room with Two Double Beds	USD	127.31	2020-07-07	0	0	2020-07-06 10:00:40.196585	2020-07-06 10:00:40.196585	\N	\N	\N
2083119	8	1	Double Room	USD	160.31	2020-07-07	0	0	2020-07-06 10:00:40.202925	2020-07-06 10:00:40.202925	\N	\N	\N
2083120	64	1	Comfort Room	USD	50.39	2020-07-07	179.9	0	2020-07-06 10:00:40.209347	2020-07-06 10:00:40.209347	\N	\N	\N
2083121	125	1	Standard Double or Twin Room	USD	35	2020-07-07	0	0	2020-07-06 10:00:40.216713	2020-07-06 10:00:40.216713	\N	\N	\N
2083122	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-07	0	0	2020-07-06 10:00:40.222827	2020-07-06 10:00:40.222827	\N	\N	\N
2083123	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-07	0	0	2020-07-06 10:00:40.229418	2020-07-06 10:00:40.229418	\N	\N	\N
2083124	194	1	Comfort Small Double Room - Non-Smoking	USD	190.65	2020-07-07	0	0	2020-07-06 10:00:40.237404	2020-07-06 10:00:40.237404	\N	\N	\N
2083125	95	1	 Twin Guestroom	USD	147.12	2020-07-07	0	0	2020-07-06 10:00:40.243998	2020-07-06 10:00:40.243998	\N	\N	\N
2083126	157	1	Cosy Small Room	USD	99.37	2020-07-07	0	0	2020-07-06 10:00:40.251365	2020-07-06 10:00:40.251365	\N	\N	\N
2083127	26	1	Double	USD	90.16	2020-07-07	0	0	2020-07-06 10:00:40.265498	2020-07-06 10:00:40.265498	\N	\N	\N
2083128	164	1	Standard Twin Room	USD	218.65	2020-07-07	0	0	2020-07-06 10:00:40.271614	2020-07-06 10:00:40.271614	\N	\N	\N
2083129	61	1	Modern Double Room	USD	193.88	2020-07-07	0	0	2020-07-06 10:00:40.277319	2020-07-06 10:00:40.277319	\N	\N	\N
2083130	109	1	Classic Double Room	USD	168.35	2020-07-07	0	0	2020-07-06 10:00:40.283816	2020-07-06 10:00:40.283816	\N	\N	\N
2083131	181	1	Superior Double Room	USD	61.94	2020-07-07	0	0	2020-07-06 10:00:40.2895	2020-07-06 10:00:40.2895	\N	\N	\N
2083132	168	1	Privilege Double or Twin	USD	101.29	2020-07-07	191.14	0	2020-07-06 10:00:40.29564	2020-07-06 10:00:40.29564	\N	\N	\N
2083133	49	1	Superior Twin Room	USD	116.72	2020-07-07	0	0	2020-07-06 10:00:40.302591	2020-07-06 10:00:40.302591	\N	\N	\N
2083134	136	1	Standard Double or Twin Room	USD	126	2020-07-07	0	0	2020-07-06 10:00:40.309379	2020-07-06 10:00:40.309379	\N	\N	\N
2083135	98	1	Double or Twin	USD	76.66	2020-07-07	0	0	2020-07-06 10:00:40.315427	2020-07-06 10:00:40.315427	\N	\N	\N
2083136	159	1	Standard Room with 1 double bed and sofa	USD	84.59	2020-07-07	0	0	2020-07-06 10:00:40.32329	2020-07-06 10:00:40.32329	\N	\N	\N
2083137	3	1	Deluxe 	USD	162.46	2020-07-07	337.35	0	2020-07-06 10:00:40.329059	2020-07-06 10:00:40.329059	\N	\N	\N
2083138	90	1	Standard Room	USD	89.49	2020-07-07	357.95	0	2020-07-06 10:00:40.334851	2020-07-06 10:00:40.334851	\N	\N	\N
2083139	106	1	Double Room with Two Single Beds	USD	41.09	2020-07-07	0	0	2020-07-06 10:00:40.340764	2020-07-06 10:00:40.340764	\N	\N	\N
2083140	4	1	Twin Room	USD	118.88	2020-07-07	0	0	2020-07-06 10:00:40.346475	2020-07-06 10:00:40.346475	\N	\N	\N
2083141	27	1	Standard Twin Room - Smoking	USD	166.04	2020-07-07	540.26	0	2020-07-06 10:00:40.365805	2020-07-06 10:00:40.365805	\N	\N	\N
2083142	77	1	Double Room - North Side	USD	146.94	2020-07-07	0	0	2020-07-06 10:00:40.371771	2020-07-06 10:00:40.371771	\N	\N	\N
2083143	31	1	Classic Double or Twin Room with Hill View	USD	385.35	2020-07-07	0	0	2020-07-06 10:00:40.377495	2020-07-06 10:00:40.377495	\N	\N	\N
2083144	18	1	Superior Room	USD	108.87	2020-07-07	0	0	2020-07-06 10:00:40.383477	2020-07-06 10:00:40.383477	\N	\N	\N
2083145	202	1	2 Queen Beds, Pool Area	USD	84.79	2020-07-07	221.22	0	2020-07-06 10:00:40.389268	2020-07-06 10:00:40.389268	\N	\N	\N
2083146	139	1	Small Double	USD	120.61	2020-07-07	482.45	0	2020-07-06 10:00:40.39529	2020-07-06 10:00:40.39529	\N	\N	\N
2083147	14	1	Classic Double Bed	USD	142.58	2020-07-07	0	0	2020-07-06 10:00:40.402171	2020-07-06 10:00:40.402171	\N	\N	\N
2083148	79	1	Standard Room	USD	80.31	2020-07-07	0	0	2020-07-06 10:00:40.408144	2020-07-06 10:00:40.408144	\N	\N	\N
2083149	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.42	2020-07-07	0	0	2020-07-06 10:00:40.414283	2020-07-06 10:00:40.414283	\N	\N	\N
2083150	67	1	Trendy Garden View Room	USD	213.59	2020-07-07	0	0	2020-07-06 10:00:40.420649	2020-07-06 10:00:40.420649	\N	\N	\N
2083151	160	1	King Accessible with Roll In Shower	USD	139	2020-07-07	0	0	2020-07-06 10:00:40.426905	2020-07-06 10:00:40.426905	\N	\N	\N
2083152	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	169	2020-07-07	0	0	2020-07-06 10:00:40.43303	2020-07-06 10:00:40.43303	\N	\N	\N
2083153	54	1	Double Room	USD	164.3	2020-07-07	812.28	0	2020-07-06 10:00:40.439006	2020-07-06 10:00:40.439006	\N	\N	\N
2083154	47	1	Garden Facing Room	USD	97.93	2020-07-07	0	0	2020-07-06 10:00:40.445537	2020-07-06 10:00:40.445537	\N	\N	\N
2083155	35	1	Twin - Non-Smoking	USD	97.67	2020-07-07	0	0	2020-07-06 10:00:40.469843	2020-07-06 10:00:40.469843	\N	\N	\N
2083156	38	1	Superior Double or Twin Room	USD	192.3	2020-07-07	0	0	2020-07-06 10:00:40.47786	2020-07-06 10:00:40.47786	\N	\N	\N
2083157	192	1	Comfort Room	USD	89.95	2020-07-07	224.87	0	2020-07-06 10:00:40.484256	2020-07-06 10:00:40.484256	\N	\N	\N
2083158	165	1	Basic Room	USD	90.97	2020-07-07	0	0	2020-07-06 10:00:40.491019	2020-07-06 10:00:40.491019	\N	\N	\N
2083159	215	1	Deluxe - 3 persons	USD	33.58	2020-07-07	134.31	25	2020-07-06 10:00:41.302891	2020-07-06 10:00:41.302891	\N	\N	\N
2083161	261	1	Superior Twin or Double Room	USD	62.2	2020-07-07	0	0	2020-07-06 10:00:41.319349	2020-07-06 10:00:41.319349	\N	\N	\N
2083162	224	1	Standard King	USD	67.59	2020-07-07	283.76	0	2020-07-06 10:00:41.325367	2020-07-06 10:00:41.325367	\N	\N	\N
2083163	300	1	Deluxe Room, Guestroom, 1 King	USD	138.13	2020-07-07	0	0	2020-07-06 10:00:41.332167	2020-07-06 10:00:41.332167	\N	\N	\N
2083164	301	1	Comfort Double or Twin Room	USD	131.85	2020-07-07	0	0	2020-07-06 10:00:41.338476	2020-07-06 10:00:41.338476	\N	\N	\N
2083165	293	1	Budget Double Room	USD	73.88	2020-07-07	0	0	2020-07-06 10:00:41.344364	2020-07-06 10:00:41.344364	\N	\N	\N
2083166	243	1	Twin Room	USD	71.24	2020-07-07	0	0	2020-07-06 10:00:41.350565	2020-07-06 10:00:41.350565	\N	\N	\N
2083167	256	1	Standard Double Room	USD	107.08	2020-07-07	0	0	2020-07-06 10:00:41.35709	2020-07-06 10:00:41.35709	\N	\N	\N
2083168	285	1	Superior Room king bed	USD	95.97	2020-07-07	0	0	2020-07-06 10:00:41.365134	2020-07-06 10:00:41.365134	\N	\N	\N
2083171	314	1	1 Double Bed Non-Smoking	USD	145.32	2020-07-07	0	0	2020-07-06 10:00:41.384654	2020-07-06 10:00:41.384654	\N	\N	\N
2083172	274	1	Small Double Room Non-Smoking	USD	153.75	2020-07-07	225.62	0	2020-07-06 10:00:41.39222	2020-07-06 10:00:41.39222	\N	\N	\N
2083173	306	1	Deluxe King City View	USD	114.67	2020-07-07	301.7	0	2020-07-06 10:00:41.399269	2020-07-06 10:00:41.399269	\N	\N	\N
2083174	290	1	Standard	USD	95.3	2020-07-07	0	0	2020-07-06 10:00:41.40501	2020-07-06 10:00:41.40501	\N	\N	\N
2083178	258	1	Standard Double Room	USD	24.36	2020-07-07	0	0	2020-07-06 10:00:41.431482	2020-07-06 10:00:41.431482	\N	\N	\N
2083179	216	1	2 Double Accessible with Bathtub	USD	139	2020-07-07	0	0	2020-07-06 10:00:41.437357	2020-07-06 10:00:41.437357	\N	\N	\N
2083182	275	1	Double or Twin Room	USD	87.9	2020-07-07	0	0	2020-07-06 10:00:41.469478	2020-07-06 10:00:41.469478	\N	\N	\N
2083183	204	1	King Bed	USD	154.12	2020-07-07	0	0	2020-07-06 10:00:41.475525	2020-07-06 10:00:41.475525	\N	\N	\N
2083185	295	1	Classic Double or Twin	USD	164.67	2020-07-07	460.98	0	2020-07-06 10:00:41.487722	2020-07-06 10:00:41.487722	\N	\N	\N
2083188	268	1	Double Room	USD	103.9	2020-07-07	0	0	2020-07-06 10:00:41.507667	2020-07-06 10:00:41.507667	\N	\N	\N
2083189	307	1	1 King Bed	USD	379.52	2020-07-07	0	0	2020-07-06 10:00:41.513772	2020-07-06 10:00:41.513772	\N	\N	\N
2083190	251	1	Standard Room with 2 Single Beds	USD	89.18	2020-07-07	0	0	2020-07-06 10:00:41.520283	2020-07-06 10:00:41.520283	\N	\N	\N
2083192	302	1	Accessible 1 King Bed	USD	84	2020-07-07	300	0	2020-07-06 10:00:41.532668	2020-07-06 10:00:41.532668	\N	\N	\N
2083197	249	1	Standard 1 Double 1 Single Bed	USD	111.41	2020-07-07	0	0	2020-07-06 10:00:41.595102	2020-07-06 10:00:41.595102	\N	\N	\N
2083199	206	1	Standard	USD	71.7	2020-07-07	0	0	2020-07-06 10:00:41.606538	2020-07-06 10:00:41.606538	\N	\N	\N
2083200	263	1	Queen Hilton Guestroom	USD	153.49	2020-07-07	0	0	2020-07-06 10:00:41.612004	2020-07-06 10:00:41.612004	\N	\N	\N
2145138	23	1	1 King Bed Evolution Room 	USD	129	2020-07-08	0	0	2020-07-07 10:00:43.832948	2020-07-07 10:00:43.832948	\N	\N	\N
2145139	45	1	Classic Double or Twin	USD	101.76	2020-07-08	0	0	2020-07-07 10:00:43.851681	2020-07-07 10:00:43.851681	\N	\N	\N
2145140	115	1	Double Room	USD	63.53	2020-07-08	0	0	2020-07-07 10:00:43.868395	2020-07-07 10:00:43.868395	\N	\N	\N
2145141	162	1	Flexible Room	USD	173.72	2020-07-08	0	0	2020-07-07 10:00:43.880667	2020-07-07 10:00:43.880667	\N	\N	\N
2145142	75	1	Low Floor Small Single Room - Smoking	USD	72.64	2020-07-08	211.96	0	2020-07-07 10:00:43.888319	2020-07-07 10:00:43.888319	\N	\N	\N
2145143	158	1	Superior Twin Non-Smoking	USD	99.72	2020-07-08	0	0	2020-07-07 10:00:43.89459	2020-07-07 10:00:43.89459	\N	\N	\N
2145144	153	1	Standard Plus King	USD	193.57	2020-07-08	0	0	2020-07-07 10:00:43.900539	2020-07-07 10:00:43.900539	\N	\N	\N
2145145	201	1	Classic Double Room	USD	104.03	2020-07-08	0	0	2020-07-07 10:00:43.907386	2020-07-07 10:00:43.907386	\N	\N	\N
2145146	131	1	Superior Double Room	USD	51.61	2020-07-08	0	0	2020-07-07 10:00:43.91456	2020-07-07 10:00:43.91456	\N	\N	\N
2145147	184	1	Superior Room	USD	76.17	2020-07-08	450.61	0	2020-07-07 10:00:43.920641	2020-07-07 10:00:43.920641	\N	\N	\N
2145148	176	1	Economy Twin Room	USD	117.19	2020-07-08	0	0	2020-07-07 10:00:43.927085	2020-07-07 10:00:43.927085	\N	\N	\N
2145149	113	1	2 Queen Beds 	USD	177.65	2020-07-08	0	0	2020-07-07 10:00:43.93294	2020-07-07 10:00:43.93294	\N	\N	\N
2145150	53	1	Superior Twin	USD	141.82	2020-07-08	0	0	2020-07-07 10:00:43.938684	2020-07-07 10:00:43.938684	\N	\N	\N
2145151	143	1	Standard Double Room	USD	140.81	2020-07-08	0	0	2020-07-07 10:00:43.948216	2020-07-07 10:00:43.948216	\N	\N	\N
2145152	108	1	Standard Double Room	USD	67.09	2020-07-08	0	0	2020-07-07 10:00:43.964367	2020-07-07 10:00:43.964367	\N	\N	\N
2145153	13	1	Premium Twin Room with Two Double Beds	USD	127.64	2020-07-08	0	0	2020-07-07 10:00:43.972127	2020-07-07 10:00:43.972127	\N	\N	\N
2145154	8	1	Twin Room	USD	161.83	2020-07-08	0	0	2020-07-07 10:00:43.978331	2020-07-07 10:00:43.978331	\N	\N	\N
2145155	64	1	Basic Double or Twin Room	USD	59.62	2020-07-08	0	0	2020-07-07 10:00:43.984893	2020-07-07 10:00:43.984893	\N	\N	\N
2145156	125	1	Standard Double or Twin Room	USD	27	2020-07-08	0	0	2020-07-07 10:00:43.991999	2020-07-07 10:00:43.991999	\N	\N	\N
2145157	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-08	0	0	2020-07-07 10:00:44.000749	2020-07-07 10:00:44.000749	\N	\N	\N
2145158	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-08	0	0	2020-07-07 10:00:44.007914	2020-07-07 10:00:44.007914	\N	\N	\N
2145159	194	1	Standard Small Double Room - Non-Smoking	USD	175.39	2020-07-08	0	0	2020-07-07 10:00:44.015854	2020-07-07 10:00:44.015854	\N	\N	\N
2145160	95	1	 Twin Guestroom	USD	156.98	2020-07-08	0	0	2020-07-07 10:00:44.022977	2020-07-07 10:00:44.022977	\N	\N	\N
2145161	157	1	Cosy Small Room	USD	99.9	2020-07-08	0	0	2020-07-07 10:00:44.029706	2020-07-07 10:00:44.029706	\N	\N	\N
2145162	26	1	Double	USD	90.67	2020-07-08	0	0	2020-07-07 10:00:44.035673	2020-07-07 10:00:44.035673	\N	\N	\N
2145163	164	1	Standard Twin Room	USD	220.73	2020-07-08	0	0	2020-07-07 10:00:44.041658	2020-07-07 10:00:44.041658	\N	\N	\N
2145164	61	1	Modern Double Room	USD	174.13	2020-07-08	0	0	2020-07-07 10:00:44.048249	2020-07-07 10:00:44.048249	\N	\N	\N
2145165	109	1	Classic Double Room	USD	169.3	2020-07-08	0	0	2020-07-07 10:00:44.054248	2020-07-07 10:00:44.054248	\N	\N	\N
2145166	181	1	Superior Double Room	USD	61.94	2020-07-08	0	0	2020-07-07 10:00:44.069455	2020-07-07 10:00:44.069455	\N	\N	\N
2145167	49	1	Superior Twin Room	USD	117.38	2020-07-08	0	0	2020-07-07 10:00:44.075717	2020-07-07 10:00:44.075717	\N	\N	\N
2145168	136	1	Standard Double or Twin Room	USD	125.29	2020-07-08	0	0	2020-07-07 10:00:44.082727	2020-07-07 10:00:44.082727	\N	\N	\N
2145169	98	1	Double or Twin	USD	77.09	2020-07-08	0	0	2020-07-07 10:00:44.08854	2020-07-07 10:00:44.08854	\N	\N	\N
2145170	159	1	Standard Room with 1 double bed and sofa	USD	85.07	2020-07-08	0	0	2020-07-07 10:00:44.096742	2020-07-07 10:00:44.096742	\N	\N	\N
2145171	3	1	Deluxe 	USD	164.53	2020-07-08	338.02	0	2020-07-07 10:00:44.102927	2020-07-07 10:00:44.102927	\N	\N	\N
2145172	90	1	Standard Room	USD	89.99	2020-07-08	359.97	0	2020-07-07 10:00:44.10957	2020-07-07 10:00:44.10957	\N	\N	\N
2145173	106	1	Double Room with Two Single Beds	USD	27.71	2020-07-08	0	0	2020-07-07 10:00:44.117796	2020-07-07 10:00:44.117796	\N	\N	\N
2145174	4	1	Double Room	USD	119.55	2020-07-08	0	0	2020-07-07 10:00:44.127368	2020-07-07 10:00:44.127368	\N	\N	\N
2145175	27	1	Standard Twin Room - Smoking	USD	166.15	2020-07-08	540.61	0	2020-07-07 10:00:44.133444	2020-07-07 10:00:44.133444	\N	\N	\N
2145176	77	1	Double Room - North Side	USD	147.5	2020-07-08	0	0	2020-07-07 10:00:44.139362	2020-07-07 10:00:44.139362	\N	\N	\N
2145177	31	1	Classic Double or Twin Room with Hill View	USD	387.53	2020-07-08	0	0	2020-07-07 10:00:44.145265	2020-07-07 10:00:44.145265	\N	\N	\N
2145178	18	1	Superior Room	USD	109.29	2020-07-08	0	0	2020-07-07 10:00:44.152	2020-07-07 10:00:44.152	\N	\N	\N
2145179	202	1	2 Queen Beds, Pool Area	USD	84.89	2020-07-08	221.47	0	2020-07-07 10:00:44.169552	2020-07-07 10:00:44.169552	\N	\N	\N
2145180	139	1	Small Double	USD	121.29	2020-07-08	485.18	0	2020-07-07 10:00:44.181112	2020-07-07 10:00:44.181112	\N	\N	\N
2145181	14	1	Classic Double Bed	USD	143.38	2020-07-08	0	0	2020-07-07 10:00:44.189729	2020-07-07 10:00:44.189729	\N	\N	\N
2145182	79	1	Standard Room	USD	80.77	2020-07-08	0	0	2020-07-07 10:00:44.197637	2020-07-07 10:00:44.197637	\N	\N	\N
2145183	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.46	2020-07-08	0	0	2020-07-07 10:00:44.203436	2020-07-07 10:00:44.203436	\N	\N	\N
2145184	67	1	Trendy Garden View Room	USD	213.59	2020-07-08	0	0	2020-07-07 10:00:44.209201	2020-07-07 10:00:44.209201	\N	\N	\N
2145185	160	1	King Accessible with Roll In Shower	USD	139	2020-07-08	0	0	2020-07-07 10:00:44.215127	2020-07-07 10:00:44.215127	\N	\N	\N
2145186	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	169	2020-07-08	0	0	2020-07-07 10:00:44.220913	2020-07-07 10:00:44.220913	\N	\N	\N
2145187	54	1	Double Room	USD	164.92	2020-07-08	815.38	0	2020-07-07 10:00:44.226849	2020-07-07 10:00:44.226849	\N	\N	\N
2145188	47	1	Standard room half board	USD	148.55	2020-07-08	500	0	2020-07-07 10:00:44.233292	2020-07-07 10:00:44.233292	\N	\N	\N
2145189	35	1	Twin - Non-Smoking	USD	97.73	2020-07-08	0	0	2020-07-07 10:00:44.243168	2020-07-07 10:00:44.243168	\N	\N	\N
2145190	38	1	Superior Double or Twin Room	USD	193.39	2020-07-08	0	0	2020-07-07 10:00:44.251077	2020-07-07 10:00:44.251077	\N	\N	\N
2145191	192	1	Comfort Room	USD	90.46	2020-07-08	226.14	0	2020-07-07 10:00:44.256984	2020-07-07 10:00:44.256984	\N	\N	\N
2145192	165	1	Basic Room	USD	91.49	2020-07-08	0	0	2020-07-07 10:00:44.266074	2020-07-07 10:00:44.266074	\N	\N	\N
2145193	215	1	Deluxe - 3 persons	USD	33.58	2020-07-08	134.31	25	2020-07-07 10:00:44.740411	2020-07-07 10:00:44.740411	\N	\N	\N
2145195	261	1	Superior Twin or Double Room	USD	62.2	2020-07-08	0	0	2020-07-07 10:00:44.768155	2020-07-07 10:00:44.768155	\N	\N	\N
2145196	224	1	Standard King	USD	67.59	2020-07-08	283.75	0	2020-07-07 10:00:44.77501	2020-07-07 10:00:44.77501	\N	\N	\N
2145197	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-07-08	0	0	2020-07-07 10:00:44.781659	2020-07-07 10:00:44.781659	\N	\N	\N
2145198	301	1	Comfort Double or Twin Room	USD	137.74	2020-07-08	0	0	2020-07-07 10:00:44.787911	2020-07-07 10:00:44.787911	\N	\N	\N
2145199	293	1	Budget Double Room	USD	74.3	2020-07-08	0	0	2020-07-07 10:00:44.79402	2020-07-07 10:00:44.79402	\N	\N	\N
2145200	243	1	Twin Room	USD	71.64	2020-07-08	0	0	2020-07-07 10:00:44.799985	2020-07-07 10:00:44.799985	\N	\N	\N
2145201	256	1	Standard Double Room	USD	107.69	2020-07-08	0	0	2020-07-07 10:00:44.807465	2020-07-07 10:00:44.807465	\N	\N	\N
2145202	285	1	Superior Room king bed	USD	96.44	2020-07-08	0	0	2020-07-07 10:00:44.819719	2020-07-07 10:00:44.819719	\N	\N	\N
2145205	314	1	1 Double Bed Non-Smoking	USD	146.14	2020-07-08	0	0	2020-07-07 10:00:44.839973	2020-07-07 10:00:44.839973	\N	\N	\N
2145206	274	1	Small Double Room Non-Smoking	USD	153.85	2020-07-08	225.77	0	2020-07-07 10:00:44.849017	2020-07-07 10:00:44.849017	\N	\N	\N
2145207	306	1	Deluxe King City View	USD	108.57	2020-07-08	301.84	30	2020-07-07 10:00:44.856272	2020-07-07 10:00:44.856272	\N	\N	\N
2145208	290	1	Standard	USD	95.84	2020-07-08	0	0	2020-07-07 10:00:44.862163	2020-07-07 10:00:44.862163	\N	\N	\N
2145212	258	1	Standard Double Room	USD	24.34	2020-07-08	0	0	2020-07-07 10:00:44.893993	2020-07-07 10:00:44.893993	\N	\N	\N
2145213	216	1	2 Double Accessible with Bathtub	USD	129	2020-07-08	0	0	2020-07-07 10:00:44.899864	2020-07-07 10:00:44.899864	\N	\N	\N
2145216	275	1	Double or Twin Room	USD	175.77	2020-07-08	0	0	2020-07-07 10:00:44.918658	2020-07-07 10:00:44.918658	\N	\N	\N
2145217	204	1	King Bed	USD	146.95	2020-07-08	0	0	2020-07-07 10:00:44.924597	2020-07-07 10:00:44.924597	\N	\N	\N
2145219	295	1	Classic Double or Twin	USD	158.06	2020-07-08	463.59	0	2020-07-07 10:00:44.939882	2020-07-07 10:00:44.939882	\N	\N	\N
2145222	268	1	Double Room	USD	124.84	2020-07-08	0	0	2020-07-07 10:00:44.965229	2020-07-07 10:00:44.965229	\N	\N	\N
2145223	307	1	1 King Bed	USD	379.77	2020-07-08	0	0	2020-07-07 10:00:44.97185	2020-07-07 10:00:44.97185	\N	\N	\N
2145224	251	1	Standard Queen Room	USD	93.77	2020-07-08	0	0	2020-07-07 10:00:44.978624	2020-07-07 10:00:44.978624	\N	\N	\N
2145226	302	1	Accessible 1 King Bed	USD	77.61	2020-07-08	300	0	2020-07-07 10:00:44.991409	2020-07-07 10:00:44.991409	\N	\N	\N
2145231	249	1	Standard 1 Double 1 Single Bed	USD	142.88	2020-07-08	0	0	2020-07-07 10:00:45.170312	2020-07-07 10:00:45.170312	\N	\N	\N
2145233	206	1	Standard	USD	71.79	2020-07-08	0	0	2020-07-07 10:00:45.185954	2020-07-07 10:00:45.185954	\N	\N	\N
2145234	263	1	Queen Hilton Guestroom	USD	130.31	2020-07-08	0	0	2020-07-07 10:00:45.191612	2020-07-07 10:00:45.191612	\N	\N	\N
2207104	23	1	1 King Bed Evolution Room 	USD	129	2020-07-09	0	0	2020-07-08 10:00:37.509345	2020-07-08 10:00:37.509345	\N	\N	\N
2207105	45	1	Classic Double or Twin	USD	101.6	2020-07-09	0	0	2020-07-08 10:00:37.529071	2020-07-08 10:00:37.529071	\N	\N	\N
2207106	115	1	Double Room	USD	63.43	2020-07-09	0	0	2020-07-08 10:00:37.53726	2020-07-08 10:00:37.53726	\N	\N	\N
2207107	162	1	Flexible Room	USD	173.45	2020-07-09	0	0	2020-07-08 10:00:37.545416	2020-07-08 10:00:37.545416	\N	\N	\N
2207108	75	1	Low Floor Small Single Room - Smoking	USD	71.84	2020-07-09	211.78	0	2020-07-08 10:00:37.56509	2020-07-08 10:00:37.56509	\N	\N	\N
2207109	158	1	Superior Twin Non-Smoking	USD	99.8	2020-07-09	0	0	2020-07-08 10:00:37.572127	2020-07-08 10:00:37.572127	\N	\N	\N
2207110	153	1	Standard Twin Room	USD	169.07	2020-07-09	0	0	2020-07-08 10:00:37.578141	2020-07-08 10:00:37.578141	\N	\N	\N
2207111	201	1	Classic Double Room	USD	104.67	2020-07-09	0	0	2020-07-08 10:00:37.584403	2020-07-08 10:00:37.584403	\N	\N	\N
2207112	131	1	Superior Double Room	USD	51.67	2020-07-09	0	0	2020-07-08 10:00:37.591861	2020-07-08 10:00:37.591861	\N	\N	\N
2207113	184	1	Superior Room	USD	75.64	2020-07-09	441.61	0	2020-07-08 10:00:37.598	2020-07-08 10:00:37.598	\N	\N	\N
2207114	176	1	Economy Twin Room	USD	117	2020-07-09	0	0	2020-07-08 10:00:37.605985	2020-07-08 10:00:37.605985	\N	\N	\N
2207115	113	1	2 Queen Beds 	USD	177.65	2020-07-09	0	0	2020-07-08 10:00:37.612102	2020-07-08 10:00:37.612102	\N	\N	\N
2207116	53	1	Superior Twin	USD	142.04	2020-07-09	0	0	2020-07-08 10:00:37.619324	2020-07-08 10:00:37.619324	\N	\N	\N
2207117	143	1	Standard Double Room	USD	139.88	2020-07-09	0	0	2020-07-08 10:00:37.625769	2020-07-08 10:00:37.625769	\N	\N	\N
2207118	108	1	Standard Double Room	USD	66.98	2020-07-09	0	0	2020-07-08 10:00:37.633589	2020-07-08 10:00:37.633589	\N	\N	\N
2207119	13	1	Premium Twin Room with Two Double Beds	USD	127.83	2020-07-09	0	0	2020-07-08 10:00:37.640823	2020-07-08 10:00:37.640823	\N	\N	\N
2207120	8	1	Twin Room	USD	160.77	2020-07-09	0	0	2020-07-08 10:00:37.646661	2020-07-08 10:00:37.646661	\N	\N	\N
2207121	125	1	Standard Double or Twin Room	USD	27	2020-07-09	0	0	2020-07-08 10:00:37.655438	2020-07-08 10:00:37.655438	\N	\N	\N
2207122	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-09	0	0	2020-07-08 10:00:37.667974	2020-07-08 10:00:37.667974	\N	\N	\N
2207123	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-09	0	0	2020-07-08 10:00:37.674056	2020-07-08 10:00:37.674056	\N	\N	\N
2207124	194	1	Standard Small Double Room - Non-Smoking	USD	175.24	2020-07-09	0	0	2020-07-08 10:00:37.683235	2020-07-08 10:00:37.683235	\N	\N	\N
2207125	95	1	 Twin Guestroom	USD	150.08	2020-07-09	0	0	2020-07-08 10:00:37.689422	2020-07-08 10:00:37.689422	\N	\N	\N
2207126	157	1	Cosy Small Room	USD	100.07	2020-07-09	0	0	2020-07-08 10:00:37.695533	2020-07-08 10:00:37.695533	\N	\N	\N
2207127	26	1	Double	USD	90.53	2020-07-09	0	0	2020-07-08 10:00:37.701065	2020-07-08 10:00:37.701065	\N	\N	\N
2207128	164	1	Standard Twin Room	USD	219.28	2020-07-09	0	0	2020-07-08 10:00:37.707171	2020-07-08 10:00:37.707171	\N	\N	\N
2207129	61	1	Modern Double Room	USD	174.08	2020-07-09	0	0	2020-07-08 10:00:37.714297	2020-07-08 10:00:37.714297	\N	\N	\N
2207130	109	1	Classic Double Room	USD	169.03	2020-07-09	0	0	2020-07-08 10:00:37.720923	2020-07-08 10:00:37.720923	\N	\N	\N
2207131	181	1	Superior Double Room	USD	61.94	2020-07-09	0	0	2020-07-08 10:00:37.727234	2020-07-08 10:00:37.727234	\N	\N	\N
2207132	168	1	Standard Room	USD	86.2	2020-07-09	0	0	2020-07-08 10:00:37.73394	2020-07-08 10:00:37.73394	\N	\N	\N
2207133	49	1	Superior Twin Room	USD	117.19	2020-07-09	0	0	2020-07-08 10:00:37.740607	2020-07-08 10:00:37.740607	\N	\N	\N
2207134	136	1	Standard Double or Twin Room	USD	119.38	2020-07-09	0	0	2020-07-08 10:00:37.74913	2020-07-08 10:00:37.74913	\N	\N	\N
2207135	98	1	Double or Twin	USD	76.97	2020-07-09	0	0	2020-07-08 10:00:37.765297	2020-07-08 10:00:37.765297	\N	\N	\N
2207136	159	1	Standard Room with 1 double bed and sofa	USD	84.94	2020-07-09	0	0	2020-07-08 10:00:37.773368	2020-07-08 10:00:37.773368	\N	\N	\N
2207137	3	1	Deluxe 	USD	162.08	2020-07-09	336.57	0	2020-07-08 10:00:37.780523	2020-07-08 10:00:37.780523	\N	\N	\N
2207138	90	1	Standard Room	USD	94.13	2020-07-09	376.52	0	2020-07-08 10:00:37.787655	2020-07-08 10:00:37.787655	\N	\N	\N
2207139	106	1	Double Room with Two Single Beds	USD	27.56	2020-07-09	0	0	2020-07-08 10:00:37.793853	2020-07-08 10:00:37.793853	\N	\N	\N
2207140	4	1	Double Room	USD	109.42	2020-07-09	0	0	2020-07-08 10:00:37.801067	2020-07-08 10:00:37.801067	\N	\N	\N
2207141	27	1	Standard Twin Room - Smoking	USD	158.1	2020-07-09	540.14	0	2020-07-08 10:00:37.807369	2020-07-08 10:00:37.807369	\N	\N	\N
2207142	77	1	Double Room - North Side	USD	147.46	2020-07-09	0	0	2020-07-08 10:00:37.813396	2020-07-08 10:00:37.813396	\N	\N	\N
2207143	31	1	Classic Double or Twin Room with Hill View	USD	386.92	2020-07-09	0	0	2020-07-08 10:00:37.819264	2020-07-08 10:00:37.819264	\N	\N	\N
2207144	18	1	Superior Room	USD	126.79	2020-07-09	0	0	2020-07-08 10:00:37.825022	2020-07-08 10:00:37.825022	\N	\N	\N
2207145	202	1	2 Queen Beds, Pool Area	USD	84.62	2020-07-09	220.77	0	2020-07-08 10:00:37.831166	2020-07-08 10:00:37.831166	\N	\N	\N
2207146	139	1	Small Double	USD	121.1	2020-07-09	484.41	0	2020-07-08 10:00:37.83693	2020-07-08 10:00:37.83693	\N	\N	\N
2207147	14	1	Classic Double Bed	USD	122.63	2020-07-09	0	0	2020-07-08 10:00:37.843101	2020-07-08 10:00:37.843101	\N	\N	\N
2207148	79	1	Standard Room	USD	80.64	2020-07-09	0	0	2020-07-08 10:00:37.849077	2020-07-08 10:00:37.849077	\N	\N	\N
2207149	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.4	2020-07-09	0	0	2020-07-08 10:00:37.869818	2020-07-08 10:00:37.869818	\N	\N	\N
2207150	67	1	Trendy Garden View Room	USD	213.59	2020-07-09	0	0	2020-07-08 10:00:37.875561	2020-07-08 10:00:37.875561	\N	\N	\N
2207151	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	159	2020-07-09	0	0	2020-07-08 10:00:37.88136	2020-07-08 10:00:37.88136	\N	\N	\N
2207152	54	1	Double Room	USD	153.61	2020-07-09	770.05	0	2020-07-08 10:00:37.886944	2020-07-08 10:00:37.886944	\N	\N	\N
2207153	47	1	Standard room half board	USD	148.55	2020-07-09	500	0	2020-07-08 10:00:37.893082	2020-07-08 10:00:37.893082	\N	\N	\N
2207154	35	1	Twin - Non-Smoking	USD	97.65	2020-07-09	0	0	2020-07-08 10:00:37.902092	2020-07-08 10:00:37.902092	\N	\N	\N
2207155	38	1	Superior Double or Twin Room	USD	193.08	2020-07-09	0	0	2020-07-08 10:00:37.909111	2020-07-08 10:00:37.909111	\N	\N	\N
2207156	192	1	Comfort Room	USD	79.56	2020-07-09	225.78	0	2020-07-08 10:00:37.914776	2020-07-08 10:00:37.914776	\N	\N	\N
2207157	165	1	Basic Room	USD	91.34	2020-07-09	0	0	2020-07-08 10:00:37.921343	2020-07-08 10:00:37.921343	\N	\N	\N
2207158	215	1	Deluxe - 3 persons	USD	33.58	2020-07-09	134.31	25	2020-07-08 10:00:38.47725	2020-07-08 10:00:38.47725	\N	\N	\N
2207160	261	1	Superior Twin or Double Room	USD	62.2	2020-07-09	0	0	2020-07-08 10:00:38.493833	2020-07-08 10:00:38.493833	\N	\N	\N
2207161	224	1	Standard King	USD	67.67	2020-07-09	284.1	0	2020-07-08 10:00:38.499512	2020-07-08 10:00:38.499512	\N	\N	\N
2207162	300	1	Deluxe Room, Guestroom, 1 King	USD	138.13	2020-07-09	0	0	2020-07-08 10:00:38.506744	2020-07-08 10:00:38.506744	\N	\N	\N
2207163	301	1	Comfort Double or Twin Room	USD	137.53	2020-07-09	0	0	2020-07-08 10:00:38.512655	2020-07-08 10:00:38.512655	\N	\N	\N
2207164	293	1	Budget Double Room	USD	74.18	2020-07-09	0	0	2020-07-08 10:00:38.518168	2020-07-08 10:00:38.518168	\N	\N	\N
2207165	243	1	Twin Room	USD	71.53	2020-07-09	0	0	2020-07-08 10:00:38.523818	2020-07-08 10:00:38.523818	\N	\N	\N
2207166	256	1	Standard Double Room	USD	107.52	2020-07-09	0	0	2020-07-08 10:00:38.530162	2020-07-08 10:00:38.530162	\N	\N	\N
2207168	285	1	Superior Room king bed	USD	96.29	2020-07-09	0	0	2020-07-08 10:00:38.546018	2020-07-08 10:00:38.546018	\N	\N	\N
2207171	314	1	1 Double Bed Non-Smoking	USD	145.91	2020-07-09	0	0	2020-07-08 10:00:38.574444	2020-07-08 10:00:38.574444	\N	\N	\N
2207172	274	1	Double Room - Non-Smoking	USD	179.85	2020-07-09	0	0	2020-07-08 10:00:38.582517	2020-07-08 10:00:38.582517	\N	\N	\N
2207173	306	1	Deluxe King City View	USD	97.89	2020-07-09	301.91	30	2020-07-08 10:00:38.589686	2020-07-08 10:00:38.589686	\N	\N	\N
2207174	290	1	Standard	USD	95.69	2020-07-09	0	0	2020-07-08 10:00:38.598581	2020-07-08 10:00:38.598581	\N	\N	\N
2207178	258	1	Standard Double Room	USD	24.21	2020-07-09	0	0	2020-07-08 10:00:38.622647	2020-07-08 10:00:38.622647	\N	\N	\N
2207179	216	1	2 Double Accessible Roll in Shower	USD	129	2020-07-09	0	0	2020-07-08 10:00:38.628317	2020-07-08 10:00:38.628317	\N	\N	\N
2207182	275	1	Double or Twin Room	USD	135.47	2020-07-09	0	0	2020-07-08 10:00:38.647417	2020-07-08 10:00:38.647417	\N	\N	\N
2207183	204	1	King Bed	USD	131.54	2020-07-09	0	0	2020-07-08 10:00:38.653175	2020-07-08 10:00:38.653175	\N	\N	\N
2207184	211	1	Standard	USD	291.83	2020-07-09	0	0	2020-07-08 10:00:38.658913	2020-07-08 10:00:38.658913	\N	\N	\N
2207186	295	1	Classic Double or Twin	USD	157.97	2020-07-09	462.86	0	2020-07-08 10:00:38.675549	2020-07-08 10:00:38.675549	\N	\N	\N
2207189	268	1	Double Room	USD	125.61	2020-07-09	0	0	2020-07-08 10:00:38.69543	2020-07-08 10:00:38.69543	\N	\N	\N
2207190	307	1	1 King Bed	USD	379.44	2020-07-09	0	0	2020-07-08 10:00:38.701282	2020-07-08 10:00:38.701282	\N	\N	\N
2207191	251	1	Standard Queen Room	USD	93.46	2020-07-09	0	0	2020-07-08 10:00:38.708027	2020-07-08 10:00:38.708027	\N	\N	\N
2207193	302	1	Accessible 1 King Bed	USD	76.98	2020-07-09	300	0	2020-07-08 10:00:38.719739	2020-07-08 10:00:38.719739	\N	\N	\N
2207199	249	1	Standard 1 Double 1 Single Bed	USD	142.65	2020-07-09	0	0	2020-07-08 10:00:38.785469	2020-07-08 10:00:38.785469	\N	\N	\N
2207201	206	1	Standard	USD	72.23	2020-07-09	0	0	2020-07-08 10:00:38.797119	2020-07-08 10:00:38.797119	\N	\N	\N
2207202	263	1	Queen Hilton Guestroom	USD	130.2	2020-07-09	0	0	2020-07-08 10:00:38.802568	2020-07-08 10:00:38.802568	\N	\N	\N
2269391	23	1	1 King Bed Evolution Room 	USD	119	2020-07-10	0	0	2020-07-09 10:00:42.009717	2020-07-09 10:00:42.009717	\N	\N	\N
2269392	45	1	Classic Double or Twin	USD	102.03	2020-07-10	0	0	2020-07-09 10:00:42.029887	2020-07-09 10:00:42.029887	\N	\N	\N
2269393	115	1	Double Room	USD	56.14	2020-07-10	0	0	2020-07-09 10:00:42.046473	2020-07-09 10:00:42.046473	\N	\N	\N
2269394	162	1	Flexible Room	USD	174.18	2020-07-10	0	0	2020-07-09 10:00:42.05423	2020-07-09 10:00:42.05423	\N	\N	\N
2269395	75	1	Low Floor Small Single Room - Smoking	USD	71.99	2020-07-10	212.26	0	2020-07-09 10:00:42.06083	2020-07-09 10:00:42.06083	\N	\N	\N
2269396	158	1	Superior Twin Non-Smoking	USD	89.94	2020-07-10	0	0	2020-07-09 10:00:42.068849	2020-07-09 10:00:42.068849	\N	\N	\N
2269397	153	1	Standard Twin Room	USD	121.15	2020-07-10	0	0	2020-07-09 10:00:42.075593	2020-07-09 10:00:42.075593	\N	\N	\N
2269398	131	1	Superior Double Room	USD	51.52	2020-07-10	0	0	2020-07-09 10:00:42.08278	2020-07-09 10:00:42.08278	\N	\N	\N
2269399	184	1	Superior Room	USD	64.76	2020-07-10	417.77	0	2020-07-09 10:00:42.090923	2020-07-09 10:00:42.090923	\N	\N	\N
2269400	176	1	Economy Twin Room	USD	117.49	2020-07-10	0	0	2020-07-09 10:00:42.097787	2020-07-09 10:00:42.097787	\N	\N	\N
2269401	113	1	2 Queen Beds 	USD	177.65	2020-07-10	0	0	2020-07-09 10:00:42.103942	2020-07-09 10:00:42.103942	\N	\N	\N
2269402	53	1	Superior Twin	USD	142.3	2020-07-10	0	0	2020-07-09 10:00:42.111007	2020-07-09 10:00:42.111007	\N	\N	\N
2269403	143	1	Standard Double Room	USD	140.68	2020-07-10	0	0	2020-07-09 10:00:42.117039	2020-07-09 10:00:42.117039	\N	\N	\N
2269404	108	1	Standard Double Room	USD	71.05	2020-07-10	0	0	2020-07-09 10:00:42.122948	2020-07-09 10:00:42.122948	\N	\N	\N
2269405	17	1	Double Room	USD	41.12	2020-07-10	0	0	2020-07-09 10:00:42.128735	2020-07-09 10:00:42.128735	\N	\N	\N
2269406	13	1	Premium King Room	USD	138.35	2020-07-10	0	0	2020-07-09 10:00:42.136073	2020-07-09 10:00:42.136073	\N	\N	\N
2269407	8	1	Double Room	USD	161.68	2020-07-10	0	0	2020-07-09 10:00:42.142104	2020-07-09 10:00:42.142104	\N	\N	\N
2269408	125	1	Standard Double or Twin Room	USD	27	2020-07-10	0	0	2020-07-09 10:00:42.149374	2020-07-09 10:00:42.149374	\N	\N	\N
2269409	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-10	0	0	2020-07-09 10:00:42.155326	2020-07-09 10:00:42.155326	\N	\N	\N
2269410	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-10	0	0	2020-07-09 10:00:42.165292	2020-07-09 10:00:42.165292	\N	\N	\N
2269411	194	1	Standard Small Double Room - Non-Smoking	USD	179.49	2020-07-10	0	0	2020-07-09 10:00:42.175108	2020-07-09 10:00:42.175108	\N	\N	\N
2269412	95	1	 Twin Guestroom	USD	150.71	2020-07-10	0	0	2020-07-09 10:00:42.181586	2020-07-09 10:00:42.181586	\N	\N	\N
2269413	157	1	Cosy Small Room	USD	104.28	2020-07-10	0	0	2020-07-09 10:00:42.188169	2020-07-09 10:00:42.188169	\N	\N	\N
2269414	26	1	Double	USD	90.91	2020-07-10	0	0	2020-07-09 10:00:42.194188	2020-07-09 10:00:42.194188	\N	\N	\N
2269415	61	1	Modern Double Room	USD	174.84	2020-07-10	0	0	2020-07-09 10:00:42.201111	2020-07-09 10:00:42.201111	\N	\N	\N
2269416	109	1	Classic Double Room	USD	169.74	2020-07-10	0	0	2020-07-09 10:00:42.206933	2020-07-09 10:00:42.206933	\N	\N	\N
2269417	181	1	Superior Double Room	USD	61.94	2020-07-10	0	0	2020-07-09 10:00:42.212678	2020-07-09 10:00:42.212678	\N	\N	\N
2269418	49	1	Superior Double Room	USD	106.89	2020-07-10	0	0	2020-07-09 10:00:42.218557	2020-07-09 10:00:42.218557	\N	\N	\N
2269419	136	1	Standard Double or Twin Room	USD	166.2	2020-07-10	0	0	2020-07-09 10:00:42.225298	2020-07-09 10:00:42.225298	\N	\N	\N
2269420	98	1	Double or Twin	USD	77.29	2020-07-10	0	0	2020-07-09 10:00:42.231451	2020-07-09 10:00:42.231451	\N	\N	\N
2269421	159	1	Standard Room with 1 double bed and sofa	USD	85.29	2020-07-10	0	0	2020-07-09 10:00:42.238219	2020-07-09 10:00:42.238219	\N	\N	\N
2269422	90	1	Standard Room	USD	94.53	2020-07-10	378.1	0	2020-07-09 10:00:42.244826	2020-07-09 10:00:42.244826	\N	\N	\N
2269423	106	1	Double Room with Two Single Beds	USD	27.63	2020-07-10	0	0	2020-07-09 10:00:42.251189	2020-07-09 10:00:42.251189	\N	\N	\N
2269424	4	1	Deluxe Double Room with Sea View	USD	129.85	2020-07-10	0	0	2020-07-09 10:00:42.266055	2020-07-09 10:00:42.266055	\N	\N	\N
2269425	27	1	Standard Twin Room - Smoking	USD	166.38	2020-07-10	541.36	0	2020-07-09 10:00:42.272197	2020-07-09 10:00:42.272197	\N	\N	\N
2269426	77	1	Double Room - North Side	USD	148.1	2020-07-10	0	0	2020-07-09 10:00:42.278308	2020-07-09 10:00:42.278308	\N	\N	\N
2269427	31	1	Classic Double or Twin Room with Hill View	USD	388.54	2020-07-10	0	0	2020-07-09 10:00:42.284109	2020-07-09 10:00:42.284109	\N	\N	\N
2269428	18	1	Superior Room	USD	118.06	2020-07-10	0	0	2020-07-09 10:00:42.29052	2020-07-09 10:00:42.29052	\N	\N	\N
2269429	202	1	2 Queen Beds, Pool Area	USD	96.12	2020-07-10	221.83	0	2020-07-09 10:00:42.296788	2020-07-09 10:00:42.296788	\N	\N	\N
2269430	139	1	Small Double	USD	121.61	2020-07-10	486.44	0	2020-07-09 10:00:42.302639	2020-07-09 10:00:42.302639	\N	\N	\N
2269431	14	1	Classic Double Bed	USD	123.15	2020-07-10	0	0	2020-07-09 10:00:42.313885	2020-07-09 10:00:42.313885	\N	\N	\N
2269432	79	1	Standard Room	USD	80.98	2020-07-10	0	0	2020-07-09 10:00:42.321625	2020-07-09 10:00:42.321625	\N	\N	\N
2269433	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.57	2020-07-10	0	0	2020-07-09 10:00:42.327636	2020-07-09 10:00:42.327636	\N	\N	\N
2269434	67	1	Trendy Garden View Room	USD	213.59	2020-07-10	0	0	2020-07-09 10:00:42.333425	2020-07-09 10:00:42.333425	\N	\N	\N
2269435	183	1	Classic, Guest room, 2 Double, Danubio Tower	USD	87	2020-07-10	0	0	2020-07-09 10:00:42.33925	2020-07-09 10:00:42.33925	\N	\N	\N
2269436	54	1	Double Room	USD	154.28	2020-07-10	773.42	0	2020-07-09 10:00:42.345114	2020-07-09 10:00:42.345114	\N	\N	\N
2269437	47	1	Standard room half board	USD	148.55	2020-07-10	500	0	2020-07-09 10:00:42.365834	2020-07-09 10:00:42.365834	\N	\N	\N
2269438	35	1	Twin - Non-Smoking	USD	97.87	2020-07-10	0	0	2020-07-09 10:00:42.372672	2020-07-09 10:00:42.372672	\N	\N	\N
2269439	38	1	Superior Double or Twin Room	USD	193.89	2020-07-10	0	0	2020-07-09 10:00:42.380715	2020-07-09 10:00:42.380715	\N	\N	\N
2269440	192	1	Comfort Room	USD	69.1	2020-07-10	226.73	0	2020-07-09 10:00:42.386485	2020-07-09 10:00:42.386485	\N	\N	\N
2269441	215	1	Deluxe - 3 persons	USD	33.58	2020-07-10	134.31	25	2020-07-09 10:00:42.814138	2020-07-09 10:00:42.814138	\N	\N	\N
2269443	261	1	Superior Twin or Double Room	USD	62.2	2020-07-10	0	0	2020-07-09 10:00:42.835899	2020-07-09 10:00:42.835899	\N	\N	\N
2269444	224	1	Standard King	USD	67.62	2020-07-10	283.9	0	2020-07-09 10:00:42.842702	2020-07-09 10:00:42.842702	\N	\N	\N
2269445	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-07-10	0	0	2020-07-09 10:00:42.849977	2020-07-09 10:00:42.849977	\N	\N	\N
2269446	301	1	Comfort Double or Twin Room	USD	158.71	2020-07-10	0	0	2020-07-09 10:00:42.856259	2020-07-09 10:00:42.856259	\N	\N	\N
2269447	293	1	Budget Double Room	USD	63.7	2020-07-10	0	0	2020-07-09 10:00:42.86221	2020-07-09 10:00:42.86221	\N	\N	\N
2269448	243	1	Twin Room	USD	60.45	2020-07-10	0	0	2020-07-09 10:00:42.868103	2020-07-09 10:00:42.868103	\N	\N	\N
2269449	256	1	Standard Double Room	USD	91.77	2020-07-10	0	0	2020-07-09 10:00:42.87576	2020-07-09 10:00:42.87576	\N	\N	\N
2269450	285	1	Superior Room king bed	USD	93.59	2020-07-10	0	0	2020-07-09 10:00:42.883286	2020-07-09 10:00:42.883286	\N	\N	\N
2269453	314	1	1 Double Bed Non-Smoking	USD	146.53	2020-07-10	0	0	2020-07-09 10:00:42.902687	2020-07-09 10:00:42.902687	\N	\N	\N
2269454	274	1	Standard Twin Room - Non-Smoking	USD	212.61	2020-07-10	391.48	0	2020-07-09 10:00:42.910324	2020-07-09 10:00:42.910324	\N	\N	\N
2269455	306	1	Deluxe King City View	USD	90.68	2020-07-10	301.98	30	2020-07-09 10:00:42.920839	2020-07-09 10:00:42.920839	\N	\N	\N
2269456	290	1	Standard	USD	96.09	2020-07-10	0	0	2020-07-09 10:00:42.92684	2020-07-09 10:00:42.92684	\N	\N	\N
2269460	258	1	Standard Double Room	USD	24.27	2020-07-10	0	0	2020-07-09 10:00:42.954337	2020-07-09 10:00:42.954337	\N	\N	\N
2269461	216	1	2 Double Beds	USD	119	2020-07-10	0	0	2020-07-09 10:00:42.960631	2020-07-09 10:00:42.960631	\N	\N	\N
2269464	275	1	Double or Twin Room	USD	136.04	2020-07-10	0	0	2020-07-09 10:00:42.981916	2020-07-09 10:00:42.981916	\N	\N	\N
2269465	204	1	King Bed	USD	132.17	2020-07-10	0	0	2020-07-09 10:00:42.987651	2020-07-09 10:00:42.987651	\N	\N	\N
2269467	295	1	Classic Double or Twin	USD	167.39	2020-07-10	464.8	0	2020-07-09 10:00:42.99997	2020-07-09 10:00:42.99997	\N	\N	\N
2269470	307	1	1 King Bed	USD	404.07	2020-07-10	0	0	2020-07-09 10:00:43.019717	2020-07-09 10:00:43.019717	\N	\N	\N
2269471	251	1	Standard Queen Room	USD	94.04	2020-07-10	0	0	2020-07-09 10:00:43.026445	2020-07-09 10:00:43.026445	\N	\N	\N
2269473	302	1	2 Queen Beds 	USD	81.77	2020-07-10	0	0	2020-07-09 10:00:43.038768	2020-07-09 10:00:43.038768	\N	\N	\N
2269474	279	1	Anchorage Room	USD	316.41	2020-07-10	0	0	2020-07-09 10:00:43.046349	2020-07-09 10:00:43.046349	\N	\N	\N
2269479	249	1	Standard Triple Room	USD	97.9	2020-07-10	0	0	2020-07-09 10:00:43.095006	2020-07-09 10:00:43.095006	\N	\N	\N
2269481	206	1	Standard	USD	72.46	2020-07-10	0	0	2020-07-09 10:00:43.112586	2020-07-09 10:00:43.112586	\N	\N	\N
2269482	263	1	Queen Hilton Guestroom	USD	130.49	2020-07-10	0	0	2020-07-09 10:00:43.118138	2020-07-09 10:00:43.118138	\N	\N	\N
2328588	23	1	1 King Bed Evolution Room 	USD	119	2020-07-11	0	0	2020-07-10 10:00:42.568353	2020-07-10 10:00:42.568353	\N	\N	\N
2328589	45	1	Classic Double or Twin	USD	101.59	2020-07-11	0	0	2020-07-10 10:00:42.587678	2020-07-10 10:00:42.587678	\N	\N	\N
2328590	115	1	Double Room	USD	68.8	2020-07-11	0	0	2020-07-10 10:00:42.605848	2020-07-10 10:00:42.605848	\N	\N	\N
2328591	162	1	Standard Double Room	USD	217.03	2020-07-11	0	0	2020-07-10 10:00:42.614984	2020-07-10 10:00:42.614984	\N	\N	\N
2328592	75	1	Low Floor Small Single Room - Smoking	USD	86.48	2020-07-11	212.21	0	2020-07-10 10:00:42.621704	2020-07-10 10:00:42.621704	\N	\N	\N
2328593	158	1	Superior Twin Non-Smoking	USD	84.93	2020-07-11	0	0	2020-07-10 10:00:42.628614	2020-07-10 10:00:42.628614	\N	\N	\N
2328594	153	1	Standard Plus King	USD	126.74	2020-07-11	0	0	2020-07-10 10:00:42.634991	2020-07-10 10:00:42.634991	\N	\N	\N
2328595	131	1	Superior Double Room	USD	51.3	2020-07-11	0	0	2020-07-10 10:00:42.641893	2020-07-10 10:00:42.641893	\N	\N	\N
2328596	184	1	Superior Room	USD	62.89	2020-07-11	413.69	0	2020-07-10 10:00:42.64985	2020-07-10 10:00:42.64985	\N	\N	\N
2328597	176	1	Economy Twin Room	USD	127.25	2020-07-11	0	0	2020-07-10 10:00:42.661956	2020-07-10 10:00:42.661956	\N	\N	\N
2328598	113	1	2 Queen Beds 	USD	177.65	2020-07-11	0	0	2020-07-10 10:00:42.667917	2020-07-10 10:00:42.667917	\N	\N	\N
2328599	53	1	Superior Twin	USD	193.4	2020-07-11	0	0	2020-07-10 10:00:42.673669	2020-07-10 10:00:42.673669	\N	\N	\N
2328600	143	1	Standard Double Room	USD	149.1	2020-07-11	0	0	2020-07-10 10:00:42.679474	2020-07-10 10:00:42.679474	\N	\N	\N
2328601	108	1	Standard Double Room	USD	70.74	2020-07-11	0	0	2020-07-10 10:00:42.685413	2020-07-10 10:00:42.685413	\N	\N	\N
2328602	8	1	Twin Room	USD	160.77	2020-07-11	0	0	2020-07-10 10:00:42.692053	2020-07-10 10:00:42.692053	\N	\N	\N
2328603	64	1	Basic Double or Twin Room	USD	61.58	2020-07-11	0	0	2020-07-10 10:00:42.699219	2020-07-10 10:00:42.699219	\N	\N	\N
2328604	125	1	Standard Double or Twin Room	USD	27	2020-07-11	0	0	2020-07-10 10:00:42.707721	2020-07-10 10:00:42.707721	\N	\N	\N
2328605	199	1	Standard Room with 1 double bed	USD	34.84	2020-07-11	0	0	2020-07-10 10:00:42.713782	2020-07-10 10:00:42.713782	\N	\N	\N
2328606	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-11	0	0	2020-07-10 10:00:42.719678	2020-07-10 10:00:42.719678	\N	\N	\N
2328607	194	1	Standard Small Double Room - Non-Smoking	USD	167.9	2020-07-11	0	0	2020-07-10 10:00:42.727631	2020-07-10 10:00:42.727631	\N	\N	\N
2328608	95	1	 Twin Guestroom	USD	150.06	2020-07-11	0	0	2020-07-10 10:00:42.734894	2020-07-10 10:00:42.734894	\N	\N	\N
2328609	157	1	Cosy Small Room	USD	103.73	2020-07-11	0	0	2020-07-10 10:00:42.743185	2020-07-10 10:00:42.743185	\N	\N	\N
2328610	26	1	Double	USD	95.84	2020-07-11	0	0	2020-07-10 10:00:42.749031	2020-07-10 10:00:42.749031	\N	\N	\N
2328611	61	1	Modern Double Room	USD	194.83	2020-07-11	0	0	2020-07-10 10:00:42.755381	2020-07-10 10:00:42.755381	\N	\N	\N
2328612	109	1	Tradition Room with View River or Village	USD	211.49	2020-07-11	0	0	2020-07-10 10:00:42.766956	2020-07-10 10:00:42.766956	\N	\N	\N
2328613	84	1	Double or Twin Room	USD	56.44	2020-07-11	0	0	2020-07-10 10:00:42.772904	2020-07-10 10:00:42.772904	\N	\N	\N
2328614	181	1	Superior Double Room	USD	61.94	2020-07-11	0	0	2020-07-10 10:00:42.778557	2020-07-10 10:00:42.778557	\N	\N	\N
2328615	49	1	Superior Twin Room	USD	106.43	2020-07-11	0	0	2020-07-10 10:00:42.784471	2020-07-10 10:00:42.784471	\N	\N	\N
2328616	136	1	Standard Double or Twin Room	USD	125.44	2020-07-11	0	0	2020-07-10 10:00:42.791362	2020-07-10 10:00:42.791362	\N	\N	\N
2328617	98	1	Double or Twin	USD	76.96	2020-07-11	0	0	2020-07-10 10:00:42.79738	2020-07-10 10:00:42.79738	\N	\N	\N
2328618	159	1	Standard Room with 1 double bed and sofa	USD	84.93	2020-07-11	0	0	2020-07-10 10:00:42.803976	2020-07-10 10:00:42.803976	\N	\N	\N
2328619	90	1	Standard Room	USD	94.12	2020-07-11	376.48	0	2020-07-10 10:00:42.810629	2020-07-10 10:00:42.810629	\N	\N	\N
2328620	106	1	Double Room with Two Single Beds	USD	47.14	2020-07-11	0	0	2020-07-10 10:00:42.817697	2020-07-10 10:00:42.817697	\N	\N	\N
2328621	27	1	Standard Twin Room - Smoking	USD	166.34	2020-07-11	541.25	0	2020-07-10 10:00:42.823539	2020-07-10 10:00:42.823539	\N	\N	\N
2328622	77	1	Double Room - North Side	USD	147.66	2020-07-11	0	0	2020-07-10 10:00:42.829401	2020-07-10 10:00:42.829401	\N	\N	\N
2328623	31	1	Classic Double or Twin Room with Hill View	USD	386.87	2020-07-11	0	0	2020-07-10 10:00:42.835654	2020-07-10 10:00:42.835654	\N	\N	\N
2328624	18	1	Superior Room	USD	117.84	2020-07-11	0	0	2020-07-10 10:00:42.841586	2020-07-10 10:00:42.841586	\N	\N	\N
2328625	202	1	2 Queen Beds, Pool Area	USD	95.72	2020-07-11	220.91	0	2020-07-10 10:00:42.865599	2020-07-10 10:00:42.865599	\N	\N	\N
2328626	139	1	Small Double	USD	121.09	2020-07-11	484.35	0	2020-07-10 10:00:42.872134	2020-07-10 10:00:42.872134	\N	\N	\N
2328627	14	1	Classic Double Bed	USD	127.75	2020-07-11	0	0	2020-07-10 10:00:42.879917	2020-07-10 10:00:42.879917	\N	\N	\N
2328628	79	1	Standard Room	USD	80.63	2020-07-11	0	0	2020-07-10 10:00:42.890111	2020-07-10 10:00:42.890111	\N	\N	\N
2328629	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.19	2020-07-11	0	0	2020-07-10 10:00:42.898615	2020-07-10 10:00:42.898615	\N	\N	\N
2328630	67	1	Trendy Garden View Room	USD	213.59	2020-07-11	0	0	2020-07-10 10:00:42.904812	2020-07-10 10:00:42.904812	\N	\N	\N
2328631	160	1	King Accessible with Roll In Shower	USD	119	2020-07-11	0	0	2020-07-10 10:00:42.910863	2020-07-10 10:00:42.910863	\N	\N	\N
2328632	183	1	Business Deluxe, Guest room, 1 King	USD	87	2020-07-11	0	0	2020-07-10 10:00:42.916773	2020-07-10 10:00:42.916773	\N	\N	\N
2328633	54	1	Double Room	USD	153.82	2020-07-11	771.12	0	2020-07-10 10:00:42.923726	2020-07-10 10:00:42.923726	\N	\N	\N
2328634	47	1	Standard room half board	USD	148.55	2020-07-11	500	0	2020-07-10 10:00:42.93104	2020-07-10 10:00:42.93104	\N	\N	\N
2328635	35	1	Twin - Non-Smoking	USD	107.68	2020-07-11	0	0	2020-07-10 10:00:42.937945	2020-07-10 10:00:42.937945	\N	\N	\N
2328636	38	1	Superior Double or Twin Room	USD	193.06	2020-07-11	0	0	2020-07-10 10:00:42.9447	2020-07-10 10:00:42.9447	\N	\N	\N
2328637	192	1	Comfort Room	USD	68.8	2020-07-11	225.76	0	2020-07-10 10:00:42.950473	2020-07-10 10:00:42.950473	\N	\N	\N
2328638	215	1	Deluxe - 3 persons	USD	33.58	2020-07-11	134.31	25	2020-07-10 10:00:43.492936	2020-07-10 10:00:43.492936	\N	\N	\N
2328640	261	1	Superior Twin or Double Room	USD	62.2	2020-07-11	0	0	2020-07-10 10:00:43.510083	2020-07-10 10:00:43.510083	\N	\N	\N
2328641	224	1	Superior King	USD	82.26	2020-07-11	268.75	0	2020-07-10 10:00:43.516292	2020-07-10 10:00:43.516292	\N	\N	\N
2328642	300	1	Deluxe Room, Guestroom, 1 King	USD	138.18	2020-07-11	0	0	2020-07-10 10:00:43.522592	2020-07-10 10:00:43.522592	\N	\N	\N
2328643	301	1	Comfort Double or Twin Room	USD	173.43	2020-07-11	0	0	2020-07-10 10:00:43.528716	2020-07-10 10:00:43.528716	\N	\N	\N
2328644	293	1	Budget Double Room	USD	63.43	2020-07-11	0	0	2020-07-10 10:00:43.534535	2020-07-10 10:00:43.534535	\N	\N	\N
2328645	243	1	Twin Room	USD	60.19	2020-07-11	0	0	2020-07-10 10:00:43.540711	2020-07-10 10:00:43.540711	\N	\N	\N
2328646	256	1	Standard Double Room	USD	91.38	2020-07-11	0	0	2020-07-10 10:00:43.547618	2020-07-10 10:00:43.547618	\N	\N	\N
2328647	285	1	Superior Room king bed	USD	93.31	2020-07-11	0	0	2020-07-10 10:00:43.55518	2020-07-10 10:00:43.55518	\N	\N	\N
2328650	314	1	1 Double Bed Non-Smoking	USD	177.84	2020-07-11	0	0	2020-07-10 10:00:43.575196	2020-07-10 10:00:43.575196	\N	\N	\N
2328651	274	1	Small Double Room Smoking	USD	238.75	2020-07-11	0	0	2020-07-10 10:00:43.582568	2020-07-10 10:00:43.582568	\N	\N	\N
2328652	306	1	Deluxe King City View	USD	88.75	2020-07-11	301.98	30	2020-07-10 10:00:43.58968	2020-07-10 10:00:43.58968	\N	\N	\N
2328653	290	1	Standard	USD	95.68	2020-07-11	0	0	2020-07-10 10:00:43.595705	2020-07-10 10:00:43.595705	\N	\N	\N
2328657	258	1	Standard Double Room	USD	24.26	2020-07-11	0	0	2020-07-10 10:00:43.622444	2020-07-10 10:00:43.622444	\N	\N	\N
2328658	216	1	2 Double Accessible Roll in Shower	USD	119	2020-07-11	0	0	2020-07-10 10:00:43.628563	2020-07-10 10:00:43.628563	\N	\N	\N
2328661	275	1	Double or Twin Room	USD	88.25	2020-07-11	0	0	2020-07-10 10:00:43.647436	2020-07-10 10:00:43.647436	\N	\N	\N
2328662	204	1	King Bed	USD	131.63	2020-07-11	0	0	2020-07-10 10:00:43.66601	2020-07-10 10:00:43.66601	\N	\N	\N
2328664	295	1	Classic Double or Twin	USD	166.68	2020-07-11	462.81	0	2020-07-10 10:00:43.680489	2020-07-10 10:00:43.680489	\N	\N	\N
2328667	307	1	1 King Bed	USD	403.98	2020-07-11	0	0	2020-07-10 10:00:43.700051	2020-07-10 10:00:43.700051	\N	\N	\N
2328668	251	1	Standard Queen Room	USD	93.71	2020-07-11	0	0	2020-07-10 10:00:43.708816	2020-07-10 10:00:43.708816	\N	\N	\N
2328670	302	1	2 Queen Beds 	USD	84.64	2020-07-11	0	0	2020-07-10 10:00:43.722778	2020-07-10 10:00:43.722778	\N	\N	\N
2328676	206	1	Standard	USD	72.51	2020-07-11	0	0	2020-07-10 10:00:43.775653	2020-07-10 10:00:43.775653	\N	\N	\N
2328677	263	1	Queen Hilton Guestroom	USD	130.47	2020-07-11	0	0	2020-07-10 10:00:43.788132	2020-07-10 10:00:43.788132	\N	\N	\N
2382314	23	1	1 King Bed Evolution Room 	USD	119	2020-07-12	0	0	2020-07-11 10:00:41.956993	2020-07-11 10:00:41.956993	\N	\N	\N
2382315	45	1	Classic Double or Twin	USD	101.69	2020-07-12	0	0	2020-07-11 10:00:41.975943	2020-07-11 10:00:41.975943	\N	\N	\N
2382316	115	1	Double Room	USD	58.11	2020-07-12	0	0	2020-07-11 10:00:41.994906	2020-07-11 10:00:41.994906	\N	\N	\N
2382317	162	1	Flexible Room	USD	173.6	2020-07-12	0	0	2020-07-11 10:00:42.007395	2020-07-11 10:00:42.007395	\N	\N	\N
2382318	75	1	Low Floor Small Single Room - Smoking	USD	65.02	2020-07-12	213.03	0	2020-07-11 10:00:42.015252	2020-07-11 10:00:42.015252	\N	\N	\N
2382319	158	1	Superior Twin Non-Smoking	USD	84.86	2020-07-12	0	0	2020-07-11 10:00:42.024362	2020-07-11 10:00:42.024362	\N	\N	\N
2382320	153	1	Standard Plus King	USD	157.27	2020-07-12	0	0	2020-07-11 10:00:42.031118	2020-07-11 10:00:42.031118	\N	\N	\N
2382321	201	1	Feature Double Room	USD	128.5	2020-07-12	0	0	2020-07-11 10:00:42.038301	2020-07-11 10:00:42.038301	\N	\N	\N
2382322	131	1	Superior Double Room	USD	51.33	2020-07-12	0	0	2020-07-11 10:00:42.045494	2020-07-11 10:00:42.045494	\N	\N	\N
2382323	184	1	Superior Room	USD	65.9	2020-07-12	409.51	0	2020-07-11 10:00:42.052586	2020-07-11 10:00:42.052586	\N	\N	\N
2382324	176	1	Economy Twin Room	USD	122.24	2020-07-12	0	0	2020-07-11 10:00:42.059205	2020-07-11 10:00:42.059205	\N	\N	\N
2382325	113	1	2 Queen Beds 	USD	177.65	2020-07-12	0	0	2020-07-11 10:00:42.070046	2020-07-11 10:00:42.070046	\N	\N	\N
2382326	53	1	Superior Twin	USD	130.77	2020-07-12	0	0	2020-07-11 10:00:42.076395	2020-07-11 10:00:42.076395	\N	\N	\N
2382327	143	1	Standard Double Room	USD	163.07	2020-07-12	0	0	2020-07-11 10:00:42.08221	2020-07-11 10:00:42.08221	\N	\N	\N
2382328	108	1	Standard Double Room	USD	67.04	2020-07-12	0	0	2020-07-11 10:00:42.088017	2020-07-11 10:00:42.088017	\N	\N	\N
2382329	17	1	Double Room	USD	37.58	2020-07-12	0	0	2020-07-11 10:00:42.094149	2020-07-11 10:00:42.094149	\N	\N	\N
2382330	13	1	Premium King Room	USD	127.97	2020-07-12	0	0	2020-07-11 10:00:42.101194	2020-07-11 10:00:42.101194	\N	\N	\N
2382331	8	1	Double Room	USD	160.92	2020-07-12	0	0	2020-07-11 10:00:42.107419	2020-07-11 10:00:42.107419	\N	\N	\N
2382332	64	1	Basic Double or Twin Room	USD	49.31	2020-07-12	0	0	2020-07-11 10:00:42.113963	2020-07-11 10:00:42.113963	\N	\N	\N
2382333	125	1	Standard Double or Twin Room	USD	27	2020-07-12	0	0	2020-07-11 10:00:42.121136	2020-07-11 10:00:42.121136	\N	\N	\N
2382334	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-12	0	0	2020-07-11 10:00:42.127239	2020-07-11 10:00:42.127239	\N	\N	\N
2382335	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-12	0	0	2020-07-11 10:00:42.133463	2020-07-11 10:00:42.133463	\N	\N	\N
2382336	194	1	Standard Small Double Room - Non-Smoking	USD	168.54	2020-07-12	0	0	2020-07-11 10:00:42.142138	2020-07-11 10:00:42.142138	\N	\N	\N
2382337	95	1	 Twin Guestroom	USD	123.45	2020-07-12	0	0	2020-07-11 10:00:42.148649	2020-07-11 10:00:42.148649	\N	\N	\N
2382338	157	1	Cosy Small Room	USD	100.58	2020-07-12	0	0	2020-07-11 10:00:42.155903	2020-07-11 10:00:42.155903	\N	\N	\N
2382339	26	1	Double	USD	85.28	2020-07-12	0	0	2020-07-11 10:00:42.170604	2020-07-11 10:00:42.170604	\N	\N	\N
2382340	164	1	Standard Twin Room	USD	219.49	2020-07-12	0	0	2020-07-11 10:00:42.176601	2020-07-11 10:00:42.176601	\N	\N	\N
2382341	61	1	Modern Double Room	USD	174.26	2020-07-12	0	0	2020-07-11 10:00:42.183553	2020-07-11 10:00:42.183553	\N	\N	\N
2382342	109	1	Classic Double Room	USD	147.92	2020-07-12	0	0	2020-07-11 10:00:42.189586	2020-07-11 10:00:42.189586	\N	\N	\N
2382343	84	1	Double or Twin Room	USD	56.5	2020-07-12	0	0	2020-07-11 10:00:42.195698	2020-07-11 10:00:42.195698	\N	\N	\N
2382344	181	1	Superior Double Room	USD	61.94	2020-07-12	0	0	2020-07-11 10:00:42.201768	2020-07-11 10:00:42.201768	\N	\N	\N
2382345	49	1	Superior Twin Room	USD	95.77	2020-07-12	0	0	2020-07-11 10:00:42.207678	2020-07-11 10:00:42.207678	\N	\N	\N
2382346	136	1	Standard Double or Twin Room	USD	125.24	2020-07-12	0	0	2020-07-11 10:00:42.215579	2020-07-11 10:00:42.215579	\N	\N	\N
2382347	98	1	Double or Twin	USD	77.04	2020-07-12	0	0	2020-07-11 10:00:42.222058	2020-07-11 10:00:42.222058	\N	\N	\N
2382348	159	1	Standard Room with 1 double bed and sofa	USD	76.41	2020-07-12	0	0	2020-07-11 10:00:42.229929	2020-07-11 10:00:42.229929	\N	\N	\N
2382349	42	1	Two-Bedroom Apartment	USD	96.05	2020-07-12	0	0	2020-07-11 10:00:42.236061	2020-07-11 10:00:42.236061	\N	\N	\N
2382350	3	1	Deluxe 	USD	139.69	2020-07-12	335.08	0	2020-07-11 10:00:42.242064	2020-07-11 10:00:42.242064	\N	\N	\N
2382351	90	1	Standard Room	USD	99.7	2020-07-12	398.81	0	2020-07-11 10:00:42.249986	2020-07-11 10:00:42.249986	\N	\N	\N
2382352	106	1	Double Room with Two Single Beds	USD	36.9	2020-07-12	0	0	2020-07-11 10:00:42.269848	2020-07-11 10:00:42.269848	\N	\N	\N
2382353	4	1	Twin Room	USD	99.56	2020-07-12	0	0	2020-07-11 10:00:42.276002	2020-07-11 10:00:42.276002	\N	\N	\N
2382354	27	1	Standard Twin Room - Smoking	USD	166.99	2020-07-12	543.34	0	2020-07-11 10:00:42.281973	2020-07-11 10:00:42.281973	\N	\N	\N
2382355	77	1	Double Room - North Side	USD	147.61	2020-07-12	0	0	2020-07-11 10:00:42.288266	2020-07-11 10:00:42.288266	\N	\N	\N
2382356	31	1	Classic Double or Twin Room with Hill View	USD	387.27	2020-07-12	0	0	2020-07-11 10:00:42.294196	2020-07-11 10:00:42.294196	\N	\N	\N
2382357	18	1	Superior Room	USD	118.43	2020-07-12	0	0	2020-07-11 10:00:42.300285	2020-07-11 10:00:42.300285	\N	\N	\N
2382358	202	1	2 Queen Beds, Pool Area	USD	84.5	2020-07-12	220.44	0	2020-07-11 10:00:42.306158	2020-07-11 10:00:42.306158	\N	\N	\N
2382359	139	1	Small Double	USD	117.1	2020-07-12	468.43	0	2020-07-11 10:00:42.312455	2020-07-11 10:00:42.312455	\N	\N	\N
2382360	14	1	Classic Double Bed	USD	127.88	2020-07-12	0	0	2020-07-11 10:00:42.318974	2020-07-11 10:00:42.318974	\N	\N	\N
2382361	79	1	Standard Room	USD	80.71	2020-07-12	0	0	2020-07-11 10:00:42.325024	2020-07-11 10:00:42.325024	\N	\N	\N
2382362	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	74.84	2020-07-12	0	0	2020-07-11 10:00:42.330866	2020-07-11 10:00:42.330866	\N	\N	\N
2382363	67	1	Trendy Garden View Room	USD	213.59	2020-07-12	0	0	2020-07-11 10:00:42.336913	2020-07-11 10:00:42.336913	\N	\N	\N
2382364	160	1	King Accesible with Bathtub	USD	109	2020-07-12	0	0	2020-07-11 10:00:42.343226	2020-07-11 10:00:42.343226	\N	\N	\N
2382365	183	1	Business Deluxe, Guest room, 1 King	USD	149	2020-07-12	0	0	2020-07-11 10:00:42.368391	2020-07-11 10:00:42.368391	\N	\N	\N
2382366	54	1	Double Room	USD	153.77	2020-07-12	770.87	0	2020-07-11 10:00:42.37526	2020-07-11 10:00:42.37526	\N	\N	\N
2382367	47	1	Sea Facing Queen Room	USD	138.26	2020-07-12	0	0	2020-07-11 10:00:42.382155	2020-07-11 10:00:42.382155	\N	\N	\N
2382368	35	1	Twin - Non-Smoking	USD	98.23	2020-07-12	0	0	2020-07-11 10:00:42.388912	2020-07-11 10:00:42.388912	\N	\N	\N
2382369	38	1	Superior Double or Twin Room	USD	193.25	2020-07-12	0	0	2020-07-11 10:00:42.397091	2020-07-11 10:00:42.397091	\N	\N	\N
2382370	192	1	Comfort Room	USD	68.87	2020-07-12	225.99	0	2020-07-11 10:00:42.403273	2020-07-11 10:00:42.403273	\N	\N	\N
2382371	165	1	Basic Room	USD	91.42	2020-07-12	0	0	2020-07-11 10:00:42.409959	2020-07-11 10:00:42.409959	\N	\N	\N
2382372	215	1	Deluxe - 3 persons	USD	32.23	2020-07-12	128.91	25	2020-07-11 10:00:42.854371	2020-07-11 10:00:42.854371	\N	\N	\N
2382374	261	1	Superior Twin or Double Room	USD	62.2	2020-07-12	0	0	2020-07-11 10:00:42.870211	2020-07-11 10:00:42.870211	\N	\N	\N
2382375	224	1	Standard King	USD	67.52	2020-07-12	283.45	0	2020-07-11 10:00:42.87816	2020-07-11 10:00:42.87816	\N	\N	\N
2382376	300	1	Deluxe Room, Guestroom, 1 King	USD	138.18	2020-07-12	0	0	2020-07-11 10:00:42.885151	2020-07-11 10:00:42.885151	\N	\N	\N
2382377	301	1	Superior Double Room with Pool and Garden View	USD	183.88	2020-07-12	0	0	2020-07-11 10:00:42.891777	2020-07-11 10:00:42.891777	\N	\N	\N
2382378	293	1	Budget Double Room	USD	59.19	2020-07-12	0	0	2020-07-11 10:00:42.898365	2020-07-11 10:00:42.898365	\N	\N	\N
2382379	243	1	Twin Room	USD	60.25	2020-07-12	0	0	2020-07-11 10:00:42.904284	2020-07-11 10:00:42.904284	\N	\N	\N
2382380	256	1	Standard Double Room	USD	91.47	2020-07-12	0	0	2020-07-11 10:00:42.910859	2020-07-11 10:00:42.910859	\N	\N	\N
2382381	285	1	Superior Room king bed	USD	90.31	2020-07-12	0	0	2020-07-11 10:00:42.918739	2020-07-11 10:00:42.918739	\N	\N	\N
2382384	314	1	1 Double Bed Non-Smoking	USD	146.05	2020-07-12	0	0	2020-07-11 10:00:42.937801	2020-07-11 10:00:42.937801	\N	\N	\N
2382385	274	1	Small Double Room Non-Smoking	USD	154.63	2020-07-12	226.91	0	2020-07-11 10:00:42.946117	2020-07-11 10:00:42.946117	\N	\N	\N
2382386	306	1	Deluxe King City View	USD	88.79	2020-07-12	302.12	30	2020-07-11 10:00:42.954183	2020-07-11 10:00:42.954183	\N	\N	\N
2382387	290	1	Standard	USD	85.01	2020-07-12	0	0	2020-07-11 10:00:42.965146	2020-07-11 10:00:42.965146	\N	\N	\N
2382391	258	1	Standard Double Room	USD	24.31	2020-07-12	0	0	2020-07-11 10:00:42.993409	2020-07-11 10:00:42.993409	\N	\N	\N
2382392	216	1	2 Double Accessible with Bathtub	USD	119	2020-07-12	0	0	2020-07-11 10:00:42.999358	2020-07-11 10:00:42.999358	\N	\N	\N
2382395	275	1	Double or Twin Room	USD	88.34	2020-07-12	0	0	2020-07-11 10:00:43.018371	2020-07-11 10:00:43.018371	\N	\N	\N
2382396	204	1	King Bed	USD	131.35	2020-07-12	0	0	2020-07-11 10:00:43.024314	2020-07-11 10:00:43.024314	\N	\N	\N
2382398	295	1	Classic Double or Twin	USD	158.12	2020-07-12	463.28	0	2020-07-11 10:00:43.037031	2020-07-11 10:00:43.037031	\N	\N	\N
2382401	268	1	Double Room	USD	105.24	2020-07-12	0	0	2020-07-11 10:00:43.073515	2020-07-11 10:00:43.073515	\N	\N	\N
2382402	307	1	1 King Bed	USD	381.68	2020-07-12	0	0	2020-07-11 10:00:43.079903	2020-07-11 10:00:43.079903	\N	\N	\N
2382403	251	1	Standard Queen Room	USD	93.75	2020-07-12	0	0	2020-07-11 10:00:43.093152	2020-07-11 10:00:43.093152	\N	\N	\N
2382405	302	1	Accessible 1 King Bed	USD	76.98	2020-07-12	300	0	2020-07-11 10:00:43.10556	2020-07-11 10:00:43.10556	\N	\N	\N
2382408	255	1	3rd Floor Mountain-View Double Room	USD	271.41	2020-07-12	0	0	2020-07-11 10:00:43.123962	2020-07-11 10:00:43.123962	\N	\N	\N
2382412	206	1	Standard	USD	72.62	2020-07-12	0	0	2020-07-11 10:00:43.168337	2020-07-11 10:00:43.168337	\N	\N	\N
2382413	263	1	Queen Hilton Guestroom	USD	130.97	2020-07-12	0	0	2020-07-11 10:00:43.174422	2020-07-11 10:00:43.174422	\N	\N	\N
2442979	23	1	1 King Bed Evolution Room 	USD	129	2020-07-13	0	0	2020-07-12 10:00:39.88393	2020-07-12 10:00:39.88393	\N	\N	\N
2442980	45	1	Classic Double or Twin	USD	101.69	2020-07-13	0	0	2020-07-12 10:00:39.907528	2020-07-12 10:00:39.907528	\N	\N	\N
2442981	115	1	Double Room	USD	63.49	2020-07-13	0	0	2020-07-12 10:00:39.914954	2020-07-12 10:00:39.914954	\N	\N	\N
2442982	162	1	Standard Double Room	USD	217.25	2020-07-13	0	0	2020-07-12 10:00:39.923433	2020-07-12 10:00:39.923433	\N	\N	\N
2442983	75	1	Low Floor Small Single Room - Smoking	USD	72.25	2020-07-13	213.03	0	2020-07-12 10:00:39.939596	2020-07-12 10:00:39.939596	\N	\N	\N
2442984	158	1	Superior Twin Non-Smoking	USD	94.29	2020-07-13	0	0	2020-07-12 10:00:39.947648	2020-07-12 10:00:39.947648	\N	\N	\N
2442985	153	1	Standard Twin Room	USD	205.84	2020-07-13	0	0	2020-07-12 10:00:39.954627	2020-07-12 10:00:39.954627	\N	\N	\N
2442986	201	1	Classic Double Room	USD	105.35	2020-07-13	0	0	2020-07-12 10:00:39.960941	2020-07-12 10:00:39.960941	\N	\N	\N
2442987	131	1	Superior Double Room	USD	51.33	2020-07-13	0	0	2020-07-12 10:00:39.96998	2020-07-12 10:00:39.96998	\N	\N	\N
2442988	184	1	Superior Room	USD	75.61	2020-07-13	441.61	0	2020-07-12 10:00:39.980108	2020-07-12 10:00:39.980108	\N	\N	\N
2442989	176	1	Economy Twin Room	USD	122.24	2020-07-13	0	0	2020-07-12 10:00:39.986726	2020-07-12 10:00:39.986726	\N	\N	\N
2442990	113	1	2 Queen Beds 	USD	177.65	2020-07-13	0	0	2020-07-12 10:00:39.992953	2020-07-12 10:00:39.992953	\N	\N	\N
2442991	53	1	Superior Twin	USD	130.77	2020-07-13	0	0	2020-07-12 10:00:39.998976	2020-07-12 10:00:39.998976	\N	\N	\N
2442992	143	1	Standard Double Room	USD	172.29	2020-07-13	0	0	2020-07-12 10:00:40.059899	2020-07-12 10:00:40.059899	\N	\N	\N
2442993	108	1	Standard Double Room	USD	67.04	2020-07-13	0	0	2020-07-12 10:00:40.066649	2020-07-12 10:00:40.066649	\N	\N	\N
2442994	17	1	Double Room	USD	37.58	2020-07-13	0	0	2020-07-12 10:00:40.072898	2020-07-12 10:00:40.072898	\N	\N	\N
2442995	13	1	Premium Twin Room with Two Double Beds	USD	127.97	2020-07-13	0	0	2020-07-12 10:00:40.081101	2020-07-12 10:00:40.081101	\N	\N	\N
2442996	8	1	Twin Room	USD	160.92	2020-07-13	0	0	2020-07-12 10:00:40.087985	2020-07-12 10:00:40.087985	\N	\N	\N
2442997	64	1	Basic Double or Twin Room	USD	59.58	2020-07-13	0	0	2020-07-12 10:00:40.094286	2020-07-12 10:00:40.094286	\N	\N	\N
2442998	125	1	Standard Double or Twin Room	USD	27	2020-07-13	0	0	2020-07-12 10:00:40.100513	2020-07-12 10:00:40.100513	\N	\N	\N
2442999	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-13	0	0	2020-07-12 10:00:40.106403	2020-07-12 10:00:40.106403	\N	\N	\N
2443000	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-13	0	0	2020-07-12 10:00:40.112235	2020-07-12 10:00:40.112235	\N	\N	\N
2443001	194	1	Standard Small Double Room - Non-Smoking	USD	172.41	2020-07-13	0	0	2020-07-12 10:00:40.120063	2020-07-12 10:00:40.120063	\N	\N	\N
2443002	95	1	 Twin Guestroom	USD	141.57	2020-07-13	0	0	2020-07-12 10:00:40.127155	2020-07-12 10:00:40.127155	\N	\N	\N
2443003	157	1	Cosy Small Room	USD	100.58	2020-07-13	0	0	2020-07-12 10:00:40.13387	2020-07-12 10:00:40.13387	\N	\N	\N
2443004	26	1	Double	USD	85.28	2020-07-13	0	0	2020-07-12 10:00:40.139873	2020-07-12 10:00:40.139873	\N	\N	\N
2443005	164	1	Standard Twin Room	USD	219.49	2020-07-13	0	0	2020-07-12 10:00:40.145956	2020-07-12 10:00:40.145956	\N	\N	\N
2443006	61	1	Modern Double Room	USD	194.77	2020-07-13	0	0	2020-07-12 10:00:40.282366	2020-07-12 10:00:40.282366	\N	\N	\N
2443007	109	1	Classic Double Room	USD	169.19	2020-07-13	0	0	2020-07-12 10:00:40.291458	2020-07-12 10:00:40.291458	\N	\N	\N
2443008	84	1	Double or Twin Room	USD	56.5	2020-07-13	0	0	2020-07-12 10:00:40.298293	2020-07-12 10:00:40.298293	\N	\N	\N
2443009	181	1	Superior Double Room	USD	61.94	2020-07-13	0	0	2020-07-12 10:00:40.305709	2020-07-12 10:00:40.305709	\N	\N	\N
2443010	49	1	Superior Twin Room	USD	117.3	2020-07-13	0	0	2020-07-12 10:00:40.311827	2020-07-12 10:00:40.311827	\N	\N	\N
2443011	136	1	Standard Double or Twin Room	USD	118.96	2020-07-13	0	0	2020-07-12 10:00:40.321653	2020-07-12 10:00:40.321653	\N	\N	\N
2443012	98	1	Double or Twin	USD	77.04	2020-07-13	0	0	2020-07-12 10:00:40.328823	2020-07-12 10:00:40.328823	\N	\N	\N
2443013	159	1	Standard Room with 1 double bed and sofa	USD	85.01	2020-07-13	0	0	2020-07-12 10:00:40.338782	2020-07-12 10:00:40.338782	\N	\N	\N
2443014	42	1	Two-Bedroom Apartment	USD	96.05	2020-07-13	0	0	2020-07-12 10:00:40.348536	2020-07-12 10:00:40.348536	\N	\N	\N
2443015	3	1	Deluxe 	USD	139.69	2020-07-13	335.08	0	2020-07-12 10:00:40.35671	2020-07-12 10:00:40.35671	\N	\N	\N
2443016	90	1	Standard Room	USD	99.7	2020-07-13	398.81	0	2020-07-12 10:00:40.36665	2020-07-12 10:00:40.36665	\N	\N	\N
2443017	106	1	Double Room with Two Single Beds	USD	36.9	2020-07-13	0	0	2020-07-12 10:00:40.372758	2020-07-12 10:00:40.372758	\N	\N	\N
2443018	4	1	Double Room	USD	119.47	2020-07-13	0	0	2020-07-12 10:00:40.378876	2020-07-12 10:00:40.378876	\N	\N	\N
2443019	27	1	Standard Twin Room - Smoking	USD	166.99	2020-07-13	543.34	0	2020-07-12 10:00:40.385016	2020-07-12 10:00:40.385016	\N	\N	\N
2443020	77	1	Double Room - North Side	USD	147.61	2020-07-13	0	0	2020-07-12 10:00:40.391326	2020-07-12 10:00:40.391326	\N	\N	\N
2443021	31	1	Classic Double or Twin Room with Hill View	USD	387.27	2020-07-13	0	0	2020-07-12 10:00:40.397332	2020-07-12 10:00:40.397332	\N	\N	\N
2443022	18	1	Superior Room	USD	127.61	2020-07-13	0	0	2020-07-12 10:00:40.403183	2020-07-12 10:00:40.403183	\N	\N	\N
2443023	202	1	2 Queen Beds, Pool Area	USD	95.52	2020-07-13	220.44	0	2020-07-12 10:00:40.412897	2020-07-12 10:00:40.412897	\N	\N	\N
2443024	139	1	Small Double	USD	117.1	2020-07-13	468.43	0	2020-07-12 10:00:40.418819	2020-07-12 10:00:40.418819	\N	\N	\N
2443025	14	1	Classic Double Bed	USD	122.74	2020-07-13	0	0	2020-07-12 10:00:40.425303	2020-07-12 10:00:40.425303	\N	\N	\N
2443026	79	1	Standard Room	USD	80.71	2020-07-13	0	0	2020-07-12 10:00:40.433913	2020-07-12 10:00:40.433913	\N	\N	\N
2443027	67	1	Trendy Garden View Room	USD	213.59	2020-07-13	0	0	2020-07-12 10:00:40.439974	2020-07-12 10:00:40.439974	\N	\N	\N
2443028	160	1	2 Double Beds	USD	129	2020-07-13	0	0	2020-07-12 10:00:40.446221	2020-07-12 10:00:40.446221	\N	\N	\N
2443029	183	1	Business Deluxe, Guest room, 1 King	USD	159	2020-07-13	0	0	2020-07-12 10:00:40.453335	2020-07-12 10:00:40.453335	\N	\N	\N
2443030	54	1	Double Room	USD	165.05	2020-07-13	815.99	0	2020-07-12 10:00:40.475197	2020-07-12 10:00:40.475197	\N	\N	\N
2443031	47	1	Sea Facing Queen Room	USD	138.26	2020-07-13	0	0	2020-07-12 10:00:40.48261	2020-07-12 10:00:40.48261	\N	\N	\N
2443032	35	1	Twin - Non-Smoking	USD	98.23	2020-07-13	0	0	2020-07-12 10:00:40.489034	2020-07-12 10:00:40.489034	\N	\N	\N
2443033	38	1	Superior Double or Twin Room	USD	193.25	2020-07-13	0	0	2020-07-12 10:00:40.497045	2020-07-12 10:00:40.497045	\N	\N	\N
2443034	192	1	Comfort Room	USD	90.4	2020-07-13	225.99	0	2020-07-12 10:00:40.502926	2020-07-12 10:00:40.502926	\N	\N	\N
2443035	165	1	Basic Room	USD	91.42	2020-07-13	0	0	2020-07-12 10:00:40.509495	2020-07-12 10:00:40.509495	\N	\N	\N
2443036	215	1	Deluxe - 3 persons	USD	33.57	2020-07-13	134.3	25	2020-07-12 10:00:40.909785	2020-07-12 10:00:40.909785	\N	\N	\N
2443038	261	1	Superior Twin or Double Room	USD	62.2	2020-07-13	0	0	2020-07-12 10:00:40.927048	2020-07-12 10:00:40.927048	\N	\N	\N
2443039	224	1	Standard King	USD	67.52	2020-07-13	283.45	0	2020-07-12 10:00:40.933435	2020-07-12 10:00:40.933435	\N	\N	\N
2443040	300	1	Deluxe Room, Guestroom, 1 King	USD	138.18	2020-07-13	0	0	2020-07-12 10:00:40.940202	2020-07-12 10:00:40.940202	\N	\N	\N
2443041	301	1	Superior Double Room with Pool and Garden View	USD	183.88	2020-07-13	0	0	2020-07-12 10:00:40.946388	2020-07-12 10:00:40.946388	\N	\N	\N
2443042	293	1	Budget Double Room	USD	59.19	2020-07-13	0	0	2020-07-12 10:00:40.952282	2020-07-12 10:00:40.952282	\N	\N	\N
2443043	243	1	Twin Room	USD	71.59	2020-07-13	0	0	2020-07-12 10:00:40.958044	2020-07-12 10:00:40.958044	\N	\N	\N
2443044	256	1	Standard Double Room	USD	107.62	2020-07-13	0	0	2020-07-12 10:00:40.9643	2020-07-12 10:00:40.9643	\N	\N	\N
2443046	285	1	Superior Room king bed	USD	93.15	2020-07-13	0	0	2020-07-12 10:00:40.979245	2020-07-12 10:00:40.979245	\N	\N	\N
2443049	314	1	1 Double Bed Non-Smoking	USD	146.05	2020-07-13	0	0	2020-07-12 10:00:41.000342	2020-07-12 10:00:41.000342	\N	\N	\N
2443050	274	1	Standard Twin Room - Non-Smoking	USD	213.39	2020-07-13	392.91	0	2020-07-12 10:00:41.009479	2020-07-12 10:00:41.009479	\N	\N	\N
2443051	306	1	Deluxe King City View	USD	97.96	2020-07-13	302.12	30	2020-07-12 10:00:41.017446	2020-07-12 10:00:41.017446	\N	\N	\N
2443052	290	1	Standard	USD	95.77	2020-07-13	0	0	2020-07-12 10:00:41.024212	2020-07-12 10:00:41.024212	\N	\N	\N
2443056	258	1	Standard Double Room	USD	24.31	2020-07-13	0	0	2020-07-12 10:00:41.049848	2020-07-12 10:00:41.049848	\N	\N	\N
2443057	216	1	2 Double Accessible with Bathtub	USD	139	2020-07-13	0	0	2020-07-12 10:00:41.055936	2020-07-12 10:00:41.055936	\N	\N	\N
2443060	275	1	Double or Twin Room	USD	88.34	2020-07-13	0	0	2020-07-12 10:00:41.07968	2020-07-12 10:00:41.07968	\N	\N	\N
2443061	204	1	King Bed	USD	131.35	2020-07-13	0	0	2020-07-12 10:00:41.08582	2020-07-12 10:00:41.08582	\N	\N	\N
2443063	295	1	Classic Double or Twin	USD	158.12	2020-07-13	463.28	0	2020-07-12 10:00:41.098606	2020-07-12 10:00:41.098606	\N	\N	\N
2443066	268	1	Double Room	USD	105.24	2020-07-13	0	0	2020-07-12 10:00:41.118272	2020-07-12 10:00:41.118272	\N	\N	\N
2443067	307	1	1 King Bed	USD	381.68	2020-07-13	0	0	2020-07-12 10:00:41.124222	2020-07-12 10:00:41.124222	\N	\N	\N
2443068	251	1	Standard Queen Room	USD	93.75	2020-07-13	0	0	2020-07-12 10:00:41.130962	2020-07-12 10:00:41.130962	\N	\N	\N
2443070	302	1	Accessible 1 King Bed	USD	78.9	2020-07-13	300	0	2020-07-12 10:00:41.143429	2020-07-12 10:00:41.143429	\N	\N	\N
2443071	279	1	Loft Suite	USD	378.03	2020-07-13	0	0	2020-07-12 10:00:41.172063	2020-07-12 10:00:41.172063	\N	\N	\N
2443074	255	1	Mountain-View Room	USD	259.8	2020-07-13	0	0	2020-07-12 10:00:41.193352	2020-07-12 10:00:41.193352	\N	\N	\N
2443077	249	1	Standard Triple Room	USD	97.58	2020-07-13	0	0	2020-07-12 10:00:41.212526	2020-07-12 10:00:41.212526	\N	\N	\N
2443079	206	1	Standard	USD	78.93	2020-07-13	0	0	2020-07-12 10:00:41.224268	2020-07-12 10:00:41.224268	\N	\N	\N
2443080	263	1	Queen Hilton Guestroom	USD	98.23	2020-07-13	0	0	2020-07-12 10:00:41.232822	2020-07-12 10:00:41.232822	\N	\N	\N
2504061	23	1	1 King Bed Evolution Room 	USD	129	2020-07-14	0	0	2020-07-13 10:00:40.416695	2020-07-13 10:00:40.416695	\N	\N	\N
2504062	45	1	Classic Double or Twin	USD	101.69	2020-07-14	0	0	2020-07-13 10:00:40.434992	2020-07-13 10:00:40.434992	\N	\N	\N
2504063	115	1	Double Room	USD	63.49	2020-07-14	0	0	2020-07-13 10:00:40.45142	2020-07-13 10:00:40.45142	\N	\N	\N
2504064	162	1	Flexible Room	USD	173.6	2020-07-14	0	0	2020-07-13 10:00:40.458651	2020-07-13 10:00:40.458651	\N	\N	\N
2504065	75	1	Low Floor Small Single Room - Smoking	USD	72.25	2020-07-14	213.03	0	2020-07-13 10:00:40.465631	2020-07-13 10:00:40.465631	\N	\N	\N
2504066	158	1	Superior Twin Non-Smoking	USD	94.29	2020-07-14	0	0	2020-07-13 10:00:40.474155	2020-07-13 10:00:40.474155	\N	\N	\N
2504067	201	1	Classic Double Room	USD	105.24	2020-07-14	0	0	2020-07-13 10:00:40.482311	2020-07-13 10:00:40.482311	\N	\N	\N
2504068	131	1	Superior Double Room	USD	51.33	2020-07-14	0	0	2020-07-13 10:00:40.489805	2020-07-13 10:00:40.489805	\N	\N	\N
2504069	184	1	Superior Room	USD	77.48	2020-07-14	450.61	0	2020-07-13 10:00:40.497043	2020-07-13 10:00:40.497043	\N	\N	\N
2504070	176	1	Economy Twin Room	USD	127.38	2020-07-14	0	0	2020-07-13 10:00:40.503596	2020-07-13 10:00:40.503596	\N	\N	\N
2504071	113	1	2 Queen Beds 	USD	177.65	2020-07-14	0	0	2020-07-13 10:00:40.510141	2020-07-13 10:00:40.510141	\N	\N	\N
2504072	53	1	Superior Twin	USD	142.19	2020-07-14	0	0	2020-07-13 10:00:40.516256	2020-07-13 10:00:40.516256	\N	\N	\N
2504073	143	1	Standard Double Room	USD	172.29	2020-07-14	0	0	2020-07-13 10:00:40.522488	2020-07-13 10:00:40.522488	\N	\N	\N
2504074	108	1	Standard Double Room	USD	67.04	2020-07-14	0	0	2020-07-13 10:00:40.528424	2020-07-13 10:00:40.528424	\N	\N	\N
2504075	17	1	Double Room	USD	37.58	2020-07-14	0	0	2020-07-13 10:00:40.534115	2020-07-13 10:00:40.534115	\N	\N	\N
2504076	13	1	Premium Twin Room with Two Double Beds	USD	127.97	2020-07-14	0	0	2020-07-13 10:00:40.541459	2020-07-13 10:00:40.541459	\N	\N	\N
2504077	64	1	Basic Double or Twin Room	USD	59.58	2020-07-14	0	0	2020-07-13 10:00:40.547997	2020-07-13 10:00:40.547997	\N	\N	\N
2504078	125	1	Standard Double or Twin Room	USD	27	2020-07-14	0	0	2020-07-13 10:00:40.554949	2020-07-13 10:00:40.554949	\N	\N	\N
2504079	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-14	0	0	2020-07-13 10:00:40.565202	2020-07-13 10:00:40.565202	\N	\N	\N
2504080	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-14	0	0	2020-07-13 10:00:40.571453	2020-07-13 10:00:40.571453	\N	\N	\N
2504081	194	1	Standard Small Double Room - Non-Smoking	USD	180.14	2020-07-14	0	0	2020-07-13 10:00:40.578751	2020-07-13 10:00:40.578751	\N	\N	\N
2504082	95	1	 Twin Guestroom	USD	141.57	2020-07-14	0	0	2020-07-13 10:00:40.585319	2020-07-13 10:00:40.585319	\N	\N	\N
2504083	157	1	Cosy Small Room	USD	100.58	2020-07-14	0	0	2020-07-13 10:00:40.591993	2020-07-13 10:00:40.591993	\N	\N	\N
2504084	26	1	Double	USD	85.28	2020-07-14	0	0	2020-07-13 10:00:40.601303	2020-07-13 10:00:40.601303	\N	\N	\N
2504085	61	1	Modern Double Room	USD	194.77	2020-07-14	0	0	2020-07-13 10:00:40.6079	2020-07-13 10:00:40.6079	\N	\N	\N
2504086	109	1	Classic Double Room	USD	169.19	2020-07-14	0	0	2020-07-13 10:00:40.613573	2020-07-13 10:00:40.613573	\N	\N	\N
2504087	84	1	Double or Twin Room	USD	56.5	2020-07-14	0	0	2020-07-13 10:00:40.619124	2020-07-13 10:00:40.619124	\N	\N	\N
2504088	181	1	Superior Double Room	USD	61.94	2020-07-14	0	0	2020-07-13 10:00:40.62491	2020-07-13 10:00:40.62491	\N	\N	\N
2504089	49	1	Superior Twin Room	USD	117.3	2020-07-14	0	0	2020-07-13 10:00:40.630849	2020-07-13 10:00:40.630849	\N	\N	\N
2504090	136	1	Standard Double or Twin Room	USD	118.96	2020-07-14	0	0	2020-07-13 10:00:40.638846	2020-07-13 10:00:40.638846	\N	\N	\N
2504091	98	1	Double or Twin	USD	77.04	2020-07-14	0	0	2020-07-13 10:00:40.644505	2020-07-13 10:00:40.644505	\N	\N	\N
2504092	159	1	Standard Room with 1 double bed and sofa	USD	85.01	2020-07-14	0	0	2020-07-13 10:00:40.652097	2020-07-13 10:00:40.652097	\N	\N	\N
2504093	42	1	Two-Bedroom Apartment	USD	96.05	2020-07-14	0	0	2020-07-13 10:00:40.665291	2020-07-13 10:00:40.665291	\N	\N	\N
2504094	3	1	Deluxe 	USD	139.69	2020-07-14	335.08	0	2020-07-13 10:00:40.671501	2020-07-13 10:00:40.671501	\N	\N	\N
2504095	90	1	Standard Room	USD	99.7	2020-07-14	398.81	0	2020-07-13 10:00:40.678283	2020-07-13 10:00:40.678283	\N	\N	\N
2504096	106	1	Double Room with Two Single Beds	USD	30.75	2020-07-14	0	0	2020-07-13 10:00:40.684029	2020-07-13 10:00:40.684029	\N	\N	\N
2504097	4	1	Twin Room	USD	109.51	2020-07-14	0	0	2020-07-13 10:00:40.689794	2020-07-13 10:00:40.689794	\N	\N	\N
2504098	27	1	Standard Twin Room - Smoking	USD	166.99	2020-07-14	543.34	0	2020-07-13 10:00:40.69538	2020-07-13 10:00:40.69538	\N	\N	\N
2504099	77	1	Double Room - North Side	USD	147.61	2020-07-14	0	0	2020-07-13 10:00:40.701175	2020-07-13 10:00:40.701175	\N	\N	\N
2504100	31	1	Classic Double or Twin Room with Hill View	USD	387.27	2020-07-14	0	0	2020-07-13 10:00:40.706795	2020-07-13 10:00:40.706795	\N	\N	\N
2504101	18	1	Superior Room	USD	127.61	2020-07-14	0	0	2020-07-13 10:00:40.712424	2020-07-13 10:00:40.712424	\N	\N	\N
2504102	202	1	2 Queen Beds, Pool Area	USD	95.52	2020-07-14	220.44	0	2020-07-13 10:00:40.718378	2020-07-13 10:00:40.718378	\N	\N	\N
2504103	139	1	Small Double	USD	121.21	2020-07-14	484.85	0	2020-07-13 10:00:40.723954	2020-07-13 10:00:40.723954	\N	\N	\N
2504104	14	1	Classic Double Bed	USD	122.74	2020-07-14	0	0	2020-07-13 10:00:40.730622	2020-07-13 10:00:40.730622	\N	\N	\N
2504105	79	1	Standard Room	USD	80.71	2020-07-14	0	0	2020-07-13 10:00:40.736843	2020-07-13 10:00:40.736843	\N	\N	\N
2504106	67	1	Trendy Garden View Room	USD	213.59	2020-07-14	0	0	2020-07-13 10:00:40.74245	2020-07-13 10:00:40.74245	\N	\N	\N
2504107	160	1	2 Double Beds	USD	129	2020-07-14	0	0	2020-07-13 10:00:40.767958	2020-07-13 10:00:40.767958	\N	\N	\N
2504108	183	1	Business Deluxe, Guest room, 1 King	USD	169	2020-07-14	0	0	2020-07-13 10:00:40.774619	2020-07-13 10:00:40.774619	\N	\N	\N
2504109	54	1	Double Room	USD	165.05	2020-07-14	815.99	0	2020-07-13 10:00:40.780744	2020-07-13 10:00:40.780744	\N	\N	\N
2504110	47	1	Standard room half board	USD	148.55	2020-07-14	500	0	2020-07-13 10:00:40.788318	2020-07-13 10:00:40.788318	\N	\N	\N
2504111	35	1	Twin - Non-Smoking	USD	98.23	2020-07-14	0	0	2020-07-13 10:00:40.794978	2020-07-13 10:00:40.794978	\N	\N	\N
2504112	38	1	Superior Double or Twin Room	USD	193.25	2020-07-14	0	0	2020-07-13 10:00:40.802094	2020-07-13 10:00:40.802094	\N	\N	\N
2504113	192	1	Comfort Room	USD	90.4	2020-07-14	225.99	0	2020-07-13 10:00:40.807835	2020-07-13 10:00:40.807835	\N	\N	\N
2504114	165	1	Basic Room	USD	91.42	2020-07-14	0	0	2020-07-13 10:00:40.813998	2020-07-13 10:00:40.813998	\N	\N	\N
2504115	215	1	Deluxe - 3 persons	USD	33.57	2020-07-14	134.3	25	2020-07-13 10:00:41.24061	2020-07-13 10:00:41.24061	\N	\N	\N
2504117	261	1	Superior Twin or Double Room	USD	62.2	2020-07-14	0	0	2020-07-13 10:00:41.261813	2020-07-13 10:00:41.261813	\N	\N	\N
2504118	224	1	Standard King	USD	67.52	2020-07-14	283.45	0	2020-07-13 10:00:41.268048	2020-07-13 10:00:41.268048	\N	\N	\N
2504119	300	1	Deluxe Room, Guestroom, 1 King	USD	138.18	2020-07-14	0	0	2020-07-13 10:00:41.275053	2020-07-13 10:00:41.275053	\N	\N	\N
2504120	301	1	Comfort Double or Twin Room	USD	147.92	2020-07-14	0	0	2020-07-13 10:00:41.281279	2020-07-13 10:00:41.281279	\N	\N	\N
2504121	293	1	Budget Double Room	USD	59.19	2020-07-14	0	0	2020-07-13 10:00:41.286881	2020-07-13 10:00:41.286881	\N	\N	\N
2504122	243	1	Twin Room	USD	71.59	2020-07-14	0	0	2020-07-13 10:00:41.292627	2020-07-13 10:00:41.292627	\N	\N	\N
2504123	256	1	Standard Double Room	USD	107.62	2020-07-14	0	0	2020-07-13 10:00:41.299803	2020-07-13 10:00:41.299803	\N	\N	\N
2504124	285	1	Superior Room king bed	USD	95.99	2020-07-14	0	0	2020-07-13 10:00:41.307573	2020-07-13 10:00:41.307573	\N	\N	\N
2504127	314	1	1 Double Bed Non-Smoking	USD	146.05	2020-07-14	0	0	2020-07-13 10:00:41.326489	2020-07-13 10:00:41.326489	\N	\N	\N
2504128	274	1	Double Room - Non-Smoking	USD	230.4	2020-07-14	0	0	2020-07-13 10:00:41.335946	2020-07-13 10:00:41.335946	\N	\N	\N
2504129	306	1	Deluxe King City View	USD	97.96	2020-07-14	302.12	30	2020-07-13 10:00:41.342953	2020-07-13 10:00:41.342953	\N	\N	\N
2504130	290	1	Standard	USD	95.77	2020-07-14	0	0	2020-07-13 10:00:41.348849	2020-07-13 10:00:41.348849	\N	\N	\N
2504134	258	1	Standard Double Room	USD	24.31	2020-07-14	0	0	2020-07-13 10:00:41.383312	2020-07-13 10:00:41.383312	\N	\N	\N
2504135	216	1	2 Double Accessible with Bathtub	USD	129	2020-07-14	0	0	2020-07-13 10:00:41.389162	2020-07-13 10:00:41.389162	\N	\N	\N
2504138	275	1	Double or Twin Room	USD	88.34	2020-07-14	0	0	2020-07-13 10:00:41.408518	2020-07-13 10:00:41.408518	\N	\N	\N
2504139	204	1	King Bed	USD	131.35	2020-07-14	0	0	2020-07-13 10:00:41.414345	2020-07-13 10:00:41.414345	\N	\N	\N
2504141	295	1	Classic Double or Twin	USD	158.12	2020-07-14	463.28	0	2020-07-13 10:00:41.427903	2020-07-13 10:00:41.427903	\N	\N	\N
2504144	268	1	Double Room	USD	105.24	2020-07-14	0	0	2020-07-13 10:00:41.449059	2020-07-13 10:00:41.449059	\N	\N	\N
2504145	307	1	1 King Bed	USD	381.68	2020-07-14	0	0	2020-07-13 10:00:41.467538	2020-07-13 10:00:41.467538	\N	\N	\N
2504146	251	1	Standard Queen Room	USD	93.75	2020-07-14	0	0	2020-07-13 10:00:41.474949	2020-07-13 10:00:41.474949	\N	\N	\N
2504148	302	1	Accessible 1 King Bed	USD	78.9	2020-07-14	300	0	2020-07-13 10:00:41.488238	2020-07-13 10:00:41.488238	\N	\N	\N
2504151	255	1	Mountain-View Room	USD	259.8	2020-07-14	0	0	2020-07-13 10:00:41.51509	2020-07-13 10:00:41.51509	\N	\N	\N
2504154	249	1	Superior Room with Double Bed	USD	97.58	2020-07-14	0	0	2020-07-13 10:00:41.534866	2020-07-13 10:00:41.534866	\N	\N	\N
2504156	206	1	Standard	USD	78.93	2020-07-14	0	0	2020-07-13 10:00:41.566898	2020-07-13 10:00:41.566898	\N	\N	\N
2504157	263	1	Queen Hilton Guestroom	USD	154.36	2020-07-14	0	0	2020-07-13 10:00:41.573201	2020-07-13 10:00:41.573201	\N	\N	\N
2565609	23	1	1 King Bed Evolution Room 	USD	129	2020-07-15	0	0	2020-07-14 10:00:43.607564	2020-07-14 10:00:43.607564	\N	\N	\N
2565610	45	1	Classic Double or Twin	USD	102.32	2020-07-15	0	0	2020-07-14 10:00:43.629146	2020-07-14 10:00:43.629146	\N	\N	\N
2565611	115	1	Double Room	USD	63.88	2020-07-15	0	0	2020-07-14 10:00:43.649685	2020-07-14 10:00:43.649685	\N	\N	\N
2565612	162	1	Flexible Room	USD	174.67	2020-07-15	0	0	2020-07-14 10:00:43.658965	2020-07-14 10:00:43.658965	\N	\N	\N
2565613	75	1	Small Single Room - Non-Smoking	USD	72.81	2020-07-15	212.46	0	2020-07-14 10:00:43.666537	2020-07-14 10:00:43.666537	\N	\N	\N
2565614	158	1	Superior Twin Non-Smoking	USD	85.75	2020-07-15	0	0	2020-07-14 10:00:43.675967	2020-07-14 10:00:43.675967	\N	\N	\N
2565615	153	1	Standard Twin Room	USD	231.49	2020-07-15	0	0	2020-07-14 10:00:43.682011	2020-07-14 10:00:43.682011	\N	\N	\N
2565616	201	1	Classic Double Room	USD	105.12	2020-07-15	0	0	2020-07-14 10:00:43.691412	2020-07-14 10:00:43.691412	\N	\N	\N
2565617	131	1	Superior Double Room	USD	51.31	2020-07-15	0	0	2020-07-14 10:00:43.699606	2020-07-14 10:00:43.699606	\N	\N	\N
2565618	184	1	Superior Room	USD	77.16	2020-07-15	450.61	0	2020-07-14 10:00:43.70597	2020-07-14 10:00:43.70597	\N	\N	\N
2565619	176	1	Economy Twin Room	USD	122.99	2020-07-15	0	0	2020-07-14 10:00:43.714007	2020-07-14 10:00:43.714007	\N	\N	\N
2565620	113	1	2 Queen Beds 	USD	152.15	2020-07-15	0	0	2020-07-14 10:00:43.719925	2020-07-14 10:00:43.719925	\N	\N	\N
2565621	53	1	Superior Twin	USD	130.96	2020-07-15	0	0	2020-07-14 10:00:43.727197	2020-07-14 10:00:43.727197	\N	\N	\N
2565622	143	1	Standard Double Room	USD	141.2	2020-07-15	0	0	2020-07-14 10:00:43.733392	2020-07-14 10:00:43.733392	\N	\N	\N
2565623	108	1	Standard Double Room	USD	67.45	2020-07-15	0	0	2020-07-14 10:00:43.739298	2020-07-14 10:00:43.739298	\N	\N	\N
2565624	17	1	Double Room	USD	37.69	2020-07-15	0	0	2020-07-14 10:00:43.74574	2020-07-14 10:00:43.74574	\N	\N	\N
2565625	13	1	Premium Twin Room with Two Double Beds	USD	128.16	2020-07-15	0	0	2020-07-14 10:00:43.753455	2020-07-14 10:00:43.753455	\N	\N	\N
2565626	64	1	Basic Double or Twin Room	USD	59.95	2020-07-15	0	0	2020-07-14 10:00:43.760049	2020-07-14 10:00:43.760049	\N	\N	\N
2565627	125	1	Standard Double or Twin Room	USD	27	2020-07-15	0	0	2020-07-14 10:00:43.766463	2020-07-14 10:00:43.766463	\N	\N	\N
2565628	199	1	Standard Room with 1 double bed	USD	32.26	2020-07-15	0	0	2020-07-14 10:00:43.7724	2020-07-14 10:00:43.7724	\N	\N	\N
2565629	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-15	0	0	2020-07-14 10:00:43.778372	2020-07-14 10:00:43.778372	\N	\N	\N
2565630	194	1	Standard Small Double Room - Non-Smoking	USD	183.52	2020-07-15	0	0	2020-07-14 10:00:43.785661	2020-07-14 10:00:43.785661	\N	\N	\N
2565631	95	1	 Twin Guestroom	USD	151.13	2020-07-15	0	0	2020-07-14 10:00:43.79283	2020-07-14 10:00:43.79283	\N	\N	\N
2565632	157	1	Cosy Small Room	USD	101.2	2020-07-15	0	0	2020-07-14 10:00:43.800697	2020-07-14 10:00:43.800697	\N	\N	\N
2565633	26	1	Double	USD	96.53	2020-07-15	0	0	2020-07-14 10:00:43.806488	2020-07-14 10:00:43.806488	\N	\N	\N
2565634	164	1	Standard Twin Room	USD	218.33	2020-07-15	0	0	2020-07-14 10:00:43.81224	2020-07-14 10:00:43.81224	\N	\N	\N
2565635	61	1	Modern Double Room	USD	174.32	2020-07-15	0	0	2020-07-14 10:00:43.821093	2020-07-14 10:00:43.821093	\N	\N	\N
2565636	109	1	Classic Double Room	USD	170.23	2020-07-15	0	0	2020-07-14 10:00:43.827212	2020-07-14 10:00:43.827212	\N	\N	\N
2565637	84	1	Double or Twin Room	USD	56.84	2020-07-15	0	0	2020-07-14 10:00:43.832955	2020-07-14 10:00:43.832955	\N	\N	\N
2565638	181	1	Superior Double Room	USD	61.94	2020-07-15	0	0	2020-07-14 10:00:43.838712	2020-07-14 10:00:43.838712	\N	\N	\N
2565639	49	1	Superior Twin Room	USD	118.02	2020-07-15	0	0	2020-07-14 10:00:43.844328	2020-07-14 10:00:43.844328	\N	\N	\N
2565640	136	1	Standard Double or Twin Room	USD	119.57	2020-07-15	0	0	2020-07-14 10:00:43.855061	2020-07-14 10:00:43.855061	\N	\N	\N
2565641	98	1	Double or Twin	USD	77.51	2020-07-15	0	0	2020-07-14 10:00:43.869465	2020-07-14 10:00:43.869465	\N	\N	\N
2565642	159	1	Standard Room with 1 double bed and sofa	USD	85.54	2020-07-15	0	0	2020-07-14 10:00:43.876548	2020-07-14 10:00:43.876548	\N	\N	\N
2565643	42	1	Two-Bedroom Apartment	USD	96.05	2020-07-15	0	0	2020-07-14 10:00:43.88256	2020-07-14 10:00:43.88256	\N	\N	\N
2565644	3	1	Deluxe 	USD	139.59	2020-07-15	334.84	0	2020-07-14 10:00:43.890244	2020-07-14 10:00:43.890244	\N	\N	\N
2565645	90	1	Standard Room	USD	100.32	2020-07-15	401.26	0	2020-07-14 10:00:43.896644	2020-07-14 10:00:43.896644	\N	\N	\N
2565646	106	1	Double Room with Two Single Beds	USD	30.69	2020-07-15	0	0	2020-07-14 10:00:43.902398	2020-07-14 10:00:43.902398	\N	\N	\N
2565647	4	1	Twin Room	USD	110.19	2020-07-15	0	0	2020-07-14 10:00:43.908169	2020-07-14 10:00:43.908169	\N	\N	\N
2565648	27	1	Standard Twin Room - Smoking	USD	166.54	2020-07-15	541.89	0	2020-07-14 10:00:43.913983	2020-07-14 10:00:43.913983	\N	\N	\N
2565649	77	1	Double Room - North Side	USD	156.89	2020-07-15	0	0	2020-07-14 10:00:43.919739	2020-07-14 10:00:43.919739	\N	\N	\N
2565650	31	1	Classic Double or Twin Room with Hill View	USD	389.64	2020-07-15	0	0	2020-07-14 10:00:43.925722	2020-07-14 10:00:43.925722	\N	\N	\N
2565651	18	1	Superior Room	USD	127.4	2020-07-15	0	0	2020-07-14 10:00:43.931549	2020-07-14 10:00:43.931549	\N	\N	\N
2565652	202	1	2 Queen Beds, Pool Area	USD	95.8	2020-07-15	221.09	0	2020-07-14 10:00:43.937267	2020-07-14 10:00:43.937267	\N	\N	\N
2565653	139	1	Small Double	USD	121.95	2020-07-15	487.82	0	2020-07-14 10:00:43.943248	2020-07-14 10:00:43.943248	\N	\N	\N
2565654	14	1	Classic Double Bed	USD	123.5	2020-07-15	0	0	2020-07-14 10:00:43.967435	2020-07-14 10:00:43.967435	\N	\N	\N
2565655	79	1	Standard Room	USD	81.21	2020-07-15	0	0	2020-07-14 10:00:43.973484	2020-07-14 10:00:43.973484	\N	\N	\N
2565656	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.3	2020-07-15	0	0	2020-07-14 10:00:43.9792	2020-07-14 10:00:43.9792	\N	\N	\N
2565657	67	1	Trendy Garden View Room	USD	213.59	2020-07-15	0	0	2020-07-14 10:00:43.984964	2020-07-14 10:00:43.984964	\N	\N	\N
2565658	160	1	2 Double Beds	USD	129	2020-07-15	0	0	2020-07-14 10:00:43.990662	2020-07-14 10:00:43.990662	\N	\N	\N
2565659	183	1	Business Deluxe, Guest room, 1 King	USD	169	2020-07-15	0	0	2020-07-14 10:00:43.996875	2020-07-14 10:00:43.996875	\N	\N	\N
2565660	54	1	Double Room	USD	165.1	2020-07-15	816.25	0	2020-07-14 10:00:44.003592	2020-07-14 10:00:44.003592	\N	\N	\N
2565661	47	1	Garden Facing Queen Room	USD	97.93	2020-07-15	0	0	2020-07-14 10:00:44.010938	2020-07-14 10:00:44.010938	\N	\N	\N
2565662	35	1	Twin - Non-Smoking	USD	97.97	2020-07-15	0	0	2020-07-14 10:00:44.018185	2020-07-14 10:00:44.018185	\N	\N	\N
2565663	38	1	Superior Double or Twin Room	USD	194.44	2020-07-15	0	0	2020-07-14 10:00:44.026058	2020-07-14 10:00:44.026058	\N	\N	\N
2565664	192	1	Comfort Room	USD	90.95	2020-07-15	227.38	0	2020-07-14 10:00:44.031792	2020-07-14 10:00:44.031792	\N	\N	\N
2565665	165	1	Basic Room	USD	91.98	2020-07-15	0	0	2020-07-14 10:00:44.039478	2020-07-14 10:00:44.039478	\N	\N	\N
2565666	190	1	King Hilton Guestroom	USD	73.49	2020-07-15	0	0	2020-07-14 10:00:44.045362	2020-07-14 10:00:44.045362	\N	\N	\N
2565667	215	1	Deluxe - 3 persons	USD	32.23	2020-07-15	128.91	25	2020-07-14 10:00:44.428554	2020-07-14 10:00:44.428554	\N	\N	\N
2565669	261	1	Superior Twin or Double Room	USD	62.2	2020-07-15	0	0	2020-07-14 10:00:44.4506	2020-07-14 10:00:44.4506	\N	\N	\N
2565670	224	1	Standard King	USD	67.54	2020-07-15	283.55	0	2020-07-14 10:00:44.456587	2020-07-14 10:00:44.456587	\N	\N	\N
2565671	300	1	Deluxe Room, Guestroom, 1 King	USD	138.18	2020-07-15	0	0	2020-07-14 10:00:44.462744	2020-07-14 10:00:44.462744	\N	\N	\N
2565672	301	1	Superior Double Room with Pool and Garden View	USD	174.67	2020-07-15	0	0	2020-07-14 10:00:44.468898	2020-07-14 10:00:44.468898	\N	\N	\N
2565673	293	1	Budget Double Room	USD	59.55	2020-07-15	0	0	2020-07-14 10:00:44.47511	2020-07-14 10:00:44.47511	\N	\N	\N
2565674	243	1	Twin Room	USD	72.03	2020-07-15	0	0	2020-07-14 10:00:44.480995	2020-07-14 10:00:44.480995	\N	\N	\N
2565675	256	1	Standard Double Room	USD	108.28	2020-07-15	0	0	2020-07-14 10:00:44.487358	2020-07-14 10:00:44.487358	\N	\N	\N
2565677	285	1	Superior Room king bed	USD	96.54	2020-07-15	0	0	2020-07-14 10:00:44.50187	2020-07-14 10:00:44.50187	\N	\N	\N
2565680	314	1	1 Double Bed Non-Smoking	USD	146.94	2020-07-15	0	0	2020-07-14 10:00:44.52281	2020-07-14 10:00:44.52281	\N	\N	\N
2565681	274	1	Double Room - Non-Smoking	USD	229.78	2020-07-15	0	0	2020-07-14 10:00:44.532732	2020-07-14 10:00:44.532732	\N	\N	\N
2565682	306	1	Deluxe King City View	USD	99	2020-07-15	302.12	30	2020-07-14 10:00:44.540994	2020-07-14 10:00:44.540994	\N	\N	\N
2565683	290	1	Standard	USD	96.36	2020-07-15	0	0	2020-07-14 10:00:44.547909	2020-07-14 10:00:44.547909	\N	\N	\N
2565687	258	1	Standard Double Room	USD	24.26	2020-07-15	0	0	2020-07-14 10:00:44.580386	2020-07-14 10:00:44.580386	\N	\N	\N
2565688	216	1	2 Double Accessible with Bathtub	USD	139	2020-07-15	0	0	2020-07-14 10:00:44.587568	2020-07-14 10:00:44.587568	\N	\N	\N
2565691	275	1	Double or Twin Room	USD	88.88	2020-07-15	0	0	2020-07-14 10:00:44.608331	2020-07-14 10:00:44.608331	\N	\N	\N
2565692	204	1	King Bed	USD	131.73	2020-07-15	0	0	2020-07-14 10:00:44.614268	2020-07-14 10:00:44.614268	\N	\N	\N
2565694	295	1	Classic Double or Twin	USD	160.74	2020-07-15	466.12	0	2020-07-14 10:00:44.626911	2020-07-14 10:00:44.626911	\N	\N	\N
2565697	268	1	Double Room	USD	105.12	2020-07-15	0	0	2020-07-14 10:00:44.649524	2020-07-14 10:00:44.649524	\N	\N	\N
2565698	307	1	1 King Bed	USD	380.66	2020-07-15	0	0	2020-07-14 10:00:44.67475	2020-07-14 10:00:44.67475	\N	\N	\N
2565699	251	1	Standard Queen Room	USD	94.38	2020-07-15	0	0	2020-07-14 10:00:44.681959	2020-07-14 10:00:44.681959	\N	\N	\N
2565701	302	1	Executive King Room	USD	89.14	2020-07-15	109.99	0	2020-07-14 10:00:44.694863	2020-07-14 10:00:44.694863	\N	\N	\N
2565702	279	1	Anchorage Room	USD	284.98	2020-07-15	0	0	2020-07-14 10:00:44.700603	2020-07-14 10:00:44.700603	\N	\N	\N
2565707	249	1	Standard Triple Room	USD	98.18	2020-07-15	0	0	2020-07-14 10:00:44.738348	2020-07-14 10:00:44.738348	\N	\N	\N
2565709	206	1	Standard	USD	72.54	2020-07-15	0	0	2020-07-14 10:00:44.766126	2020-07-14 10:00:44.766126	\N	\N	\N
2565710	263	1	Queen Hilton Guestroom	USD	153.95	2020-07-15	0	0	2020-07-14 10:00:44.77223	2020-07-14 10:00:44.77223	\N	\N	\N
2627230	23	1	1 King Bed Evolution Room 	USD	129	2020-07-16	0	0	2020-07-15 10:00:42.528048	2020-07-15 10:00:42.528048	\N	\N	\N
2627231	45	1	Classic Double or Twin	USD	102.63	2020-07-16	0	0	2020-07-15 10:00:42.547703	2020-07-15 10:00:42.547703	\N	\N	\N
2627232	115	1	Double Room	USD	64.08	2020-07-16	0	0	2020-07-15 10:00:42.565958	2020-07-15 10:00:42.565958	\N	\N	\N
2627233	162	1	Flexible Room	USD	175.21	2020-07-16	0	0	2020-07-15 10:00:42.574107	2020-07-15 10:00:42.574107	\N	\N	\N
2627234	75	1	Low Floor Small Single Room - Smoking	USD	72.05	2020-07-16	212.44	0	2020-07-15 10:00:42.582869	2020-07-15 10:00:42.582869	\N	\N	\N
2627235	158	1	Superior Twin Non-Smoking	USD	85.64	2020-07-16	0	0	2020-07-15 10:00:42.590752	2020-07-15 10:00:42.590752	\N	\N	\N
2627236	153	1	Standard Twin Room	USD	244.35	2020-07-16	0	0	2020-07-15 10:00:42.597391	2020-07-15 10:00:42.597391	\N	\N	\N
2627237	201	1	Classic Double Room	USD	106.98	2020-07-16	0	0	2020-07-15 10:00:42.604404	2020-07-15 10:00:42.604404	\N	\N	\N
2627238	131	1	Superior Double Room	USD	50.95	2020-07-16	0	0	2020-07-15 10:00:42.611229	2020-07-15 10:00:42.611229	\N	\N	\N
2627239	184	1	Superior Room	USD	75.15	2020-07-16	441.61	0	2020-07-15 10:00:42.61818	2020-07-15 10:00:42.61818	\N	\N	\N
2627240	176	1	Economy Twin Room	USD	123.37	2020-07-16	0	0	2020-07-15 10:00:42.626971	2020-07-15 10:00:42.626971	\N	\N	\N
2627241	113	1	2 Queen Beds 	USD	152.15	2020-07-16	0	0	2020-07-15 10:00:42.633122	2020-07-15 10:00:42.633122	\N	\N	\N
2627242	53	1	Superior Twin	USD	130.01	2020-07-16	0	0	2020-07-15 10:00:42.640584	2020-07-15 10:00:42.640584	\N	\N	\N
2627243	143	1	Standard Double Room	USD	140.81	2020-07-16	0	0	2020-07-15 10:00:42.647506	2020-07-15 10:00:42.647506	\N	\N	\N
2627244	108	1	Standard Double Room	USD	67.66	2020-07-16	0	0	2020-07-15 10:00:42.654314	2020-07-15 10:00:42.654314	\N	\N	\N
2627245	17	1	Double Room	USD	37.55	2020-07-16	0	0	2020-07-15 10:00:42.66582	2020-07-15 10:00:42.66582	\N	\N	\N
2627246	13	1	Premium Twin Room with Two Double Beds	USD	127.23	2020-07-16	0	0	2020-07-15 10:00:42.673449	2020-07-15 10:00:42.673449	\N	\N	\N
2627247	64	1	Basic Double or Twin Room	USD	60.13	2020-07-16	0	0	2020-07-15 10:00:42.681265	2020-07-15 10:00:42.681265	\N	\N	\N
2627248	125	1	Standard Double or Twin Room	USD	27	2020-07-16	0	0	2020-07-15 10:00:42.687838	2020-07-15 10:00:42.687838	\N	\N	\N
2627249	199	1	Standard Room with 1 double bed	USD	32.25	2020-07-16	0	0	2020-07-15 10:00:42.694085	2020-07-15 10:00:42.694085	\N	\N	\N
2627250	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-16	0	0	2020-07-15 10:00:42.700344	2020-07-15 10:00:42.700344	\N	\N	\N
2627251	194	1	Standard Small Double Room - Non-Smoking	USD	183.5	2020-07-16	0	0	2020-07-15 10:00:42.712543	2020-07-15 10:00:42.712543	\N	\N	\N
2627252	95	1	 Twin Guestroom	USD	142.88	2020-07-16	0	0	2020-07-15 10:00:42.719838	2020-07-15 10:00:42.719838	\N	\N	\N
2627253	157	1	Cosy Small Room	USD	101.6	2020-07-16	0	0	2020-07-15 10:00:42.72766	2020-07-15 10:00:42.72766	\N	\N	\N
2627254	26	1	Double	USD	91.45	2020-07-16	0	0	2020-07-15 10:00:42.734117	2020-07-15 10:00:42.734117	\N	\N	\N
2627255	61	1	Modern Double Room	USD	174.67	2020-07-16	0	0	2020-07-15 10:00:42.740915	2020-07-15 10:00:42.740915	\N	\N	\N
2627256	109	1	Classic Double Room	USD	170.75	2020-07-16	0	0	2020-07-15 10:00:42.747136	2020-07-15 10:00:42.747136	\N	\N	\N
2627257	84	1	Double or Twin Room	USD	57.02	2020-07-16	0	0	2020-07-15 10:00:42.753425	2020-07-15 10:00:42.753425	\N	\N	\N
2627258	181	1	Superior Double Room	USD	61.94	2020-07-16	0	0	2020-07-15 10:00:42.765263	2020-07-15 10:00:42.765263	\N	\N	\N
2627259	49	1	Superior Twin Room	USD	118.38	2020-07-16	0	0	2020-07-15 10:00:42.771531	2020-07-15 10:00:42.771531	\N	\N	\N
2627260	136	1	Standard Double or Twin Room	USD	119.54	2020-07-16	0	0	2020-07-15 10:00:42.779117	2020-07-15 10:00:42.779117	\N	\N	\N
2627261	98	1	Double or Twin	USD	77.75	2020-07-16	0	0	2020-07-15 10:00:42.785303	2020-07-15 10:00:42.785303	\N	\N	\N
2627262	159	1	Standard Room with 1 double bed and sofa	USD	85.8	2020-07-16	0	0	2020-07-15 10:00:42.79223	2020-07-15 10:00:42.79223	\N	\N	\N
2627263	42	1	Two-Bedroom Apartment	USD	113	2020-07-16	0	0	2020-07-15 10:00:42.800272	2020-07-15 10:00:42.800272	\N	\N	\N
2627264	3	1	Deluxe 	USD	138.84	2020-07-16	333.04	0	2020-07-15 10:00:42.806692	2020-07-15 10:00:42.806692	\N	\N	\N
2627265	90	1	Standard Room	USD	96.93	2020-07-16	387.73	0	2020-07-15 10:00:42.81393	2020-07-15 10:00:42.81393	\N	\N	\N
2627266	106	1	Double Room with Two Single Beds	USD	30.49	2020-07-16	0	0	2020-07-15 10:00:42.820991	2020-07-15 10:00:42.820991	\N	\N	\N
2627267	4	1	Twin Room	USD	110.53	2020-07-16	0	0	2020-07-15 10:00:42.827408	2020-07-15 10:00:42.827408	\N	\N	\N
2627268	27	1	Standard Twin Room - Smoking	USD	166.52	2020-07-16	541.83	0	2020-07-15 10:00:42.833785	2020-07-15 10:00:42.833785	\N	\N	\N
2627269	77	1	Double Room - North Side	USD	157.21	2020-07-16	0	0	2020-07-15 10:00:42.840574	2020-07-15 10:00:42.840574	\N	\N	\N
2627270	31	1	Classic Double or Twin Room with Hill View	USD	390.84	2020-07-16	0	0	2020-07-15 10:00:42.848405	2020-07-15 10:00:42.848405	\N	\N	\N
2627271	139	1	Small Double	USD	122.33	2020-07-16	489.33	0	2020-07-15 10:00:42.86549	2020-07-15 10:00:42.86549	\N	\N	\N
2627272	14	1	Classic Double Bed	USD	123.88	2020-07-16	0	0	2020-07-15 10:00:42.87257	2020-07-15 10:00:42.87257	\N	\N	\N
2627273	79	1	Standard Room	USD	81.46	2020-07-16	0	0	2020-07-15 10:00:42.879199	2020-07-15 10:00:42.879199	\N	\N	\N
2627274	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.29	2020-07-16	0	0	2020-07-15 10:00:42.888719	2020-07-15 10:00:42.888719	\N	\N	\N
2627275	67	1	Trendy Garden View Room	USD	213.59	2020-07-16	0	0	2020-07-15 10:00:42.894686	2020-07-15 10:00:42.894686	\N	\N	\N
2627276	160	1	King Accesible with Bathtub	USD	109	2020-07-16	0	0	2020-07-15 10:00:42.901074	2020-07-15 10:00:42.901074	\N	\N	\N
2627277	183	1	Business Deluxe, Guest room, 1 King	USD	126	2020-07-16	0	0	2020-07-15 10:00:42.909037	2020-07-15 10:00:42.909037	\N	\N	\N
2627278	54	1	Double Room	USD	165.43	2020-07-16	817.9	0	2020-07-15 10:00:42.915185	2020-07-15 10:00:42.915185	\N	\N	\N
2627279	47	1	Garden Facing Queen Room	USD	115.22	2020-07-16	0	0	2020-07-15 10:00:42.922458	2020-07-15 10:00:42.922458	\N	\N	\N
2627280	35	1	Twin - Non-Smoking	USD	97.95	2020-07-16	0	0	2020-07-15 10:00:42.929257	2020-07-15 10:00:42.929257	\N	\N	\N
2627281	38	1	Superior Double or Twin Room	USD	195.04	2020-07-16	0	0	2020-07-15 10:00:42.936249	2020-07-15 10:00:42.936249	\N	\N	\N
2627282	192	1	Comfort Room	USD	80.37	2020-07-16	228.08	0	2020-07-15 10:00:42.942035	2020-07-15 10:00:42.942035	\N	\N	\N
2627283	185	1	Standard Double	USD	133.21	2020-07-16	364.92	0	2020-07-15 10:00:42.948637	2020-07-15 10:00:42.948637	\N	\N	\N
2627284	165	1	Basic Room	USD	92.27	2020-07-16	0	0	2020-07-15 10:00:42.965791	2020-07-15 10:00:42.965791	\N	\N	\N
2627285	190	1	King Hilton Guestroom	USD	73.71	2020-07-16	0	0	2020-07-15 10:00:42.971484	2020-07-15 10:00:42.971484	\N	\N	\N
2627286	215	1	Deluxe - 3 persons	USD	32.23	2020-07-16	128.9	25	2020-07-15 10:00:43.345417	2020-07-15 10:00:43.345417	\N	\N	\N
2627288	261	1	Superior Twin or Double Room	USD	62.2	2020-07-16	0	0	2020-07-15 10:00:43.36315	2020-07-15 10:00:43.36315	\N	\N	\N
2627289	224	1	Standard King	USD	67.47	2020-07-16	283.24	0	2020-07-15 10:00:43.369306	2020-07-15 10:00:43.369306	\N	\N	\N
2627290	300	1	Deluxe Room, Guestroom, 1 King	USD	138.18	2020-07-16	0	0	2020-07-15 10:00:43.377966	2020-07-15 10:00:43.377966	\N	\N	\N
2627291	301	1	Comfort Double or Twin Room	USD	149.29	2020-07-16	0	0	2020-07-15 10:00:43.384537	2020-07-15 10:00:43.384537	\N	\N	\N
2627292	293	1	Budget Double Room	USD	59.73	2020-07-16	0	0	2020-07-15 10:00:43.391	2020-07-15 10:00:43.391	\N	\N	\N
2627293	243	1	Twin Room	USD	72.25	2020-07-16	0	0	2020-07-15 10:00:43.397037	2020-07-15 10:00:43.397037	\N	\N	\N
2627294	256	1	Standard Double Room	USD	108.61	2020-07-16	0	0	2020-07-15 10:00:43.403582	2020-07-15 10:00:43.403582	\N	\N	\N
2627295	240	1	Twin Room	USD	84	2020-07-16	0	0	2020-07-15 10:00:43.409858	2020-07-15 10:00:43.409858	\N	\N	\N
2627296	285	1	Superior Room king bed	USD	96.35	2020-07-16	0	0	2020-07-15 10:00:43.417764	2020-07-15 10:00:43.417764	\N	\N	\N
2627299	314	1	1 Double Bed Non-Smoking	USD	147.39	2020-07-16	0	0	2020-07-15 10:00:43.438443	2020-07-15 10:00:43.438443	\N	\N	\N
2627300	274	1	Small Double Room Non-Smoking	USD	308.4	2020-07-16	0	0	2020-07-15 10:00:43.446775	2020-07-15 10:00:43.446775	\N	\N	\N
2627301	306	1	Deluxe King City View	USD	97.89	2020-07-16	301.91	30	2020-07-15 10:00:43.454013	2020-07-15 10:00:43.454013	\N	\N	\N
2627302	290	1	Standard	USD	96.66	2020-07-16	0	0	2020-07-15 10:00:43.467361	2020-07-15 10:00:43.467361	\N	\N	\N
2627306	258	1	Standard Double Room	USD	24.1	2020-07-16	0	0	2020-07-15 10:00:43.497601	2020-07-15 10:00:43.497601	\N	\N	\N
2627307	216	1	2 Double Accessible Roll in Shower	USD	129	2020-07-16	0	0	2020-07-15 10:00:43.504907	2020-07-15 10:00:43.504907	\N	\N	\N
2627310	275	1	Double or Twin Room	USD	89.15	2020-07-16	0	0	2020-07-15 10:00:43.524247	2020-07-15 10:00:43.524247	\N	\N	\N
2627311	204	1	King Bed	USD	131.22	2020-07-16	0	0	2020-07-15 10:00:43.530291	2020-07-15 10:00:43.530291	\N	\N	\N
2627313	295	1	Classic Double or Twin	USD	159.56	2020-07-16	467.56	0	2020-07-15 10:00:43.543164	2020-07-15 10:00:43.543164	\N	\N	\N
2627316	268	1	Double Room	USD	115.03	2020-07-16	0	0	2020-07-15 10:00:43.580251	2020-07-15 10:00:43.580251	\N	\N	\N
2627317	307	1	1 King Bed	USD	380.62	2020-07-16	0	0	2020-07-15 10:00:43.586681	2020-07-15 10:00:43.586681	\N	\N	\N
2627318	251	1	Standard Queen Room	USD	94.6	2020-07-16	0	0	2020-07-15 10:00:43.593659	2020-07-15 10:00:43.593659	\N	\N	\N
2627320	302	1	2 Queen Beds 	USD	78.9	2020-07-16	0	0	2020-07-15 10:00:43.612298	2020-07-15 10:00:43.612298	\N	\N	\N
2627323	255	1	3rd Floor Mountain-View Double Room	USD	336.66	2020-07-16	0	0	2020-07-15 10:00:43.632696	2020-07-15 10:00:43.632696	\N	\N	\N
2627326	249	1	Standard Triple Room	USD	98.48	2020-07-16	0	0	2020-07-15 10:00:43.669367	2020-07-15 10:00:43.669367	\N	\N	\N
2627328	206	1	Standard	USD	72.15	2020-07-16	0	0	2020-07-15 10:00:43.682377	2020-07-15 10:00:43.682377	\N	\N	\N
2627329	263	1	Queen Hilton Guestroom	USD	153.93	2020-07-16	0	0	2020-07-15 10:00:43.688253	2020-07-15 10:00:43.688253	\N	\N	\N
2688818	23	1	1 King Bed Evolution Room 	USD	129	2020-07-17	0	0	2020-07-16 10:00:42.199496	2020-07-16 10:00:42.199496	\N	\N	\N
2688819	45	1	Classic Double or Twin	USD	102.67	2020-07-17	0	0	2020-07-16 10:00:42.222517	2020-07-16 10:00:42.222517	\N	\N	\N
2688820	115	1	Double Room	USD	70.61	2020-07-17	0	0	2020-07-16 10:00:42.239002	2020-07-16 10:00:42.239002	\N	\N	\N
2688821	162	1	Flexible Room	USD	175.27	2020-07-17	0	0	2020-07-16 10:00:42.247898	2020-07-16 10:00:42.247898	\N	\N	\N
2688822	75	1	Small Single Room - Non-Smoking	USD	72.22	2020-07-17	212.94	0	2020-07-16 10:00:42.256446	2020-07-16 10:00:42.256446	\N	\N	\N
2688823	158	1	Superior Twin Non-Smoking	USD	77.26	2020-07-17	0	0	2020-07-16 10:00:42.265223	2020-07-16 10:00:42.265223	\N	\N	\N
2688824	153	1	Superior Room	USD	293.53	2020-07-17	0	0	2020-07-16 10:00:42.271969	2020-07-16 10:00:42.271969	\N	\N	\N
2688825	201	1	Feature Double Room	USD	179.38	2020-07-17	0	0	2020-07-16 10:00:42.278685	2020-07-16 10:00:42.278685	\N	\N	\N
2688826	131	1	Superior Double Room	USD	50.9	2020-07-17	0	0	2020-07-16 10:00:42.286344	2020-07-16 10:00:42.286344	\N	\N	\N
2688827	184	1	Superior Room	USD	63.61	2020-07-17	417.77	0	2020-07-16 10:00:42.293168	2020-07-16 10:00:42.293168	\N	\N	\N
2688828	176	1	Economy Twin Room	USD	128.6	2020-07-17	0	0	2020-07-16 10:00:42.300115	2020-07-16 10:00:42.300115	\N	\N	\N
2688829	113	1	2 Queen Beds 	USD	189	2020-07-17	0	0	2020-07-16 10:00:42.306135	2020-07-16 10:00:42.306135	\N	\N	\N
2688830	53	1	Superior Twin	USD	130.81	2020-07-17	0	0	2020-07-16 10:00:42.312706	2020-07-16 10:00:42.312706	\N	\N	\N
2688831	143	1	Standard Double Room	USD	142.13	2020-07-17	0	0	2020-07-16 10:00:42.319371	2020-07-16 10:00:42.319371	\N	\N	\N
2688832	108	1	Standard Double Room	USD	75.29	2020-07-17	0	0	2020-07-16 10:00:42.325887	2020-07-16 10:00:42.325887	\N	\N	\N
2688833	17	1	Double Room	USD	52.38	2020-07-17	0	0	2020-07-16 10:00:42.332408	2020-07-16 10:00:42.332408	\N	\N	\N
2688834	13	1	Premium King Room	USD	138.29	2020-07-17	0	0	2020-07-16 10:00:42.339408	2020-07-16 10:00:42.339408	\N	\N	\N
2688835	64	1	Basic Double or Twin Room	USD	53.92	2020-07-17	0	0	2020-07-16 10:00:42.346797	2020-07-16 10:00:42.346797	\N	\N	\N
2688836	125	1	Standard Double or Twin Room	USD	27	2020-07-17	0	0	2020-07-16 10:00:42.354327	2020-07-16 10:00:42.354327	\N	\N	\N
2688837	199	1	Standard Room with 1 double bed	USD	38.7	2020-07-17	0	0	2020-07-16 10:00:42.367387	2020-07-16 10:00:42.367387	\N	\N	\N
2688838	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-17	0	0	2020-07-16 10:00:42.373866	2020-07-16 10:00:42.373866	\N	\N	\N
2688839	194	1	Standard Small Double Room - Non-Smoking	USD	180.06	2020-07-17	0	0	2020-07-16 10:00:42.382522	2020-07-16 10:00:42.382522	\N	\N	\N
2688840	95	1	 Twin Guestroom	USD	142.93	2020-07-17	0	0	2020-07-16 10:00:42.390031	2020-07-16 10:00:42.390031	\N	\N	\N
2688841	157	1	Cosy Small Room	USD	105.41	2020-07-17	0	0	2020-07-16 10:00:42.396832	2020-07-16 10:00:42.396832	\N	\N	\N
2688842	26	1	Double	USD	86.09	2020-07-17	0	0	2020-07-16 10:00:42.40285	2020-07-16 10:00:42.40285	\N	\N	\N
2688843	61	1	Modern Double Room	USD	194.01	2020-07-17	0	0	2020-07-16 10:00:42.41074	2020-07-16 10:00:42.41074	\N	\N	\N
2688844	109	1	Classic Double Room	USD	170.81	2020-07-17	0	0	2020-07-16 10:00:42.417187	2020-07-16 10:00:42.417187	\N	\N	\N
2688845	84	1	Double or Twin Room	USD	57.04	2020-07-17	0	0	2020-07-16 10:00:42.423167	2020-07-16 10:00:42.423167	\N	\N	\N
2688846	181	1	Superior Double Room	USD	61.94	2020-07-17	0	0	2020-07-16 10:00:42.428973	2020-07-16 10:00:42.428973	\N	\N	\N
2688847	49	1	Superior Twin Room	USD	107.56	2020-07-17	0	0	2020-07-16 10:00:42.43496	2020-07-16 10:00:42.43496	\N	\N	\N
2688848	136	1	Standard Double or Twin Room	USD	190.74	2020-07-17	0	0	2020-07-16 10:00:42.441936	2020-07-16 10:00:42.441936	\N	\N	\N
2688849	98	1	Double or Twin	USD	85.04	2020-07-17	0	0	2020-07-16 10:00:42.447911	2020-07-16 10:00:42.447911	\N	\N	\N
2688850	159	1	Standard Room with 1 double bed and sofa	USD	85.83	2020-07-17	0	0	2020-07-16 10:00:42.467247	2020-07-16 10:00:42.467247	\N	\N	\N
2688851	42	1	Two-Bedroom Apartment	USD	96.05	2020-07-17	0	0	2020-07-16 10:00:42.474026	2020-07-16 10:00:42.474026	\N	\N	\N
2688852	3	1	Deluxe 	USD	138.69	2020-07-17	332.68	0	2020-07-16 10:00:42.480114	2020-07-16 10:00:42.480114	\N	\N	\N
2688853	90	1	Standard Room	USD	155.14	2020-07-17	456.31	0	2020-07-16 10:00:42.486701	2020-07-16 10:00:42.486701	\N	\N	\N
2688854	106	1	Double Room with Two Single Beds	USD	27.55	2020-07-17	0	0	2020-07-16 10:00:42.49311	2020-07-16 10:00:42.49311	\N	\N	\N
2688855	4	1	Twin Room	USD	110.56	2020-07-17	0	0	2020-07-16 10:00:42.498865	2020-07-16 10:00:42.498865	\N	\N	\N
2688856	27	1	Standard Twin Room - Smoking	USD	166.92	2020-07-17	543.11	0	2020-07-16 10:00:42.504744	2020-07-16 10:00:42.504744	\N	\N	\N
2688857	77	1	Double Room - North Side	USD	156.23	2020-07-17	0	0	2020-07-16 10:00:42.51114	2020-07-16 10:00:42.51114	\N	\N	\N
2688858	31	1	Classic Double or Twin Room with Hill View	USD	390.98	2020-07-17	0	0	2020-07-16 10:00:42.51697	2020-07-16 10:00:42.51697	\N	\N	\N
2688859	139	1	Small Double	USD	122.37	2020-07-17	489.49	0	2020-07-16 10:00:42.522838	2020-07-16 10:00:42.522838	\N	\N	\N
2688860	14	1	Classic Double Bed	USD	123.92	2020-07-17	0	0	2020-07-16 10:00:42.529267	2020-07-16 10:00:42.529267	\N	\N	\N
2688861	79	1	Standard Room	USD	81.49	2020-07-17	0	0	2020-07-16 10:00:42.535272	2020-07-16 10:00:42.535272	\N	\N	\N
2688862	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.51	2020-07-17	0	0	2020-07-16 10:00:42.541033	2020-07-16 10:00:42.541033	\N	\N	\N
2688863	67	1	Trendy Garden View Room	USD	213.59	2020-07-17	0	0	2020-07-16 10:00:42.546904	2020-07-16 10:00:42.546904	\N	\N	\N
2688864	160	1	King Accesible with Bathtub	USD	109	2020-07-17	0	0	2020-07-16 10:00:42.570061	2020-07-16 10:00:42.570061	\N	\N	\N
2688865	183	1	Business Deluxe, Guest room, 1 King	USD	109	2020-07-17	0	0	2020-07-16 10:00:42.576609	2020-07-16 10:00:42.576609	\N	\N	\N
2688866	54	1	Double Room	USD	153.17	2020-07-17	767.85	0	2020-07-16 10:00:42.582378	2020-07-16 10:00:42.582378	\N	\N	\N
2688867	47	1	Garden Facing Queen Room	USD	115.22	2020-07-17	0	0	2020-07-16 10:00:42.589672	2020-07-16 10:00:42.589672	\N	\N	\N
2688868	35	1	Twin - Non-Smoking	USD	98.19	2020-07-17	0	0	2020-07-16 10:00:42.596263	2020-07-16 10:00:42.596263	\N	\N	\N
2688869	38	1	Superior Double or Twin Room	USD	195.11	2020-07-17	0	0	2020-07-16 10:00:42.604278	2020-07-16 10:00:42.604278	\N	\N	\N
2688870	192	1	Comfort Room	USD	69.53	2020-07-17	228.15	0	2020-07-16 10:00:42.610352	2020-07-16 10:00:42.610352	\N	\N	\N
2688871	185	1	Standard Double	USD	133.25	2020-07-17	365.05	0	2020-07-16 10:00:42.616349	2020-07-16 10:00:42.616349	\N	\N	\N
2688872	165	1	Basic Room	USD	92.3	2020-07-17	0	0	2020-07-16 10:00:42.62279	2020-07-16 10:00:42.62279	\N	\N	\N
2688873	190	1	Twin Hilton Deluxe Room	USD	101.73	2020-07-17	0	0	2020-07-16 10:00:42.628898	2020-07-16 10:00:42.628898	\N	\N	\N
2688874	215	1	Deluxe - 3 persons	USD	32.22	2020-07-17	128.88	25	2020-07-16 10:00:43.069688	2020-07-16 10:00:43.069688	\N	\N	\N
2688875	261	1	Superior Twin or Double Room	USD	62.2	2020-07-17	0	0	2020-07-16 10:00:43.082029	2020-07-16 10:00:43.082029	\N	\N	\N
2688876	224	1	Standard King	USD	67.63	2020-07-17	283.91	0	2020-07-16 10:00:43.088397	2020-07-16 10:00:43.088397	\N	\N	\N
2688877	300	1	Deluxe Room, Guestroom, 1 King	USD	138.14	2020-07-17	0	0	2020-07-16 10:00:43.095924	2020-07-16 10:00:43.095924	\N	\N	\N
2688878	301	1	Comfort Double or Twin Room	USD	154.52	2020-07-17	0	0	2020-07-16 10:00:43.102008	2020-07-16 10:00:43.102008	\N	\N	\N
2688879	293	1	Budget Double Room	USD	59.75	2020-07-17	0	0	2020-07-16 10:00:43.107576	2020-07-16 10:00:43.107576	\N	\N	\N
2688880	243	1	Twin Room	USD	60.83	2020-07-17	0	0	2020-07-16 10:00:43.113551	2020-07-16 10:00:43.113551	\N	\N	\N
2688881	256	1	Standard Double Room	USD	92.35	2020-07-17	0	0	2020-07-16 10:00:43.120467	2020-07-16 10:00:43.120467	\N	\N	\N
2688882	240	1	Twin Room	USD	84	2020-07-17	0	0	2020-07-16 10:00:43.126271	2020-07-16 10:00:43.126271	\N	\N	\N
2688883	285	1	Superior Room king bed	USD	93.93	2020-07-17	0	0	2020-07-16 10:00:43.133099	2020-07-16 10:00:43.133099	\N	\N	\N
2688886	314	1	1 Double Bed Non-Smoking	USD	147.44	2020-07-17	0	0	2020-07-16 10:00:43.154551	2020-07-16 10:00:43.154551	\N	\N	\N
2688887	274	1	Small Double Room Non-Smoking	USD	225.66	2020-07-17	0	0	2020-07-16 10:00:43.164308	2020-07-16 10:00:43.164308	\N	\N	\N
2688888	306	1	Deluxe King City View	USD	97.93	2020-07-17	302.05	30	2020-07-16 10:00:43.171223	2020-07-16 10:00:43.171223	\N	\N	\N
2688889	290	1	Standard	USD	96.69	2020-07-17	0	0	2020-07-16 10:00:43.177612	2020-07-16 10:00:43.177612	\N	\N	\N
2688892	258	1	Standard Double Room	USD	24.19	2020-07-17	0	0	2020-07-16 10:00:43.197919	2020-07-16 10:00:43.197919	\N	\N	\N
2688893	216	1	2 Double Accessible with Bathtub	USD	109	2020-07-17	0	0	2020-07-16 10:00:43.204737	2020-07-16 10:00:43.204737	\N	\N	\N
2688896	204	1	King Bed	USD	117.29	2020-07-17	0	0	2020-07-16 10:00:43.224523	2020-07-16 10:00:43.224523	\N	\N	\N
2688898	295	1	Classic Double or Twin	USD	168.43	2020-07-17	467.72	0	2020-07-16 10:00:43.237512	2020-07-16 10:00:43.237512	\N	\N	\N
2688901	307	1	1 King Bed	USD	476.9	2020-07-17	0	0	2020-07-16 10:00:43.265254	2020-07-16 10:00:43.265254	\N	\N	\N
2688902	251	1	Standard Queen Room	USD	94.57	2020-07-17	0	0	2020-07-16 10:00:43.272492	2020-07-16 10:00:43.272492	\N	\N	\N
2688904	302	1	2 Queen Beds 	USD	81.77	2020-07-17	0	0	2020-07-16 10:00:43.285215	2020-07-16 10:00:43.285215	\N	\N	\N
2688910	249	1	Standard 1 Double 1 Single Bed	USD	98.52	2020-07-17	0	0	2020-07-16 10:00:43.333893	2020-07-16 10:00:43.333893	\N	\N	\N
2688912	263	1	Queen Hilton Guestroom	USD	154.3	2020-07-17	0	0	2020-07-16 10:00:43.347045	2020-07-16 10:00:43.347045	\N	\N	\N
2746833	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-18	0	0	2020-07-17 10:00:43.611924	2020-07-17 10:00:43.611924	\N	\N	\N
2746834	45	1	Classic Double or Twin	USD	102.68	2020-07-18	0	0	2020-07-17 10:00:43.6297	2020-07-17 10:00:43.6297	\N	\N	\N
2746835	115	1	Double Room	USD	70.62	2020-07-18	0	0	2020-07-17 10:00:43.646641	2020-07-17 10:00:43.646641	\N	\N	\N
2746836	162	1	Standard Double Room	USD	219.36	2020-07-18	0	0	2020-07-17 10:00:43.654771	2020-07-17 10:00:43.654771	\N	\N	\N
2746837	75	1	Low Floor Small Single Room - Smoking	USD	86.57	2020-07-18	212.44	0	2020-07-17 10:00:43.661722	2020-07-17 10:00:43.661722	\N	\N	\N
2746838	158	1	Superior Twin Non-Smoking	USD	85.84	2020-07-18	0	0	2020-07-17 10:00:43.670623	2020-07-17 10:00:43.670623	\N	\N	\N
2746839	153	1	Superior Room	USD	256.76	2020-07-18	0	0	2020-07-17 10:00:43.676927	2020-07-17 10:00:43.676927	\N	\N	\N
2746840	131	1	Superior Double Room	USD	50.49	2020-07-18	0	0	2020-07-17 10:00:43.684767	2020-07-17 10:00:43.684767	\N	\N	\N
2746841	184	1	Superior Room	USD	63.56	2020-07-18	413.69	0	2020-07-17 10:00:43.691873	2020-07-17 10:00:43.691873	\N	\N	\N
2746842	176	1	Economy Twin Room	USD	128.61	2020-07-18	0	0	2020-07-17 10:00:43.700017	2020-07-17 10:00:43.700017	\N	\N	\N
2746843	113	1	2 Queen Beds 	USD	189	2020-07-18	0	0	2020-07-17 10:00:43.706057	2020-07-17 10:00:43.706057	\N	\N	\N
2746844	53	1	Superior Twin	USD	181.69	2020-07-18	0	0	2020-07-17 10:00:43.712598	2020-07-17 10:00:43.712598	\N	\N	\N
2746845	143	1	Standard Double Room	USD	142.53	2020-07-18	0	0	2020-07-17 10:00:43.71875	2020-07-17 10:00:43.71875	\N	\N	\N
2746846	108	1	Standard Double Room	USD	75.3	2020-07-18	0	0	2020-07-17 10:00:43.725139	2020-07-17 10:00:43.725139	\N	\N	\N
2746847	13	1	Premium Twin Room with Two Double Beds	USD	204.53	2020-07-18	0	0	2020-07-17 10:00:43.732611	2020-07-17 10:00:43.732611	\N	\N	\N
2746848	64	1	Basic Double or Twin Room	USD	53.93	2020-07-18	0	0	2020-07-17 10:00:43.739443	2020-07-17 10:00:43.739443	\N	\N	\N
2746849	125	1	Standard Double or Twin Room	USD	27	2020-07-18	0	0	2020-07-17 10:00:43.746571	2020-07-17 10:00:43.746571	\N	\N	\N
2746850	199	1	Standard Room with 1 double bed	USD	41.27	2020-07-18	0	0	2020-07-17 10:00:43.752349	2020-07-17 10:00:43.752349	\N	\N	\N
2746851	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-18	0	0	2020-07-17 10:00:43.765809	2020-07-17 10:00:43.765809	\N	\N	\N
2746852	194	1	Standard Small Double Room - Non-Smoking	USD	168.08	2020-07-18	0	0	2020-07-17 10:00:43.773631	2020-07-17 10:00:43.773631	\N	\N	\N
2746853	95	1	 Twin Guestroom	USD	142.95	2020-07-18	0	0	2020-07-17 10:00:43.780966	2020-07-17 10:00:43.780966	\N	\N	\N
2746854	157	1	Cosy Small Room	USD	105.56	2020-07-18	0	0	2020-07-17 10:00:43.789367	2020-07-17 10:00:43.789367	\N	\N	\N
2746855	26	1	Double	USD	86.1	2020-07-18	0	0	2020-07-17 10:00:43.795747	2020-07-17 10:00:43.795747	\N	\N	\N
2746856	61	1	Modern Double Room	USD	214.61	2020-07-18	0	0	2020-07-17 10:00:43.802534	2020-07-17 10:00:43.802534	\N	\N	\N
2746857	109	1	Classic Double Room	USD	181.1	2020-07-18	0	0	2020-07-17 10:00:43.808511	2020-07-17 10:00:43.808511	\N	\N	\N
2746858	84	1	Double or Twin Room	USD	57.05	2020-07-18	0	0	2020-07-17 10:00:43.81442	2020-07-17 10:00:43.81442	\N	\N	\N
2746859	181	1	Superior Double Room	USD	61.94	2020-07-18	0	0	2020-07-17 10:00:43.820508	2020-07-17 10:00:43.820508	\N	\N	\N
2746860	49	1	Superior Twin Room	USD	107.58	2020-07-18	0	0	2020-07-17 10:00:43.826515	2020-07-17 10:00:43.826515	\N	\N	\N
2746861	136	1	Standard Double or Twin Room	USD	125.54	2020-07-18	0	0	2020-07-17 10:00:43.833889	2020-07-17 10:00:43.833889	\N	\N	\N
2746862	98	1	Double or Twin	USD	85.05	2020-07-18	0	0	2020-07-17 10:00:43.84002	2020-07-17 10:00:43.84002	\N	\N	\N
2746863	159	1	Standard Room with 1 double bed and sofa	USD	85.84	2020-07-18	0	0	2020-07-17 10:00:43.846939	2020-07-17 10:00:43.846939	\N	\N	\N
2746864	42	1	Standard Twin Room	USD	81	2020-07-18	0	0	2020-07-17 10:00:43.868556	2020-07-17 10:00:43.868556	\N	\N	\N
2746865	3	1	Deluxe 	USD	147.97	2020-07-18	331.28	0	2020-07-17 10:00:43.874886	2020-07-17 10:00:43.874886	\N	\N	\N
2746866	90	1	Standard Room	USD	95.13	2020-07-18	380.51	0	2020-07-17 10:00:43.88145	2020-07-17 10:00:43.88145	\N	\N	\N
2746867	106	1	Double Room with Two Single Beds	USD	36.96	2020-07-18	0	0	2020-07-17 10:00:43.88771	2020-07-17 10:00:43.88771	\N	\N	\N
2746868	4	1	Twin Room	USD	110.58	2020-07-18	0	0	2020-07-17 10:00:43.893963	2020-07-17 10:00:43.893963	\N	\N	\N
2746869	27	1	Standard Twin Room - Smoking	USD	182.38	2020-07-18	541.83	0	2020-07-17 10:00:43.900567	2020-07-17 10:00:43.900567	\N	\N	\N
2746870	31	1	Classic Double or Twin Room with Hill View	USD	391.02	2020-07-18	0	0	2020-07-17 10:00:43.906928	2020-07-17 10:00:43.906928	\N	\N	\N
2746871	139	1	Small Double	USD	122.38	2020-07-18	489.55	0	2020-07-17 10:00:43.913229	2020-07-17 10:00:43.913229	\N	\N	\N
2746872	14	1	Classic Double Bed	USD	123.93	2020-07-18	0	0	2020-07-17 10:00:43.920818	2020-07-17 10:00:43.920818	\N	\N	\N
2746873	79	1	Standard Room	USD	81.49	2020-07-18	0	0	2020-07-17 10:00:43.927365	2020-07-17 10:00:43.927365	\N	\N	\N
2746874	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	111.95	2020-07-18	0	0	2020-07-17 10:00:43.934141	2020-07-17 10:00:43.934141	\N	\N	\N
2746875	67	1	Trendy Garden View Room	USD	213.59	2020-07-18	0	0	2020-07-17 10:00:43.93997	2020-07-17 10:00:43.93997	\N	\N	\N
2746876	160	1	King Accesible with Bathtub	USD	109	2020-07-18	0	0	2020-07-17 10:00:43.946546	2020-07-17 10:00:43.946546	\N	\N	\N
2746877	183	1	Business Deluxe, Guest room, 1 King	USD	87	2020-07-18	0	0	2020-07-17 10:00:43.968477	2020-07-17 10:00:43.968477	\N	\N	\N
2746878	54	1	Double Room	USD	153.3	2020-07-18	768.5	0	2020-07-17 10:00:43.976737	2020-07-17 10:00:43.976737	\N	\N	\N
2746879	47	1	Garden Facing Queen Room	USD	115.22	2020-07-18	0	0	2020-07-17 10:00:43.984007	2020-07-17 10:00:43.984007	\N	\N	\N
2746880	35	1	Twin - Non-Smoking	USD	107.79	2020-07-18	0	0	2020-07-17 10:00:43.991488	2020-07-17 10:00:43.991488	\N	\N	\N
2746881	38	1	Superior Double or Twin Room	USD	195.13	2020-07-18	0	0	2020-07-17 10:00:44.000379	2020-07-17 10:00:44.000379	\N	\N	\N
2746882	192	1	Comfort Room	USD	69.54	2020-07-18	228.18	0	2020-07-17 10:00:44.008415	2020-07-17 10:00:44.008415	\N	\N	\N
2746883	185	1	Standard Double	USD	136.91	2020-07-18	365.09	0	2020-07-17 10:00:44.014327	2020-07-17 10:00:44.014327	\N	\N	\N
2746884	165	1	Basic Room	USD	92.31	2020-07-18	0	0	2020-07-17 10:00:44.020845	2020-07-17 10:00:44.020845	\N	\N	\N
2746885	190	1	Twin Hilton Guestroom	USD	81.12	2020-07-18	0	0	2020-07-17 10:00:44.028229	2020-07-17 10:00:44.028229	\N	\N	\N
2746886	215	1	Deluxe - 3 persons	USD	32.22	2020-07-18	128.86	25	2020-07-17 10:00:44.441238	2020-07-17 10:00:44.441238	\N	\N	\N
2746888	261	1	Superior Twin or Double Room	USD	62.2	2020-07-18	0	0	2020-07-17 10:00:44.459601	2020-07-17 10:00:44.459601	\N	\N	\N
2746889	300	1	Deluxe Room, Guestroom, 1 King	USD	138.07	2020-07-18	0	0	2020-07-17 10:00:44.467461	2020-07-17 10:00:44.467461	\N	\N	\N
2746890	301	1	Deluxe Double Room	USD	211.58	2020-07-18	0	0	2020-07-17 10:00:44.473308	2020-07-17 10:00:44.473308	\N	\N	\N
2746891	293	1	Comfort Double Room	USD	67.37	2020-07-18	0	0	2020-07-17 10:00:44.479108	2020-07-17 10:00:44.479108	\N	\N	\N
2746892	243	1	Twin Room	USD	60.83	2020-07-18	0	0	2020-07-17 10:00:44.485333	2020-07-17 10:00:44.485333	\N	\N	\N
2746893	256	1	Standard Double Room	USD	92.36	2020-07-18	0	0	2020-07-17 10:00:44.491848	2020-07-17 10:00:44.491848	\N	\N	\N
2746894	285	1	Superior Room king bed	USD	96.63	2020-07-18	0	0	2020-07-17 10:00:44.498943	2020-07-17 10:00:44.498943	\N	\N	\N
2746897	314	1	1 Double Bed Non-Smoking	USD	222.8	2020-07-18	0	0	2020-07-17 10:00:44.520191	2020-07-17 10:00:44.520191	\N	\N	\N
2746898	274	1	Small Double Room Non-Smoking	USD	225.13	2020-07-18	0	0	2020-07-17 10:00:44.52804	2020-07-17 10:00:44.52804	\N	\N	\N
2746899	306	1	Deluxe King City View	USD	97.89	2020-07-18	301.91	30	2020-07-17 10:00:44.535815	2020-07-17 10:00:44.535815	\N	\N	\N
2746900	290	1	Standard	USD	96.7	2020-07-18	0	0	2020-07-17 10:00:44.541914	2020-07-17 10:00:44.541914	\N	\N	\N
2746903	258	1	Standard Double Room	USD	24.35	2020-07-18	0	0	2020-07-17 10:00:44.573799	2020-07-17 10:00:44.573799	\N	\N	\N
2746904	216	1	2 Double Accessible with Bathtub	USD	109	2020-07-18	0	0	2020-07-17 10:00:44.584806	2020-07-17 10:00:44.584806	\N	\N	\N
2746907	275	1	Double or Twin Room	USD	89.2	2020-07-18	0	0	2020-07-17 10:00:44.603742	2020-07-17 10:00:44.603742	\N	\N	\N
2746908	204	1	King Bed	USD	116.96	2020-07-18	0	0	2020-07-17 10:00:44.609793	2020-07-17 10:00:44.609793	\N	\N	\N
2746910	295	1	Classic Double or Twin	USD	168.45	2020-07-18	467.77	0	2020-07-17 10:00:44.622824	2020-07-17 10:00:44.622824	\N	\N	\N
2746913	307	1	1 King Bed	USD	475.78	2020-07-18	0	0	2020-07-17 10:00:44.644273	2020-07-17 10:00:44.644273	\N	\N	\N
2746914	251	1	Standard Queen Room	USD	94.57	2020-07-18	0	0	2020-07-17 10:00:44.665685	2020-07-17 10:00:44.665685	\N	\N	\N
2746916	302	1	Accessible 1 King Bed	USD	70.61	2020-07-18	291.6	0	2020-07-17 10:00:44.678186	2020-07-17 10:00:44.678186	\N	\N	\N
2746922	249	1	Standard 1 Double 1 Single Bed	USD	98.53	2020-07-18	0	0	2020-07-17 10:00:44.729172	2020-07-17 10:00:44.729172	\N	\N	\N
2746924	263	1	Queen Hilton Guestroom	USD	167.92	2020-07-18	0	0	2020-07-17 10:00:44.742212	2020-07-17 10:00:44.742212	\N	\N	\N
2799343	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-19	0	0	2020-07-18 10:00:42.732559	2020-07-18 10:00:42.732559	\N	\N	\N
2799344	45	1	Classic Double or Twin	USD	102.93	2020-07-19	0	0	2020-07-18 10:00:42.757763	2020-07-18 10:00:42.757763	\N	\N	\N
2799345	115	1	Double Room	USD	59.9	2020-07-19	0	0	2020-07-18 10:00:42.777377	2020-07-18 10:00:42.777377	\N	\N	\N
2799346	162	1	Flexible Room	USD	175.71	2020-07-19	0	0	2020-07-18 10:00:42.787477	2020-07-18 10:00:42.787477	\N	\N	\N
2799347	75	1	Low Floor Small Single Room - Smoking	USD	64.94	2020-07-19	212.76	0	2020-07-18 10:00:42.795704	2020-07-18 10:00:42.795704	\N	\N	\N
2799348	158	1	Superior Twin Non-Smoking	USD	85.81	2020-07-19	0	0	2020-07-18 10:00:42.807217	2020-07-18 10:00:42.807217	\N	\N	\N
2799349	153	1	Standard Twin Room	USD	183.71	2020-07-19	0	0	2020-07-18 10:00:42.813855	2020-07-18 10:00:42.813855	\N	\N	\N
2799350	201	1	Feature Double Room	USD	151.32	2020-07-19	0	0	2020-07-18 10:00:42.821844	2020-07-18 10:00:42.821844	\N	\N	\N
2799351	131	1	Superior Double Room	USD	50.15	2020-07-19	0	0	2020-07-18 10:00:42.83116	2020-07-18 10:00:42.83116	\N	\N	\N
2799352	184	1	Superior Room	USD	65.12	2020-07-19	409.51	0	2020-07-18 10:00:42.839208	2020-07-18 10:00:42.839208	\N	\N	\N
2799353	176	1	Economy Twin Room	USD	123.72	2020-07-19	0	0	2020-07-18 10:00:42.846426	2020-07-18 10:00:42.846426	\N	\N	\N
2799354	113	1	2 Queen Beds 	USD	169	2020-07-19	0	0	2020-07-18 10:00:42.852562	2020-07-18 10:00:42.852562	\N	\N	\N
2799355	53	1	Superior Twin	USD	130.57	2020-07-19	0	0	2020-07-18 10:00:42.859204	2020-07-18 10:00:42.859204	\N	\N	\N
2799356	143	1	Standard Double Room	USD	142.66	2020-07-19	0	0	2020-07-18 10:00:42.865066	2020-07-18 10:00:42.865066	\N	\N	\N
2799357	108	1	Standard Double Room	USD	67.85	2020-07-19	0	0	2020-07-18 10:00:42.870789	2020-07-18 10:00:42.870789	\N	\N	\N
2799358	17	1	Double Room	USD	37.65	2020-07-19	0	0	2020-07-18 10:00:42.877821	2020-07-18 10:00:42.877821	\N	\N	\N
2799359	13	1	Premium Twin Room with Two Double Beds	USD	127.78	2020-07-19	0	0	2020-07-18 10:00:42.886253	2020-07-18 10:00:42.886253	\N	\N	\N
2799360	64	1	Basic Double or Twin Room	USD	48.87	2020-07-19	0	0	2020-07-18 10:00:42.893871	2020-07-18 10:00:42.893871	\N	\N	\N
2799361	125	1	Standard Double or Twin Room	USD	27	2020-07-19	0	0	2020-07-18 10:00:42.90157	2020-07-18 10:00:42.90157	\N	\N	\N
2799362	199	1	Standard Room with 1 double bed	USD	34.82	2020-07-19	0	0	2020-07-18 10:00:42.907754	2020-07-18 10:00:42.907754	\N	\N	\N
2799363	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-19	0	0	2020-07-18 10:00:42.919047	2020-07-18 10:00:42.919047	\N	\N	\N
2799364	194	1	Standard Small Double Room - Non-Smoking	USD	164.47	2020-07-19	0	0	2020-07-18 10:00:42.930302	2020-07-18 10:00:42.930302	\N	\N	\N
2799365	95	1	 Twin Guestroom	USD	143.29	2020-07-19	0	0	2020-07-18 10:00:42.937922	2020-07-18 10:00:42.937922	\N	\N	\N
2799366	157	1	Cosy Small Room	USD	102.39	2020-07-19	0	0	2020-07-18 10:00:42.945357	2020-07-18 10:00:42.945357	\N	\N	\N
2799367	26	1	Double	USD	86.31	2020-07-19	0	0	2020-07-18 10:00:42.951096	2020-07-18 10:00:42.951096	\N	\N	\N
2799368	164	1	Superior King Room	USD	301.94	2020-07-19	0	0	2020-07-18 10:00:42.956933	2020-07-18 10:00:42.956933	\N	\N	\N
2799369	61	1	Modern Double Room	USD	174.64	2020-07-19	0	0	2020-07-18 10:00:42.967774	2020-07-18 10:00:42.967774	\N	\N	\N
2799370	109	1	Classic Double Room	USD	149.71	2020-07-19	0	0	2020-07-18 10:00:42.97359	2020-07-18 10:00:42.97359	\N	\N	\N
2799371	84	1	Double or Twin Room	USD	57.18	2020-07-19	0	0	2020-07-18 10:00:42.979176	2020-07-18 10:00:42.979176	\N	\N	\N
2799372	181	1	Superior Double Room	USD	61.94	2020-07-19	0	0	2020-07-18 10:00:42.984965	2020-07-18 10:00:42.984965	\N	\N	\N
2799373	49	1	Superior Twin Room	USD	96.94	2020-07-19	0	0	2020-07-18 10:00:42.991019	2020-07-18 10:00:42.991019	\N	\N	\N
2799374	136	1	Standard Double or Twin Room	USD	119.76	2020-07-19	0	0	2020-07-18 10:00:42.99992	2020-07-18 10:00:42.99992	\N	\N	\N
2799375	98	1	Double or Twin	USD	77.97	2020-07-19	0	0	2020-07-18 10:00:43.006075	2020-07-18 10:00:43.006075	\N	\N	\N
2799376	159	1	Standard Room with 1 double bed and sofa	USD	86.05	2020-07-19	0	0	2020-07-18 10:00:43.01534	2020-07-18 10:00:43.01534	\N	\N	\N
2799377	42	1	Standard Twin Room	USD	68.85	2020-07-19	0	0	2020-07-18 10:00:43.022356	2020-07-18 10:00:43.022356	\N	\N	\N
2799378	3	1	Deluxe 	USD	138.15	2020-07-19	331.4	0	2020-07-18 10:00:43.028108	2020-07-18 10:00:43.028108	\N	\N	\N
2799379	90	1	Standard Room	USD	95.36	2020-07-19	381.43	0	2020-07-18 10:00:43.036251	2020-07-18 10:00:43.036251	\N	\N	\N
2799380	106	1	Double Room with Two Single Beds	USD	36.75	2020-07-19	0	0	2020-07-18 10:00:43.043148	2020-07-18 10:00:43.043148	\N	\N	\N
2799381	4	1	Twin Room	USD	100.77	2020-07-19	0	0	2020-07-18 10:00:43.049043	2020-07-18 10:00:43.049043	\N	\N	\N
2799382	27	1	Standard Twin Room - Smoking	USD	166.77	2020-07-19	542.64	0	2020-07-18 10:00:43.056037	2020-07-18 10:00:43.056037	\N	\N	\N
2799383	77	1	Double Room - North Side	USD	157.17	2020-07-19	0	0	2020-07-18 10:00:43.070458	2020-07-18 10:00:43.070458	\N	\N	\N
2799384	31	1	Classic Double or Twin Room with Hill View	USD	391.96	2020-07-19	0	0	2020-07-18 10:00:43.07651	2020-07-18 10:00:43.07651	\N	\N	\N
2799385	139	1	Small Double	USD	118.52	2020-07-19	474.11	0	2020-07-18 10:00:43.082345	2020-07-18 10:00:43.082345	\N	\N	\N
2799386	14	1	Classic Double Bed	USD	124.23	2020-07-19	0	0	2020-07-18 10:00:43.089276	2020-07-18 10:00:43.089276	\N	\N	\N
2799387	79	1	Standard Room	USD	81.69	2020-07-19	0	0	2020-07-18 10:00:43.094934	2020-07-18 10:00:43.094934	\N	\N	\N
2799388	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	93.43	2020-07-19	0	0	2020-07-18 10:00:43.100478	2020-07-18 10:00:43.100478	\N	\N	\N
2799389	67	1	Trendy Garden View Room	USD	213.59	2020-07-19	0	0	2020-07-18 10:00:43.107476	2020-07-18 10:00:43.107476	\N	\N	\N
2799390	160	1	King Accesible with Bathtub	USD	98.1	2020-07-19	0	0	2020-07-18 10:00:43.11333	2020-07-18 10:00:43.11333	\N	\N	\N
2799391	183	1	Business Deluxe, Guest room, 1 King	USD	149	2020-07-19	0	0	2020-07-18 10:00:43.119697	2020-07-18 10:00:43.119697	\N	\N	\N
2799392	54	1	Double Room	USD	154.1	2020-07-19	772.52	0	2020-07-18 10:00:43.125506	2020-07-18 10:00:43.125506	\N	\N	\N
2799393	47	1	Garden Facing Queen Room	USD	115.22	2020-07-19	0	0	2020-07-18 10:00:43.133062	2020-07-18 10:00:43.133062	\N	\N	\N
2799394	35	1	Twin - Non-Smoking	USD	98.1	2020-07-19	0	0	2020-07-18 10:00:43.139338	2020-07-18 10:00:43.139338	\N	\N	\N
2799395	38	1	Superior Double or Twin Room	USD	195.6	2020-07-19	0	0	2020-07-18 10:00:43.146332	2020-07-18 10:00:43.146332	\N	\N	\N
2799396	192	1	Comfort Room	USD	69.7	2020-07-19	228.73	0	2020-07-18 10:00:43.168295	2020-07-18 10:00:43.168295	\N	\N	\N
2799397	185	1	Standard Double	USD	137.24	2020-07-19	365.97	0	2020-07-18 10:00:43.174914	2020-07-18 10:00:43.174914	\N	\N	\N
2799398	165	1	Basic Room	USD	92.53	2020-07-19	0	0	2020-07-18 10:00:43.18177	2020-07-18 10:00:43.18177	\N	\N	\N
2799399	190	1	Twin Hilton Guestroom	USD	73.92	2020-07-19	0	0	2020-07-18 10:00:43.188135	2020-07-18 10:00:43.188135	\N	\N	\N
2799400	215	1	Deluxe - 3 persons	USD	32.22	2020-07-19	128.86	25	2020-07-18 10:00:43.605675	2020-07-18 10:00:43.605675	\N	\N	\N
2799402	261	1	Superior Twin or Double Room	USD	62.2	2020-07-19	0	0	2020-07-18 10:00:43.62668	2020-07-18 10:00:43.62668	\N	\N	\N
2799403	224	1	Standard King	USD	67.44	2020-07-19	283.13	0	2020-07-18 10:00:43.633029	2020-07-18 10:00:43.633029	\N	\N	\N
2799404	300	1	Deluxe Room, Guestroom, 1 King	USD	138.07	2020-07-19	0	0	2020-07-18 10:00:43.640247	2020-07-18 10:00:43.640247	\N	\N	\N
2799405	301	1	Comfort Double or Twin Room	USD	154.91	2020-07-19	0	0	2020-07-18 10:00:43.646369	2020-07-18 10:00:43.646369	\N	\N	\N
2799406	293	1	Budget Double Room	USD	59.9	2020-07-19	0	0	2020-07-18 10:00:43.652546	2020-07-18 10:00:43.652546	\N	\N	\N
2799407	243	1	Twin Room	USD	60.98	2020-07-19	0	0	2020-07-18 10:00:43.658648	2020-07-18 10:00:43.658648	\N	\N	\N
2799408	256	1	Standard Double Room	USD	92.58	2020-07-19	0	0	2020-07-18 10:00:43.666165	2020-07-18 10:00:43.666165	\N	\N	\N
2799410	285	1	Superior Room king bed	USD	91.01	2020-07-19	0	0	2020-07-18 10:00:43.683782	2020-07-18 10:00:43.683782	\N	\N	\N
2799413	314	1	1 Double Bed Non-Smoking	USD	147.82	2020-07-19	0	0	2020-07-18 10:00:43.703602	2020-07-18 10:00:43.703602	\N	\N	\N
2799414	274	1	Standard Twin Room - Non-Smoking	USD	213.11	2020-07-19	392.41	0	2020-07-18 10:00:43.715765	2020-07-18 10:00:43.715765	\N	\N	\N
2799415	306	1	Deluxe King City View	USD	97.91	2020-07-19	301.98	30	2020-07-18 10:00:43.724575	2020-07-18 10:00:43.724575	\N	\N	\N
2799416	290	1	Standard	USD	86.05	2020-07-19	0	0	2020-07-18 10:00:43.730471	2020-07-18 10:00:43.730471	\N	\N	\N
2799420	258	1	Standard Double Room	USD	24.21	2020-07-19	0	0	2020-07-18 10:00:43.756657	2020-07-18 10:00:43.756657	\N	\N	\N
2799421	216	1	2 Double Accessible with Bathtub	USD	109	2020-07-19	0	0	2020-07-18 10:00:43.763771	2020-07-18 10:00:43.763771	\N	\N	\N
2799424	275	1	Double or Twin Room	USD	89.41	2020-07-19	0	0	2020-07-18 10:00:43.782901	2020-07-18 10:00:43.782901	\N	\N	\N
2799425	204	1	King Bed	USD	116.72	2020-07-19	0	0	2020-07-18 10:00:43.788762	2020-07-18 10:00:43.788762	\N	\N	\N
2799427	295	1	Classic Double or Twin	USD	160.01	2020-07-19	468.89	0	2020-07-18 10:00:43.802281	2020-07-18 10:00:43.802281	\N	\N	\N
2799430	268	1	Double Room	USD	131.57	2020-07-19	0	0	2020-07-18 10:00:43.826043	2020-07-18 10:00:43.826043	\N	\N	\N
2799431	307	1	1 King Bed	USD	448.46	2020-07-19	0	0	2020-07-18 10:00:43.831824	2020-07-18 10:00:43.831824	\N	\N	\N
2799432	251	1	Standard Queen Room	USD	94.95	2020-07-19	0	0	2020-07-18 10:00:43.845248	2020-07-18 10:00:43.845248	\N	\N	\N
2799434	302	1	Accessible 1 King Bed	USD	78.9	2020-07-19	300	0	2020-07-18 10:00:43.87649	2020-07-18 10:00:43.87649	\N	\N	\N
2799436	279	1	Anchorage Room	USD	285.56	2020-07-19	0	0	2020-07-18 10:00:43.888926	2020-07-18 10:00:43.888926	\N	\N	\N
2799441	249	1	Standard Triple Room	USD	98.76	2020-07-19	0	0	2020-07-18 10:00:43.923209	2020-07-18 10:00:43.923209	\N	\N	\N
2799443	206	1	Standard	USD	72.22	2020-07-19	0	0	2020-07-18 10:00:43.936255	2020-07-18 10:00:43.936255	\N	\N	\N
2799444	263	1	Queen Hilton Guestroom	USD	154.16	2020-07-19	0	0	2020-07-18 10:00:43.942026	2020-07-18 10:00:43.942026	\N	\N	\N
2860218	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-20	0	0	2020-07-19 10:00:39.18998	2020-07-19 10:00:39.18998	\N	\N	\N
2860219	45	1	Classic Double or Twin	USD	102.93	2020-07-20	0	0	2020-07-19 10:00:39.214836	2020-07-19 10:00:39.214836	\N	\N	\N
2860220	115	1	Double Room	USD	64.26	2020-07-20	0	0	2020-07-19 10:00:39.232295	2020-07-19 10:00:39.232295	\N	\N	\N
2860221	162	1	Flexible Room	USD	175.71	2020-07-20	0	0	2020-07-19 10:00:39.240341	2020-07-19 10:00:39.240341	\N	\N	\N
2860222	75	1	Low Floor Small Single Room - Smoking	USD	72.16	2020-07-20	212.76	0	2020-07-19 10:00:39.247341	2020-07-19 10:00:39.247341	\N	\N	\N
2860223	158	1	Superior Twin Non-Smoking	USD	85.81	2020-07-20	0	0	2020-07-19 10:00:39.256821	2020-07-19 10:00:39.256821	\N	\N	\N
2860224	153	1	Superior Room	USD	269.72	2020-07-20	0	0	2020-07-19 10:00:39.263092	2020-07-19 10:00:39.263092	\N	\N	\N
2860225	201	1	Feature Double Room	USD	192.1	2020-07-20	0	0	2020-07-19 10:00:39.270386	2020-07-19 10:00:39.270386	\N	\N	\N
2860226	131	1	Superior Double Room	USD	50.15	2020-07-20	0	0	2020-07-19 10:00:39.279745	2020-07-19 10:00:39.279745	\N	\N	\N
2860227	184	1	Superior Room	USD	75.15	2020-07-20	441.61	0	2020-07-19 10:00:39.28684	2020-07-19 10:00:39.28684	\N	\N	\N
2860228	176	1	Economy Twin Room	USD	128.92	2020-07-20	0	0	2020-07-19 10:00:39.295365	2020-07-19 10:00:39.295365	\N	\N	\N
2860229	113	1	2 Queen Beds 	USD	179	2020-07-20	0	0	2020-07-19 10:00:39.30142	2020-07-19 10:00:39.30142	\N	\N	\N
2860230	53	1	Superior Twin	USD	130.57	2020-07-20	0	0	2020-07-19 10:00:39.308493	2020-07-19 10:00:39.308493	\N	\N	\N
2860231	143	1	Standard Double Room	USD	142.66	2020-07-20	0	0	2020-07-19 10:00:39.314527	2020-07-19 10:00:39.314527	\N	\N	\N
2860232	108	1	Standard Double Room	USD	67.85	2020-07-20	0	0	2020-07-19 10:00:39.32032	2020-07-19 10:00:39.32032	\N	\N	\N
2860233	17	1	Double Room	USD	40	2020-07-20	0	0	2020-07-19 10:00:39.327134	2020-07-19 10:00:39.327134	\N	\N	\N
2860234	13	1	Premium Twin Room with Two Double Beds	USD	127.78	2020-07-20	0	0	2020-07-19 10:00:39.335452	2020-07-19 10:00:39.335452	\N	\N	\N
2860235	64	1	Basic Double or Twin Room	USD	54.06	2020-07-20	0	0	2020-07-19 10:00:39.342634	2020-07-19 10:00:39.342634	\N	\N	\N
2860236	125	1	Standard Double or Twin Room	USD	27	2020-07-20	0	0	2020-07-19 10:00:39.350027	2020-07-19 10:00:39.350027	\N	\N	\N
2860237	199	1	Standard Room with 1 double bed	USD	33.53	2020-07-20	0	0	2020-07-19 10:00:39.356958	2020-07-19 10:00:39.356958	\N	\N	\N
2860238	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-20	0	0	2020-07-19 10:00:39.366907	2020-07-19 10:00:39.366907	\N	\N	\N
2860239	194	1	Standard Small Double Room - Non-Smoking	USD	172.19	2020-07-20	0	0	2020-07-19 10:00:39.379688	2020-07-19 10:00:39.379688	\N	\N	\N
2860240	95	1	 Twin Guestroom	USD	124.95	2020-07-20	0	0	2020-07-19 10:00:39.387557	2020-07-19 10:00:39.387557	\N	\N	\N
2860241	157	1	Cosy Small Room	USD	102.39	2020-07-20	0	0	2020-07-19 10:00:39.395044	2020-07-19 10:00:39.395044	\N	\N	\N
2860242	26	1	Double	USD	75.52	2020-07-20	0	0	2020-07-19 10:00:39.400748	2020-07-19 10:00:39.400748	\N	\N	\N
2860243	164	1	Standard Twin Room	USD	220.58	2020-07-20	0	0	2020-07-19 10:00:39.406341	2020-07-19 10:00:39.406341	\N	\N	\N
2860244	61	1	Modern Double Room	USD	195.18	2020-07-20	0	0	2020-07-19 10:00:39.413631	2020-07-19 10:00:39.413631	\N	\N	\N
2860245	109	1	Classic Double Room	USD	171.24	2020-07-20	0	0	2020-07-19 10:00:39.419472	2020-07-19 10:00:39.419472	\N	\N	\N
2860246	84	1	Double or Twin Room	USD	57.18	2020-07-20	0	0	2020-07-19 10:00:39.425021	2020-07-19 10:00:39.425021	\N	\N	\N
2860247	181	1	Superior Double Room	USD	61.94	2020-07-20	0	0	2020-07-19 10:00:39.430651	2020-07-19 10:00:39.430651	\N	\N	\N
2860248	49	1	Superior Twin Room	USD	118.72	2020-07-20	0	0	2020-07-19 10:00:39.436242	2020-07-19 10:00:39.436242	\N	\N	\N
2860249	136	1	Standard Double or Twin Room	USD	119.28	2020-07-20	0	0	2020-07-19 10:00:39.444543	2020-07-19 10:00:39.444543	\N	\N	\N
2860250	98	1	Double or Twin	USD	80.05	2020-07-20	0	0	2020-07-19 10:00:39.450163	2020-07-19 10:00:39.450163	\N	\N	\N
2860251	159	1	Standard Room with 1 double bed and sofa	USD	86.05	2020-07-20	0	0	2020-07-19 10:00:39.458269	2020-07-19 10:00:39.458269	\N	\N	\N
2860252	42	1	Standard Twin Room	USD	68.85	2020-07-20	0	0	2020-07-19 10:00:39.464948	2020-07-19 10:00:39.464948	\N	\N	\N
2860253	3	1	Deluxe 	USD	138.15	2020-07-20	331.4	0	2020-07-19 10:00:39.47075	2020-07-19 10:00:39.47075	\N	\N	\N
2860254	90	1	Standard Room	USD	95.36	2020-07-20	381.43	0	2020-07-19 10:00:39.477438	2020-07-19 10:00:39.477438	\N	\N	\N
2860255	106	1	Double Room with Two Single Beds	USD	36.75	2020-07-20	0	0	2020-07-19 10:00:39.483732	2020-07-19 10:00:39.483732	\N	\N	\N
2860256	4	1	Twin Room	USD	110.84	2020-07-20	0	0	2020-07-19 10:00:39.489312	2020-07-19 10:00:39.489312	\N	\N	\N
2860257	27	1	Standard Twin Room - Smoking	USD	166.77	2020-07-20	542.64	0	2020-07-19 10:00:39.496648	2020-07-19 10:00:39.496648	\N	\N	\N
2860258	77	1	Double Room - North Side	USD	157.17	2020-07-20	0	0	2020-07-19 10:00:39.502418	2020-07-19 10:00:39.502418	\N	\N	\N
2860259	31	1	Classic Double or Twin Room with Hill View	USD	391.96	2020-07-20	0	0	2020-07-19 10:00:39.507992	2020-07-19 10:00:39.507992	\N	\N	\N
2860260	139	1	Small Double	USD	118.52	2020-07-20	474.11	0	2020-07-19 10:00:39.513673	2020-07-19 10:00:39.513673	\N	\N	\N
2860261	14	1	Classic Double Bed	USD	124.23	2020-07-20	0	0	2020-07-19 10:00:39.52114	2020-07-19 10:00:39.52114	\N	\N	\N
2860262	79	1	Standard Room	USD	81.69	2020-07-20	0	0	2020-07-19 10:00:39.526815	2020-07-19 10:00:39.526815	\N	\N	\N
2860263	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	112.12	2020-07-20	0	0	2020-07-19 10:00:39.532827	2020-07-19 10:00:39.532827	\N	\N	\N
2860264	67	1	Trendy Garden View Room	USD	213.59	2020-07-20	0	0	2020-07-19 10:00:39.544387	2020-07-19 10:00:39.544387	\N	\N	\N
2860265	160	1	King Accesible with Bathtub	USD	139	2020-07-20	0	0	2020-07-19 10:00:39.550672	2020-07-19 10:00:39.550672	\N	\N	\N
2860266	183	1	Business Deluxe, Guest room, 1 King	USD	159	2020-07-20	0	0	2020-07-19 10:00:39.567233	2020-07-19 10:00:39.567233	\N	\N	\N
2860267	54	1	Double Room	USD	154.1	2020-07-20	772.52	0	2020-07-19 10:00:39.573037	2020-07-19 10:00:39.573037	\N	\N	\N
2860268	47	1	Garden Facing Queen Room	USD	115.22	2020-07-20	0	0	2020-07-19 10:00:39.579946	2020-07-19 10:00:39.579946	\N	\N	\N
2860269	35	1	Twin - Non-Smoking	USD	98.1	2020-07-20	0	0	2020-07-19 10:00:39.587701	2020-07-19 10:00:39.587701	\N	\N	\N
2860270	38	1	Superior Double or Twin Room	USD	195.6	2020-07-20	0	0	2020-07-19 10:00:39.597831	2020-07-19 10:00:39.597831	\N	\N	\N
2860271	192	1	Comfort Room	USD	80.6	2020-07-20	228.73	0	2020-07-19 10:00:39.603662	2020-07-19 10:00:39.603662	\N	\N	\N
2860272	185	1	Standard Double	USD	137.24	2020-07-20	365.97	0	2020-07-19 10:00:39.60925	2020-07-19 10:00:39.60925	\N	\N	\N
2860273	165	1	Basic Room	USD	92.53	2020-07-20	0	0	2020-07-19 10:00:39.615304	2020-07-19 10:00:39.615304	\N	\N	\N
2860274	190	1	Twin Hilton Deluxe Room	USD	101.99	2020-07-20	0	0	2020-07-19 10:00:39.621058	2020-07-19 10:00:39.621058	\N	\N	\N
2860275	134	1	Queen Studio	USD	64.63	2020-07-20	0	0	2020-07-19 10:00:39.626485	2020-07-19 10:00:39.626485	\N	\N	\N
2860276	215	1	Deluxe - 3 persons	USD	32.22	2020-07-20	128.86	25	2020-07-19 10:00:40.06001	2020-07-19 10:00:40.06001	\N	\N	\N
2860278	261	1	Superior Twin or Double Room	USD	62.2	2020-07-20	0	0	2020-07-19 10:00:40.082776	2020-07-19 10:00:40.082776	\N	\N	\N
2860279	224	1	Standard King	USD	67.44	2020-07-20	283.13	0	2020-07-19 10:00:40.088591	2020-07-19 10:00:40.088591	\N	\N	\N
2860280	300	1	Deluxe Room, Guestroom, 1 King	USD	138.07	2020-07-20	0	0	2020-07-19 10:00:40.096066	2020-07-19 10:00:40.096066	\N	\N	\N
2860281	301	1	Comfort Double or Twin Room	USD	154.91	2020-07-20	0	0	2020-07-19 10:00:40.102315	2020-07-19 10:00:40.102315	\N	\N	\N
2860282	293	1	Budget Double Room	USD	59.9	2020-07-20	0	0	2020-07-19 10:00:40.108378	2020-07-19 10:00:40.108378	\N	\N	\N
2860283	243	1	Twin Room	USD	72.46	2020-07-20	0	0	2020-07-19 10:00:40.114796	2020-07-19 10:00:40.114796	\N	\N	\N
2860284	256	1	Standard Double Room	USD	108.92	2020-07-20	0	0	2020-07-19 10:00:40.123204	2020-07-19 10:00:40.123204	\N	\N	\N
2860286	285	1	Superior Room king bed	USD	93.87	2020-07-20	0	0	2020-07-19 10:00:40.142786	2020-07-19 10:00:40.142786	\N	\N	\N
2860289	238	1	Double or Twin Room	USD	120.36	2020-07-20	207.23	0	2020-07-19 10:00:40.162661	2020-07-19 10:00:40.162661	\N	\N	\N
2860290	314	1	1 Double Bed Non-Smoking	USD	158.6	2020-07-20	0	0	2020-07-19 10:00:40.171643	2020-07-19 10:00:40.171643	\N	\N	\N
2860291	274	1	Standard Twin Room - Non-Smoking	USD	197.67	2020-07-20	392.41	0	2020-07-19 10:00:40.179033	2020-07-19 10:00:40.179033	\N	\N	\N
2860292	306	1	Deluxe King City View	USD	107.47	2020-07-20	301.98	30	2020-07-19 10:00:40.18736	2020-07-19 10:00:40.18736	\N	\N	\N
2860293	290	1	Standard	USD	107.83	2020-07-20	0	0	2020-07-19 10:00:40.193645	2020-07-19 10:00:40.193645	\N	\N	\N
2860297	258	1	Standard Double Room	USD	24.21	2020-07-20	0	0	2020-07-19 10:00:40.22037	2020-07-19 10:00:40.22037	\N	\N	\N
2860298	216	1	2 Double Accessible with Bathtub	USD	129	2020-07-20	0	0	2020-07-19 10:00:40.228143	2020-07-19 10:00:40.228143	\N	\N	\N
2860299	281	1	Standard Room with Balcony	USD	192.38	2020-07-20	0	0	2020-07-19 10:00:40.234018	2020-07-19 10:00:40.234018	\N	\N	\N
2860302	275	1	Double or Twin Room	USD	101.89	2020-07-20	0	0	2020-07-19 10:00:40.253242	2020-07-19 10:00:40.253242	\N	\N	\N
2860303	204	1	King Bed	USD	116.72	2020-07-20	0	0	2020-07-19 10:00:40.269524	2020-07-19 10:00:40.269524	\N	\N	\N
2860305	295	1	Classic Double or Twin	USD	160.01	2020-07-20	468.89	0	2020-07-19 10:00:40.285386	2020-07-19 10:00:40.285386	\N	\N	\N
2860308	268	1	Double Room	USD	131.57	2020-07-20	0	0	2020-07-19 10:00:40.315809	2020-07-19 10:00:40.315809	\N	\N	\N
2860309	307	1	1 King Bed	USD	448.46	2020-07-20	0	0	2020-07-19 10:00:40.321776	2020-07-19 10:00:40.321776	\N	\N	\N
2860310	251	1	Standard Queen Room	USD	94.95	2020-07-20	0	0	2020-07-19 10:00:40.328729	2020-07-19 10:00:40.328729	\N	\N	\N
2860312	302	1	Accessible 1 King Bed	USD	78.9	2020-07-20	300	0	2020-07-19 10:00:40.340543	2020-07-19 10:00:40.340543	\N	\N	\N
2860318	249	1	Standard 1 Double 1 Single Bed	USD	113.32	2020-07-20	0	0	2020-07-19 10:00:40.396964	2020-07-19 10:00:40.396964	\N	\N	\N
2860320	206	1	Standard	USD	72.22	2020-07-20	0	0	2020-07-19 10:00:40.410322	2020-07-19 10:00:40.410322	\N	\N	\N
2860321	263	1	Queen Hilton Guestroom	USD	154.16	2020-07-20	0	0	2020-07-19 10:00:40.41579	2020-07-19 10:00:40.41579	\N	\N	\N
2920973	23	1	1 King Bed Evolution Room 	USD	129	2020-07-21	0	0	2020-07-20 10:00:37.023728	2020-07-20 10:00:37.023728	\N	\N	\N
2920974	45	1	Classic Double or Twin	USD	102.93	2020-07-21	0	0	2020-07-20 10:00:37.049016	2020-07-20 10:00:37.049016	\N	\N	\N
2920975	115	1	Double Room	USD	64.26	2020-07-21	0	0	2020-07-20 10:00:37.067827	2020-07-20 10:00:37.067827	\N	\N	\N
2920976	162	1	Flexible Room	USD	175.71	2020-07-21	0	0	2020-07-20 10:00:37.076782	2020-07-20 10:00:37.076782	\N	\N	\N
2920977	75	1	Low Floor Small Single Room - Smoking	USD	72.16	2020-07-21	212.76	0	2020-07-20 10:00:37.084351	2020-07-20 10:00:37.084351	\N	\N	\N
2920978	158	1	Superior Twin Non-Smoking	USD	85.81	2020-07-21	0	0	2020-07-20 10:00:37.094145	2020-07-20 10:00:37.094145	\N	\N	\N
2920979	153	1	Standard Twin Room	USD	245.15	2020-07-21	0	0	2020-07-20 10:00:37.100018	2020-07-20 10:00:37.100018	\N	\N	\N
2920980	131	1	Superior Double Room	USD	50.15	2020-07-21	0	0	2020-07-20 10:00:37.108895	2020-07-20 10:00:37.108895	\N	\N	\N
2920981	184	1	Superior Room	USD	73.25	2020-07-21	398.49	0	2020-07-20 10:00:37.116297	2020-07-20 10:00:37.116297	\N	\N	\N
2920982	176	1	Economy Twin Room	USD	134.11	2020-07-21	0	0	2020-07-20 10:00:37.125508	2020-07-20 10:00:37.125508	\N	\N	\N
2920983	113	1	2 Queen Beds 	USD	179	2020-07-21	0	0	2020-07-20 10:00:37.131517	2020-07-20 10:00:37.131517	\N	\N	\N
2920984	53	1	Superior Twin	USD	141.97	2020-07-21	0	0	2020-07-20 10:00:37.138622	2020-07-20 10:00:37.138622	\N	\N	\N
2920985	143	1	Standard Double Room	USD	142.66	2020-07-21	0	0	2020-07-20 10:00:37.144424	2020-07-20 10:00:37.144424	\N	\N	\N
2920986	108	1	Standard Double Room	USD	67.85	2020-07-21	0	0	2020-07-20 10:00:37.15057	2020-07-20 10:00:37.15057	\N	\N	\N
2920987	17	1	Double Room	USD	40	2020-07-21	0	0	2020-07-20 10:00:37.158045	2020-07-20 10:00:37.158045	\N	\N	\N
2920988	13	1	Premium Twin Room with Two Double Beds	USD	127.78	2020-07-21	0	0	2020-07-20 10:00:37.1638	2020-07-20 10:00:37.1638	\N	\N	\N
2920989	64	1	Basic Double or Twin Room	USD	54.06	2020-07-21	0	0	2020-07-20 10:00:37.172184	2020-07-20 10:00:37.172184	\N	\N	\N
2920990	125	1	Standard Double or Twin Room	USD	27	2020-07-21	0	0	2020-07-20 10:00:37.17962	2020-07-20 10:00:37.17962	\N	\N	\N
2920991	199	1	Standard Room with 1 double bed	USD	33.53	2020-07-21	0	0	2020-07-20 10:00:37.187259	2020-07-20 10:00:37.187259	\N	\N	\N
2920992	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-21	0	0	2020-07-20 10:00:37.194626	2020-07-20 10:00:37.194626	\N	\N	\N
2920993	194	1	Standard Small Double Room - Non-Smoking	USD	176.05	2020-07-21	0	0	2020-07-20 10:00:37.202896	2020-07-20 10:00:37.202896	\N	\N	\N
2920994	95	1	 Twin Guestroom	USD	124.95	2020-07-21	0	0	2020-07-20 10:00:37.208824	2020-07-20 10:00:37.208824	\N	\N	\N
2920995	157	1	Cosy Small Room	USD	102.39	2020-07-21	0	0	2020-07-20 10:00:37.215684	2020-07-20 10:00:37.215684	\N	\N	\N
2920996	26	1	Double	USD	80.91	2020-07-21	0	0	2020-07-20 10:00:37.221847	2020-07-20 10:00:37.221847	\N	\N	\N
2920997	61	1	Modern Double Room	USD	195.18	2020-07-21	0	0	2020-07-20 10:00:37.231294	2020-07-20 10:00:37.231294	\N	\N	\N
2920998	109	1	Classic Double Room	USD	171.24	2020-07-21	0	0	2020-07-20 10:00:37.237482	2020-07-20 10:00:37.237482	\N	\N	\N
2920999	84	1	Double or Twin Room	USD	57.18	2020-07-21	0	0	2020-07-20 10:00:37.243772	2020-07-20 10:00:37.243772	\N	\N	\N
2921000	181	1	Superior Double Room	USD	61.94	2020-07-21	0	0	2020-07-20 10:00:37.249729	2020-07-20 10:00:37.249729	\N	\N	\N
2921001	49	1	Superior Twin Room	USD	118.72	2020-07-21	0	0	2020-07-20 10:00:37.255309	2020-07-20 10:00:37.255309	\N	\N	\N
2921002	136	1	Standard Double or Twin Room	USD	125.95	2020-07-21	0	0	2020-07-20 10:00:37.270622	2020-07-20 10:00:37.270622	\N	\N	\N
2921003	98	1	Double or Twin	USD	80.05	2020-07-21	0	0	2020-07-20 10:00:37.277058	2020-07-20 10:00:37.277058	\N	\N	\N
2921004	159	1	Standard Room with 1 double bed and sofa	USD	86.05	2020-07-21	0	0	2020-07-20 10:00:37.28453	2020-07-20 10:00:37.28453	\N	\N	\N
2921005	42	1	Standard Twin Room	USD	68.85	2020-07-21	0	0	2020-07-20 10:00:37.293843	2020-07-20 10:00:37.293843	\N	\N	\N
2921006	3	1	Deluxe 	USD	138.15	2020-07-21	331.4	0	2020-07-20 10:00:37.299896	2020-07-20 10:00:37.299896	\N	\N	\N
2921007	90	1	Standard Room	USD	95.36	2020-07-21	381.43	0	2020-07-20 10:00:37.306299	2020-07-20 10:00:37.306299	\N	\N	\N
2921008	106	1	Double Room with Two Single Beds	USD	36.75	2020-07-21	0	0	2020-07-20 10:00:37.312506	2020-07-20 10:00:37.312506	\N	\N	\N
2921009	4	1	Double Room	USD	120.92	2020-07-21	0	0	2020-07-20 10:00:37.318278	2020-07-20 10:00:37.318278	\N	\N	\N
2921010	27	1	Standard Twin Room - Smoking	USD	166.77	2020-07-21	542.64	0	2020-07-20 10:00:37.324628	2020-07-20 10:00:37.324628	\N	\N	\N
2921011	77	1	Double Room - North Side	USD	157.17	2020-07-21	0	0	2020-07-20 10:00:37.330701	2020-07-20 10:00:37.330701	\N	\N	\N
2921012	31	1	Classic Double or Twin Room with Hill View	USD	391.96	2020-07-21	0	0	2020-07-20 10:00:37.336548	2020-07-20 10:00:37.336548	\N	\N	\N
2921013	139	1	Small Double	USD	122.68	2020-07-21	490.73	0	2020-07-20 10:00:37.342546	2020-07-20 10:00:37.342546	\N	\N	\N
2921014	14	1	Classic Double Bed	USD	124.23	2020-07-21	0	0	2020-07-20 10:00:37.349524	2020-07-20 10:00:37.349524	\N	\N	\N
2921015	79	1	Standard Room	USD	81.69	2020-07-21	0	0	2020-07-20 10:00:37.36924	2020-07-20 10:00:37.36924	\N	\N	\N
2921016	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	112.12	2020-07-21	0	0	2020-07-20 10:00:37.375208	2020-07-20 10:00:37.375208	\N	\N	\N
2921017	67	1	Trendy Garden View Room	USD	213.59	2020-07-21	0	0	2020-07-20 10:00:37.381984	2020-07-20 10:00:37.381984	\N	\N	\N
2921018	160	1	King Accessible with Roll In Shower	USD	139	2020-07-21	0	0	2020-07-20 10:00:37.387539	2020-07-20 10:00:37.387539	\N	\N	\N
2921019	183	1	Business Deluxe, Guest room, 1 King	USD	169	2020-07-21	0	0	2020-07-20 10:00:37.393747	2020-07-20 10:00:37.393747	\N	\N	\N
2921020	54	1	Double Room	USD	165.4	2020-07-21	817.73	0	2020-07-20 10:00:37.399574	2020-07-20 10:00:37.399574	\N	\N	\N
2921021	47	1	Garden Facing Queen Room	USD	115.22	2020-07-21	0	0	2020-07-20 10:00:37.405074	2020-07-20 10:00:37.405074	\N	\N	\N
2921022	35	1	Twin - Non-Smoking	USD	98.1	2020-07-21	0	0	2020-07-20 10:00:37.411686	2020-07-20 10:00:37.411686	\N	\N	\N
2921023	38	1	Superior Double or Twin Room	USD	238.35	2020-07-21	0	0	2020-07-20 10:00:37.417357	2020-07-20 10:00:37.417357	\N	\N	\N
2921024	192	1	Comfort Room	USD	80.6	2020-07-21	228.73	0	2020-07-20 10:00:37.423664	2020-07-20 10:00:37.423664	\N	\N	\N
2921025	165	1	Basic Room	USD	92.53	2020-07-21	0	0	2020-07-20 10:00:37.429567	2020-07-20 10:00:37.429567	\N	\N	\N
2921026	190	1	Twin Hilton Guestroom	USD	73.92	2020-07-21	0	0	2020-07-20 10:00:37.435417	2020-07-20 10:00:37.435417	\N	\N	\N
2921027	134	1	Queen Studio	USD	64.63	2020-07-21	0	0	2020-07-20 10:00:37.440986	2020-07-20 10:00:37.440986	\N	\N	\N
2921028	215	1	Deluxe - 3 persons	USD	32.22	2020-07-21	128.86	25	2020-07-20 10:00:37.887561	2020-07-20 10:00:37.887561	\N	\N	\N
2921031	261	1	Superior Twin or Double Room	USD	62.2	2020-07-21	0	0	2020-07-20 10:00:37.915044	2020-07-20 10:00:37.915044	\N	\N	\N
2921032	224	1	Standard King	USD	67.44	2020-07-21	283.13	0	2020-07-20 10:00:37.921004	2020-07-20 10:00:37.921004	\N	\N	\N
2921033	300	1	Deluxe Room, Guestroom, 1 King	USD	138.07	2020-07-21	0	0	2020-07-20 10:00:37.928132	2020-07-20 10:00:37.928132	\N	\N	\N
2921034	301	1	Comfort Double or Twin Room	USD	154.91	2020-07-21	0	0	2020-07-20 10:00:37.934129	2020-07-20 10:00:37.934129	\N	\N	\N
2921035	293	1	Budget Double Room	USD	59.9	2020-07-21	0	0	2020-07-20 10:00:37.939789	2020-07-20 10:00:37.939789	\N	\N	\N
2921036	243	1	Twin Room	USD	72.46	2020-07-21	0	0	2020-07-20 10:00:37.945577	2020-07-20 10:00:37.945577	\N	\N	\N
2921037	256	1	Standard Double Room	USD	108.92	2020-07-21	0	0	2020-07-20 10:00:37.951544	2020-07-20 10:00:37.951544	\N	\N	\N
2921039	285	1	Superior Room king bed	USD	96.73	2020-07-21	0	0	2020-07-20 10:00:37.964493	2020-07-20 10:00:37.964493	\N	\N	\N
2921042	238	1	Double or Twin Room	USD	137.56	2020-07-21	207.23	0	2020-07-20 10:00:37.983483	2020-07-20 10:00:37.983483	\N	\N	\N
2921043	314	1	1 Double Bed Non-Smoking	USD	147.82	2020-07-21	0	0	2020-07-20 10:00:37.990189	2020-07-20 10:00:37.990189	\N	\N	\N
2921044	274	1	Standard Twin Room - Non-Smoking	USD	197.67	2020-07-21	392.41	0	2020-07-20 10:00:37.996644	2020-07-20 10:00:37.996644	\N	\N	\N
2921045	306	1	Deluxe King City View	USD	107.47	2020-07-21	301.98	30	2020-07-20 10:00:38.03395	2020-07-20 10:00:38.03395	\N	\N	\N
2921046	290	1	Standard	USD	107.83	2020-07-21	0	0	2020-07-20 10:00:38.040933	2020-07-20 10:00:38.040933	\N	\N	\N
2921050	258	1	Standard Double Room	USD	24.21	2020-07-21	0	0	2020-07-20 10:00:38.069806	2020-07-20 10:00:38.069806	\N	\N	\N
2921051	216	1	2 Double Accessible with Bathtub	USD	129	2020-07-21	0	0	2020-07-20 10:00:38.075644	2020-07-20 10:00:38.075644	\N	\N	\N
2921052	281	1	Standard Room with Balcony	USD	192.38	2020-07-21	0	0	2020-07-20 10:00:38.081649	2020-07-20 10:00:38.081649	\N	\N	\N
2921055	275	1	Double or Twin Room	USD	89.41	2020-07-21	0	0	2020-07-20 10:00:38.099402	2020-07-20 10:00:38.099402	\N	\N	\N
2921056	204	1	King Bed	USD	116.72	2020-07-21	0	0	2020-07-20 10:00:38.105415	2020-07-20 10:00:38.105415	\N	\N	\N
2921058	295	1	Classic Double or Twin	USD	160.01	2020-07-21	468.89	0	2020-07-20 10:00:38.118122	2020-07-20 10:00:38.118122	\N	\N	\N
2921061	268	1	Double Room	USD	131.57	2020-07-21	0	0	2020-07-20 10:00:38.14109	2020-07-20 10:00:38.14109	\N	\N	\N
2921062	307	1	1 King Bed	USD	448.46	2020-07-21	0	0	2020-07-20 10:00:38.169775	2020-07-20 10:00:38.169775	\N	\N	\N
2921063	251	1	Standard Queen Room	USD	79.27	2020-07-21	0	0	2020-07-20 10:00:38.177476	2020-07-20 10:00:38.177476	\N	\N	\N
2921065	302	1	Accessible 1 King Bed	USD	78.9	2020-07-21	300	0	2020-07-20 10:00:38.190346	2020-07-20 10:00:38.190346	\N	\N	\N
2921067	279	1	Garden View Room	USD	253.76	2020-07-21	0	0	2020-07-20 10:00:38.205742	2020-07-20 10:00:38.205742	\N	\N	\N
2921072	249	1	Standard 1 Double 1 Single Bed	USD	113.32	2020-07-21	0	0	2020-07-20 10:00:38.245695	2020-07-20 10:00:38.245695	\N	\N	\N
2921074	206	1	Standard	USD	82.53	2020-07-21	0	0	2020-07-20 10:00:38.260032	2020-07-20 10:00:38.260032	\N	\N	\N
2921075	263	1	Queen Hilton Guestroom	USD	131.03	2020-07-21	0	0	2020-07-20 10:00:38.266395	2020-07-20 10:00:38.266395	\N	\N	\N
2981341	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-22	0	0	2020-07-21 10:00:40.429297	2020-07-21 10:00:40.429297	\N	\N	\N
2981342	45	1	Classic Double or Twin	USD	102.95	2020-07-22	0	0	2020-07-21 10:00:40.457849	2020-07-21 10:00:40.457849	\N	\N	\N
2981343	115	1	Double Room	USD	64.28	2020-07-22	0	0	2020-07-21 10:00:40.478765	2020-07-21 10:00:40.478765	\N	\N	\N
2981344	162	1	Flexible Room	USD	175.75	2020-07-22	0	0	2020-07-21 10:00:40.489206	2020-07-21 10:00:40.489206	\N	\N	\N
2981345	75	1	Low Floor Small Single Room - Smoking	USD	72.76	2020-07-22	212.3	0	2020-07-21 10:00:40.497866	2020-07-21 10:00:40.497866	\N	\N	\N
2981346	158	1	Superior Twin Non-Smoking	USD	85.91	2020-07-22	0	0	2020-07-21 10:00:40.509144	2020-07-21 10:00:40.509144	\N	\N	\N
2981347	153	1	Standard Plus King	USD	257.43	2020-07-22	0	0	2020-07-21 10:00:40.516159	2020-07-21 10:00:40.516159	\N	\N	\N
2981348	201	1	Feature Double Room	USD	137.84	2020-07-22	0	0	2020-07-21 10:00:40.524259	2020-07-21 10:00:40.524259	\N	\N	\N
2981349	131	1	Superior Double Room	USD	49.9	2020-07-22	0	0	2020-07-21 10:00:40.533706	2020-07-21 10:00:40.533706	\N	\N	\N
2981350	184	1	Superior Room	USD	77.48	2020-07-22	450.61	0	2020-07-21 10:00:40.543838	2020-07-21 10:00:40.543838	\N	\N	\N
2981351	176	1	Economy Twin Room	USD	118.55	2020-07-22	0	0	2020-07-21 10:00:40.553381	2020-07-21 10:00:40.553381	\N	\N	\N
2981352	113	1	2 Queen Beds 	USD	152.15	2020-07-22	0	0	2020-07-21 10:00:40.560994	2020-07-21 10:00:40.560994	\N	\N	\N
2981353	53	1	Superior Twin	USD	142.21	2020-07-22	0	0	2020-07-21 10:00:40.568718	2020-07-21 10:00:40.568718	\N	\N	\N
2981354	143	1	Standard Double Room	USD	143.19	2020-07-22	0	0	2020-07-21 10:00:40.577278	2020-07-21 10:00:40.577278	\N	\N	\N
2981355	108	1	Standard Double Room	USD	67.87	2020-07-22	0	0	2020-07-21 10:00:40.583671	2020-07-21 10:00:40.583671	\N	\N	\N
2981356	17	1	Double Room	USD	39.88	2020-07-22	0	0	2020-07-21 10:00:40.591069	2020-07-21 10:00:40.591069	\N	\N	\N
2981357	13	1	Premium Twin Room with Two Double Beds	USD	127.99	2020-07-22	0	0	2020-07-21 10:00:40.599368	2020-07-21 10:00:40.599368	\N	\N	\N
2981358	64	1	Basic Double or Twin Room	USD	54.07	2020-07-22	0	0	2020-07-21 10:00:40.60857	2020-07-21 10:00:40.60857	\N	\N	\N
2981359	125	1	Standard Double or Twin Room	USD	27	2020-07-22	0	0	2020-07-21 10:00:40.618359	2020-07-21 10:00:40.618359	\N	\N	\N
2981360	199	1	Standard Room with 1 double bed	USD	36.12	2020-07-22	0	0	2020-07-21 10:00:40.626788	2020-07-21 10:00:40.626788	\N	\N	\N
2981361	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-22	0	0	2020-07-21 10:00:40.635765	2020-07-21 10:00:40.635765	\N	\N	\N
2981362	194	1	Standard Small Double Room - Non-Smoking	USD	171.82	2020-07-22	0	0	2020-07-21 10:00:40.644539	2020-07-21 10:00:40.644539	\N	\N	\N
2981363	95	1	 Twin Guestroom	USD	124.98	2020-07-22	0	0	2020-07-21 10:00:40.656477	2020-07-21 10:00:40.656477	\N	\N	\N
2981364	157	1	Cosy Small Room	USD	103	2020-07-22	0	0	2020-07-21 10:00:40.664345	2020-07-21 10:00:40.664345	\N	\N	\N
2981365	26	1	Double	USD	86.33	2020-07-22	0	0	2020-07-21 10:00:40.670214	2020-07-21 10:00:40.670214	\N	\N	\N
2981366	61	1	Modern Double Room	USD	195	2020-07-22	0	0	2020-07-21 10:00:40.677811	2020-07-21 10:00:40.677811	\N	\N	\N
2981367	109	1	Classic Double Room	USD	171.28	2020-07-22	0	0	2020-07-21 10:00:40.683427	2020-07-21 10:00:40.683427	\N	\N	\N
2981368	84	1	Double or Twin Room	USD	57.2	2020-07-22	0	0	2020-07-21 10:00:40.689021	2020-07-21 10:00:40.689021	\N	\N	\N
2981369	181	1	Superior Double Room	USD	61.94	2020-07-22	0	0	2020-07-21 10:00:40.695924	2020-07-21 10:00:40.695924	\N	\N	\N
2981370	49	1	Superior Twin Room	USD	118.75	2020-07-22	0	0	2020-07-21 10:00:40.701643	2020-07-21 10:00:40.701643	\N	\N	\N
2981371	136	1	Standard Double or Twin Room	USD	126.42	2020-07-22	0	0	2020-07-21 10:00:40.708817	2020-07-21 10:00:40.708817	\N	\N	\N
2981372	98	1	Double or Twin	USD	82.16	2020-07-22	0	0	2020-07-21 10:00:40.714511	2020-07-21 10:00:40.714511	\N	\N	\N
2981373	159	1	Standard Room with 1 double bed and sofa	USD	86.07	2020-07-22	0	0	2020-07-21 10:00:40.722942	2020-07-21 10:00:40.722942	\N	\N	\N
2981374	42	1	Standard Twin Room	USD	81	2020-07-22	0	0	2020-07-21 10:00:40.730726	2020-07-21 10:00:40.730726	\N	\N	\N
2981375	3	1	Deluxe 	USD	137.59	2020-07-22	330.06	0	2020-07-21 10:00:40.736732	2020-07-21 10:00:40.736732	\N	\N	\N
2981376	90	1	Standard Room	USD	95.38	2020-07-22	381.51	0	2020-07-21 10:00:40.746852	2020-07-21 10:00:40.746852	\N	\N	\N
2981377	106	1	Double Room with Two Single Beds	USD	27.68	2020-07-22	0	0	2020-07-21 10:00:40.755744	2020-07-21 10:00:40.755744	\N	\N	\N
2981378	4	1	Double Room	USD	120.94	2020-07-22	0	0	2020-07-21 10:00:40.762335	2020-07-21 10:00:40.762335	\N	\N	\N
2981379	27	1	Standard Twin Room - Smoking	USD	166.42	2020-07-22	541.48	0	2020-07-21 10:00:40.769645	2020-07-21 10:00:40.769645	\N	\N	\N
2981380	77	1	Double Room - North Side	USD	157.02	2020-07-22	0	0	2020-07-21 10:00:40.776064	2020-07-21 10:00:40.776064	\N	\N	\N
2981381	31	1	Classic Double or Twin Room with Hill View	USD	392.05	2020-07-22	0	0	2020-07-21 10:00:40.781895	2020-07-21 10:00:40.781895	\N	\N	\N
2981382	102	1	Tryp Room	USD	82.36	2020-07-22	0	0	2020-07-21 10:00:40.790749	2020-07-21 10:00:40.790749	\N	\N	\N
2981383	139	1	Small Double	USD	122.71	2020-07-22	490.84	0	2020-07-21 10:00:40.796735	2020-07-21 10:00:40.796735	\N	\N	\N
2981384	14	1	Classic Double Bed	USD	124.26	2020-07-22	0	0	2020-07-21 10:00:40.804124	2020-07-21 10:00:40.804124	\N	\N	\N
2981385	79	1	Standard Room	USD	81.71	2020-07-22	0	0	2020-07-21 10:00:40.809792	2020-07-21 10:00:40.809792	\N	\N	\N
2981386	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	111.88	2020-07-22	0	0	2020-07-21 10:00:40.815399	2020-07-21 10:00:40.815399	\N	\N	\N
2981387	67	1	Trendy Garden View Room	USD	213.59	2020-07-22	0	0	2020-07-21 10:00:40.823394	2020-07-21 10:00:40.823394	\N	\N	\N
2981388	160	1	King Accesible with Bathtub	USD	139	2020-07-22	0	0	2020-07-21 10:00:40.831787	2020-07-21 10:00:40.831787	\N	\N	\N
2981389	183	1	Business Deluxe, Guest room, 1 King	USD	169	2020-07-22	0	0	2020-07-21 10:00:40.839308	2020-07-21 10:00:40.839308	\N	\N	\N
2981390	54	1	Double Room	USD	165.24	2020-07-22	816.94	0	2020-07-21 10:00:40.846006	2020-07-21 10:00:40.846006	\N	\N	\N
2981391	47	1	Garden Facing Queen Room	USD	115.22	2020-07-22	0	0	2020-07-21 10:00:40.85286	2020-07-21 10:00:40.85286	\N	\N	\N
2981392	35	1	Twin - Non-Smoking	USD	107.72	2020-07-22	0	0	2020-07-21 10:00:40.860315	2020-07-21 10:00:40.860315	\N	\N	\N
2981393	38	1	Superior Double or Twin Room	USD	238.4	2020-07-22	0	0	2020-07-21 10:00:40.871721	2020-07-21 10:00:40.871721	\N	\N	\N
2981394	192	1	Comfort Room	USD	80.62	2020-07-22	228.78	0	2020-07-21 10:00:40.877626	2020-07-21 10:00:40.877626	\N	\N	\N
2981395	165	1	Basic Room	USD	92.55	2020-07-22	0	0	2020-07-21 10:00:40.884022	2020-07-21 10:00:40.884022	\N	\N	\N
2981396	190	1	Twin Hilton Deluxe Room	USD	102.01	2020-07-22	0	0	2020-07-21 10:00:40.889531	2020-07-21 10:00:40.889531	\N	\N	\N
2981397	215	1	Deluxe - 3 persons	USD	32.22	2020-07-22	128.89	25	2020-07-21 10:00:42.158211	2020-07-21 10:00:42.158211	\N	\N	\N
2981400	261	1	Superior Twin or Double Room	USD	62.2	2020-07-22	0	0	2020-07-21 10:00:42.186982	2020-07-21 10:00:42.186982	\N	\N	\N
2981401	224	1	Standard King	USD	67.45	2020-07-22	283.19	0	2020-07-21 10:00:42.193102	2020-07-21 10:00:42.193102	\N	\N	\N
2981402	300	1	Deluxe Room, Guestroom, 1 King	USD	138.07	2020-07-22	0	0	2020-07-21 10:00:42.202048	2020-07-21 10:00:42.202048	\N	\N	\N
2981403	301	1	Comfort Double or Twin Room	USD	160.15	2020-07-22	0	0	2020-07-21 10:00:42.208218	2020-07-21 10:00:42.208218	\N	\N	\N
2981404	293	1	Comfort Double Room	USD	67.55	2020-07-22	0	0	2020-07-21 10:00:42.216266	2020-07-21 10:00:42.216266	\N	\N	\N
2981405	243	1	Twin Room	USD	72.48	2020-07-22	0	0	2020-07-21 10:00:42.222457	2020-07-21 10:00:42.222457	\N	\N	\N
2981406	256	1	Standard Double Room	USD	108.95	2020-07-22	0	0	2020-07-21 10:00:42.229345	2020-07-21 10:00:42.229345	\N	\N	\N
2981408	285	1	Superior Room king bed	USD	96.88	2020-07-22	0	0	2020-07-21 10:00:42.246068	2020-07-21 10:00:42.246068	\N	\N	\N
2981412	314	1	1 Double Bed Non-Smoking	USD	147.85	2020-07-22	0	0	2020-07-21 10:00:42.283523	2020-07-21 10:00:42.283523	\N	\N	\N
2981413	274	1	Small Double Room Non-Smoking	USD	197.25	2020-07-22	0	0	2020-07-21 10:00:42.294491	2020-07-21 10:00:42.294491	\N	\N	\N
2981414	306	1	Deluxe King City View	USD	106.19	2020-07-22	301.98	30	2020-07-21 10:00:42.302795	2020-07-21 10:00:42.302795	\N	\N	\N
2981415	290	1	Standard	USD	107.85	2020-07-22	0	0	2020-07-21 10:00:42.30936	2020-07-21 10:00:42.30936	\N	\N	\N
2981418	258	1	Standard Double Room	USD	24.31	2020-07-22	0	0	2020-07-21 10:00:42.32984	2020-07-21 10:00:42.32984	\N	\N	\N
2981419	216	1	2 Double Accessible with Bathtub	USD	129	2020-07-22	0	0	2020-07-21 10:00:42.337981	2020-07-21 10:00:42.337981	\N	\N	\N
2981420	281	1	Standard Room with Balcony	USD	192.43	2020-07-22	0	0	2020-07-21 10:00:42.344896	2020-07-21 10:00:42.344896	\N	\N	\N
2981423	275	1	Double or Twin Room	USD	89.43	2020-07-22	0	0	2020-07-21 10:00:42.366255	2020-07-21 10:00:42.366255	\N	\N	\N
2981424	204	1	King Bed	USD	132.09	2020-07-22	0	0	2020-07-21 10:00:42.374261	2020-07-21 10:00:42.374261	\N	\N	\N
2981426	295	1	Classic Double or Twin	USD	161.72	2020-07-22	469	0	2020-07-21 10:00:42.395801	2020-07-21 10:00:42.395801	\N	\N	\N
2981429	268	1	Double Room	USD	132.54	2020-07-22	0	0	2020-07-21 10:00:42.42154	2020-07-21 10:00:42.42154	\N	\N	\N
2981430	307	1	1 King Bed	USD	380.38	2020-07-22	0	0	2020-07-21 10:00:42.433876	2020-07-21 10:00:42.433876	\N	\N	\N
2981431	251	1	Standard Room with 2 Single Beds	USD	79.34	2020-07-22	0	0	2020-07-21 10:00:42.44139	2020-07-21 10:00:42.44139	\N	\N	\N
2981433	302	1	Accessible 1 King Bed	USD	79.55	2020-07-22	300	0	2020-07-21 10:00:42.456549	2020-07-21 10:00:42.456549	\N	\N	\N
2981435	279	1	Garden View Room	USD	254.14	2020-07-22	0	0	2020-07-21 10:00:42.472469	2020-07-21 10:00:42.472469	\N	\N	\N
2981440	249	1	Standard 1 Double 1 Single Bed	USD	113.35	2020-07-22	0	0	2020-07-21 10:00:42.514739	2020-07-21 10:00:42.514739	\N	\N	\N
2981442	206	1	Standard	USD	83.14	2020-07-22	0	0	2020-07-21 10:00:42.528012	2020-07-21 10:00:42.528012	\N	\N	\N
2981443	263	1	Queen Hilton Guestroom	USD	153.83	2020-07-22	0	0	2020-07-21 10:00:42.534074	2020-07-21 10:00:42.534074	\N	\N	\N
3041599	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-23	0	0	2020-07-22 10:00:39.085738	2020-07-22 10:00:39.085738	\N	\N	\N
3041600	45	1	Classic Double or Twin	USD	103.65	2020-07-23	0	0	2020-07-22 10:00:39.113347	2020-07-22 10:00:39.113347	\N	\N	\N
3041601	115	1	Double Room	USD	64.71	2020-07-23	0	0	2020-07-22 10:00:39.131403	2020-07-22 10:00:39.131403	\N	\N	\N
3041602	162	1	Flexible Room	USD	124.59	2020-07-23	0	0	2020-07-22 10:00:39.139854	2020-07-22 10:00:39.139854	\N	\N	\N
3041603	75	1	Small Single Room - Non-Smoking	USD	86.93	2020-07-23	213.35	0	2020-07-22 10:00:39.147419	2020-07-22 10:00:39.147419	\N	\N	\N
3041604	158	1	Superior Twin Non-Smoking	USD	85.95	2020-07-23	0	0	2020-07-22 10:00:39.157545	2020-07-22 10:00:39.157545	\N	\N	\N
3041605	153	1	Standard Twin Room	USD	197.4	2020-07-23	0	0	2020-07-22 10:00:39.164289	2020-07-22 10:00:39.164289	\N	\N	\N
3041606	201	1	Feature Double Room	USD	230.75	2020-07-23	0	0	2020-07-22 10:00:39.171422	2020-07-22 10:00:39.171422	\N	\N	\N
3041607	131	1	Superior Double Room	USD	50.56	2020-07-23	0	0	2020-07-22 10:00:39.181746	2020-07-22 10:00:39.181746	\N	\N	\N
3041608	184	1	Superior Room	USD	74.16	2020-07-23	441.61	0	2020-07-22 10:00:39.189947	2020-07-22 10:00:39.189947	\N	\N	\N
3041609	176	1	Economy Twin Room	USD	119.36	2020-07-23	0	0	2020-07-22 10:00:39.202521	2020-07-22 10:00:39.202521	\N	\N	\N
3041610	113	1	2 Queen Beds 	USD	152.15	2020-07-23	0	0	2020-07-22 10:00:39.208985	2020-07-22 10:00:39.208985	\N	\N	\N
3041611	53	1	Superior Twin	USD	132.08	2020-07-23	0	0	2020-07-22 10:00:39.216468	2020-07-22 10:00:39.216468	\N	\N	\N
3041612	143	1	Standard Double Room	USD	145.17	2020-07-23	0	0	2020-07-22 10:00:39.222711	2020-07-22 10:00:39.222711	\N	\N	\N
3041613	108	1	Standard Double Room	USD	72.94	2020-07-23	0	0	2020-07-22 10:00:39.228809	2020-07-22 10:00:39.228809	\N	\N	\N
3041614	17	1	Double Room	USD	40.33	2020-07-23	0	0	2020-07-22 10:00:39.236195	2020-07-22 10:00:39.236195	\N	\N	\N
3041615	13	1	Premium Twin Room with Two Double Beds	USD	129.26	2020-07-23	0	0	2020-07-22 10:00:39.245926	2020-07-22 10:00:39.245926	\N	\N	\N
3041616	64	1	Basic Double or Twin Room	USD	54.44	2020-07-23	0	0	2020-07-22 10:00:39.253846	2020-07-22 10:00:39.253846	\N	\N	\N
3041617	125	1	Standard Double or Twin Room	USD	27	2020-07-23	0	0	2020-07-22 10:00:39.261512	2020-07-22 10:00:39.261512	\N	\N	\N
3041618	199	1	Standard Room with 1 double bed	USD	38.71	2020-07-23	0	0	2020-07-22 10:00:39.270057	2020-07-22 10:00:39.270057	\N	\N	\N
3041619	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-23	0	0	2020-07-22 10:00:39.279893	2020-07-22 10:00:39.279893	\N	\N	\N
3041620	194	1	Standard Small Double Room - Non-Smoking	USD	180.41	2020-07-23	0	0	2020-07-22 10:00:39.290868	2020-07-22 10:00:39.290868	\N	\N	\N
3041621	95	1	 Twin Guestroom	USD	125.83	2020-07-23	0	0	2020-07-22 10:00:39.298481	2020-07-22 10:00:39.298481	\N	\N	\N
3041622	157	1	Cosy Small Room	USD	104.11	2020-07-23	0	0	2020-07-22 10:00:39.307203	2020-07-22 10:00:39.307203	\N	\N	\N
3041623	26	1	Double	USD	86.92	2020-07-23	0	0	2020-07-22 10:00:39.313345	2020-07-22 10:00:39.313345	\N	\N	\N
3041624	164	1	King Room	USD	253.45	2020-07-23	0	0	2020-07-22 10:00:39.319523	2020-07-22 10:00:39.319523	\N	\N	\N
3041625	61	1	Modern Double Room	USD	175.76	2020-07-23	0	0	2020-07-22 10:00:39.326414	2020-07-22 10:00:39.326414	\N	\N	\N
3041626	109	1	Classic Double Room	USD	172.44	2020-07-23	0	0	2020-07-22 10:00:39.332281	2020-07-22 10:00:39.332281	\N	\N	\N
3041627	84	1	Double or Twin Room	USD	52.34	2020-07-23	0	0	2020-07-22 10:00:39.337961	2020-07-22 10:00:39.337961	\N	\N	\N
3041628	181	1	Superior Double Room	USD	61.94	2020-07-23	0	0	2020-07-22 10:00:39.343507	2020-07-22 10:00:39.343507	\N	\N	\N
3041629	49	1	Superior Twin Room	USD	119.56	2020-07-23	0	0	2020-07-22 10:00:39.349106	2020-07-22 10:00:39.349106	\N	\N	\N
3041630	136	1	Standard Double or Twin Room	USD	120.27	2020-07-23	0	0	2020-07-22 10:00:39.357783	2020-07-22 10:00:39.357783	\N	\N	\N
3041631	98	1	Double or Twin	USD	80.62	2020-07-23	0	0	2020-07-22 10:00:39.36365	2020-07-22 10:00:39.36365	\N	\N	\N
3041632	159	1	Standard Room with 1 double bed and sofa	USD	86.65	2020-07-23	0	0	2020-07-22 10:00:39.373132	2020-07-22 10:00:39.373132	\N	\N	\N
3041633	42	1	Standard Twin Room	USD	68.85	2020-07-23	0	0	2020-07-22 10:00:39.380366	2020-07-22 10:00:39.380366	\N	\N	\N
3041634	3	1	Deluxe 	USD	138.95	2020-07-23	333.31	0	2020-07-22 10:00:39.386767	2020-07-22 10:00:39.386767	\N	\N	\N
3041635	90	1	Standard Room	USD	96.03	2020-07-23	384.11	0	2020-07-22 10:00:39.397139	2020-07-22 10:00:39.397139	\N	\N	\N
3041636	106	1	Double Room with Two Single Beds	USD	28.49	2020-07-23	0	0	2020-07-22 10:00:39.403397	2020-07-22 10:00:39.403397	\N	\N	\N
3041637	4	1	Twin Room	USD	121.77	2020-07-23	0	0	2020-07-22 10:00:39.409202	2020-07-22 10:00:39.409202	\N	\N	\N
3041638	27	1	Standard Twin Room - Smoking	USD	199.09	2020-07-23	544.15	0	2020-07-22 10:00:39.415717	2020-07-22 10:00:39.415717	\N	\N	\N
3041639	77	1	Double Room - North Side	USD	158.19	2020-07-23	0	0	2020-07-22 10:00:39.421686	2020-07-22 10:00:39.421686	\N	\N	\N
3041640	31	1	Classic Double or Twin Room with Hill View	USD	394.71	2020-07-23	0	0	2020-07-22 10:00:39.427667	2020-07-22 10:00:39.427667	\N	\N	\N
3041641	102	1	Tryp Room	USD	87.94	2020-07-23	0	0	2020-07-22 10:00:39.433624	2020-07-22 10:00:39.433624	\N	\N	\N
3041642	139	1	Small Double	USD	123.54	2020-07-23	494.17	0	2020-07-22 10:00:39.439415	2020-07-22 10:00:39.439415	\N	\N	\N
3041643	14	1	Classic Double Bed	USD	125.1	2020-07-23	0	0	2020-07-22 10:00:39.447897	2020-07-22 10:00:39.447897	\N	\N	\N
3041644	79	1	Standard Room	USD	82.26	2020-07-23	0	0	2020-07-22 10:00:39.453935	2020-07-22 10:00:39.453935	\N	\N	\N
3041645	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	131.17	2020-07-23	0	0	2020-07-22 10:00:39.466907	2020-07-22 10:00:39.466907	\N	\N	\N
3041646	67	1	Trendy Garden View Room	USD	334.42	2020-07-23	541.69	40	2020-07-22 10:00:39.474464	2020-07-22 10:00:39.474464	\N	\N	\N
3041647	160	1	King Accesible with Bathtub	USD	109	2020-07-23	0	0	2020-07-22 10:00:39.480216	2020-07-22 10:00:39.480216	\N	\N	\N
3041648	183	1	Business Deluxe, Guest room, 1 King	USD	124.17	2020-07-23	0	0	2020-07-22 10:00:39.486929	2020-07-22 10:00:39.486929	\N	\N	\N
3041649	54	1	Double Room	USD	166.46	2020-07-23	822.99	0	2020-07-22 10:00:39.492597	2020-07-22 10:00:39.492597	\N	\N	\N
3041650	47	1	Garden Facing Queen Room	USD	115.22	2020-07-23	0	0	2020-07-22 10:00:39.500319	2020-07-22 10:00:39.500319	\N	\N	\N
3041651	38	1	Superior Double or Twin Room	USD	240.02	2020-07-23	0	0	2020-07-22 10:00:39.508221	2020-07-22 10:00:39.508221	\N	\N	\N
3041652	192	1	Comfort Room	USD	81.17	2020-07-23	230.34	0	2020-07-22 10:00:39.514	2020-07-22 10:00:39.514	\N	\N	\N
3041653	165	1	Basic Room	USD	93.18	2020-07-23	0	0	2020-07-22 10:00:39.523958	2020-07-22 10:00:39.523958	\N	\N	\N
3041654	190	1	Twin Hilton Guestroom	USD	81.88	2020-07-23	0	0	2020-07-22 10:00:39.530408	2020-07-22 10:00:39.530408	\N	\N	\N
3041655	215	1	Deluxe Room	USD	28.98	2020-07-23	187.82	0	2020-07-22 10:00:40.06559	2020-07-22 10:00:40.06559	\N	\N	\N
3041658	261	1	Superior Twin or Double Room	USD	62.2	2020-07-23	0	0	2020-07-22 10:00:40.096988	2020-07-22 10:00:40.096988	\N	\N	\N
3041659	224	1	Standard King	USD	67.49	2020-07-23	283.32	0	2020-07-22 10:00:40.103618	2020-07-22 10:00:40.103618	\N	\N	\N
3041660	300	1	Deluxe Room, Guestroom, 1 King	USD	138.05	2020-07-23	0	0	2020-07-22 10:00:40.112166	2020-07-22 10:00:40.112166	\N	\N	\N
3041661	301	1	Comfort Double or Twin Room	USD	161.23	2020-07-23	0	0	2020-07-22 10:00:40.11835	2020-07-22 10:00:40.11835	\N	\N	\N
3041662	293	1	Budget Double Room	USD	70.19	2020-07-23	0	0	2020-07-22 10:00:40.12433	2020-07-22 10:00:40.12433	\N	\N	\N
3041663	243	1	Twin Room	USD	72.97	2020-07-23	0	0	2020-07-22 10:00:40.130133	2020-07-22 10:00:40.130133	\N	\N	\N
3041664	256	1	Standard Double Room	USD	109.69	2020-07-23	0	0	2020-07-22 10:00:40.136761	2020-07-22 10:00:40.136761	\N	\N	\N
3041666	285	1	Superior Room king bed	USD	98.44	2020-07-23	0	0	2020-07-22 10:00:40.151518	2020-07-22 10:00:40.151518	\N	\N	\N
3041670	314	1	1 Double Bed Non-Smoking	USD	148.85	2020-07-23	0	0	2020-07-22 10:00:40.182598	2020-07-22 10:00:40.182598	\N	\N	\N
3041671	274	1	Standard Twin Room - Non-Smoking	USD	327.91	2020-07-23	0	0	2020-07-22 10:00:40.194973	2020-07-22 10:00:40.194973	\N	\N	\N
3041672	306	1	Deluxe King City View	USD	105.09	2020-07-23	302.05	30	2020-07-22 10:00:40.203901	2020-07-22 10:00:40.203901	\N	\N	\N
3041673	290	1	Standard	USD	97.62	2020-07-23	0	0	2020-07-22 10:00:40.210015	2020-07-22 10:00:40.210015	\N	\N	\N
3041677	258	1	Standard Double Room	USD	25.03	2020-07-23	0	0	2020-07-22 10:00:40.238559	2020-07-22 10:00:40.238559	\N	\N	\N
3041678	216	1	2 Double Accessible with Bathtub	USD	119	2020-07-23	0	0	2020-07-22 10:00:40.246143	2020-07-22 10:00:40.246143	\N	\N	\N
3041681	275	1	Double or Twin Room	USD	90.04	2020-07-23	0	0	2020-07-22 10:00:40.265348	2020-07-22 10:00:40.265348	\N	\N	\N
3041682	204	1	King Bed	USD	132.99	2020-07-23	0	0	2020-07-22 10:00:40.274052	2020-07-22 10:00:40.274052	\N	\N	\N
3041684	295	1	Classic Double or Twin	USD	163.53	2020-07-23	472.19	0	2020-07-22 10:00:40.291413	2020-07-22 10:00:40.291413	\N	\N	\N
3041687	268	1	Double Room	USD	145.67	2020-07-23	0	0	2020-07-22 10:00:40.3177	2020-07-22 10:00:40.3177	\N	\N	\N
3041688	307	1	1 King Bed	USD	430.04	2020-07-23	0	0	2020-07-22 10:00:40.3297	2020-07-22 10:00:40.3297	\N	\N	\N
3041689	251	1	Standard Room with 2 Single Beds	USD	92.49	2020-07-23	0	0	2020-07-22 10:00:40.337392	2020-07-22 10:00:40.337392	\N	\N	\N
3041691	302	1	Accessible 1 King Bed	USD	71.14	2020-07-23	291.6	0	2020-07-22 10:00:40.351021	2020-07-22 10:00:40.351021	\N	\N	\N
3041693	279	1	Anchorage Room	USD	290.58	2020-07-23	0	0	2020-07-22 10:00:40.374994	2020-07-22 10:00:40.374994	\N	\N	\N
3041698	249	1	Standard 1 Double 1 Single Bed	USD	114.12	2020-07-23	0	0	2020-07-22 10:00:40.416424	2020-07-22 10:00:40.416424	\N	\N	\N
3041700	206	1	Standard	USD	83.75	2020-07-23	0	0	2020-07-22 10:00:40.430294	2020-07-22 10:00:40.430294	\N	\N	\N
3041701	263	1	Queen Hilton Guestroom	USD	201.43	2020-07-23	0	0	2020-07-22 10:00:40.436409	2020-07-22 10:00:40.436409	\N	\N	\N
3100529	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-24	0	0	2020-07-23 10:00:42.522685	2020-07-23 10:00:42.522685	\N	\N	\N
3100530	45	1	Classic Double or Twin	USD	103.65	2020-07-24	0	0	2020-07-23 10:00:42.544496	2020-07-23 10:00:42.544496	\N	\N	\N
3100531	115	1	Double Room	USD	66.91	2020-07-24	0	0	2020-07-23 10:00:42.562333	2020-07-23 10:00:42.562333	\N	\N	\N
3100532	162	1	Flexible Room	USD	135.06	2020-07-24	0	0	2020-07-23 10:00:42.572124	2020-07-23 10:00:42.572124	\N	\N	\N
3100533	75	1	Low Floor Small Single Room - Smoking	USD	86.93	2020-07-24	213.35	0	2020-07-23 10:00:42.580414	2020-07-23 10:00:42.580414	\N	\N	\N
3100534	105	1	Deluxe Room	USD	104.6	2020-07-24	418.4	0	2020-07-23 10:00:42.586358	2020-07-23 10:00:42.586358	\N	\N	\N
3100535	158	1	Superior Twin Non-Smoking	USD	85.95	2020-07-24	0	0	2020-07-23 10:00:42.596292	2020-07-23 10:00:42.596292	\N	\N	\N
3100536	153	1	Standard Twin Room	USD	197.4	2020-07-24	0	0	2020-07-23 10:00:42.602602	2020-07-23 10:00:42.602602	\N	\N	\N
3100537	131	1	Superior Double Room	USD	50.56	2020-07-24	0	0	2020-07-23 10:00:42.611989	2020-07-23 10:00:42.611989	\N	\N	\N
3100538	184	1	Superior Room	USD	64.56	2020-07-24	417.77	0	2020-07-23 10:00:42.622865	2020-07-23 10:00:42.622865	\N	\N	\N
3100539	176	1	Economy Twin Room	USD	129.83	2020-07-24	0	0	2020-07-23 10:00:42.63094	2020-07-23 10:00:42.63094	\N	\N	\N
3100540	113	1	2 Queen Beds 	USD	152.15	2020-07-24	0	0	2020-07-23 10:00:42.636956	2020-07-23 10:00:42.636956	\N	\N	\N
3100541	53	1	Superior Twin	USD	132.08	2020-07-24	0	0	2020-07-23 10:00:42.64436	2020-07-23 10:00:42.64436	\N	\N	\N
3100542	143	1	Superior Room	USD	173.86	2020-07-24	0	0	2020-07-23 10:00:42.650547	2020-07-23 10:00:42.650547	\N	\N	\N
3100543	108	1	Standard Double Room	USD	76.78	2020-07-24	0	0	2020-07-23 10:00:42.657175	2020-07-23 10:00:42.657175	\N	\N	\N
3100544	17	1	Double Room	USD	52.53	2020-07-24	0	0	2020-07-23 10:00:42.663933	2020-07-23 10:00:42.663933	\N	\N	\N
3100545	13	1	Premium Twin Room with Two Double Beds	USD	129.26	2020-07-24	0	0	2020-07-23 10:00:42.677087	2020-07-23 10:00:42.677087	\N	\N	\N
3100546	64	1	Basic Double or Twin Room	USD	57.58	2020-07-24	0	0	2020-07-23 10:00:42.68593	2020-07-23 10:00:42.68593	\N	\N	\N
3100547	125	1	Standard Double or Twin Room	USD	27	2020-07-24	0	0	2020-07-23 10:00:42.693898	2020-07-23 10:00:42.693898	\N	\N	\N
3100548	199	1	Standard Room with 1 double bed	USD	45.16	2020-07-24	0	0	2020-07-23 10:00:42.700464	2020-07-23 10:00:42.700464	\N	\N	\N
3100549	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-24	0	0	2020-07-23 10:00:42.708381	2020-07-23 10:00:42.708381	\N	\N	\N
3100550	194	1	Standard Small Double Room - Non-Smoking	USD	178.9	2020-07-24	0	0	2020-07-23 10:00:42.716406	2020-07-23 10:00:42.716406	\N	\N	\N
3100551	95	1	 Twin Guestroom	USD	125.83	2020-07-24	0	0	2020-07-23 10:00:42.723387	2020-07-23 10:00:42.723387	\N	\N	\N
3100552	157	1	Cosy Small Room	USD	104.11	2020-07-24	0	0	2020-07-23 10:00:42.730697	2020-07-23 10:00:42.730697	\N	\N	\N
3100553	26	1	Double	USD	76.05	2020-07-24	0	0	2020-07-23 10:00:42.736477	2020-07-23 10:00:42.736477	\N	\N	\N
3100554	164	1	King Room	USD	300.02	2020-07-24	0	0	2020-07-23 10:00:42.742397	2020-07-23 10:00:42.742397	\N	\N	\N
3100555	61	1	Modern Double Room	USD	217.12	2020-07-24	0	0	2020-07-23 10:00:42.749556	2020-07-23 10:00:42.749556	\N	\N	\N
3100556	109	1	Classic Double Room	USD	172.44	2020-07-24	0	0	2020-07-23 10:00:42.75539	2020-07-23 10:00:42.75539	\N	\N	\N
3100557	84	1	Double or Twin Room	USD	52.34	2020-07-24	0	0	2020-07-23 10:00:42.761125	2020-07-23 10:00:42.761125	\N	\N	\N
3100558	181	1	Superior Double Room	USD	61.94	2020-07-24	0	0	2020-07-23 10:00:42.767167	2020-07-23 10:00:42.767167	\N	\N	\N
3100559	49	1	Superior Twin Room	USD	108.59	2020-07-24	0	0	2020-07-23 10:00:42.773183	2020-07-23 10:00:42.773183	\N	\N	\N
3100560	136	1	Standard Double or Twin Room	USD	167.77	2020-07-24	0	0	2020-07-23 10:00:42.781736	2020-07-23 10:00:42.781736	\N	\N	\N
3100561	98	1	Double or Twin	USD	84.81	2020-07-24	0	0	2020-07-23 10:00:42.788209	2020-07-23 10:00:42.788209	\N	\N	\N
3100562	159	1	Standard Room with 1 double bed and sofa	USD	86.65	2020-07-24	0	0	2020-07-23 10:00:42.798058	2020-07-23 10:00:42.798058	\N	\N	\N
3100563	42	1	Standard Twin Room	USD	68.85	2020-07-24	0	0	2020-07-23 10:00:42.805076	2020-07-23 10:00:42.805076	\N	\N	\N
3100564	3	1	Deluxe 	USD	97.09	2020-07-24	333.31	0	2020-07-23 10:00:42.810874	2020-07-23 10:00:42.810874	\N	\N	\N
3100565	90	1	Standard Room	USD	96.03	2020-07-24	384.11	0	2020-07-23 10:00:42.819264	2020-07-23 10:00:42.819264	\N	\N	\N
3100566	106	1	Double Room with Two Single Beds	USD	24.31	2020-07-24	0	0	2020-07-23 10:00:42.825203	2020-07-23 10:00:42.825203	\N	\N	\N
3100567	4	1	Twin Room	USD	111.62	2020-07-24	0	0	2020-07-23 10:00:42.831051	2020-07-23 10:00:42.831051	\N	\N	\N
3100568	27	1	Standard Twin Room - Smoking	USD	199.09	2020-07-24	544.15	0	2020-07-23 10:00:42.841974	2020-07-23 10:00:42.841974	\N	\N	\N
3100569	77	1	Double Room - North Side	USD	176.8	2020-07-24	0	0	2020-07-23 10:00:42.848276	2020-07-23 10:00:42.848276	\N	\N	\N
3100570	31	1	Classic Double or Twin Room with Hill View	USD	394.71	2020-07-24	0	0	2020-07-23 10:00:42.854377	2020-07-23 10:00:42.854377	\N	\N	\N
3100571	102	1	Tryp Room	USD	92.13	2020-07-24	0	0	2020-07-23 10:00:42.86019	2020-07-23 10:00:42.86019	\N	\N	\N
3100572	139	1	Small Double	USD	123.54	2020-07-24	494.17	0	2020-07-23 10:00:42.867486	2020-07-23 10:00:42.867486	\N	\N	\N
3100573	14	1	Classic Double Bed	USD	125.1	2020-07-24	0	0	2020-07-23 10:00:42.874956	2020-07-23 10:00:42.874956	\N	\N	\N
3100574	79	1	Standard Room	USD	82.26	2020-07-24	0	0	2020-07-23 10:00:42.881024	2020-07-23 10:00:42.881024	\N	\N	\N
3100575	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	112.43	2020-07-24	0	0	2020-07-23 10:00:42.887024	2020-07-23 10:00:42.887024	\N	\N	\N
3100576	67	1	Trendy Garden View Room	USD	290.27	2020-07-24	0	0	2020-07-23 10:00:42.894789	2020-07-23 10:00:42.894789	\N	\N	\N
3100577	160	1	1 King Bed	USD	109	2020-07-24	0	0	2020-07-23 10:00:42.90065	2020-07-23 10:00:42.90065	\N	\N	\N
3100578	183	1	Business Deluxe, Guest room, 1 King	USD	109	2020-07-24	0	0	2020-07-23 10:00:42.908323	2020-07-23 10:00:42.908323	\N	\N	\N
3100579	54	1	Double Room	USD	143.71	2020-07-24	731.98	0	2020-07-23 10:00:42.914046	2020-07-23 10:00:42.914046	\N	\N	\N
3100580	47	1	Garden Facing Queen Room	USD	115.22	2020-07-24	0	0	2020-07-23 10:00:42.921671	2020-07-23 10:00:42.921671	\N	\N	\N
3100581	35	1	Twin - Non-Smoking	USD	108.25	2020-07-24	0	0	2020-07-23 10:00:42.929571	2020-07-23 10:00:42.929571	\N	\N	\N
3100582	38	1	Superior Double or Twin Room	USD	240.02	2020-07-24	0	0	2020-07-23 10:00:42.938398	2020-07-23 10:00:42.938398	\N	\N	\N
3100583	192	1	Comfort Room	USD	70.19	2020-07-24	230.34	0	2020-07-23 10:00:42.944181	2020-07-23 10:00:42.944181	\N	\N	\N
3100584	165	1	Basic Room	USD	93.18	2020-07-24	0	0	2020-07-23 10:00:42.951092	2020-07-23 10:00:42.951092	\N	\N	\N
3100585	190	1	Twin Hilton Deluxe Room	USD	102.71	2020-07-24	0	0	2020-07-23 10:00:42.957008	2020-07-23 10:00:42.957008	\N	\N	\N
3100586	215	1	Deluxe Room	USD	28.98	2020-07-24	187.82	0	2020-07-23 10:00:43.59022	2020-07-23 10:00:43.59022	\N	\N	\N
3100589	261	1	Superior Twin or Double Room	USD	62.2	2020-07-24	0	0	2020-07-23 10:00:43.621354	2020-07-23 10:00:43.621354	\N	\N	\N
3100590	224	1	Superior King	USD	73.35	2020-07-24	268.41	0	2020-07-23 10:00:43.627651	2020-07-23 10:00:43.627651	\N	\N	\N
3100591	300	1	Deluxe Room, Guestroom, 1 King	USD	138.05	2020-07-24	0	0	2020-07-23 10:00:43.636698	2020-07-23 10:00:43.636698	\N	\N	\N
3100592	301	1	Comfort Double or Twin Room	USD	161.23	2020-07-24	0	0	2020-07-23 10:00:43.642677	2020-07-23 10:00:43.642677	\N	\N	\N
3100593	293	1	Budget Double Room	USD	64.71	2020-07-24	0	0	2020-07-23 10:00:43.648641	2020-07-23 10:00:43.648641	\N	\N	\N
3100594	243	1	Twin Room	USD	61.41	2020-07-24	0	0	2020-07-23 10:00:43.654729	2020-07-23 10:00:43.654729	\N	\N	\N
3100595	256	1	Standard Double Room	USD	93.23	2020-07-24	0	0	2020-07-23 10:00:43.662122	2020-07-23 10:00:43.662122	\N	\N	\N
3100597	285	1	Superior Room king bed	USD	95.52	2020-07-24	0	0	2020-07-23 10:00:43.675969	2020-07-23 10:00:43.675969	\N	\N	\N
3100600	314	1	1 Double Bed Non-Smoking	USD	148.85	2020-07-24	0	0	2020-07-23 10:00:43.697469	2020-07-23 10:00:43.697469	\N	\N	\N
3100601	274	1	Small Double Room Non-Smoking	USD	281.07	2020-07-24	0	0	2020-07-23 10:00:43.706481	2020-07-23 10:00:43.706481	\N	\N	\N
3100602	306	1	Deluxe King City View	USD	98.62	2020-07-24	302.05	0	2020-07-23 10:00:43.714847	2020-07-23 10:00:43.714847	\N	\N	\N
3100603	290	1	Standard	USD	97.62	2020-07-24	0	0	2020-07-23 10:00:43.722279	2020-07-23 10:00:43.722279	\N	\N	\N
3100606	258	1	Standard Double Room	USD	25.03	2020-07-24	0	0	2020-07-23 10:00:43.740891	2020-07-23 10:00:43.740891	\N	\N	\N
3100607	216	1	2 Double Accessible Roll in Shower	USD	119	2020-07-24	0	0	2020-07-23 10:00:43.747451	2020-07-23 10:00:43.747451	\N	\N	\N
3100610	275	1	Double or Twin Room	USD	90.04	2020-07-24	0	0	2020-07-23 10:00:43.769127	2020-07-23 10:00:43.769127	\N	\N	\N
3100611	204	1	King Bed	USD	132.99	2020-07-24	0	0	2020-07-23 10:00:43.776307	2020-07-23 10:00:43.776307	\N	\N	\N
3100613	295	1	Classic Double or Twin	USD	161.12	2020-07-24	472.19	0	2020-07-23 10:00:43.793298	2020-07-23 10:00:43.793298	\N	\N	\N
3100616	307	1	1 King Bed	USD	430.04	2020-07-24	0	0	2020-07-23 10:00:43.819919	2020-07-23 10:00:43.819919	\N	\N	\N
3100617	251	1	Standard Room with 2 Single Beds	USD	80.69	2020-07-24	0	0	2020-07-23 10:00:43.827534	2020-07-23 10:00:43.827534	\N	\N	\N
3100619	302	1	2 Queen Beds 	USD	78.04	2020-07-24	0	0	2020-07-23 10:00:43.847856	2020-07-23 10:00:43.847856	\N	\N	\N
3100621	279	1	Garden View Room	USD	290.58	2020-07-24	0	0	2020-07-23 10:00:43.865798	2020-07-23 10:00:43.865798	\N	\N	\N
3100626	249	1	Standard Triple Room	USD	90.04	2020-07-24	0	0	2020-07-23 10:00:43.906057	2020-07-23 10:00:43.906057	\N	\N	\N
3100628	206	1	Standard	USD	83.75	2020-07-24	0	0	2020-07-23 10:00:43.924434	2020-07-23 10:00:43.924434	\N	\N	\N
3100629	263	1	Queen Hilton Guestroom	USD	248.28	2020-07-24	0	0	2020-07-23 10:00:43.931179	2020-07-23 10:00:43.931179	\N	\N	\N
3106535	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-25	0	0	2020-07-24 10:00:41.301098	2020-07-24 10:00:41.301098	\N	\N	\N
3106536	45	1	Classic Double or Twin	USD	104.58	2020-07-25	0	0	2020-07-24 10:00:41.327447	2020-07-24 10:00:41.327447	\N	\N	\N
3106537	115	1	Double Room	USD	78.57	2020-07-25	0	0	2020-07-24 10:00:41.344773	2020-07-24 10:00:41.344773	\N	\N	\N
3106538	162	1	Flexible Room	USD	210.21	2020-07-25	0	0	2020-07-24 10:00:41.35455	2020-07-24 10:00:41.35455	\N	\N	\N
3106539	75	1	Low Floor Small Single Room - Smoking	USD	86.87	2020-07-25	213.19	0	2020-07-24 10:00:41.361359	2020-07-24 10:00:41.361359	\N	\N	\N
3106540	158	1	Superior Twin Non-Smoking	USD	85.66	2020-07-25	0	0	2020-07-24 10:00:41.371914	2020-07-24 10:00:41.371914	\N	\N	\N
3106541	153	1	Standard Twin Room	USD	174.21	2020-07-25	0	0	2020-07-24 10:00:41.378206	2020-07-24 10:00:41.378206	\N	\N	\N
3106542	131	1	Superior Double Room	USD	50.71	2020-07-25	0	0	2020-07-24 10:00:41.387309	2020-07-24 10:00:41.387309	\N	\N	\N
3106543	184	1	Superior Room	USD	63.09	2020-07-25	413.69	0	2020-07-24 10:00:41.396445	2020-07-24 10:00:41.396445	\N	\N	\N
3106544	176	1	Economy Twin Room	USD	130.99	2020-07-25	0	0	2020-07-24 10:00:41.406829	2020-07-24 10:00:41.406829	\N	\N	\N
3106545	113	1	2 Queen Beds 	USD	160.65	2020-07-25	0	0	2020-07-24 10:00:41.41273	2020-07-24 10:00:41.41273	\N	\N	\N
3106546	53	1	Superior Twin	USD	155.62	2020-07-25	0	0	2020-07-24 10:00:41.42057	2020-07-24 10:00:41.42057	\N	\N	\N
3106547	143	1	Standard Double Room	USD	144.12	2020-07-25	0	0	2020-07-24 10:00:41.426546	2020-07-24 10:00:41.426546	\N	\N	\N
3106548	108	1	Standard Plus Double Room	USD	85.21	2020-07-25	0	0	2020-07-24 10:00:41.4327	2020-07-24 10:00:41.4327	\N	\N	\N
3106549	17	1	Double Room	USD	52.39	2020-07-25	0	0	2020-07-24 10:00:41.441292	2020-07-24 10:00:41.441292	\N	\N	\N
3106550	13	1	Premium Twin Room with Two Double Beds	USD	202.53	2020-07-25	0	0	2020-07-24 10:00:41.450376	2020-07-24 10:00:41.450376	\N	\N	\N
3106551	8	1	Twin Room	USD	165.64	2020-07-25	0	0	2020-07-24 10:00:41.456615	2020-07-24 10:00:41.456615	\N	\N	\N
3106552	64	1	Basic Double or Twin Room	USD	63.39	2020-07-25	0	0	2020-07-24 10:00:41.46421	2020-07-24 10:00:41.46421	\N	\N	\N
3106553	125	1	Standard Double or Twin Room	USD	27	2020-07-25	0	0	2020-07-24 10:00:41.470851	2020-07-24 10:00:41.470851	\N	\N	\N
3106554	199	1	Standard Room with 1 double bed	USD	45.15	2020-07-25	0	0	2020-07-24 10:00:41.479162	2020-07-24 10:00:41.479162	\N	\N	\N
3106555	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	125	2020-07-25	0	0	2020-07-24 10:00:41.487873	2020-07-24 10:00:41.487873	\N	\N	\N
3106556	194	1	Standard Small Double Room - Non-Smoking	USD	172.54	2020-07-25	0	0	2020-07-24 10:00:41.49917	2020-07-24 10:00:41.49917	\N	\N	\N
3106557	95	1	 Twin Guestroom	USD	126.95	2020-07-25	0	0	2020-07-24 10:00:41.506149	2020-07-24 10:00:41.506149	\N	\N	\N
3106558	157	1	Cosy Small Room	USD	104.58	2020-07-25	0	0	2020-07-24 10:00:41.513783	2020-07-24 10:00:41.513783	\N	\N	\N
3106559	26	1	Double	USD	87.69	2020-07-25	0	0	2020-07-24 10:00:41.519665	2020-07-24 10:00:41.519665	\N	\N	\N
3106560	164	1	Standard Twin Room	USD	200.23	2020-07-25	0	0	2020-07-24 10:00:41.525884	2020-07-24 10:00:41.525884	\N	\N	\N
3106561	61	1	Modern Double Room	USD	198.12	2020-07-25	0	0	2020-07-24 10:00:41.533524	2020-07-24 10:00:41.533524	\N	\N	\N
3106562	84	1	Double or Twin Room	USD	52.81	2020-07-25	0	0	2020-07-24 10:00:41.539776	2020-07-24 10:00:41.539776	\N	\N	\N
3106563	181	1	Superior Double Room	USD	61.94	2020-07-25	0	0	2020-07-24 10:00:41.54597	2020-07-24 10:00:41.54597	\N	\N	\N
3106564	49	1	Superior Twin Room	USD	109.56	2020-07-25	0	0	2020-07-24 10:00:41.556501	2020-07-24 10:00:41.556501	\N	\N	\N
3106565	136	1	Standard Double or Twin Room	USD	126.77	2020-07-25	0	0	2020-07-24 10:00:41.568472	2020-07-24 10:00:41.568472	\N	\N	\N
3106566	98	1	Double or Twin	USD	88.73	2020-07-25	0	0	2020-07-24 10:00:41.574321	2020-07-24 10:00:41.574321	\N	\N	\N
3106567	159	1	Standard Room with 1 double bed and sofa	USD	87.43	2020-07-25	0	0	2020-07-24 10:00:41.586407	2020-07-24 10:00:41.586407	\N	\N	\N
3106568	42	1	Standard Twin Room	USD	68.85	2020-07-25	0	0	2020-07-24 10:00:41.59434	2020-07-24 10:00:41.59434	\N	\N	\N
3106569	90	1	Standard Room with View	USD	109.12	2020-07-25	436.46	0	2020-07-24 10:00:41.602424	2020-07-24 10:00:41.602424	\N	\N	\N
3106570	106	1	Double Room with Two Single Beds	USD	24.41	2020-07-25	0	0	2020-07-24 10:00:41.60824	2020-07-24 10:00:41.60824	\N	\N	\N
3106571	4	1	Twin Room	USD	112.62	2020-07-25	0	0	2020-07-24 10:00:41.614927	2020-07-24 10:00:41.614927	\N	\N	\N
3106572	27	1	Standard Twin Room - Smoking	USD	198.94	2020-07-25	543.74	0	2020-07-24 10:00:41.62248	2020-07-24 10:00:41.62248	\N	\N	\N
3106573	77	1	Double Room - South Side	USD	187.69	2020-07-25	0	0	2020-07-24 10:00:41.628728	2020-07-24 10:00:41.628728	\N	\N	\N
3106574	31	1	Classic Double or Twin Room with Hill View	USD	398.25	2020-07-25	0	0	2020-07-24 10:00:41.634834	2020-07-24 10:00:41.634834	\N	\N	\N
3106575	102	1	Tryp Room	USD	126.76	2020-07-25	0	0	2020-07-24 10:00:41.64096	2020-07-24 10:00:41.64096	\N	\N	\N
3106576	139	1	Small Double	USD	124.65	2020-07-25	498.59	0	2020-07-24 10:00:41.646815	2020-07-24 10:00:41.646815	\N	\N	\N
3106577	14	1	Classic Double Bed	USD	131.5	2020-07-25	0	0	2020-07-24 10:00:41.653875	2020-07-24 10:00:41.653875	\N	\N	\N
3106578	79	1	Standard Room	USD	83	2020-07-25	0	0	2020-07-24 10:00:41.660032	2020-07-24 10:00:41.660032	\N	\N	\N
3106579	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	112.34	2020-07-25	0	0	2020-07-24 10:00:41.666129	2020-07-24 10:00:41.666129	\N	\N	\N
3106580	67	1	Trendy Garden View Room	USD	290.27	2020-07-25	0	0	2020-07-24 10:00:41.678541	2020-07-24 10:00:41.678541	\N	\N	\N
3106581	160	1	1 King Bed	USD	109	2020-07-25	0	0	2020-07-24 10:00:41.684748	2020-07-24 10:00:41.684748	\N	\N	\N
3106582	183	1	Business Deluxe, Guest room, 1 King	USD	109	2020-07-25	0	0	2020-07-24 10:00:41.692272	2020-07-24 10:00:41.692272	\N	\N	\N
3106583	54	1	Double Room	USD	144.94	2020-07-25	738.24	0	2020-07-24 10:00:41.698489	2020-07-24 10:00:41.698489	\N	\N	\N
3106584	47	1	Garden Facing Queen Room	USD	115.22	2020-07-25	0	0	2020-07-24 10:00:41.706741	2020-07-24 10:00:41.706741	\N	\N	\N
3106585	35	1	Twin - Non-Smoking	USD	108.17	2020-07-25	0	0	2020-07-24 10:00:41.714208	2020-07-24 10:00:41.714208	\N	\N	\N
3106586	38	1	Superior Double or Twin Room	USD	242.17	2020-07-25	0	0	2020-07-24 10:00:41.722711	2020-07-24 10:00:41.722711	\N	\N	\N
3106587	192	1	Comfort Room	USD	70.82	2020-07-25	232.4	0	2020-07-24 10:00:41.72893	2020-07-24 10:00:41.72893	\N	\N	\N
3106588	165	1	Standard Room	USD	104.58	2020-07-25	0	0	2020-07-24 10:00:41.73567	2020-07-24 10:00:41.73567	\N	\N	\N
3106589	190	1	Twin Hilton Deluxe Room	USD	103.63	2020-07-25	0	0	2020-07-24 10:00:41.743342	2020-07-24 10:00:41.743342	\N	\N	\N
3106590	215	1	Deluxe Room	USD	28.98	2020-07-25	187.8	0	2020-07-24 10:00:42.210898	2020-07-24 10:00:42.210898	\N	\N	\N
3106593	261	1	Superior Twin or Double Room	USD	62.2	2020-07-25	0	0	2020-07-24 10:00:42.23897	2020-07-24 10:00:42.23897	\N	\N	\N
3106594	300	1	Deluxe Room, Guestroom, 1 King	USD	138.09	2020-07-25	0	0	2020-07-24 10:00:42.247569	2020-07-24 10:00:42.247569	\N	\N	\N
3106595	301	1	Deluxe Double Room	USD	226.06	2020-07-25	0	0	2020-07-24 10:00:42.25347	2020-07-24 10:00:42.25347	\N	\N	\N
3106596	293	1	Budget Double Room	USD	65.29	2020-07-25	0	0	2020-07-24 10:00:42.259326	2020-07-24 10:00:42.259326	\N	\N	\N
3106597	243	1	Twin Room	USD	61.96	2020-07-25	0	0	2020-07-24 10:00:42.265216	2020-07-24 10:00:42.265216	\N	\N	\N
3106598	256	1	Standard Double Room	USD	94.06	2020-07-25	0	0	2020-07-24 10:00:42.272793	2020-07-24 10:00:42.272793	\N	\N	\N
3106600	285	1	Superior Room king bed	USD	98.52	2020-07-25	0	0	2020-07-24 10:00:42.286775	2020-07-24 10:00:42.286775	\N	\N	\N
3106603	314	1	1 Double Bed Non-Smoking	USD	183.07	2020-07-25	0	0	2020-07-24 10:00:42.31034	2020-07-24 10:00:42.31034	\N	\N	\N
3106604	274	1	Standard Twin Room - Non-Smoking	USD	327.67	2020-07-25	0	0	2020-07-24 10:00:42.320597	2020-07-24 10:00:42.320597	\N	\N	\N
3106605	306	1	Deluxe King City View	USD	91.58	2020-07-25	302.12	0	2020-07-24 10:00:42.32992	2020-07-24 10:00:42.32992	\N	\N	\N
3106606	290	1	Standard	USD	98.49	2020-07-25	0	0	2020-07-24 10:00:42.337653	2020-07-24 10:00:42.337653	\N	\N	\N
3106609	258	1	Standard Double Room	USD	25.13	2020-07-25	0	0	2020-07-24 10:00:42.358586	2020-07-24 10:00:42.358586	\N	\N	\N
3106610	216	1	2 Double Accessible with Bathtub	USD	119	2020-07-25	0	0	2020-07-24 10:00:42.366632	2020-07-24 10:00:42.366632	\N	\N	\N
3106613	275	1	Double or Twin Room	USD	90.84	2020-07-25	0	0	2020-07-24 10:00:42.387182	2020-07-24 10:00:42.387182	\N	\N	\N
3106614	204	1	King Bed	USD	133.85	2020-07-25	0	0	2020-07-24 10:00:42.394509	2020-07-24 10:00:42.394509	\N	\N	\N
3106616	295	1	Classic Double or Twin	USD	153.67	2020-07-25	476.41	0	2020-07-24 10:00:42.409875	2020-07-24 10:00:42.409875	\N	\N	\N
3106619	307	1	1 King Bed	USD	429.72	2020-07-25	0	0	2020-07-24 10:00:42.437164	2020-07-24 10:00:42.437164	\N	\N	\N
3106620	251	1	Standard Room with 2 Single Beds	USD	81.68	2020-07-25	0	0	2020-07-24 10:00:42.444416	2020-07-24 10:00:42.444416	\N	\N	\N
3106622	302	1	Accessible 1 King Bed	USD	73.73	2020-07-25	300	0	2020-07-24 10:00:42.460606	2020-07-24 10:00:42.460606	\N	\N	\N
3106624	279	1	Garden View Room	USD	290.83	2020-07-25	0	0	2020-07-24 10:00:42.480666	2020-07-24 10:00:42.480666	\N	\N	\N
3106629	249	1	Standard 1 Double 1 Single Bed	USD	100.35	2020-07-25	0	0	2020-07-24 10:00:42.522914	2020-07-24 10:00:42.522914	\N	\N	\N
3106631	206	1	Standard	USD	83.75	2020-07-25	0	0	2020-07-24 10:00:42.537878	2020-07-24 10:00:42.537878	\N	\N	\N
3106632	263	1	Queen Hilton Guestroom	USD	201.28	2020-07-25	0	0	2020-07-24 10:00:42.54372	2020-07-24 10:00:42.54372	\N	\N	\N
3157651	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-26	0	0	2020-07-25 10:00:39.953479	2020-07-25 10:00:39.953479	\N	\N	\N
3157652	45	1	Classic Double or Twin	USD	104.72	2020-07-26	0	0	2020-07-25 10:00:39.984828	2020-07-25 10:00:39.984828	\N	\N	\N
3157653	115	1	Double Room	USD	60.95	2020-07-26	0	0	2020-07-25 10:00:40.053394	2020-07-25 10:00:40.053394	\N	\N	\N
3157654	162	1	Standard Double Room	USD	223.73	2020-07-26	0	0	2020-07-25 10:00:40.0637	2020-07-25 10:00:40.0637	\N	\N	\N
3157655	75	1	Low Floor Small Single Room - Smoking	USD	65.75	2020-07-26	215.47	0	2020-07-25 10:00:40.071922	2020-07-25 10:00:40.071922	\N	\N	\N
3157656	105	1	Double or Twin Room	USD	75.9	2020-07-26	418.9	0	2020-07-25 10:00:40.078388	2020-07-25 10:00:40.078388	\N	\N	\N
3157657	158	1	Superior Twin Non-Smoking	USD	85.5	2020-07-26	0	0	2020-07-25 10:00:40.091528	2020-07-25 10:00:40.091528	\N	\N	\N
3157658	153	1	Standard Twin Room	USD	170.68	2020-07-26	0	0	2020-07-25 10:00:40.098314	2020-07-25 10:00:40.098314	\N	\N	\N
3157659	201	1	Classic Double Room	USD	121.77	2020-07-26	0	0	2020-07-25 10:00:40.106114	2020-07-25 10:00:40.106114	\N	\N	\N
3157660	131	1	Superior Double Room	USD	50.85	2020-07-26	0	0	2020-07-25 10:00:40.114728	2020-07-25 10:00:40.114728	\N	\N	\N
3157661	184	1	Superior Room	USD	65.24	2020-07-26	409.51	0	2020-07-25 10:00:40.123386	2020-07-25 10:00:40.123386	\N	\N	\N
3157662	176	1	Economy Twin Room	USD	120.6	2020-07-26	0	0	2020-07-25 10:00:40.133105	2020-07-25 10:00:40.133105	\N	\N	\N
3157663	113	1	2 Queen Beds 	USD	143.65	2020-07-26	0	0	2020-07-25 10:00:40.13929	2020-07-25 10:00:40.13929	\N	\N	\N
3157664	53	1	Superior Twin	USD	120.51	2020-07-26	0	0	2020-07-25 10:00:40.147298	2020-07-25 10:00:40.147298	\N	\N	\N
3157665	143	1	Standard Double Room	USD	143.98	2020-07-26	0	0	2020-07-25 10:00:40.153659	2020-07-25 10:00:40.153659	\N	\N	\N
3157666	108	1	Standard Double Room	USD	73.69	2020-07-26	0	0	2020-07-25 10:00:40.159636	2020-07-25 10:00:40.159636	\N	\N	\N
3157667	17	1	Double Room	USD	40.27	2020-07-26	0	0	2020-07-25 10:00:40.167842	2020-07-25 10:00:40.167842	\N	\N	\N
3157668	13	1	Premium Twin Room with Two Double Beds	USD	129.22	2020-07-26	0	0	2020-07-25 10:00:40.175153	2020-07-25 10:00:40.175153	\N	\N	\N
3157669	64	1	Basic Double or Twin Room	USD	50.78	2020-07-26	0	0	2020-07-25 10:00:40.183212	2020-07-25 10:00:40.183212	\N	\N	\N
3157670	125	1	Standard Double or Twin Room	USD	27	2020-07-26	0	0	2020-07-25 10:00:40.189848	2020-07-25 10:00:40.189848	\N	\N	\N
3157671	199	1	Standard Room with 1 double bed	USD	36.12	2020-07-26	0	0	2020-07-25 10:00:40.197146	2020-07-25 10:00:40.197146	\N	\N	\N
3157672	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	109	2020-07-26	0	0	2020-07-25 10:00:40.204741	2020-07-25 10:00:40.204741	\N	\N	\N
3157673	194	1	Standard Small Double Room - Non-Smoking	USD	166.56	2020-07-26	0	0	2020-07-25 10:00:40.213327	2020-07-25 10:00:40.213327	\N	\N	\N
3157674	95	1	 Twin Guestroom	USD	127.13	2020-07-26	0	0	2020-07-25 10:00:40.22043	2020-07-25 10:00:40.22043	\N	\N	\N
3157675	157	1	Cosy Small Room	USD	104.41	2020-07-26	0	0	2020-07-25 10:00:40.227463	2020-07-25 10:00:40.227463	\N	\N	\N
3157676	26	1	Double	USD	76.84	2020-07-26	0	0	2020-07-25 10:00:40.233438	2020-07-25 10:00:40.233438	\N	\N	\N
3157677	164	1	Standard Twin Room	USD	240.08	2020-07-26	0	0	2020-07-25 10:00:40.239332	2020-07-25 10:00:40.239332	\N	\N	\N
3157678	61	1	Modern Double Room	USD	177.7	2020-07-26	0	0	2020-07-25 10:00:40.246584	2020-07-25 10:00:40.246584	\N	\N	\N
3157679	109	1	Classic Double Room	USD	152.33	2020-07-26	0	0	2020-07-25 10:00:40.252921	2020-07-25 10:00:40.252921	\N	\N	\N
3157680	84	1	Double or Twin Room	USD	52.89	2020-07-26	0	0	2020-07-25 10:00:40.267278	2020-07-25 10:00:40.267278	\N	\N	\N
3157681	181	1	Superior Double Room	USD	61.94	2020-07-26	0	0	2020-07-25 10:00:40.273994	2020-07-25 10:00:40.273994	\N	\N	\N
3157682	49	1	Superior Twin Room	USD	98.63	2020-07-26	0	0	2020-07-25 10:00:40.2802	2020-07-25 10:00:40.2802	\N	\N	\N
3157683	136	1	Standard Double or Twin Room	USD	126.69	2020-07-26	0	0	2020-07-25 10:00:40.28836	2020-07-25 10:00:40.28836	\N	\N	\N
3157684	98	1	Double or Twin	USD	86.75	2020-07-26	0	0	2020-07-25 10:00:40.294314	2020-07-25 10:00:40.294314	\N	\N	\N
3157685	159	1	Standard Room with 1 double bed and sofa	USD	87.55	2020-07-26	0	0	2020-07-25 10:00:40.303523	2020-07-25 10:00:40.303523	\N	\N	\N
3157686	90	1	Standard Room	USD	97.02	2020-07-26	388.08	0	2020-07-25 10:00:40.313071	2020-07-25 10:00:40.313071	\N	\N	\N
3157687	106	1	Double Room with Two Single Beds	USD	32.33	2020-07-26	0	0	2020-07-25 10:00:40.319292	2020-07-25 10:00:40.319292	\N	\N	\N
3157688	4	1	Twin Room	USD	112.78	2020-07-26	0	0	2020-07-25 10:00:40.325769	2020-07-25 10:00:40.325769	\N	\N	\N
3157689	27	1	Standard Twin Room - Smoking	USD	201.07	2020-07-26	549.55	0	2020-07-25 10:00:40.332772	2020-07-25 10:00:40.332772	\N	\N	\N
3157690	77	1	Double Room - North Side	USD	159.93	2020-07-26	0	0	2020-07-25 10:00:40.338866	2020-07-25 10:00:40.338866	\N	\N	\N
3157691	31	1	Classic Double or Twin Room with Hill View	USD	398.8	2020-07-26	0	0	2020-07-25 10:00:40.344981	2020-07-25 10:00:40.344981	\N	\N	\N
3157692	102	1	Tryp Room	USD	63.47	2020-07-26	0	0	2020-07-25 10:00:40.350838	2020-07-25 10:00:40.350838	\N	\N	\N
3157693	139	1	Small Double	USD	120.59	2020-07-26	482.38	0	2020-07-25 10:00:40.369567	2020-07-25 10:00:40.369567	\N	\N	\N
3157694	14	1	Classic Double Bed	USD	126.4	2020-07-26	0	0	2020-07-25 10:00:40.376244	2020-07-25 10:00:40.376244	\N	\N	\N
3157695	79	1	Standard Room	USD	83.12	2020-07-26	0	0	2020-07-25 10:00:40.382189	2020-07-25 10:00:40.382189	\N	\N	\N
3157696	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	113.54	2020-07-26	0	0	2020-07-25 10:00:40.388318	2020-07-25 10:00:40.388318	\N	\N	\N
3157697	67	1	Trendy Garden View Room	USD	270.91	2020-07-26	0	0	2020-07-25 10:00:40.39556	2020-07-25 10:00:40.39556	\N	\N	\N
3157698	160	1	King Accesible with Bathtub	USD	109	2020-07-26	0	0	2020-07-25 10:00:40.401954	2020-07-25 10:00:40.401954	\N	\N	\N
3157699	183	1	Business Deluxe, Guest room, 1 King	USD	149	2020-07-26	0	0	2020-07-25 10:00:40.40964	2020-07-25 10:00:40.40964	\N	\N	\N
3157700	54	1	Double Room	USD	145.3	2020-07-26	740.08	0	2020-07-25 10:00:40.415496	2020-07-25 10:00:40.415496	\N	\N	\N
3157701	47	1	Garden Facing Queen Room	USD	115.22	2020-07-26	0	0	2020-07-25 10:00:40.423589	2020-07-25 10:00:40.423589	\N	\N	\N
3157702	35	1	Twin - Non-Smoking	USD	99.35	2020-07-26	0	0	2020-07-25 10:00:40.430759	2020-07-25 10:00:40.430759	\N	\N	\N
3157703	38	1	Superior Double or Twin Room	USD	242.51	2020-07-26	0	0	2020-07-25 10:00:40.438236	2020-07-25 10:00:40.438236	\N	\N	\N
3157704	192	1	Comfort Room	USD	70.92	2020-07-26	232.72	0	2020-07-25 10:00:40.444483	2020-07-25 10:00:40.444483	\N	\N	\N
3157705	165	1	Basic Room	USD	94.15	2020-07-26	0	0	2020-07-25 10:00:40.451571	2020-07-25 10:00:40.451571	\N	\N	\N
3157706	190	1	Twin Hilton Guestroom	USD	82.73	2020-07-26	0	0	2020-07-25 10:00:40.471238	2020-07-25 10:00:40.471238	\N	\N	\N
3157707	215	1	Deluxe Room	USD	27.87	2020-07-26	182.75	0	2020-07-25 10:00:40.958416	2020-07-25 10:00:40.958416	\N	\N	\N
3157709	261	1	Superior Twin or Double Room	USD	62.2	2020-07-26	0	0	2020-07-25 10:00:40.979647	2020-07-25 10:00:40.979647	\N	\N	\N
3157710	224	1	Standard King	USD	67.54	2020-07-26	283.54	0	2020-07-25 10:00:40.985607	2020-07-25 10:00:40.985607	\N	\N	\N
3157711	300	1	Deluxe Room, Guestroom, 1 King	USD	138.09	2020-07-26	0	0	2020-07-25 10:00:40.994221	2020-07-25 10:00:40.994221	\N	\N	\N
3157712	301	1	Comfort Double or Twin Room	USD	157.61	2020-07-26	0	0	2020-07-25 10:00:41.000477	2020-07-25 10:00:41.000477	\N	\N	\N
3157713	293	1	Budget Double Room	USD	65.38	2020-07-26	0	0	2020-07-25 10:00:41.006464	2020-07-25 10:00:41.006464	\N	\N	\N
3157714	243	1	Twin Room	USD	62.04	2020-07-26	0	0	2020-07-25 10:00:41.012818	2020-07-25 10:00:41.012818	\N	\N	\N
3157715	256	1	Standard Double Room	USD	94.19	2020-07-26	0	0	2020-07-25 10:00:41.019392	2020-07-25 10:00:41.019392	\N	\N	\N
3157717	285	1	Superior Room king bed	USD	95.16	2020-07-26	0	0	2020-07-25 10:00:41.037805	2020-07-25 10:00:41.037805	\N	\N	\N
3157721	314	1	1 Double Bed Non-Smoking	USD	150.4	2020-07-26	0	0	2020-07-25 10:00:41.068171	2020-07-25 10:00:41.068171	\N	\N	\N
3157722	274	1	Standard Twin Room - Non-Smoking	USD	215.83	2020-07-26	397.4	0	2020-07-25 10:00:41.076806	2020-07-25 10:00:41.076806	\N	\N	\N
3157723	306	1	Deluxe King City View	USD	91.58	2020-07-26	302.12	0	2020-07-25 10:00:41.085704	2020-07-25 10:00:41.085704	\N	\N	\N
3157724	290	1	Standard	USD	87.55	2020-07-26	0	0	2020-07-25 10:00:41.09305	2020-07-25 10:00:41.09305	\N	\N	\N
3157728	258	1	Standard Double Room	USD	24.96	2020-07-26	0	0	2020-07-25 10:00:41.120068	2020-07-25 10:00:41.120068	\N	\N	\N
3157729	216	1	2 Double Accessible with Bathtub	USD	119	2020-07-26	0	0	2020-07-25 10:00:41.127665	2020-07-25 10:00:41.127665	\N	\N	\N
3157732	275	1	Double or Twin Room	USD	90.97	2020-07-26	0	0	2020-07-25 10:00:41.14593	2020-07-25 10:00:41.14593	\N	\N	\N
3157733	204	1	King Bed	USD	133.1	2020-07-26	0	0	2020-07-25 10:00:41.153828	2020-07-25 10:00:41.153828	\N	\N	\N
3157735	295	1	Classic Double or Twin	USD	153.88	2020-07-26	477.08	0	2020-07-25 10:00:41.171189	2020-07-25 10:00:41.171189	\N	\N	\N
3157738	268	1	Family Room (2 Adults + 1 Child)	USD	140.03	2020-07-26	0	0	2020-07-25 10:00:41.198191	2020-07-25 10:00:41.198191	\N	\N	\N
3157739	307	1	1 King Bed	USD	386.05	2020-07-26	0	0	2020-07-25 10:00:41.204349	2020-07-25 10:00:41.204349	\N	\N	\N
3157740	251	1	Standard Room with 2 Single Beds	USD	81.79	2020-07-26	0	0	2020-07-25 10:00:41.218078	2020-07-25 10:00:41.218078	\N	\N	\N
3157742	302	1	Accessible 1 King Bed	USD	71.14	2020-07-26	291.6	0	2020-07-25 10:00:41.233996	2020-07-25 10:00:41.233996	\N	\N	\N
3157744	279	1	Garden View Room	USD	257.25	2020-07-26	311.35	0	2020-07-25 10:00:41.246441	2020-07-25 10:00:41.246441	\N	\N	\N
3157747	255	1	Mountain-View Room	USD	338.95	2020-07-26	0	0	2020-07-25 10:00:41.275018	2020-07-25 10:00:41.275018	\N	\N	\N
3157750	249	1	Standard 1 Double 1 Single Bed	USD	100.49	2020-07-26	0	0	2020-07-25 10:00:41.297772	2020-07-25 10:00:41.297772	\N	\N	\N
3157752	206	1	Standard	USD	84.02	2020-07-26	0	0	2020-07-25 10:00:41.313769	2020-07-25 10:00:41.313769	\N	\N	\N
3157753	263	1	Queen Hilton Deluxe	USD	141.93	2020-07-26	0	0	2020-07-25 10:00:41.319508	2020-07-25 10:00:41.319508	\N	\N	\N
3217563	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-27	0	0	2020-07-26 10:00:38.162867	2020-07-26 10:00:38.162867	\N	\N	\N
3217564	45	1	Classic Double or Twin	USD	104.72	2020-07-27	0	0	2020-07-26 10:00:38.190744	2020-07-26 10:00:38.190744	\N	\N	\N
3217565	115	1	Double Room	USD	67.61	2020-07-27	0	0	2020-07-26 10:00:38.209705	2020-07-26 10:00:38.209705	\N	\N	\N
3217566	162	1	Standard Double Room	USD	223.73	2020-07-27	0	0	2020-07-26 10:00:38.219524	2020-07-26 10:00:38.219524	\N	\N	\N
3217567	75	1	Low Floor Small Single Room - Smoking	USD	73.06	2020-07-27	215.47	0	2020-07-26 10:00:38.227273	2020-07-26 10:00:38.227273	\N	\N	\N
3217568	105	1	Double or Twin Room	USD	75.9	2020-07-27	418.9	0	2020-07-26 10:00:38.233005	2020-07-26 10:00:38.233005	\N	\N	\N
3217569	158	1	Superior Twin Non-Smoking	USD	85.5	2020-07-27	0	0	2020-07-26 10:00:38.244366	2020-07-26 10:00:38.244366	\N	\N	\N
3217570	153	1	Standard Twin Room	USD	199.44	2020-07-27	0	0	2020-07-26 10:00:38.250458	2020-07-26 10:00:38.250458	\N	\N	\N
3217571	201	1	Feature Double Room	USD	160.73	2020-07-27	0	0	2020-07-26 10:00:38.258848	2020-07-26 10:00:38.258848	\N	\N	\N
3217572	131	1	Superior Double Room	USD	50.85	2020-07-27	0	0	2020-07-26 10:00:38.26723	2020-07-26 10:00:38.26723	\N	\N	\N
3217573	184	1	Superior Room	USD	76.91	2020-07-27	441.61	0	2020-07-26 10:00:38.277065	2020-07-26 10:00:38.277065	\N	\N	\N
3217574	176	1	Economy Twin Room	USD	125.88	2020-07-27	0	0	2020-07-26 10:00:38.285249	2020-07-26 10:00:38.285249	\N	\N	\N
3217575	113	1	2 Queen Beds 	USD	152.15	2020-07-27	0	0	2020-07-26 10:00:38.291232	2020-07-26 10:00:38.291232	\N	\N	\N
3217576	53	1	Superior Twin	USD	126.27	2020-07-27	0	0	2020-07-26 10:00:38.299202	2020-07-26 10:00:38.299202	\N	\N	\N
3217577	143	1	Standard Double Room	USD	143.98	2020-07-27	0	0	2020-07-26 10:00:38.305281	2020-07-26 10:00:38.305281	\N	\N	\N
3217578	108	1	Standard Double Room	USD	73.69	2020-07-27	0	0	2020-07-26 10:00:38.311321	2020-07-26 10:00:38.311321	\N	\N	\N
3217579	17	1	Double Room	USD	40.27	2020-07-27	0	0	2020-07-26 10:00:38.318935	2020-07-26 10:00:38.318935	\N	\N	\N
3217580	13	1	Premium Twin Room with Two Double Beds	USD	129.22	2020-07-27	0	0	2020-07-26 10:00:38.328272	2020-07-26 10:00:38.328272	\N	\N	\N
3217581	64	1	Basic Double or Twin Room	USD	55	2020-07-27	0	0	2020-07-26 10:00:38.33581	2020-07-26 10:00:38.33581	\N	\N	\N
3217582	125	1	Standard Double or Twin Room	USD	27	2020-07-27	0	0	2020-07-26 10:00:38.343524	2020-07-26 10:00:38.343524	\N	\N	\N
3217583	199	1	Standard Room with 1 double bed	USD	36.12	2020-07-27	0	0	2020-07-26 10:00:38.351443	2020-07-26 10:00:38.351443	\N	\N	\N
3217584	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-27	0	0	2020-07-26 10:00:38.360024	2020-07-26 10:00:38.360024	\N	\N	\N
3217585	194	1	Standard Small Double Room - Non-Smoking	USD	170.47	2020-07-27	0	0	2020-07-26 10:00:38.370058	2020-07-26 10:00:38.370058	\N	\N	\N
3217586	95	1	 Twin Guestroom	USD	145.79	2020-07-27	0	0	2020-07-26 10:00:38.377643	2020-07-26 10:00:38.377643	\N	\N	\N
3217587	157	1	Cosy Small Room	USD	104.41	2020-07-27	0	0	2020-07-26 10:00:38.385368	2020-07-26 10:00:38.385368	\N	\N	\N
3217588	26	1	Double	USD	76.84	2020-07-27	0	0	2020-07-26 10:00:38.391288	2020-07-26 10:00:38.391288	\N	\N	\N
3217589	164	1	Standard Twin Room	USD	173.36	2020-07-27	0	0	2020-07-26 10:00:38.39722	2020-07-26 10:00:38.39722	\N	\N	\N
3217590	61	1	Modern Double Room	USD	198.61	2020-07-27	0	0	2020-07-26 10:00:38.405532	2020-07-26 10:00:38.405532	\N	\N	\N
3217591	109	1	Classic Double Room	USD	174.23	2020-07-27	0	0	2020-07-26 10:00:38.414659	2020-07-26 10:00:38.414659	\N	\N	\N
3217592	84	1	Double or Twin Room	USD	52.89	2020-07-27	0	0	2020-07-26 10:00:38.420432	2020-07-26 10:00:38.420432	\N	\N	\N
3217593	181	1	Superior Double Room	USD	61.94	2020-07-27	0	0	2020-07-26 10:00:38.426729	2020-07-26 10:00:38.426729	\N	\N	\N
3217594	49	1	Superior Twin Room	USD	120.79	2020-07-27	0	0	2020-07-26 10:00:38.432836	2020-07-26 10:00:38.432836	\N	\N	\N
3217595	136	1	Standard Double or Twin Room	USD	126.69	2020-07-27	0	0	2020-07-26 10:00:38.443003	2020-07-26 10:00:38.443003	\N	\N	\N
3217596	98	1	Double or Twin	USD	93.09	2020-07-27	0	0	2020-07-26 10:00:38.448925	2020-07-26 10:00:38.448925	\N	\N	\N
3217597	159	1	Standard Room with 1 double bed and sofa	USD	87.55	2020-07-27	0	0	2020-07-26 10:00:38.459398	2020-07-26 10:00:38.459398	\N	\N	\N
3217598	90	1	Standard Room	USD	97.02	2020-07-27	388.08	0	2020-07-26 10:00:38.470828	2020-07-26 10:00:38.470828	\N	\N	\N
3217599	106	1	Double Room with Two Single Beds	USD	24.25	2020-07-27	0	0	2020-07-26 10:00:38.476862	2020-07-26 10:00:38.476862	\N	\N	\N
3217600	4	1	Twin Room	USD	123.03	2020-07-27	0	0	2020-07-26 10:00:38.482687	2020-07-26 10:00:38.482687	\N	\N	\N
3217601	27	1	Standard Twin Room - Smoking	USD	168.9	2020-07-27	549.55	0	2020-07-26 10:00:38.490253	2020-07-26 10:00:38.490253	\N	\N	\N
3217602	77	1	Double Room - North Side	USD	159.93	2020-07-27	0	0	2020-07-26 10:00:38.49589	2020-07-26 10:00:38.49589	\N	\N	\N
3217603	31	1	Classic Double or Twin Room with Hill View	USD	398.8	2020-07-27	0	0	2020-07-26 10:00:38.501812	2020-07-26 10:00:38.501812	\N	\N	\N
3217604	102	1	Tryp Room	USD	71.93	2020-07-27	0	0	2020-07-26 10:00:38.5075	2020-07-26 10:00:38.5075	\N	\N	\N
3217605	139	1	Small Double	USD	120.59	2020-07-27	482.38	0	2020-07-26 10:00:38.513164	2020-07-26 10:00:38.513164	\N	\N	\N
3217606	14	1	Classic Double Bed	USD	126.4	2020-07-27	0	0	2020-07-26 10:00:38.520865	2020-07-26 10:00:38.520865	\N	\N	\N
3217607	79	1	Standard Room	USD	83.12	2020-07-27	0	0	2020-07-26 10:00:38.526511	2020-07-26 10:00:38.526511	\N	\N	\N
3217608	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	113.54	2020-07-27	0	0	2020-07-26 10:00:38.533669	2020-07-26 10:00:38.533669	\N	\N	\N
3217609	67	1	Trendy Garden View Room	USD	312.13	2020-07-27	505.59	40	2020-07-26 10:00:38.545219	2020-07-26 10:00:38.545219	\N	\N	\N
3217610	160	1	2 Double Beds	USD	129	2020-07-27	0	0	2020-07-26 10:00:38.551158	2020-07-26 10:00:38.551158	\N	\N	\N
3217611	183	1	Business Deluxe, Guest room, 1 King	USD	159	2020-07-27	0	0	2020-07-26 10:00:38.559048	2020-07-26 10:00:38.559048	\N	\N	\N
3217612	54	1	Double Room	USD	156.8	2020-07-27	786.08	0	2020-07-26 10:00:38.565313	2020-07-26 10:00:38.565313	\N	\N	\N
3217613	47	1	Garden Facing Queen Room	USD	115.22	2020-07-27	0	0	2020-07-26 10:00:38.572583	2020-07-26 10:00:38.572583	\N	\N	\N
3217614	35	1	Twin - Non-Smoking	USD	99.35	2020-07-27	0	0	2020-07-26 10:00:38.580208	2020-07-26 10:00:38.580208	\N	\N	\N
3217615	38	1	Superior Double or Twin Room	USD	242.51	2020-07-27	0	0	2020-07-26 10:00:38.591075	2020-07-26 10:00:38.591075	\N	\N	\N
3217616	192	1	Comfort Room	USD	82.01	2020-07-27	232.72	0	2020-07-26 10:00:38.596927	2020-07-26 10:00:38.596927	\N	\N	\N
3217617	165	1	Basic Room	USD	94.15	2020-07-27	0	0	2020-07-26 10:00:38.603696	2020-07-26 10:00:38.603696	\N	\N	\N
3217618	190	1	Twin Hilton Deluxe Room	USD	103.77	2020-07-27	0	0	2020-07-26 10:00:38.614095	2020-07-26 10:00:38.614095	\N	\N	\N
3217619	215	1	Deluxe Room	USD	27.87	2020-07-27	182.75	0	2020-07-26 10:00:39.140417	2020-07-26 10:00:39.140417	\N	\N	\N
3217622	261	1	Superior Twin or Double Room	USD	62.2	2020-07-27	0	0	2020-07-26 10:00:39.172342	2020-07-26 10:00:39.172342	\N	\N	\N
3217623	224	1	Standard King	USD	67.54	2020-07-27	283.54	0	2020-07-26 10:00:39.178168	2020-07-26 10:00:39.178168	\N	\N	\N
3217624	300	1	Deluxe Room, Guestroom, 1 King	USD	138.09	2020-07-27	0	0	2020-07-26 10:00:39.186751	2020-07-26 10:00:39.186751	\N	\N	\N
3217625	301	1	Comfort Double or Twin Room	USD	152.33	2020-07-27	0	0	2020-07-26 10:00:39.193003	2020-07-26 10:00:39.193003	\N	\N	\N
3217626	293	1	Budget Double Room	USD	65.38	2020-07-27	0	0	2020-07-26 10:00:39.198893	2020-07-26 10:00:39.198893	\N	\N	\N
3217627	243	1	Twin Room	USD	71.04	2020-07-27	0	0	2020-07-26 10:00:39.20458	2020-07-26 10:00:39.20458	\N	\N	\N
3217628	256	1	Standard Double Room	USD	110.82	2020-07-27	0	0	2020-07-26 10:00:39.211875	2020-07-26 10:00:39.211875	\N	\N	\N
3217630	285	1	Superior Room king bed	USD	98.07	2020-07-27	0	0	2020-07-26 10:00:39.226587	2020-07-26 10:00:39.226587	\N	\N	\N
3217634	314	1	1 Double Bed Non-Smoking	USD	150.4	2020-07-27	0	0	2020-07-26 10:00:39.257482	2020-07-26 10:00:39.257482	\N	\N	\N
3217635	274	1	Small Double Room Non-Smoking	USD	156.4	2020-07-27	229.5	0	2020-07-26 10:00:39.268123	2020-07-26 10:00:39.268123	\N	\N	\N
3217636	306	1	Deluxe King City View	USD	100.99	2020-07-27	302.12	0	2020-07-26 10:00:39.2772	2020-07-26 10:00:39.2772	\N	\N	\N
3217637	290	1	Standard	USD	98.63	2020-07-27	0	0	2020-07-26 10:00:39.285547	2020-07-26 10:00:39.285547	\N	\N	\N
3217641	258	1	Standard Double Room	USD	24.96	2020-07-27	0	0	2020-07-26 10:00:39.312989	2020-07-26 10:00:39.312989	\N	\N	\N
3217642	216	1	2 Double Accessible Roll in Shower	USD	129	2020-07-27	0	0	2020-07-26 10:00:39.321043	2020-07-26 10:00:39.321043	\N	\N	\N
3217645	275	1	Double or Twin Room	USD	90.97	2020-07-27	0	0	2020-07-26 10:00:39.341051	2020-07-26 10:00:39.341051	\N	\N	\N
3217646	204	1	King Bed	USD	133.1	2020-07-27	0	0	2020-07-26 10:00:39.348311	2020-07-26 10:00:39.348311	\N	\N	\N
3217648	295	1	Classic Double or Twin	USD	162.77	2020-07-27	477.08	0	2020-07-26 10:00:39.363081	2020-07-26 10:00:39.363081	\N	\N	\N
3217651	307	1	1 King Bed	USD	386.05	2020-07-27	0	0	2020-07-26 10:00:39.386635	2020-07-26 10:00:39.386635	\N	\N	\N
3217652	251	1	Standard Queen Room	USD	81.79	2020-07-27	0	0	2020-07-26 10:00:39.402418	2020-07-26 10:00:39.402418	\N	\N	\N
3217654	302	1	Accessible 1 King Bed	USD	81	2020-07-27	300	0	2020-07-26 10:00:39.416363	2020-07-26 10:00:39.416363	\N	\N	\N
3217656	279	1	Garden View Room	USD	218.57	2020-07-27	0	0	2020-07-26 10:00:39.43333	2020-07-26 10:00:39.43333	\N	\N	\N
3217659	255	1	Mountain-View Room	USD	321.38	2020-07-27	0	0	2020-07-26 10:00:39.454581	2020-07-26 10:00:39.454581	\N	\N	\N
3217662	249	1	Standard 1 Double 1 Single Bed	USD	100.49	2020-07-27	0	0	2020-07-26 10:00:39.477478	2020-07-26 10:00:39.477478	\N	\N	\N
3217664	206	1	Standard	USD	84.02	2020-07-27	0	0	2020-07-26 10:00:39.493095	2020-07-26 10:00:39.493095	\N	\N	\N
3217665	263	1	Queen Hilton Deluxe	USD	141.93	2020-07-27	0	0	2020-07-26 10:00:39.498904	2020-07-26 10:00:39.498904	\N	\N	\N
3277516	23	1	1 King Bed Evolution Room 	USD	109.65	2020-07-28	0	0	2020-07-27 10:00:40.439934	2020-07-27 10:00:40.439934	\N	\N	\N
3277517	45	1	Classic Double or Twin	USD	104.72	2020-07-28	0	0	2020-07-27 10:00:40.461537	2020-07-27 10:00:40.461537	\N	\N	\N
3277518	115	1	Double Room	USD	73.14	2020-07-28	0	0	2020-07-27 10:00:40.47919	2020-07-27 10:00:40.47919	\N	\N	\N
3277519	162	1	Flexible Room	USD	125.88	2020-07-28	0	0	2020-07-27 10:00:40.487164	2020-07-27 10:00:40.487164	\N	\N	\N
3277520	75	1	Low Floor Small Single Room - Smoking	USD	73.06	2020-07-28	215.47	0	2020-07-27 10:00:40.494078	2020-07-27 10:00:40.494078	\N	\N	\N
3277521	105	1	Deluxe Room	USD	99.92	2020-07-28	399.69	0	2020-07-27 10:00:40.500366	2020-07-27 10:00:40.500366	\N	\N	\N
3277522	158	1	Superior Twin Non-Smoking	USD	85.5	2020-07-28	0	0	2020-07-27 10:00:40.508698	2020-07-27 10:00:40.508698	\N	\N	\N
3277523	201	1	Feature Double Room	USD	151.36	2020-07-28	0	0	2020-07-27 10:00:40.515856	2020-07-27 10:00:40.515856	\N	\N	\N
3277524	131	1	Superior Double Room	USD	50.85	2020-07-28	0	0	2020-07-27 10:00:40.524253	2020-07-27 10:00:40.524253	\N	\N	\N
3277525	184	1	Superior Room	USD	75.56	2020-07-28	450.61	0	2020-07-27 10:00:40.533383	2020-07-27 10:00:40.533383	\N	\N	\N
3277526	176	1	Economy Twin Room	USD	125.88	2020-07-28	0	0	2020-07-27 10:00:40.540794	2020-07-27 10:00:40.540794	\N	\N	\N
3277527	113	1	2 Queen Beds 	USD	152.15	2020-07-28	0	0	2020-07-27 10:00:40.546616	2020-07-27 10:00:40.546616	\N	\N	\N
3277528	53	1	Superior Twin	USD	132.04	2020-07-28	0	0	2020-07-27 10:00:40.567711	2020-07-27 10:00:40.567711	\N	\N	\N
3277529	143	1	Standard Double Room	USD	143.98	2020-07-28	0	0	2020-07-27 10:00:40.574345	2020-07-27 10:00:40.574345	\N	\N	\N
3277530	108	1	Standard Double Room	USD	73.69	2020-07-28	0	0	2020-07-27 10:00:40.580615	2020-07-27 10:00:40.580615	\N	\N	\N
3277531	17	1	Double Room	USD	40.27	2020-07-28	0	0	2020-07-27 10:00:40.587746	2020-07-27 10:00:40.587746	\N	\N	\N
3277532	13	1	Premium Twin Room with Two Double Beds	USD	129.22	2020-07-28	0	0	2020-07-27 10:00:40.595236	2020-07-27 10:00:40.595236	\N	\N	\N
3277533	64	1	Basic Double or Twin Room	USD	55	2020-07-28	0	0	2020-07-27 10:00:40.602374	2020-07-27 10:00:40.602374	\N	\N	\N
3277534	125	1	Standard Double or Twin Room	USD	27	2020-07-28	0	0	2020-07-27 10:00:40.610277	2020-07-27 10:00:40.610277	\N	\N	\N
3277535	199	1	Standard Room with 1 double bed	USD	38.7	2020-07-28	0	0	2020-07-27 10:00:40.617891	2020-07-27 10:00:40.617891	\N	\N	\N
3277536	187	1	Queen with 2 Queen Beds - Non-Smoking	USD	114	2020-07-28	0	0	2020-07-27 10:00:40.625321	2020-07-27 10:00:40.625321	\N	\N	\N
3277537	194	1	Single Deluxe Non-Smoking	USD	178.29	2020-07-28	0	0	2020-07-27 10:00:40.633494	2020-07-27 10:00:40.633494	\N	\N	\N
3277538	95	1	 Twin Guestroom	USD	145.79	2020-07-28	0	0	2020-07-27 10:00:40.640032	2020-07-27 10:00:40.640032	\N	\N	\N
3277539	157	1	Cosy Small Room	USD	104.41	2020-07-28	0	0	2020-07-27 10:00:40.647228	2020-07-27 10:00:40.647228	\N	\N	\N
3277540	26	1	Double	USD	82.32	2020-07-28	0	0	2020-07-27 10:00:40.653011	2020-07-27 10:00:40.653011	\N	\N	\N
3277541	164	1	Standard Twin Room	USD	195.94	2020-07-28	0	0	2020-07-27 10:00:40.658688	2020-07-27 10:00:40.658688	\N	\N	\N
3277542	61	1	Modern Double Room	USD	198.61	2020-07-28	0	0	2020-07-27 10:00:40.674371	2020-07-27 10:00:40.674371	\N	\N	\N
3277543	109	1	Classic Double Room	USD	174.23	2020-07-28	0	0	2020-07-27 10:00:40.680566	2020-07-27 10:00:40.680566	\N	\N	\N
3277544	84	1	Double or Twin Room	USD	52.89	2020-07-28	0	0	2020-07-27 10:00:40.686367	2020-07-27 10:00:40.686367	\N	\N	\N
3277545	181	1	Superior Double Room	USD	61.94	2020-07-28	0	0	2020-07-27 10:00:40.695533	2020-07-27 10:00:40.695533	\N	\N	\N
3277546	49	1	Superior Twin Room	USD	120.79	2020-07-28	0	0	2020-07-27 10:00:40.705777	2020-07-27 10:00:40.705777	\N	\N	\N
3277547	136	1	Standard Double or Twin Room	USD	126.69	2020-07-28	0	0	2020-07-27 10:00:40.713345	2020-07-27 10:00:40.713345	\N	\N	\N
3277548	98	1	Double or Twin	USD	86.75	2020-07-28	0	0	2020-07-27 10:00:40.719215	2020-07-27 10:00:40.719215	\N	\N	\N
3277549	159	1	Standard Room with 1 double bed and sofa	USD	87.55	2020-07-28	0	0	2020-07-27 10:00:40.726975	2020-07-27 10:00:40.726975	\N	\N	\N
3277550	3	1	Deluxe 	USD	112.39	2020-07-28	331.74	0	2020-07-27 10:00:40.734201	2020-07-27 10:00:40.734201	\N	\N	\N
3277551	90	1	Standard Room	USD	97.02	2020-07-28	388.08	0	2020-07-27 10:00:40.741973	2020-07-27 10:00:40.741973	\N	\N	\N
3277552	106	1	Double Room with Two Single Beds	USD	24.25	2020-07-28	0	0	2020-07-27 10:00:40.747951	2020-07-27 10:00:40.747951	\N	\N	\N
3277553	4	1	Twin Room	USD	123.03	2020-07-28	0	0	2020-07-27 10:00:40.753886	2020-07-27 10:00:40.753886	\N	\N	\N
3277554	27	1	Standard Twin Room - Smoking	USD	168.9	2020-07-28	549.55	0	2020-07-27 10:00:40.76036	2020-07-27 10:00:40.76036	\N	\N	\N
3277555	77	1	Double Room - North Side	USD	159.93	2020-07-28	0	0	2020-07-27 10:00:40.766239	2020-07-27 10:00:40.766239	\N	\N	\N
3277556	31	1	Classic Double or Twin Room with Hill View	USD	398.8	2020-07-28	0	0	2020-07-27 10:00:40.772032	2020-07-27 10:00:40.772032	\N	\N	\N
3277557	102	1	Tryp Room	USD	71.93	2020-07-28	0	0	2020-07-27 10:00:40.777884	2020-07-27 10:00:40.777884	\N	\N	\N
3277558	139	1	Small Double	USD	124.82	2020-07-28	499.29	0	2020-07-27 10:00:40.783578	2020-07-27 10:00:40.783578	\N	\N	\N
3277559	14	1	Classic Double Bed	USD	126.4	2020-07-28	0	0	2020-07-27 10:00:40.790976	2020-07-27 10:00:40.790976	\N	\N	\N
3277560	79	1	Standard Room	USD	83.12	2020-07-28	0	0	2020-07-27 10:00:40.797119	2020-07-27 10:00:40.797119	\N	\N	\N
3277561	170	1	Room Selected at Check-In - Late Check-In 18:00	USD	113.54	2020-07-28	0	0	2020-07-27 10:00:40.803401	2020-07-27 10:00:40.803401	\N	\N	\N
3277562	67	1	Trendy Garden View Room	USD	312.13	2020-07-28	505.59	40	2020-07-27 10:00:40.809903	2020-07-27 10:00:40.809903	\N	\N	\N
3277563	160	1	2 Double Beds	USD	129	2020-07-28	0	0	2020-07-27 10:00:40.815642	2020-07-27 10:00:40.815642	\N	\N	\N
3277564	183	1	Business Deluxe, Guest room, 1 King	USD	169	2020-07-28	0	0	2020-07-27 10:00:40.822587	2020-07-27 10:00:40.822587	\N	\N	\N
3277565	54	1	Double Room	USD	156.8	2020-07-28	786.08	0	2020-07-27 10:00:40.828662	2020-07-27 10:00:40.828662	\N	\N	\N
3277566	47	1	Garden Facing Queen Room	USD	115.22	2020-07-28	0	0	2020-07-27 10:00:40.836939	2020-07-27 10:00:40.836939	\N	\N	\N
3277567	35	1	Twin - Non-Smoking	USD	99.35	2020-07-28	0	0	2020-07-27 10:00:40.844027	2020-07-27 10:00:40.844027	\N	\N	\N
3277568	38	1	Superior Double or Twin Room	USD	242.51	2020-07-28	0	0	2020-07-27 10:00:40.851792	2020-07-27 10:00:40.851792	\N	\N	\N
3277569	192	1	Comfort Room	USD	82.01	2020-07-28	232.72	0	2020-07-27 10:00:40.869215	2020-07-27 10:00:40.869215	\N	\N	\N
3277570	165	1	Basic Room	USD	94.15	2020-07-28	0	0	2020-07-27 10:00:40.876735	2020-07-27 10:00:40.876735	\N	\N	\N
3277571	190	1	Twin Hilton Guestroom	USD	82.73	2020-07-28	0	0	2020-07-27 10:00:40.892585	2020-07-27 10:00:40.892585	\N	\N	\N
3277572	215	1	Deluxe - 3 persons	USD	30.96	2020-07-28	123.85	25	2020-07-27 10:00:41.380419	2020-07-27 10:00:41.380419	\N	\N	\N
3277575	261	1	Superior Twin or Double Room	USD	62.2	2020-07-28	0	0	2020-07-27 10:00:41.408329	2020-07-27 10:00:41.408329	\N	\N	\N
3277576	224	1	Standard King	USD	67.54	2020-07-28	283.54	0	2020-07-27 10:00:41.414213	2020-07-27 10:00:41.414213	\N	\N	\N
3277577	300	1	Deluxe Room, Guestroom, 1 King	USD	138.09	2020-07-28	0	0	2020-07-27 10:00:41.421875	2020-07-27 10:00:41.421875	\N	\N	\N
3277578	301	1	Comfort Double or Twin Room	USD	152.33	2020-07-28	0	0	2020-07-27 10:00:41.427845	2020-07-27 10:00:41.427845	\N	\N	\N
3277579	293	1	Budget Double Room	USD	76.46	2020-07-28	0	0	2020-07-27 10:00:41.433681	2020-07-27 10:00:41.433681	\N	\N	\N
3277580	243	1	Twin Room	USD	71.04	2020-07-28	0	0	2020-07-27 10:00:41.439697	2020-07-27 10:00:41.439697	\N	\N	\N
3277581	256	1	Standard Double Room	USD	110.82	2020-07-28	0	0	2020-07-27 10:00:41.446559	2020-07-27 10:00:41.446559	\N	\N	\N
3277583	285	1	Superior Room king bed	USD	100.97	2020-07-28	0	0	2020-07-27 10:00:41.461285	2020-07-27 10:00:41.461285	\N	\N	\N
3277587	238	1	Double or Twin Room	USD	140.03	2020-07-28	0	0	2020-07-27 10:00:41.488156	2020-07-27 10:00:41.488156	\N	\N	\N
3277588	314	1	1 Double Bed Non-Smoking	USD	150.4	2020-07-28	0	0	2020-07-27 10:00:41.495261	2020-07-27 10:00:41.495261	\N	\N	\N
3277589	274	1	Standard Twin Room - Non-Smoking	USD	182.98	2020-07-28	397.4	0	2020-07-27 10:00:41.503962	2020-07-27 10:00:41.503962	\N	\N	\N
3277590	306	1	Deluxe King City View	USD	100.99	2020-07-28	302.12	0	2020-07-27 10:00:41.512238	2020-07-27 10:00:41.512238	\N	\N	\N
3277591	213	1	Standard Double Room	USD	103.5	2020-07-28	0	0	2020-07-27 10:00:41.518166	2020-07-27 10:00:41.518166	\N	\N	\N
3277592	290	1	Standard	USD	98.63	2020-07-28	0	0	2020-07-27 10:00:41.525889	2020-07-27 10:00:41.525889	\N	\N	\N
3277595	258	1	Standard Double Room	USD	24.96	2020-07-28	0	0	2020-07-27 10:00:41.546061	2020-07-27 10:00:41.546061	\N	\N	\N
3277596	216	1	2 Double Accessible Roll in Shower	USD	129	2020-07-28	0	0	2020-07-27 10:00:41.552809	2020-07-27 10:00:41.552809	\N	\N	\N
3277597	281	1	Standard Room with Balcony	USD	195.74	2020-07-28	0	0	2020-07-27 10:00:41.560007	2020-07-27 10:00:41.560007	\N	\N	\N
3277600	275	1	Double or Twin Room	USD	90.97	2020-07-28	0	0	2020-07-27 10:00:41.584044	2020-07-27 10:00:41.584044	\N	\N	\N
3277601	204	1	King Bed	USD	133.1	2020-07-28	0	0	2020-07-27 10:00:41.591753	2020-07-27 10:00:41.591753	\N	\N	\N
3277603	295	1	Classic Double or Twin	USD	162.77	2020-07-28	477.08	0	2020-07-27 10:00:41.608463	2020-07-27 10:00:41.608463	\N	\N	\N
3277606	307	1	1 King Bed	USD	386.05	2020-07-28	0	0	2020-07-27 10:00:41.644001	2020-07-27 10:00:41.644001	\N	\N	\N
3277607	251	1	Standard Room with 2 Single Beds	USD	81.79	2020-07-28	0	0	2020-07-27 10:00:41.652526	2020-07-27 10:00:41.652526	\N	\N	\N
3277609	302	1	Accessible 1 King Bed	USD	78.9	2020-07-28	300	0	2020-07-27 10:00:41.670171	2020-07-27 10:00:41.670171	\N	\N	\N
3277611	279	1	Garden View Room	USD	173.44	2020-07-28	0	0	2020-07-27 10:00:41.685247	2020-07-27 10:00:41.685247	\N	\N	\N
3277614	255	1	Mountain-View Room	USD	321.38	2020-07-28	0	0	2020-07-27 10:00:41.710232	2020-07-27 10:00:41.710232	\N	\N	\N
3277617	249	1	Standard 1 Double 1 Single Bed	USD	100.49	2020-07-28	0	0	2020-07-27 10:00:41.732145	2020-07-27 10:00:41.732145	\N	\N	\N
3277619	206	1	Standard	USD	84.02	2020-07-28	0	0	2020-07-27 10:00:41.746328	2020-07-27 10:00:41.746328	\N	\N	\N
3277620	263	1	Queen Hilton Guestroom	USD	134.84	2020-07-28	0	0	2020-07-27 10:00:41.752098	2020-07-27 10:00:41.752098	\N	\N	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.schema_migrations (version) FROM stdin;
20200406211648
20200428120824
20200503194054
20200503200003
20200503204745
20200503204839
20200503204914
20200528081814
20200603201111
20200603201138
20200611204322
20200618204913
20201007191154
20210322220401
20210323102319
20210526194740
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY public.subscriptions (id, email, created_at, updated_at) FROM stdin;
10	test@alex.com	2020-05-26 19:53:55.999743	2020-05-26 19:53:55.999743
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.brands_id_seq', 2861, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.hotels_id_seq', 706005, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.locations_id_seq', 84, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.partners_id_seq', 2, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.photos_id_seq', 3530015, true);


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.rates_id_seq', 3337204, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 15, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: rates rates_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: alex
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_hotels_on_agoda_hotel_id; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_hotels_on_agoda_hotel_id ON public.hotels USING btree (agoda_hotel_id);


--
-- Name: index_hotels_on_brand_id; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_hotels_on_brand_id ON public.hotels USING btree (brand_id);


--
-- Name: index_hotels_on_id_and_hotel_state; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_hotels_on_id_and_hotel_state ON public.hotels USING btree (id, hotel_state);


--
-- Name: index_hotels_on_name; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_hotels_on_name ON public.hotels USING btree (name);


--
-- Name: index_hotels_on_name_and_hotel_state; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_hotels_on_name_and_hotel_state ON public.hotels USING btree (name, hotel_state);


--
-- Name: index_hotels_on_slug; Type: INDEX; Schema: public; Owner: alex
--

CREATE UNIQUE INDEX index_hotels_on_slug ON public.hotels USING btree (slug);


--
-- Name: index_hotels_on_slug_and_hotel_state; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_hotels_on_slug_and_hotel_state ON public.hotels USING btree (slug, hotel_state);


--
-- Name: index_locations_on_city_and_country; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_locations_on_city_and_country ON public.locations USING btree (city, country);


--
-- Name: index_photos_on_hotel_id; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_photos_on_hotel_id ON public.photos USING btree (hotel_id);


--
-- Name: index_rates_on_hotel_id; Type: INDEX; Schema: public; Owner: alex
--

CREATE INDEX index_rates_on_hotel_id ON public.rates USING btree (hotel_id);


--
-- PostgreSQL database dump complete
--

