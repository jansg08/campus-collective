SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '9364512e-7f2f-4a83-ac24-6168ca42d304', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 09:30:49.168876+00', ''),
	('00000000-0000-0000-0000-000000000000', '6934b989-6449-4e19-883f-5a569d57c209', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 10:29:55.542727+00', ''),
	('00000000-0000-0000-0000-000000000000', '7750cfa5-2e42-4264-b0fc-6b4ba7a5ee91', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 10:29:55.543328+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c089302e-2a04-433f-99e5-8991ed35dc38', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 11:36:39.485816+00', ''),
	('00000000-0000-0000-0000-000000000000', 'efb09e5b-f17a-4687-a0ac-81a3e3cc350b', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 11:36:39.48645+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dabbe8ad-c055-45b9-83f9-f70e4ce988d6', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 11:37:27.420616+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad9407aa-bdab-4892-9b98-c70ef7935616', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 11:37:27.452004+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dcc3ef66-d211-4743-946b-1d17d8af45ec', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 11:39:34.262093+00', ''),
	('00000000-0000-0000-0000-000000000000', '26755821-48c3-49d8-9ac4-0b80efee94b3', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 12:38:58.620491+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cae87b96-f6e1-4438-bc91-b95037b63632', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 12:38:58.621505+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e16ee15-bd24-4ed2-9848-66d2b44eda31', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 12:38:58.641334+00', ''),
	('00000000-0000-0000-0000-000000000000', '809ef253-aeb4-43a3-823e-cc763caab67a', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 13:45:11.903291+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e28548e-e0ca-4508-950d-a5384514c583', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 13:45:11.903915+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d34b441-9aa4-4216-b54b-337637d1ce5c', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 14:43:59.196821+00', ''),
	('00000000-0000-0000-0000-000000000000', '7bd23cc0-51e0-4f42-8aa4-c28ba8f3b04f', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 14:43:59.197565+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bac0ca95-ca80-4962-8f8a-daeeb29c7dfe', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-06 14:53:26.228207+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be44ec85-ded6-4841-93f0-36c448957ee1', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 14:53:43.589154+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b755781-fbc9-46ab-a88e-d922d3bd01b7', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-06 14:53:55.693892+00', ''),
	('00000000-0000-0000-0000-000000000000', '95480d43-9d83-48c9-a94c-3c97b7a861e9', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 14:54:07.427431+00', ''),
	('00000000-0000-0000-0000-000000000000', '08417737-a05e-45ea-9933-4dde224bce2b', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-06 14:54:16.70295+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ea0e19be-283a-48b5-8df6-6ec58f460f6c', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 14:54:30.347983+00', ''),
	('00000000-0000-0000-0000-000000000000', '138a14ed-c509-4461-b145-8f610a074261', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 16:00:07.695774+00', ''),
	('00000000-0000-0000-0000-000000000000', '735f2e57-7737-4931-a3ba-797ddf3c860b', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 16:00:07.696558+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b91588f-bb64-408d-bff5-d8f1b9256447', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 19:57:03.033035+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd538709-e184-4b21-b0d9-a63a1da9f06f', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 19:57:03.033618+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4711dbf-f9ea-4417-afcb-a32ab0ed1015', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 22:58:49.931038+00', ''),
	('00000000-0000-0000-0000-000000000000', '32b348a8-8a54-4aa7-9aca-cc561732f028', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-06 22:58:49.931679+00', ''),
	('00000000-0000-0000-0000-000000000000', '2118e97c-d23f-4a00-8ea0-4cea1d5653dc', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-06 22:59:31.093526+00', ''),
	('00000000-0000-0000-0000-000000000000', '05db9e63-2035-4082-8bc5-0fa6fc3b3e9c', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 22:59:44.063485+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f546957-127b-4e9a-9977-56bd32f15106', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-06 23:00:17.518551+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac18f09a-2a11-4c11-9a6d-2e195bf341ef', '{"action":"user_confirmation_requested","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-05-06 23:00:54.919368+00', ''),
	('00000000-0000-0000-0000-000000000000', '48d764fd-b2a8-4357-ac34-f2ea06a7415e', '{"action":"user_signedup","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"team"}', '2025-05-06 23:01:11.679441+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f2099c58-7a73-4976-b377-fd15efa9e4ba', '{"action":"login","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 23:09:57.638881+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed5ae3e9-e159-4acc-89d4-26acbbe3c48a', '{"action":"login","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 23:09:59.501438+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ab583ce0-2ce7-40ad-b88f-a490ed4fa27b', '{"action":"login","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 23:10:24.3799+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a90243d-b20b-4ca5-898f-a5a94dfa61c1', '{"action":"login","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 23:13:31.329117+00', ''),
	('00000000-0000-0000-0000-000000000000', '019f72a9-31e7-41e9-be26-6d4ed49a843b', '{"action":"login","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-06 23:17:08.878249+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc6c5182-abaa-4d9c-bb28-408d907c9fda', '{"action":"token_refreshed","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 13:01:46.887472+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f85a4688-1b2c-4dc7-893f-265087bb6f14', '{"action":"token_revoked","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 13:01:46.889059+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3485208-ed59-4fc4-8c84-a50859fd7f5f', '{"action":"token_refreshed","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 13:01:46.915015+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e33abf2a-2e56-4a08-8eea-3ecdf27954ba', '{"action":"logout","actor_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"account"}', '2025-05-07 13:02:24.07537+00', ''),
	('00000000-0000-0000-0000-000000000000', '087551a1-282c-4b20-8574-bf50dc9efff3', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-07 13:02:34.090652+00', ''),
	('00000000-0000-0000-0000-000000000000', '573c7a01-93d5-4311-9cb6-4ec907c4d63d', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-07 13:24:55.796577+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e298e2be-b6a2-4bec-8dd0-aabda07e93f8', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-07 13:25:46.189207+00', ''),
	('00000000-0000-0000-0000-000000000000', '601a9d32-0e79-444b-a4a4-9b1401f83e3b', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 15:00:07.247455+00', ''),
	('00000000-0000-0000-0000-000000000000', '244e1906-f6ec-4adc-af6b-14dd7edf5edf', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 15:00:07.247993+00', ''),
	('00000000-0000-0000-0000-000000000000', '55cfab8a-734d-4c95-b6ac-22b32c45b781', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 15:00:07.266419+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a4085fe-255d-463a-8aea-3f12c2ea4a96', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 16:49:51.325131+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c7e63ba-27b8-4f27-8583-b923d79797eb', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 16:49:51.325919+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a8d5edb4-91f4-458b-b22e-99d44a3f22e0', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 16:49:51.347081+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad94fd11-7c01-453e-b659-66422ed14dec', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 18:34:17.190958+00', ''),
	('00000000-0000-0000-0000-000000000000', '8dc49823-6eca-41c0-97b5-416f04b5f7ff', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 18:34:17.191446+00', ''),
	('00000000-0000-0000-0000-000000000000', 'faecd159-a278-4374-99f1-2c638515fc82', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 18:34:17.208945+00', ''),
	('00000000-0000-0000-0000-000000000000', '43207d90-65d3-4f2b-8eec-7aa54fb73d53', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 20:18:26.194078+00', ''),
	('00000000-0000-0000-0000-000000000000', '8e505aca-a373-4b4d-9c30-68fd34622e76', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 20:18:26.194487+00', ''),
	('00000000-0000-0000-0000-000000000000', '98bef1d7-e3d2-4de5-ab2e-ac58780411e8', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 20:18:26.211732+00', ''),
	('00000000-0000-0000-0000-000000000000', '328b8c13-9aed-41a3-a53f-2d02abfe895e', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 21:16:59.480947+00', ''),
	('00000000-0000-0000-0000-000000000000', '59cd96ff-3202-44a3-8dc2-db164b7b948c', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 21:16:59.481619+00', ''),
	('00000000-0000-0000-0000-000000000000', '934edc7b-b875-4563-b37e-446264213a82', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 22:15:57.304031+00', ''),
	('00000000-0000-0000-0000-000000000000', '63c169ac-5e66-47ac-ae8c-481ae215378f', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 22:15:57.304827+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fbf2e3e0-4aeb-40ec-a21c-498b2a022a4a', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 22:15:57.326427+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b3b83a7e-8d69-430b-835a-2eea28d9c053', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 23:14:58.287064+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f91a25f2-4060-4a15-85dd-7a9afd53ce1c', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 23:14:58.287525+00', ''),
	('00000000-0000-0000-0000-000000000000', '86181627-edcf-4d2f-afa2-b053264f355d', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-07 23:14:58.31911+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd70fb73-1479-4c03-88ff-28cf63d315a7', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 10:24:36.257582+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d5e79d9-be4e-42e4-88bd-9e76b8c91c28', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 10:24:36.259292+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4e07017-c826-4366-b8e9-26ff2c12cd58', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 10:24:36.278553+00', ''),
	('00000000-0000-0000-0000-000000000000', '28e86187-a05d-40b4-8292-7ae7f49999d4', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 20:49:19.851+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f828e3c9-6e25-48b2-86b4-443a9b345a8f', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 20:49:19.851622+00', ''),
	('00000000-0000-0000-0000-000000000000', '1126c2ed-7072-49c3-9c34-713d548d476e', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 20:49:19.881796+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4f2ef57-f846-4147-ad79-2e9e1f8061b5', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 22:27:50.78812+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aeb79d25-bb82-4830-aff2-467abf4d31e3', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 22:27:50.788699+00', ''),
	('00000000-0000-0000-0000-000000000000', '97c78299-f46f-4b92-84cc-268b59b0f53b', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-08 22:27:50.811167+00', ''),
	('00000000-0000-0000-0000-000000000000', '99a805ad-8079-423b-9c69-6da1039b9d5b', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-08 22:42:32.163087+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1ad733e-d2c0-4f9a-885a-06afb66ef14c', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-09 20:51:59.091584+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f340484a-36cc-4db8-8476-7c11805e9d6c', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-09 21:52:02.991546+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5bc536a-e6a0-4d26-ac55-fdebfffc373b', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-09 21:52:02.992186+00', ''),
	('00000000-0000-0000-0000-000000000000', '03e738d3-f49f-4820-b2f2-2627fdbda40c', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-09 22:51:41.762663+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c73d9ed6-2584-4cb6-8736-af32e24efe58', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-09 22:51:41.763128+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a308290d-5bf3-42b0-ae06-8b54eb7ec5de', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-09 23:50:40.246545+00', ''),
	('00000000-0000-0000-0000-000000000000', '89095ed1-3d49-4107-b49d-671691bf3754', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-09 23:50:40.247061+00', ''),
	('00000000-0000-0000-0000-000000000000', '580baeec-d2c8-453c-ba08-7582867698ef', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-10 14:18:58.454124+00', ''),
	('00000000-0000-0000-0000-000000000000', '96d2e25a-a432-4a27-8cb4-403b864601a2', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-10 14:18:58.456156+00', ''),
	('00000000-0000-0000-0000-000000000000', '1a015afc-8276-466d-bfc6-48c30db0928b', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-10 14:18:58.476352+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b3791a6-baec-4af8-97a9-fa033814ad22', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-10 14:19:03.151005+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c66529f-212c-4efb-94ec-e2122995df7f', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-11 20:06:55.204547+00', ''),
	('00000000-0000-0000-0000-000000000000', '4cd3e2ed-c8a1-4d28-8cb7-357a5a58c5e8', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 09:02:30.943785+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f53c6694-644e-41fc-8d3e-174fd66898db', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 09:02:30.945139+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f437b49-0b1b-4324-969c-d256128a8371', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 09:02:30.967498+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5a1b430-7d9e-484d-b610-087de63ec73e', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 10:05:31.414992+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e07fec3e-0f9d-42ac-917f-97690b133c17', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 10:05:31.416775+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5f46148-c541-4d14-b292-221ecfc1c742', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 10:05:31.435864+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa75685a-43e0-4d89-b3e3-faf3d8ddb3da', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 11:13:43.874998+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa41b120-cb6b-4c20-b3a2-5e52c917864f', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-12 11:13:43.876241+00', ''),
	('00000000-0000-0000-0000-000000000000', '95701ec0-1cd3-4755-b710-b92c5ab5a239', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-12 11:13:43.891768+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6973df5-a649-4895-835d-33184ae3cd5a', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-12 23:15:40.968531+00', ''),
	('00000000-0000-0000-0000-000000000000', '7fb5f126-ef44-4b30-a71d-d630e7489bfc', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-12 23:15:47.903048+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7eece74-cf94-4329-ad91-cacb1ca80370', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000008","actor_username":"user8@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-12 23:15:55.897246+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f07c133d-db8a-46dc-9c92-4408109ce643', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000008","actor_username":"user8@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-13 09:05:44.645692+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1092716-eeff-4d20-b518-63a2b72715b7', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000008","actor_username":"user8@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-13 09:05:44.648204+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f501835-9ce4-486c-83f0-4b98606c4923', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000008","actor_username":"user8@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-13 10:03:25.617803+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f049ac9a-a109-4b70-af1f-e48a85c4d773', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000004","actor_username":"user4@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-13 11:04:57.932348+00', ''),
	('00000000-0000-0000-0000-000000000000', '02bc9a49-dfaf-4149-9f3a-d9e2858dd717', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000004","actor_username":"user4@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-13 11:47:02.005448+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b526d91-0ac8-406e-b019-09909406f107', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-13 11:48:10.545702+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa2c3c19-e7dc-4ccb-9f8e-e58d45a947f8', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-13 11:48:12.87365+00', ''),
	('00000000-0000-0000-0000-000000000000', '4456eb50-8d5f-4acf-b5df-39c609bea033', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-13 11:48:26.6726+00', ''),
	('00000000-0000-0000-0000-000000000000', '85064c5c-bc9b-43d2-a680-c3ad8edf7d30', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-13 12:10:11.867295+00', ''),
	('00000000-0000-0000-0000-000000000000', '41bc06b0-1e1a-48e5-b563-9450521c85c0', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-13 12:14:30.537404+00', ''),
	('00000000-0000-0000-0000-000000000000', '3425364b-27ad-4cbc-a473-5a1433753890', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-13 13:51:21.49651+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5ef44d1-238a-4a7e-8293-906f8f2e718f', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-13 13:51:21.499773+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f549539a-ac97-4c26-8a5f-c85465051b11', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-13 13:51:21.517643+00', ''),
	('00000000-0000-0000-0000-000000000000', '41a1c423-8bd1-476b-aaf1-e65796547751', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000005","actor_username":"user5@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-13 14:20:04.959492+00', ''),
	('00000000-0000-0000-0000-000000000000', '3fb5fc8a-62ac-449a-bed5-08dd44ffc768', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-14 00:31:48.806612+00', ''),
	('00000000-0000-0000-0000-000000000000', '0c24f3f2-d357-4ba0-a7c7-c0b2d500bfaf', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000001","actor_username":"user1@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-14 00:32:01.414174+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a829e2be-debb-4274-888a-c543fc58e15b', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-22 19:37:57.978815+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f13ca11-b0bb-457f-a738-04a9397874e5', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-22 21:46:33.947969+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b41cdcf-958c-4b7c-a48c-3500358e3dfb', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-22 21:46:33.948614+00', ''),
	('00000000-0000-0000-0000-000000000000', '475d6330-40b2-4926-bc1e-3356a2d51b9c', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-22 22:27:48.869857+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6e1712d-8189-45f9-bece-aa2245b41ec4', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 09:05:06.800783+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a954063-f7f6-486c-ab0b-1770d55cad65', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 09:22:42.693609+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c06d06a8-d2cf-4990-bc4e-68ee25599cc9', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 09:23:02.672847+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd863f1eb-b6ca-437f-a042-29c79b7fe1e0', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 10:33:10.565231+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e34467ad-3996-44d0-b4d5-269f14e1f520', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 10:33:10.565799+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9ef0c8c-9493-442f-8397-6582f31a703d', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 10:47:40.294363+00', ''),
	('00000000-0000-0000-0000-000000000000', '6190da37-44e6-4af1-9db8-a7bad12269bd', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 10:47:49.660254+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0b00bca-32df-485f-b7f1-31875fa82686', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 11:50:54.150083+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c137460-1b79-491f-82fb-a7b9e08209cf', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 11:50:54.150546+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2209fcc-00d8-46e5-845d-cea999360377', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 12:54:16.588606+00', ''),
	('00000000-0000-0000-0000-000000000000', '53cd6e40-0001-48d1-8782-f8bd39d2b9ec', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 12:54:16.589676+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5a7e175-a06c-4c2d-b546-aeb212a155ec', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000006","actor_username":"user6@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 12:56:42.495171+00', ''),
	('00000000-0000-0000-0000-000000000000', '45d579c0-1759-4567-83ce-8451ea4d375c', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 12:57:37.572239+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a44286c4-413e-4dc8-8f08-8c8b887306db', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 12:59:41.81829+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b441184a-34cc-486c-bb27-760610d79c13', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 12:59:53.214511+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0cb0576-2f07-4c05-ab59-eb51c4e0b762', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 13:02:13.505171+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bb4c4244-364a-40c7-93b8-754427b75362', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 13:02:28.349467+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e819114e-c53f-4842-8fd9-c459db66bc8f', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 13:03:41.020853+00', ''),
	('00000000-0000-0000-0000-000000000000', '368d0770-eccd-4433-8774-134915b05a51', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 13:03:50.587098+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc84c302-137c-45a9-b32d-54f9635323e5', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 13:04:38.240299+00', ''),
	('00000000-0000-0000-0000-000000000000', '44b6fbb2-6998-4ddc-a55e-e013b39d9fa6', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000002","actor_username":"user2@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 13:05:27.942855+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1491168-33c0-4c0e-941c-f3dc19b4a2ab', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 13:05:37.852378+00', ''),
	('00000000-0000-0000-0000-000000000000', '80af4458-eb0e-43b9-b2f1-ca89d8b8db86', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 13:06:09.782303+00', ''),
	('00000000-0000-0000-0000-000000000000', '13fb4add-b734-44ea-8eca-8017d4293159', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 13:06:20.247631+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c940b6f2-ba14-4196-8c04-e0aa470bddba', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 22:27:20.725704+00', ''),
	('00000000-0000-0000-0000-000000000000', 'abbe170e-3b3d-4c73-89da-dd416a4802d2', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-24 22:27:20.726358+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b795f77e-a885-4434-ad3e-423540abbae4', '{"action":"logout","actor_id":"00000000-0000-0000-0000-000000000003","actor_username":"user3@example.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 23:06:02.463868+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5eed457-b3ca-487e-8895-4b61b9371b4a', '{"action":"user_confirmation_requested","actor_id":"dca79ea4-dbea-4545-98fd-9d141db3b3b6","actor_username":"hansjeej2@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-05-24 23:07:14.871134+00', ''),
	('00000000-0000-0000-0000-000000000000', '45fe6ab2-38c6-4eb2-a240-2ec9ab3871af', '{"action":"user_confirmation_requested","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-05-24 23:08:18.696634+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5ecb67b-445e-4df6-bc16-f8d9207309dd', '{"action":"user_signedup","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"team"}', '2025-05-24 23:10:27.491511+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ff4be79-21a0-45d9-936e-c643c94d49d9', '{"action":"login","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 23:10:51.694602+00', ''),
	('00000000-0000-0000-0000-000000000000', '07c37ccc-0d7a-4bf1-8314-227a38eabb36', '{"action":"user_modified","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"user"}', '2025-05-24 23:12:01.167894+00', ''),
	('00000000-0000-0000-0000-000000000000', '1f7fe4bc-8b27-4acf-8e11-f8310c7ad682', '{"action":"user_modified","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"user"}', '2025-05-24 23:12:29.185221+00', ''),
	('00000000-0000-0000-0000-000000000000', '32dbf1d9-d9b2-4854-9067-b1230cd5ab10', '{"action":"user_modified","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"user"}', '2025-05-24 23:13:41.902663+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d193ff7-224a-4845-85c0-3351c35a1567', '{"action":"logout","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"account"}', '2025-05-24 23:13:50.74372+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ef7626f-bb6b-439d-b18d-3581a812391d', '{"action":"login","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-24 23:13:57.045238+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2a2aae7-f7b3-4e1c-b0c7-7fb9d4a671df', '{"action":"token_refreshed","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"token"}', '2025-05-25 21:16:46.530829+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf73d00f-5b6e-451f-a7ff-4ec94ba8485c', '{"action":"token_revoked","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"token"}', '2025-05-25 21:16:46.532439+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ef9c2dc9-deff-4a35-94ff-a07c1c385fb6', '{"action":"token_refreshed","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"token"}', '2025-05-25 21:16:46.552709+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ccddcbe0-bc00-4fbd-a417-7aa56d03fcb3', '{"action":"logout","actor_id":"6443e038-4e19-4326-9bf6-733ab0416c20","actor_username":"jack@hansjee.com","actor_via_sso":false,"log_type":"account"}', '2025-05-25 21:18:34.603743+00', ''),
	('00000000-0000-0000-0000-000000000000', '004bc833-0351-46b2-91c4-b0f332d31f9f', '{"action":"login","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-05-25 21:29:41.638674+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4346479-bdf0-4bae-8b47-2a4d624f5954', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-25 22:28:21.71653+00', ''),
	('00000000-0000-0000-0000-000000000000', '375dfc1b-08c0-4b68-89a9-995465589a19', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-25 22:28:21.717963+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd68fd227-b1f2-46f4-9c40-09e603f73c58', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-26 11:09:28.736837+00', ''),
	('00000000-0000-0000-0000-000000000000', '1270f25d-aca5-47c2-92fe-920e52cb6a45', '{"action":"token_revoked","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-26 11:09:28.739032+00', ''),
	('00000000-0000-0000-0000-000000000000', '835ca0d8-3ec7-49a1-8b7e-cba0f6c389da', '{"action":"token_refreshed","actor_id":"00000000-0000-0000-0000-000000000007","actor_username":"user7@example.com","actor_via_sso":false,"log_type":"token"}', '2025-05-26 11:09:28.755166+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e2723b2-a513-49ec-919e-75eb3fa8afa5', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"hansjeej2@gmail.com","user_id":"dca79ea4-dbea-4545-98fd-9d141db3b3b6","user_phone":""}}', '2025-05-26 11:22:13.336215+00', ''),
	('00000000-0000-0000-0000-000000000000', '3198442d-d0ed-42b2-a982-0bec9ab7deea', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"jack.hansjee@me.com","user_id":"c4bced4a-7c19-468f-a9b8-e7175f6c1e31","user_phone":""}}', '2025-05-26 11:22:13.338306+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7759f29-d5bf-46c2-abb8-9525b6502ba9', '{"action":"user_confirmation_requested","actor_id":"44c7d98a-ed17-42fa-8676-1476b6e040c2","actor_username":"hansjeej2@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-05-26 11:24:23.893959+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cc6c604d-b41e-4d48-8543-23a5af4ca9d9', '{"action":"user_signedup","actor_id":"44c7d98a-ed17-42fa-8676-1476b6e040c2","actor_username":"hansjeej2@gmail.com","actor_via_sso":false,"log_type":"team"}', '2025-05-26 11:24:56.908418+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a90beefa-453e-4271-a3bc-96899b3eb003', '{"action":"user_confirmation_requested","actor_id":"6a69f6fb-db38-40ea-af44-128b2e360f45","actor_username":"jack.hansjee@me.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-05-26 11:25:52.014976+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a376e830-b492-4f3c-81af-be9ec6d49b21', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"jack.hansjee@me.com","user_id":"6a69f6fb-db38-40ea-af44-128b2e360f45","user_phone":""}}', '2025-05-26 11:26:50.767097+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at") VALUES
	('e0823663-c4ca-46a1-8525-dfb7f4b2c9cb', 'c4bced4a-7c19-468f-a9b8-e7175f6c1e31', '2b19ecf7-bfca-4b4d-ac36-ac013ed566c7', 's256', 'PmGh8rugvsupODTbuzoC1rVKu8pe9RY0Gs-SUI50B_s', 'email', '', '', '2025-05-06 23:00:54.919922+00', '2025-05-06 23:00:54.919922+00', 'email/signup', NULL),
	('9e4d4392-1b62-433a-b375-bbd006315b68', 'dca79ea4-dbea-4545-98fd-9d141db3b3b6', '41935e18-68ed-443a-b768-e76bae5a05b0', 's256', '7spFEwSCFnhhwW50gMCDRKC6HUsC2h-gKg0q4Vl3LdI', 'email', '', '', '2025-05-24 23:07:14.871588+00', '2025-05-24 23:07:14.871588+00', 'email/signup', NULL),
	('dccb2c2a-c0fd-484e-bdbf-1ff75e92533e', '6443e038-4e19-4326-9bf6-733ab0416c20', 'd2f272d0-f9d8-404f-a301-dcf47849438f', 's256', 'zrSYwVlGRNZD2YQooYe_uxK5njMvPBQaPplSKT-jYcc', 'email', '', '', '2025-05-24 23:08:18.697183+00', '2025-05-24 23:08:18.697183+00', 'email/signup', NULL),
	('3ff6c192-1d05-445c-97c4-2f62ceb35476', '44c7d98a-ed17-42fa-8676-1476b6e040c2', '04c2fb94-1962-4488-96d6-174961c26da6', 's256', 'IvqVpaU6bD05Kh8VMJLJfeKyL1SZvfWzgB0SlqIOdAw', 'email', '', '', '2025-05-26 11:24:23.894356+00', '2025-05-26 11:24:23.894356+00', 'email/signup', NULL),
	('e977fd4a-991e-4653-949e-30b711abff1f', '6a69f6fb-db38-40ea-af44-128b2e360f45', 'd7543c8b-c12e-44ad-b864-264f4d868cf6', 's256', '8y5mUONJxx1eqHotPfw40IK44g0eyhlLee1JEUzRkbQ', 'email', '', '', '2025-05-26 11:25:52.015518+00', '2025-05-26 11:25:52.015518+00', 'email/signup', NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000009', 'authenticated', 'authenticated', 'user9@example.com', '$2a$06$9BY.l257qQ5Qgvhg0v9uNeZGsr5EC/kz7gZBQFYlWLM8AlhgtBHVK', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-06 09:30:20.965667+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": true, "university": 2}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000006', 'authenticated', 'authenticated', 'user6@example.com', '$2a$06$B7ffYWSBrqMwUGHLSMgWT.s36SvWhlAmuvyNIhtVZqBrXpwU2txAS', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-24 10:47:49.660844+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": true, "university": 3}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-24 12:54:16.591505+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000005', 'authenticated', 'authenticated', 'user5@example.com', '$2a$06$N049eehW5AYjLh9dn.ATiuK3GhKUcfr1vMd6Q9ozRF4EzZjLcaSlO', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-13 12:14:30.538234+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": false, "university": 2}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-13 13:51:21.504806+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000001', 'authenticated', 'authenticated', 'user1@example.com', '$2a$06$XJtWcQdp7KXBV6a7J7Xd5ulUqmO8eAf61vDxs3q8cwBpTntWOpSXy', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-14 00:31:48.809123+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": false, "university": 2}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-14 00:31:48.813882+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000007', 'authenticated', 'authenticated', 'user7@example.com', '$2a$06$DWN35uNOsocyQDHRAdVoYO6SiK2NT/IY6u3SzIh/r2h8THs4i89xC', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-25 21:29:41.639324+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": true, "university": 4}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-26 11:09:28.741536+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000002', 'authenticated', 'authenticated', 'user2@example.com', '$2a$06$EQT8WVA9tskhwvaXWpJSm.HIylys7FESJ9RrMEgf7MymlSH83pnvy', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-24 13:04:38.240949+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": false, "university": 3}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-24 13:04:38.242169+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000008', 'authenticated', 'authenticated', 'user8@example.com', '$2a$06$ZQvZxi2LP/PC0/uUiI9ujOanidtV8vrGBEvfyGU3hOW1nrx01akaG', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-12 23:15:55.897904+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": true, "university": 1}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-13 09:05:44.65341+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000004', 'authenticated', 'authenticated', 'user4@example.com', '$2a$06$q2G89oRKU0wvfIzb3GTb0ONS8qNCD6tzq5blKJw.gZccdixlyzbe6', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-13 11:04:57.934179+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": false, "university": 1}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-13 11:04:57.940941+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '6443e038-4e19-4326-9bf6-733ab0416c20', 'authenticated', 'authenticated', 'jack@hansjee.com', '$2a$10$lsABIYAqgtUeUvW2.YD.veGONplemAKOIXCnfz3rQanzctUzm6Ph2', '2025-05-24 23:10:27.492149+00', NULL, '', '2025-05-24 23:08:18.697667+00', '', NULL, '', '', NULL, '2025-05-24 23:13:57.045858+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "6443e038-4e19-4326-9bf6-733ab0416c20", "email": "jack@hansjee.com", "is_staff": false, "university": 2, "email_verified": true, "phone_verified": false}', NULL, '2025-05-24 23:08:18.692332+00', '2025-05-25 21:16:46.534382+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '44c7d98a-ed17-42fa-8676-1476b6e040c2', 'authenticated', 'authenticated', 'hansjeej2@gmail.com', '$2a$10$9GKJkrtomWpL7d0jEo3DWuDp9m1DX/ECoI.Nt5nODQ6uJ.LLguB0S', '2025-05-26 11:24:56.908968+00', NULL, '', '2025-05-26 11:24:23.897117+00', '', NULL, '', '', NULL, '2025-05-26 11:24:56.912121+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "44c7d98a-ed17-42fa-8676-1476b6e040c2", "email": "hansjeej2@gmail.com", "is_staff": false, "university": 2, "email_verified": true, "phone_verified": false}', NULL, '2025-05-26 11:24:23.884747+00', '2025-05-26 11:24:56.914284+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000003', 'authenticated', 'authenticated', 'user3@example.com', '$2a$06$rE4vRocNStOVDUZVeW9qMuuaAzvkYjZMic5G9zvIfMWkPNxgymFue', '2025-05-06 09:30:20.965667+00', NULL, '', NULL, '', '2025-05-06 09:30:20.965667+00', '', '', NULL, '2025-05-24 13:06:20.248484+00', '{"provider": "email", "providers": ["email"]}', '{"is_staff": false, "university": 4}', NULL, '2025-05-06 09:30:20.965667+00', '2025-05-24 22:27:20.727992+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '{"sub": "00000000-0000-0000-0000-000000000001", "email": "user1@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', 'cb021550-d375-47af-b61c-3a1441997155'),
	('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '{"sub": "00000000-0000-0000-0000-000000000002", "email": "user2@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '27e60c21-611e-439b-9ac3-ee2486712313'),
	('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000003', '{"sub": "00000000-0000-0000-0000-000000000003", "email": "user3@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '7dddb7f0-d3e8-494a-8d10-4d27391ae5f2'),
	('00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000004', '{"sub": "00000000-0000-0000-0000-000000000004", "email": "user4@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', 'e9b26c90-abf7-4ddb-9bc3-2a9ef8d6d30c'),
	('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000005', '{"sub": "00000000-0000-0000-0000-000000000005", "email": "user5@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '101cce96-4f1e-47cc-8d97-0eedd4878b50'),
	('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0000-000000000006', '{"sub": "00000000-0000-0000-0000-000000000006", "email": "user6@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '59c40b6c-98ed-4c23-962e-cc948416d42b'),
	('00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0000-000000000007', '{"sub": "00000000-0000-0000-0000-000000000007", "email": "user7@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '65d88931-ba3d-43cf-b206-d3ba54a32232'),
	('00000000-0000-0000-0000-000000000008', '00000000-0000-0000-0000-000000000008', '{"sub": "00000000-0000-0000-0000-000000000008", "email": "user8@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '10775973-b735-45e3-88ef-3981609ce8c2'),
	('00000000-0000-0000-0000-000000000009', '00000000-0000-0000-0000-000000000009', '{"sub": "00000000-0000-0000-0000-000000000009", "email": "user9@example.com"}', 'email', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '2025-05-06 09:30:20.965667+00', '32bfa952-324e-4f75-a07d-0430bf3e3e86'),
	('6443e038-4e19-4326-9bf6-733ab0416c20', '6443e038-4e19-4326-9bf6-733ab0416c20', '{"sub": "6443e038-4e19-4326-9bf6-733ab0416c20", "email": "jack@hansjee.com", "is_staff": false, "email_verified": true, "phone_verified": false}', 'email', '2025-05-24 23:08:18.695109+00', '2025-05-24 23:08:18.695133+00', '2025-05-24 23:08:18.695133+00', '10068923-61e4-4379-9fff-eb71fbda1e75'),
	('44c7d98a-ed17-42fa-8676-1476b6e040c2', '44c7d98a-ed17-42fa-8676-1476b6e040c2', '{"sub": "44c7d98a-ed17-42fa-8676-1476b6e040c2", "email": "hansjeej2@gmail.com", "is_staff": false, "university": 2, "email_verified": true, "phone_verified": false}', 'email', '2025-05-26 11:24:23.891797+00', '2025-05-26 11:24:23.891827+00', '2025-05-26 11:24:23.891827+00', '017ab0a0-9fcb-4546-8275-3d7c35686351');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('12c0a50b-2f21-4d4e-b1f7-c6cca13187cb', '00000000-0000-0000-0000-000000000007', '2025-05-25 21:29:41.639381+00', '2025-05-26 11:09:28.756446+00', NULL, 'aal1', NULL, '2025-05-26 11:09:28.756389', 'node', '172.18.0.1', NULL),
	('e076da9d-9420-4fbd-be4e-fa13e8b3c49a', '44c7d98a-ed17-42fa-8676-1476b6e040c2', '2025-05-26 11:24:56.912164+00', '2025-05-26 11:24:56.912164+00', NULL, 'aal1', NULL, NULL, 'node', '172.18.0.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('12c0a50b-2f21-4d4e-b1f7-c6cca13187cb', '2025-05-25 21:29:41.642741+00', '2025-05-25 21:29:41.642741+00', 'password', 'ccc108ae-02d0-43c4-840a-5090e6251f81'),
	('e076da9d-9420-4fbd-be4e-fa13e8b3c49a', '2025-05-26 11:24:56.914525+00', '2025-05-26 11:24:56.914525+00', 'otp', '8f1f14bd-6449-4e0f-a769-cfce2e82bb6d');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 71, '6zjz3nx3psnr', '00000000-0000-0000-0000-000000000007', true, '2025-05-25 21:29:41.641204+00', '2025-05-25 22:28:21.718363+00', NULL, '12c0a50b-2f21-4d4e-b1f7-c6cca13187cb'),
	('00000000-0000-0000-0000-000000000000', 72, 'z3a7oibseo6t', '00000000-0000-0000-0000-000000000007', true, '2025-05-25 22:28:21.719967+00', '2025-05-26 11:09:28.739615+00', '6zjz3nx3psnr', '12c0a50b-2f21-4d4e-b1f7-c6cca13187cb'),
	('00000000-0000-0000-0000-000000000000', 73, 'byyfvnr32wlg', '00000000-0000-0000-0000-000000000007', false, '2025-05-26 11:09:28.740315+00', '2025-05-26 11:09:28.740315+00', 'z3a7oibseo6t', '12c0a50b-2f21-4d4e-b1f7-c6cca13187cb'),
	('00000000-0000-0000-0000-000000000000', 74, 'r4shkthht7zm', '44c7d98a-ed17-42fa-8676-1476b6e040c2', false, '2025-05-26 11:24:56.913614+00', '2025-05-26 11:24:56.913614+00', NULL, 'e076da9d-9420-4fbd-be4e-fa13e8b3c49a');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."categories" ("id", "name", "cover_photo_url") VALUES
	(1, 'Music', 'https://images.pexels.com/photos/995301/pexels-photo-995301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
	(2, 'Comedy', 'https://images.pexels.com/photos/144429/pexels-photo-144429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
	(3, 'Sports and Exercise', 'https://images.pexels.com/photos/2526878/pexels-photo-2526878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
	(4, 'Talks', 'https://images.pexels.com/photos/3321791/pexels-photo-3321791.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
	(5, 'Tech', 'https://images.pexels.com/photos/17260648/pexels-photo-17260648/free-photo-of-robotics-event-for-children.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
	(6, 'Drama and Dance', 'https://images.pexels.com/photos/2736742/pexels-photo-2736742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
	(7, 'Art and Design', 'https://images.pexels.com/photos/4219152/pexels-photo-4219152.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."universities" ("id", "slug", "name", "logo_url", "crest_url") VALUES
	(1, 'exeter-uni', 'University of Exeter', '/assets/university-logos/exeter-logo.svg', '/assets/university-crests/exeter-crest.jpg'),
	(2, 'imperial', 'Imperial College London', '/assets/university-logos/imperial-logo.svg', '/assets/university-crests/icl-crest.png'),
	(3, 'lboro-uni', 'Loughborough University', '/assets/university-logos/lboro-logo.svg', '/assets/university-crests/lboro-crest.png'),
	(4, 'oxford-uni', 'University of Oxford', '/assets/university-logos/oxford-logo.svg', '/assets/university-crests/oxford-crest.png');


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."profiles" ("id", "avatar_url", "university_id", "is_staff") VALUES
	('00000000-0000-0000-0000-000000000001', NULL, 2, false),
	('00000000-0000-0000-0000-000000000002', NULL, 3, false),
	('00000000-0000-0000-0000-000000000003', NULL, 4, false),
	('00000000-0000-0000-0000-000000000004', NULL, 1, false),
	('00000000-0000-0000-0000-000000000005', NULL, 2, false),
	('00000000-0000-0000-0000-000000000006', NULL, 3, true),
	('00000000-0000-0000-0000-000000000007', NULL, 4, true),
	('00000000-0000-0000-0000-000000000008', NULL, 1, true),
	('00000000-0000-0000-0000-000000000009', NULL, 2, true),
	('6443e038-4e19-4326-9bf6-733ab0416c20', NULL, 2, false),
	('44c7d98a-ed17-42fa-8676-1476b6e040c2', NULL, 2, false);


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."venues" ("id", "university_id", "location", "name", "max_capacity") VALUES
	(1, 1, '0101000020E61000004B598638D6450CC058A835CD3B5E4940', 'Alumni Auditorium', 400),
	(2, 1, '0101000020E610000062105839B4480CC04A7B832F4C5E4940', 'The Terrace', 300),
	(3, 1, '0101000020E6100000986E1283C04A0CC0AE47E17A145E4940', 'Devonshire House', 250),
	(4, 2, '0101000020E6100000DCD781734694C6BF2B8716D9CEBF4940', 'Royal School of Mines Lecture Theatre', 150),
	(5, 2, '0101000020E6100000772D211FF46CC6BFB9FC87F4DBBF4940', 'Huxley Building Room 340', 100),
	(6, 2, '0101000020E6100000BC7493180456C6BF9D11A5BDC1BF4940', 'Beit Hall Conference Room', 120),
	(7, 3, '0101000020E610000026E4839ECDAAF3BF1904560E2D624A40', 'Edward Herbert Building - EHB001', 180),
	(8, 3, '0101000020E6100000D9CEF753E3A5F3BF448B6CE7FB614A40', 'Pilkington Library Seminar Room', 60),
	(9, 3, '0101000020E6100000AE47E17A14AEF3BF355EBA490C624A40', 'STEMLab Events Area', 200),
	(10, 4, '0101000020E6100000FDF675E09C11F4BF8D976E1283E04940', 'Exam Schools East Room', 350),
	(11, 4, '0101000020E61000007F6ABC749318F4BF0DE02D90A0E04940', 'Mathematical Institute Lecture Room L1', 250),
	(12, 4, '0101000020E6100000228E75711B0DF4BF46B6F3FDD4E04940', 'Keble College Hall', 180),
	(13, 4, '0101000020E6100000AAF1D24D6210F4BFAA8251499DE04940', 'Sheldonian Theatre', 800),
	(14, 4, '0101000020E61000007F6ABC749318F4BFFED478E926E14940', 'Oxford Union', 500),
	(15, 4, '0101000020E6100000333333333333F4BF545227A089E04940', 'Exam Schools', 600),
	(16, 4, '0101000020E610000068B3EA73B515F4BFC74B378941E04940', 'Keble College Hall', 300),
	(17, 4, '0101000020E6100000295C8FC2F528F4BF8D976E1283E04940', 'Oxford Playhouse', 400),
	(18, 3, '0101000020E6100000F085C954C1A8F3BFE02D90A0F8614A40', 'Sir David Wallace Sports Hall', 1000),
	(19, 3, '0101000020E610000090A0F831E6AEF3BFE0BE0E9C33624A40', 'Cope Auditorium', 400),
	(20, 3, '0101000020E6100000448B6CE7FBA9F3BF355EBA490C624A40', 'Edward Herbert Building', 350),
	(21, 3, '0101000020E6100000CFF753E3A59BF3BFFCA9F1D24D624A40', 'Loughborough Students'' Union', 1200),
	(22, 3, '0101000020E6100000F775E09C11A5F3BFB515FBCBEE614A40', 'James France Building', 250);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."events" ("id", "title", "description", "start_time", "end_time", "venue_id", "ticket_price", "cover_photo_url", "host", "creator", "is_listed", "is_public", "category_id") VALUES
	(28, 'Design Fair', 'Design students show off their final projects.', '2025-06-23 10:00:00+00', '2025-06-23 15:00:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 7),
	(1, 'Exeter Battle of the Bands', 'Student bands compete for the crown.', '2025-06-10 18:00:00+00', '2025-06-10 21:00:00+00', 1, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000006', true, true, 1),
	(2, 'Exeter Open Mic Comedy', 'A night of laughter at Lemon Grove.', '2025-06-12 19:00:00+00', '2025-06-12 22:00:00+00', 2, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 2),
	(3, 'Exeter Fitness Bootcamp', 'Outdoor group workout at Streatham.', '2025-06-15 07:00:00+00', '2025-06-15 08:30:00+00', 3, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000006', true, false, 3),
	(4, 'Exeter AI Talk', 'Panel with AI researchers.', '2025-06-20 17:00:00+00', '2025-06-20 19:00:00+00', 2, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000006', true, true, 5),
	(5, 'Exeter Art Showcase', 'Fine arts and digital works display.', '2025-06-21 13:00:00+00', '2025-06-21 17:00:00+00', 1, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000006', true, true, 7),
	(6, 'Exeter Jazz Night', 'Live jazz in the Great Hall.', '2025-06-22 20:00:00+00', '2025-06-22 23:00:00+00', 1, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 1),
	(7, 'Exeter Tech Workshop', 'Intro to web development.', '2025-06-23 15:00:00+00', '2025-06-23 18:00:00+00', 3, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000006', true, true, 5),
	(8, 'Exeter Drama Rehearsal', 'Open rehearsal session.', '2025-06-24 16:00:00+00', '2025-06-24 18:00:00+00', 1, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000006', true, false, 6),
	(9, 'Exeter Science Talks', 'Student-led presentations.', '2025-06-25 10:00:00+00', '2025-06-25 12:00:00+00', 3, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 4),
	(10, 'Exeter Design Sprint', 'Creative collaboration challenge.', '2025-06-26 09:00:00+00', '2025-06-26 17:00:00+00', 2, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000006', true, true, 7),
	(11, 'Imperial Coding Jam', 'Speed coding challenge for teams.', '2025-07-01 14:00:00+00', '2025-07-01 18:00:00+00', 6, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000007', true, true, 5),
	(12, 'Imperial Music Showcase', 'Instrumental and vocal talent.', '2025-07-02 19:00:00+00', '2025-07-02 22:00:00+00', 5, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', true, true, 1),
	(13, 'Imperial Laugh Lounge', 'Student comedy performances.', '2025-07-03 18:00:00+00', '2025-07-03 21:00:00+00', 5, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000007', true, true, 2),
	(14, 'Imperial Gym Bash', 'Fitness and wellness event.', '2025-07-04 09:00:00+00', '2025-07-04 11:00:00+00', 7, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000007', true, false, 3),
	(15, 'Imperial Future Tech Talk', 'Emerging technologies and careers.', '2025-07-05 15:00:00+00', '2025-07-05 17:00:00+00', 6, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000007', true, true, 5),
	(16, 'Imperial Drama Night', 'A night of short plays.', '2025-07-06 20:00:00+00', '2025-07-06 22:00:00+00', 5, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000007', true, true, 6),
	(17, 'Imperial Creative Fest', 'Student creative fair.', '2025-07-07 11:00:00+00', '2025-07-07 15:00:00+00', 5, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', true, true, 7),
	(18, 'Imperial Engineering Panel', 'Engineering leaders Q&A.', '2025-07-08 14:00:00+00', '2025-07-08 16:00:00+00', 6, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000007', true, true, 4),
	(19, 'Imperial Startups Meetup', 'Founders present their projects.', '2025-07-09 10:00:00+00', '2025-07-09 12:00:00+00', 6, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000007', true, true, 5),
	(20, 'Imperial Late Night Beats', 'Campus DJ night.', '2025-07-10 21:00:00+00', '2025-07-11 01:00:00+00', 5, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000007', true, true, 1),
	(21, 'Debate Night at the Union', 'A lively debate featuring leading thinkers.', '2025-06-10 18:00:00+00', '2025-06-10 20:00:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(22, 'Classical Concert', 'Enjoy a night of classical music at the Sheldonian.', '2025-06-12 19:00:00+00', '2025-06-12 21:30:00+00', 13, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(23, 'Art Exhibition', 'Student art showcase at the Exam Schools.', '2025-06-14 10:00:00+00', '2025-06-14 16:00:00+00', 14, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, false, 7),
	(24, 'Tech Talk: AI in Medicine', 'Exploring the future of AI in healthcare.', '2025-06-16 15:00:00+00', '2025-06-16 17:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(25, 'Student Theatre Showcase', 'Performances by Oxford Drama Society.', '2025-06-18 19:30:00+00', '2025-06-18 21:00:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 6),
	(26, 'Oxford Stand-Up Night', 'An evening of student comedy at Keble College Hall.', '2025-06-20 19:00:00+00', '2025-06-20 21:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 2),
	(27, 'Oxford Tech Expo', 'Tech society expo showcasing new projects.', '2025-06-22 12:00:00+00', '2025-06-22 17:00:00+00', 13, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(29, 'Public Lecture on Ethics', 'Guest speaker from the philosophy faculty.', '2025-06-24 17:00:00+00', '2025-06-24 18:30:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(30, 'Oxford Freshers'' Showcase', 'Music, drama, and more from first-years.', '2025-06-26 18:00:00+00', '2025-06-26 21:00:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(31, 'Varsity Sports Finals', 'Watch the best of university sports.', '2025-06-10 13:00:00+00', '2025-06-10 18:00:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000008', true, true, 3),
	(32, 'Student Open Mic Night', 'Showcase your talent at the SU.', '2025-06-11 20:00:00+00', '2025-06-11 22:30:00+00', 8, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000008', true, true, 2),
	(33, 'TEDx Talks', 'Ideas worth spreading by Lboro students.', '2025-06-13 10:00:00+00', '2025-06-13 13:00:00+00', 19, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000008', true, false, 4),
	(34, 'Hackathon', '24h coding challenge in the EH building.', '2025-06-15 09:00:00+00', '2025-06-16 09:00:00+00', 18, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000008', true, true, 5),
	(35, 'Drama Night', 'An evening of student theatre.', '2025-06-17 19:00:00+00', '2025-06-17 21:30:00+00', 20, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000008', true, true, 6),
	(36, 'Lboro Laughs', 'Comedy society''s term-end standup show.', '2025-06-19 19:00:00+00', '2025-06-19 21:00:00+00', 19, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000008', true, true, 2),
	(37, 'Sports Science Panel', 'Talks from elite athletes and coaches.', '2025-06-20 14:00:00+00', '2025-06-20 16:00:00+00', 7, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000008', true, true, 4),
	(38, 'Tech Demo Day', 'Final year projects from computing students.', '2025-06-22 10:00:00+00', '2025-06-22 14:00:00+00', 18, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000008', true, false, 5),
	(39, 'Art & Design Market', 'Stalls from students selling prints, posters and more.', '2025-06-24 11:00:00+00', '2025-06-24 15:00:00+00', 22, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000008', true, true, 7),
	(40, 'Film Screening Night', 'End of year film society selection.', '2025-06-25 19:00:00+00', '2025-06-25 21:30:00+00', 9, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000008', true, true, 6),
	(41, 'Public Talk: Quantum Computing Horizons', 'Join Professor Davies for an insightful talk on the future potential and current challenges of quantum computing. Suitable for a general academic audience.', '2025-05-15 17:00:00+00', '2025-05-15 18:30:00+00', 11, 0, 'https://picsum.photos/seed/quantum_ox/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(42, 'St John''s College Chapel Choir Evensong', 'Join the renowned St John''s College Choir for a service of Choral Evensong, featuring works by Tallis and Byrd. Open to all.', '2025-05-22 16:30:00+00', '2025-05-22 17:30:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(43, 'Oxford Union Debate: AI Regulation', 'A formal debate addressing the motion "This House believes urgent global regulation of AI is paramount". Featuring student speakers and guest experts. Union members only.', '2025-05-29 19:00:00+00', '2025-05-29 21:00:00+00', 14, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 4),
	(44, 'Tech Talk: Introduction to Machine Learning', 'An introductory session covering the fundamentals of machine learning algorithms and their applications. Aimed at students from all disciplines.', '2025-06-05 13:00:00+00', '2025-06-05 14:30:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(45, 'Lunchtime Organ Recital', 'Enjoy a selection of classical pieces performed on the historic Sheldonian Theatre organ by university organ scholar, Kenji Tanaka.', '2025-06-12 12:10:00+00', '2025-06-12 12:50:00+00', 13, 0, 'https://picsum.photos/seed/organ_recital_alt/1000/300', '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(46, 'OUDS Presents: Rosencrantz and Guildenstern Are Dead', 'The Oxford University Dramatic Society stages Tom Stoppard''s witty exploration of fate and free will at the Oxford Playhouse.', '2025-06-18 18:30:00+00', '2025-06-18 21:15:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 6),
	(47, 'Ruskin School Final Year Show: Private View', 'An exclusive first look at the degree show from graduating students of the Ruskin School of Art. Drinks reception included.', '2025-06-23 17:00:00+00', '2025-06-23 19:30:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', false, false, 7),
	(48, 'Inter-Collegiate Rowing Regatta Finals', 'Watch the culmination of the college rowing season. Finals races held throughout the afternoon. Spectators welcome along the towpath.', '2025-06-28 12:00:00+00', '2025-06-28 16:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, true, 3),
	(49, 'Oxford Revue Stand-up Night', 'An evening of hilarious stand-up comedy featuring members of the renowned Oxford Revue troupe.', '2025-07-01 19:00:00+00', '2025-07-01 21:00:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 2),
	(50, 'Life Drawing Workshop (Untutored)', 'Practice your drawing skills in a relaxed, untutored life drawing session. Basic materials provided, or bring your own.', '2025-07-03 13:00:00+00', '2025-07-03 15:00:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, false, 7),
	(51, 'Chancellor''s Lecture: Geopolitics in the 21st Century', 'A prestigious lecture delivered by a leading international figure on contemporary global politics. Admission free, booking required.', '2025-07-05 16:30:00+00', '2025-07-05 18:00:00+00', 13, 0, 'https://picsum.photos/seed/chancellor_lecture/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(52, 'Jazz Night ft. University Big Band', 'An evening of swinging tunes from the Oxford University Jazz Orchestra (OUJO) Big Band. Licensed bar available.', '2025-07-08 19:30:00+00', '2025-07-08 22:00:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(53, 'Physics Dept Seminar: Dark Matter Detection', 'Weekly departmental seminar featuring Dr. Eleanor Vance presenting recent results from the LUX-ZEPLIN experiment.', '2025-07-10 15:00:00+00', '2025-07-10 16:00:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', false, false, 5),
	(54, 'Contemporary Dance Showcase', 'Experience innovative choreography and powerful performances from the Oxford University Contemporary Dance group.', '2025-07-12 18:30:00+00', '2025-07-12 20:00:00+00', 12, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 6),
	(55, 'University Fencing Championships', 'Watch the Varsity fencing team compete in the annual University Championships. Foil, Epee, and Sabre categories.', '2025-07-15 09:00:00+00', '2025-07-15 16:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 3),
	(56, 'Poetry Reading: New Voices', 'An evening showcasing talented student poets from across the university. Open mic slots available.', '2025-07-17 18:00:00+00', '2025-07-17 19:30:00+00', 10, 0, 'https://picsum.photos/seed/poetry_ox/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(57, 'Postgraduate Welcome Drinks', 'An informal drinks reception for new postgraduate students starting Michaelmas term early.', '2025-07-19 17:00:00+00', '2025-07-19 19:00:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', false, false, 4),
	(58, 'Robotics Workshop: Build a Bot', 'Hands-on workshop introducing basic robotics principles. Build and program a simple line-following robot. Materials included.', '2025-07-22 09:00:00+00', '2025-07-22 15:00:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 5),
	(59, 'Outdoor Theatre: Twelfth Night', 'Enjoy Shakespeare''s classic comedy performed outdoors in the college gardens (Meeting point: Keble College Hall). Bring a picnic!', '2025-07-24 17:30:00+00', '2025-07-24 20:00:00+00', 12, 0, 'https://picsum.photos/seed/twelfth_night_ox/1000/300', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 6),
	(60, 'Oxford Philharmonic Orchestra Concert', 'The renowned Oxford Philharmonic performs Beethoven Symphony No. 5 and Mozart Piano Concerto No. 21.', '2025-07-26 18:30:00+00', '2025-07-26 20:30:00+00', 13, 0, 'https://picsum.photos/seed/oxford_phil/1000/300', '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(61, 'Yoga in the Park (University Parks)', 'Start your day with a refreshing outdoor yoga session suitable for all levels. Meet near Keble College entrance.', '2025-07-29 07:00:00+00', '2025-07-29 08:00:00+00', 12, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 3),
	(62, 'Improv Comedy Night', 'Watch skilled improvisers create hilarious scenes based on audience suggestions. Unpredictable fun guaranteed!', '2025-07-31 19:00:00+00', '2025-07-31 20:30:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 2),
	(63, 'History Faculty Seminar: The English Reformation', 'Professor Catherine Armstrong discusses new perspectives on the social impact of the English Reformation.', '2025-08-02 13:00:00+00', '2025-08-02 14:30:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', false, false, 4),
	(64, 'Digital Photography Workshop', 'Learn the basics of composition, lighting, and camera settings in this introductory digital photography workshop.', '2025-08-05 10:00:00+00', '2025-08-05 13:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 7),
	(65, 'Astrophysics Public Lecture: Exoplanets', 'Explore the fascinating world of planets beyond our solar system with Dr. Ben Carter. Suitable for all.', '2025-08-07 17:30:00+00', '2025-08-07 18:45:00+00', 11, 0, 'https://picsum.photos/seed/exoplanets_ox/1000/300', '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(66, 'Oxford University Orchestra Summer Concert', 'The premier student orchestra performs works by Sibelius and Dvorak in the magnificent Sheldonian Theatre.', '2025-08-09 18:30:00+00', '2025-08-09 20:45:00+00', 13, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(67, 'OU Contemporary Dance Company Auditions', 'Auditions for the Oxford University Contemporary Dance Company. Open to all university members with dance experience.', '2025-08-12 16:00:00+00', '2025-08-12 18:00:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', false, false, 6),
	(68, '5-a-side Football Tournament (Grad vs Undergrad)', 'Friendly inter-faculty 5-a-side football tournament. Sign up your team or come along to support.', '2025-08-14 13:00:00+00', '2025-08-14 17:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 3),
	(69, 'Philosophy Society Guest Lecture', 'Professor Simon Blackburn discusses "Truth, Lies, and Bullshit". Q&A session to follow.', '2025-08-16 16:00:00+00', '2025-08-16 17:30:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(70, 'Screen Printing Taster Session', 'Try your hand at screen printing! Learn the basics and print your own design onto a tote bag (provided).', '2025-08-19 12:00:00+00', '2025-08-19 14:00:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 7),
	(71, 'BioTech Start-up Pitch Event', 'Watch Oxford''s budding biotech entrepreneurs pitch their innovative ideas to a panel of investors and experts.', '2025-08-21 17:00:00+00', '2025-08-21 19:00:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(72, 'Keble College Chapel Choir Performance', 'An evening concert by the Keble College Chapel Choir, featuring sacred and secular works spanning five centuries.', '2025-08-23 18:00:00+00', '2025-08-23 19:30:00+00', 12, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(73, 'Careers Service: CV Writing Workshop', 'Learn how to craft an effective CV for academic or industry applications. Essential for finalists and postgraduates.', '2025-08-26 13:00:00+00', '2025-08-26 14:30:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 4),
	(74, 'Film Screening: "Blade Runner" (Director''s Cut)', 'University Film Society screening of the sci-fi classic. Introduction and post-film discussion.', '2025-08-28 18:30:00+00', '2025-08-28 21:00:00+00', 17, 0, 'https://picsum.photos/seed/blade_runner_ox/1000/300', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 5),
	(75, 'University Basketball Club Trials', 'Trials for the Oxford University Men''s and Women''s Basketball teams. Open to all skilled players.', '2025-08-30 09:00:00+00', '2025-08-30 12:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', false, false, 3),
	(76, 'Sheldonian Theatre Guided Tour', 'Discover the history and architecture of Sir Christopher Wren''s masterpiece. Includes access to the cupola for panoramic views.', '2025-09-01 10:00:00+00', '2025-09-01 11:00:00+00', 13, 0, 'https://picsum.photos/seed/sheldonian_tour/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(77, 'Introduction to Ballroom Dancing Class', 'Learn the basic steps of Waltz and Quickstep in this fun, introductory class. No partner needed.', '2025-09-03 18:00:00+00', '2025-09-03 19:30:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 6),
	(78, 'AI Ethics Discussion Panel', 'Experts from philosophy, law, and computer science discuss the ethical challenges posed by advancing artificial intelligence.', '2025-09-05 16:00:00+00', '2025-09-05 17:30:00+00', 14, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 5),
	(79, 'Oxford Gargoyles A Cappella Concert', 'Enjoy tight harmonies and smooth jazz sounds from Oxford''s famous all-male a cappella group.', '2025-09-07 19:00:00+00', '2025-09-07 20:30:00+00', 12, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(80, 'Watercolour Painting Outdoors', 'Capture the beauty of Oxford''s architecture in this outdoor watercolour painting session (weather permitting). Meet at Exam Schools.', '2025-09-10 09:30:00+00', '2025-09-10 12:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 7),
	(81, 'Stand-up Comedy Open Mic Night', 'Try out your material or enjoy fresh comedic talent at this supportive open mic night.', '2025-09-12 18:30:00+00', '2025-09-12 20:30:00+00', 10, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 2),
	(82, 'Mindfulness and Meditation Session', 'A guided session to help reduce stress and improve focus. Suitable for beginners.', '2025-09-15 12:00:00+00', '2025-09-15 12:45:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, false, 3),
	(83, 'Play Reading: "Waiting for Godot"', 'Join the drama society for an informal reading of Samuel Beckett''s absurdist masterpiece. Participation encouraged.', '2025-09-17 17:00:00+00', '2025-09-17 19:00:00+00', 17, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', false, false, 6),
	(84, 'Climate Change Solutions: A Student Forum', 'A student-led forum presenting and debating innovative solutions to the climate crisis. Open to all.', '2025-09-19 15:00:00+00', '2025-09-19 17:00:00+00', 14, 0, 'https://picsum.photos/seed/climate_forum_ox/1000/300', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 4),
	(85, 'Late Night Jazz Jam Session', 'Bring your instrument or just come to listen at this informal late-night jazz jam session.', '2025-09-22 20:00:00+00', '2025-09-22 22:30:00+00', 12, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 1),
	(86, 'Introduction to Coding (Python)', 'Absolute beginners coding workshop focused on the Python language. No prior experience needed. Laptops required.', '2025-09-24 09:00:00+00', '2025-09-24 12:00:00+00', 11, 0, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, false, 5),
	(87, 'Sculpture Park Visit & Sketching', 'Organised trip to a local sculpture park (transport included). Opportunity for sketching and appreciation. Meet at Exam Schools.', '2025-09-26 08:30:00+00', '2025-09-26 15:00:00+00', 15, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, false, 7),
	(88, 'Guest Comedy Night: Phil Wang (Preview)', 'Catch acclaimed comedian Phil Wang previewing his new tour show at the Oxford Playhouse.', '2025-09-28 18:30:00+00', '2025-09-28 20:00:00+00', 17, 0, 'https://picsum.photos/seed/phil_wang_ox/1000/300', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, true, 2),
	(89, 'Circuit Training Session', 'High-intensity interval training session suitable for improving overall fitness. All levels welcome.', '2025-09-30 16:30:00+00', '2025-09-30 17:30:00+00', 16, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, false, 3);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."bookings" ("user_id", "event_id", "payment_ref", "date_booked", "ics_url") VALUES
	('00000000-0000-0000-0000-000000000001', 1, 'PAY001', '2025-05-10 10:00:00+00', '/ics/quiz_exeter_1.ics'),
	('00000000-0000-0000-0000-000000000002', 1, 'PAY002', '2025-05-10 11:00:00+00', '/ics/quiz_exeter_2.ics'),
	('00000000-0000-0000-0000-000000000003', 1, 'PAY003', '2025-05-10 12:00:00+00', '/ics/quiz_exeter_3.ics'),
	('00000000-0000-0000-0000-000000000004', 1, 'PAY004', '2025-05-10 13:00:00+00', '/ics/quiz_exeter_4.ics'),
	('00000000-0000-0000-0000-000000000005', 1, 'PAY005', '2025-05-10 14:00:00+00', '/ics/quiz_exeter_5.ics'),
	('00000000-0000-0000-0000-000000000001', 2, 'PAY006', '2025-05-12 17:00:00+00', '/ics/jazz_exeter_1.ics'),
	('00000000-0000-0000-0000-000000000002', 2, 'PAY007', '2025-05-12 18:00:00+00', '/ics/jazz_exeter_2.ics'),
	('00000000-0000-0000-0000-000000000003', 2, 'PAY008', '2025-05-12 19:00:00+00', '/ics/jazz_exeter_3.ics'),
	('00000000-0000-0000-0000-000000000004', 2, 'PAY009', '2025-05-12 20:00:00+00', '/ics/jazz_exeter_4.ics'),
	('00000000-0000-0000-0000-000000000005', 2, 'PAY010', '2025-05-12 21:00:00+00', '/ics/jazz_exeter_5.ics'),
	('00000000-0000-0000-0000-000000000001', 3, 'PAY011', '2025-05-14 14:00:00+00', '/ics/science_exeter_1.ics'),
	('00000000-0000-0000-0000-000000000002', 3, 'PAY012', '2025-05-14 15:00:00+00', '/ics/science_exeter_2.ics'),
	('00000000-0000-0000-0000-000000000003', 3, 'PAY013', '2025-05-14 16:00:00+00', '/ics/science_exeter_3.ics'),
	('00000000-0000-0000-0000-000000000004', 3, 'PAY014', '2025-05-14 17:00:00+00', '/ics/science_exeter_4.ics'),
	('00000000-0000-0000-0000-000000000005', 3, 'PAY015', '2025-05-14 18:00:00+00', '/ics/science_exeter_5.ics'),
	('00000000-0000-0000-0000-000000000001', 4, 'PAY016', '2025-05-16 11:00:00+00', '/ics/workshop_exeter_1.ics'),
	('00000000-0000-0000-0000-000000000002', 4, 'PAY017', '2025-05-16 12:00:00+00', '/ics/workshop_exeter_2.ics'),
	('00000000-0000-0000-0000-000000000003', 4, 'PAY018', '2025-05-16 13:00:00+00', '/ics/workshop_exeter_3.ics'),
	('00000000-0000-0000-0000-000000000004', 4, 'PAY019', '2025-05-16 14:00:00+00', '/ics/workshop_exeter_4.ics'),
	('00000000-0000-0000-0000-000000000005', 4, 'PAY020', '2025-05-16 15:00:00+00', '/ics/workshop_exeter_5.ics'),
	('00000000-0000-0000-0000-000000000001', 5, 'PAY021', '2025-05-18 09:00:00+00', '/ics/poetry_exeter_1.ics'),
	('00000000-0000-0000-0000-000000000002', 5, 'PAY022', '2025-05-18 10:00:00+00', '/ics/poetry_exeter_2.ics'),
	('00000000-0000-0000-0000-000000000003', 5, 'PAY023', '2025-05-18 11:00:00+00', '/ics/poetry_exeter_3.ics'),
	('00000000-0000-0000-0000-000000000004', 5, 'PAY024', '2025-05-18 12:00:00+00', '/ics/poetry_exeter_4.ics'),
	('00000000-0000-0000-0000-000000000005', 5, 'PAY025', '2025-05-18 13:00:00+00', '/ics/poetry_exeter_5.ics'),
	('00000000-0000-0000-0000-000000000001', 11, 'PAY026', '2025-05-10 12:00:00+00', '/ics/tech_imperial_1.ics'),
	('00000000-0000-0000-0000-000000000002', 11, 'PAY027', '2025-05-10 13:00:00+00', '/ics/tech_imperial_2.ics'),
	('00000000-0000-0000-0000-000000000003', 11, 'PAY028', '2025-05-10 14:00:00+00', '/ics/tech_imperial_3.ics'),
	('00000000-0000-0000-0000-000000000004', 11, 'PAY029', '2025-05-10 15:00:00+00', '/ics/tech_imperial_4.ics'),
	('00000000-0000-0000-0000-000000000005', 11, 'PAY030', '2025-05-10 16:00:00+00', '/ics/tech_imperial_5.ics'),
	('00000000-0000-0000-0000-000000000001', 12, 'PAY031', '2025-05-12 18:00:00+00', '/ics/music_imperial_1.ics'),
	('00000000-0000-0000-0000-000000000002', 12, 'PAY032', '2025-05-12 19:00:00+00', '/ics/music_imperial_2.ics'),
	('00000000-0000-0000-0000-000000000003', 12, 'PAY033', '2025-05-12 20:00:00+00', '/ics/music_imperial_3.ics'),
	('00000000-0000-0000-0000-000000000004', 12, 'PAY034', '2025-05-12 21:00:00+00', '/ics/music_imperial_4.ics'),
	('00000000-0000-0000-0000-000000000005', 12, 'PAY035', '2025-05-12 22:00:00+00', '/ics/music_imperial_5.ics'),
	('00000000-0000-0000-0000-000000000001', 13, 'PAY036', '2025-05-14 16:00:00+00', '/ics/career_imperial_1.ics'),
	('00000000-0000-0000-0000-000000000002', 13, 'PAY037', '2025-05-14 17:00:00+00', '/ics/career_imperial_2.ics'),
	('00000000-0000-0000-0000-000000000003', 13, 'PAY038', '2025-05-14 18:00:00+00', '/ics/career_imperial_3.ics'),
	('00000000-0000-0000-0000-000000000004', 13, 'PAY039', '2025-05-14 19:00:00+00', '/ics/career_imperial_4.ics'),
	('00000000-0000-0000-0000-000000000005', 13, 'PAY040', '2025-05-14 20:00:00+00', '/ics/career_imperial_5.ics'),
	('00000000-0000-0000-0000-000000000001', 14, 'PAY041', '2025-05-16 10:00:00+00', '/ics/expo_imperial_1.ics'),
	('00000000-0000-0000-0000-000000000002', 14, 'PAY042', '2025-05-16 11:00:00+00', '/ics/expo_imperial_2.ics'),
	('00000000-0000-0000-0000-000000000003', 14, 'PAY043', '2025-05-16 12:00:00+00', '/ics/expo_imperial_3.ics'),
	('00000000-0000-0000-0000-000000000004', 14, 'PAY044', '2025-05-16 13:00:00+00', '/ics/expo_imperial_4.ics'),
	('00000000-0000-0000-0000-000000000005', 14, 'PAY045', '2025-05-16 14:00:00+00', '/ics/expo_imperial_5.ics'),
	('00000000-0000-0000-0000-000000000001', 15, 'PAY046', '2025-05-18 09:00:00+00', '/ics/design_imperial_1.ics'),
	('00000000-0000-0000-0000-000000000002', 15, 'PAY047', '2025-05-18 10:00:00+00', '/ics/design_imperial_2.ics'),
	('00000000-0000-0000-0000-000000000003', 15, 'PAY048', '2025-05-18 11:00:00+00', '/ics/design_imperial_3.ics'),
	('00000000-0000-0000-0000-000000000004', 15, 'PAY049', '2025-05-18 12:00:00+00', '/ics/design_imperial_4.ics'),
	('00000000-0000-0000-0000-000000000005', 15, 'PAY050', '2025-05-18 13:00:00+00', '/ics/design_imperial_5.ics'),
	('00000000-0000-0000-0000-000000000001', 21, 'PAY001', '2025-06-10 16:00:00+00', '/ics/debate_oxford_1.ics'),
	('00000000-0000-0000-0000-000000000002', 21, 'PAY002', '2025-06-10 17:00:00+00', '/ics/debate_oxford_2.ics'),
	('00000000-0000-0000-0000-000000000003', 21, 'PAY003', '2025-06-10 18:00:00+00', '/ics/debate_oxford_3.ics'),
	('00000000-0000-0000-0000-000000000004', 21, 'PAY004', '2025-06-10 19:00:00+00', '/ics/debate_oxford_4.ics'),
	('00000000-0000-0000-0000-000000000005', 21, 'PAY005', '2025-06-10 20:00:00+00', '/ics/debate_oxford_5.ics'),
	('00000000-0000-0000-0000-000000000001', 22, 'PAY006', '2025-06-12 18:00:00+00', '/ics/classical_oxford_1.ics'),
	('00000000-0000-0000-0000-000000000002', 22, 'PAY007', '2025-06-12 19:00:00+00', '/ics/classical_oxford_2.ics'),
	('00000000-0000-0000-0000-000000000003', 22, 'PAY008', '2025-06-12 20:00:00+00', '/ics/classical_oxford_3.ics'),
	('00000000-0000-0000-0000-000000000004', 22, 'PAY009', '2025-06-12 21:00:00+00', '/ics/classical_oxford_4.ics'),
	('00000000-0000-0000-0000-000000000005', 22, 'PAY010', '2025-06-12 22:00:00+00', '/ics/classical_oxford_5.ics'),
	('00000000-0000-0000-0000-000000000001', 23, 'PAY011', '2025-06-14 09:00:00+00', '/ics/art_oxford_1.ics'),
	('00000000-0000-0000-0000-000000000002', 23, 'PAY012', '2025-06-14 10:00:00+00', '/ics/art_oxford_2.ics'),
	('00000000-0000-0000-0000-000000000003', 23, 'PAY013', '2025-06-14 11:00:00+00', '/ics/art_oxford_3.ics'),
	('00000000-0000-0000-0000-000000000004', 23, 'PAY014', '2025-06-14 12:00:00+00', '/ics/art_oxford_4.ics'),
	('00000000-0000-0000-0000-000000000005', 23, 'PAY015', '2025-06-14 13:00:00+00', '/ics/art_oxford_5.ics'),
	('00000000-0000-0000-0000-000000000001', 24, 'PAY016', '2025-06-16 14:00:00+00', '/ics/ai_oxford_1.ics'),
	('00000000-0000-0000-0000-000000000002', 24, 'PAY017', '2025-06-16 15:00:00+00', '/ics/ai_oxford_2.ics'),
	('00000000-0000-0000-0000-000000000003', 24, 'PAY018', '2025-06-16 16:00:00+00', '/ics/ai_oxford_3.ics'),
	('00000000-0000-0000-0000-000000000004', 24, 'PAY019', '2025-06-16 17:00:00+00', '/ics/ai_oxford_4.ics'),
	('00000000-0000-0000-0000-000000000005', 24, 'PAY020', '2025-06-16 18:00:00+00', '/ics/ai_oxford_5.ics'),
	('00000000-0000-0000-0000-000000000001', 25, 'PAY021', '2025-06-18 18:00:00+00', '/ics/theatre_oxford_1.ics'),
	('00000000-0000-0000-0000-000000000002', 25, 'PAY022', '2025-06-18 19:00:00+00', '/ics/theatre_oxford_2.ics'),
	('00000000-0000-0000-0000-000000000003', 25, 'PAY023', '2025-06-18 20:00:00+00', '/ics/theatre_oxford_3.ics'),
	('00000000-0000-0000-0000-000000000004', 25, 'PAY024', '2025-06-18 21:00:00+00', '/ics/theatre_oxford_4.ics'),
	('00000000-0000-0000-0000-000000000005', 25, 'PAY025', '2025-06-18 22:00:00+00', '/ics/theatre_oxford_5.ics'),
	('00000000-0000-0000-0000-000000000001', 26, 'PAY026', '2025-06-10 12:00:00+00', '/ics/sports_lboro_1.ics'),
	('00000000-0000-0000-0000-000000000002', 26, 'PAY027', '2025-06-10 13:00:00+00', '/ics/sports_lboro_2.ics'),
	('00000000-0000-0000-0000-000000000003', 26, 'PAY028', '2025-06-10 14:00:00+00', '/ics/sports_lboro_3.ics'),
	('00000000-0000-0000-0000-000000000004', 26, 'PAY029', '2025-06-10 15:00:00+00', '/ics/sports_lboro_4.ics'),
	('00000000-0000-0000-0000-000000000005', 26, 'PAY030', '2025-06-10 16:00:00+00', '/ics/sports_lboro_5.ics'),
	('00000000-0000-0000-0000-000000000001', 27, 'PAY031', '2025-06-11 19:00:00+00', '/ics/openmic_lboro_1.ics'),
	('00000000-0000-0000-0000-000000000002', 27, 'PAY032', '2025-06-11 20:00:00+00', '/ics/openmic_lboro_2.ics'),
	('00000000-0000-0000-0000-000000000003', 27, 'PAY033', '2025-06-11 21:00:00+00', '/ics/openmic_lboro_3.ics'),
	('00000000-0000-0000-0000-000000000004', 27, 'PAY034', '2025-06-11 22:00:00+00', '/ics/openmic_lboro_4.ics'),
	('00000000-0000-0000-0000-000000000005', 27, 'PAY035', '2025-06-11 23:00:00+00', '/ics/openmic_lboro_5.ics'),
	('00000000-0000-0000-0000-000000000001', 28, 'PAY036', '2025-06-13 09:00:00+00', '/ics/tedx_lboro_1.ics'),
	('00000000-0000-0000-0000-000000000002', 28, 'PAY037', '2025-06-13 10:00:00+00', '/ics/tedx_lboro_2.ics'),
	('00000000-0000-0000-0000-000000000003', 28, 'PAY038', '2025-06-13 11:00:00+00', '/ics/tedx_lboro_3.ics'),
	('00000000-0000-0000-0000-000000000004', 28, 'PAY039', '2025-06-13 12:00:00+00', '/ics/tedx_lboro_4.ics'),
	('00000000-0000-0000-0000-000000000005', 28, 'PAY040', '2025-06-13 13:00:00+00', '/ics/tedx_lboro_5.ics'),
	('00000000-0000-0000-0000-000000000001', 29, 'PAY041', '2025-06-15 08:00:00+00', '/ics/hackathon_lboro_1.ics'),
	('00000000-0000-0000-0000-000000000002', 29, 'PAY042', '2025-06-15 09:00:00+00', '/ics/hackathon_lboro_2.ics'),
	('00000000-0000-0000-0000-000000000003', 29, 'PAY043', '2025-06-15 10:00:00+00', '/ics/hackathon_lboro_3.ics'),
	('00000000-0000-0000-0000-000000000004', 29, 'PAY044', '2025-06-15 11:00:00+00', '/ics/hackathon_lboro_4.ics'),
	('00000000-0000-0000-0000-000000000005', 29, 'PAY045', '2025-06-15 12:00:00+00', '/ics/hackathon_lboro_5.ics'),
	('00000000-0000-0000-0000-000000000001', 30, 'PAY046', '2025-06-17 18:00:00+00', '/ics/drama_lboro_1.ics'),
	('00000000-0000-0000-0000-000000000002', 30, 'PAY047', '2025-06-17 19:00:00+00', '/ics/drama_lboro_2.ics'),
	('00000000-0000-0000-0000-000000000003', 30, 'PAY048', '2025-06-17 20:00:00+00', '/ics/drama_lboro_3.ics'),
	('00000000-0000-0000-0000-000000000004', 30, 'PAY049', '2025-06-17 21:00:00+00', '/ics/drama_lboro_4.ics'),
	('00000000-0000-0000-0000-000000000005', 30, 'PAY050', '2025-06-17 22:00:00+00', '/ics/drama_lboro_5.ics'),
	('00000000-0000-0000-0000-000000000001', 73, NULL, '2025-05-06 10:08:43.207257+00', NULL),
	('00000000-0000-0000-0000-000000000001', 83, NULL, '2025-05-06 13:31:45.825012+00', NULL),
	('00000000-0000-0000-0000-000000000008', 11, NULL, '2025-05-12 23:19:06.491976+00', NULL);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--



--
-- Data for Name: venue_authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."venue_authorities" ("user_id", "venue_id") VALUES
	('00000000-0000-0000-0000-000000000006', 1),
	('00000000-0000-0000-0000-000000000006', 2),
	('00000000-0000-0000-0000-000000000006', 3),
	('00000000-0000-0000-0000-000000000007', 4),
	('00000000-0000-0000-0000-000000000007', 5),
	('00000000-0000-0000-0000-000000000007', 6),
	('00000000-0000-0000-0000-000000000008', 7),
	('00000000-0000-0000-0000-000000000008', 8),
	('00000000-0000-0000-0000-000000000008', 9),
	('00000000-0000-0000-0000-000000000009', 10),
	('00000000-0000-0000-0000-000000000009', 11),
	('00000000-0000-0000-0000-000000000009', 12),
	('00000000-0000-0000-0000-000000000009', 13),
	('00000000-0000-0000-0000-000000000009', 14),
	('00000000-0000-0000-0000-000000000009', 15),
	('00000000-0000-0000-0000-000000000009', 16),
	('00000000-0000-0000-0000-000000000009', 17),
	('00000000-0000-0000-0000-000000000008', 18),
	('00000000-0000-0000-0000-000000000008', 19),
	('00000000-0000-0000-0000-000000000008', 20),
	('00000000-0000-0000-0000-000000000008', 21),
	('00000000-0000-0000-0000-000000000008', 22);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id") VALUES
	('assets', 'assets', NULL, '2025-05-06 09:30:33.539376+00', '2025-05-06 09:30:33.539376+00', true, false, 52428800, '{image/png,image/jpeg,image/svg+xml}', NULL);


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata", "level") VALUES
	('3f995f02-074f-4a52-9a34-73740d670ecb', 'assets', 'university-crests/exeter-crest.jpg', NULL, '2025-05-06 09:30:33.605485+00', '2025-05-06 09:30:33.605485+00', '2025-05-06 09:30:33.605485+00', '{"eTag": "\"f18a0378d71784cf1383f135ab5e1a92\"", "size": 147319, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.576Z", "contentLength": 147319, "httpStatusCode": 200}', '36cc0e33-ee57-4c22-8d3e-caf9133772e3', NULL, '{}', 2),
	('03add0ec-4fc7-4df3-9414-c7077088f807', 'assets', 'university-crests/lboro-crest.png', NULL, '2025-05-06 09:30:33.605898+00', '2025-05-06 09:30:33.605898+00', '2025-05-06 09:30:33.605898+00', '{"eTag": "\"da3d07375d8c7b18d840e17d8fa553bf\"", "size": 38901, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.586Z", "contentLength": 38901, "httpStatusCode": 200}', '0afdf814-8829-47f7-8b67-ac2ac8b0436d', NULL, '{}', 2),
	('0d4a699f-bc7d-4f1c-8837-d0a7c1b9faf7', 'assets', 'university-crests/oxford-crest.png', NULL, '2025-05-06 09:30:33.609691+00', '2025-05-06 09:30:33.609691+00', '2025-05-06 09:30:33.609691+00', '{"eTag": "\"fc1fa051ef9eb776219184d1247519bb\"", "size": 75603, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.586Z", "contentLength": 75603, "httpStatusCode": 200}', 'ceb98c65-2538-4258-88b4-2302523b5047', NULL, '{}', 2),
	('9dea395d-5635-4e47-949c-43aef60ca28f', 'assets', 'university-crests/icl-crest.png', NULL, '2025-05-06 09:30:33.613277+00', '2025-05-06 09:30:33.613277+00', '2025-05-06 09:30:33.613277+00', '{"eTag": "\"ae5affbb2a1474253642175ccb9799a7\"", "size": 52469, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.596Z", "contentLength": 52469, "httpStatusCode": 200}', 'f7e613d7-967a-4ee0-a5d2-ed1c32f68af5', NULL, '{}', 2),
	('7342c534-5be9-44a1-b0c6-1ed37d040275', 'assets', 'university-logos/exeter-logo.svg', NULL, '2025-05-06 09:30:33.622254+00', '2025-05-06 09:30:33.622254+00', '2025-05-06 09:30:33.622254+00', '{"eTag": "\"14dd1012d72710a39192e735d6ff644a\"", "size": 36746, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.596Z", "contentLength": 36746, "httpStatusCode": 200}', '3e711ff3-1c07-4b47-8d5c-8bc4b50317c6', NULL, '{}', 2),
	('12005e98-704e-4826-aee4-a848fcde6760', 'assets', 'university-logos/oxford-logo.svg', NULL, '2025-05-06 09:30:33.653602+00', '2025-05-06 09:30:33.653602+00', '2025-05-06 09:30:33.653602+00', '{"eTag": "\"34ee7044058daa4dde8bf972add97e32\"", "size": 51823, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.636Z", "contentLength": 51823, "httpStatusCode": 200}', '25cb6813-4921-4898-bc85-ec2dd74cfdd4', NULL, '{}', 2),
	('ebe3efb8-b0da-47ff-8330-e0cf44f0be00', 'assets', 'university-logos/imperial-logo.svg', NULL, '2025-05-06 09:30:33.653125+00', '2025-05-06 09:30:33.653125+00', '2025-05-06 09:30:33.653125+00', '{"eTag": "\"fb441e62e83e737464830e8c1f66088c\"", "size": 7853, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.636Z", "contentLength": 7853, "httpStatusCode": 200}', '2c79b187-c1a9-4932-ab7d-c8ad9895e854', NULL, '{}', 2),
	('3ef4f5e1-1f44-44fb-88f8-8ab5ab66edf2', 'assets', 'university-logos/lboro-logo.svg', NULL, '2025-05-06 09:30:33.65927+00', '2025-05-06 09:30:33.65927+00', '2025-05-06 09:30:33.65927+00', '{"eTag": "\"962c4ec8c32a05b3c34e5ac0cb15e586\"", "size": 34533, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-05-06T09:30:33.646Z", "contentLength": 34533, "httpStatusCode": 200}', 'c2d9d172-7d8b-4024-8882-9a8b90c9de3a', NULL, '{}', 2);


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."prefixes" ("bucket_id", "name", "created_at", "updated_at") VALUES
	('assets', 'university-crests', '2025-05-06 09:30:33.605485+00', '2025-05-06 09:30:33.605485+00'),
	('assets', 'university-logos', '2025-05-06 09:30:33.622254+00', '2025-05-06 09:30:33.622254+00');


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 74, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."categories_id_seq"', 7, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."events_id_seq"', 90, true);


--
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."universities_id_seq"', 4, true);


--
-- Name: venues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."venues_id_seq"', 22, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
