INSERT INTO public.universities
  (slug, name, logo_url, crest_url)
VALUES
  ('exeter-uni', 'University of Exeter', '/assets/university-logos/exeter-logo.svg', '/assets/university-crests/exeter-crest.jpg'),
  ('imperial', 'Imperial College London', '/assets/university-logos/imperial-logo.svg', '/assets/university-crests/icl-crest.png'),
  ('lboro-uni', 'Loughborough University', '/assets/university-logos/lboro-logo.svg', '/assets/university-crests/lboro-crest.png'),
  ('oxford-uni', 'University of Oxford', '/assets/university-logos/oxford-logo.svg', '/assets/university-crests/oxford-crest.png');

INSERT INTO
  auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    encrypted_password,
    email_confirmed_at,
    recovery_sent_at,
    last_sign_in_at,
    raw_app_meta_data,
    raw_user_meta_data,
    created_at,
    updated_at,
    confirmation_token,
    email_change,
    email_change_token_new,
    recovery_token
  )
  (
    SELECT
      '00000000-0000-0000-0000-000000000000',
      ('00000000-0000-0000-0000-00000000000' || (ROW_NUMBER() OVER ()))::uuid,
      'authenticated',
      'authenticated',
      'user' || (ROW_NUMBER() OVER ()) || '@example.com',
      crypt ('password123', gen_salt ('bf')),
      current_timestamp,
      current_timestamp,
      current_timestamp,
      '{"provider":"email","providers":["email"]}',
      JSONB_BUILD_OBJECT('university', ((ROW_NUMBER() OVER()) % 4) + 1, 'is_staff', ((ROW_NUMBER() OVER()) > 5)),
      current_timestamp,
      current_timestamp,
      '',
      '',
      '',
      ''
    FROM
      generate_series(1, 9)
  );

INSERT INTO
  auth.identities (
    id,
    user_id,
    provider_id,
    identity_data,
    provider,
    last_sign_in_at,
    created_at,
    updated_at
  )
  (
    select
      uuid_generate_v4 (),
      id,
      id,
      format('{"sub":"%s","email":"%s"}', id::text, email)::jsonb,
      'email',
      current_timestamp,
      current_timestamp,
      current_timestamp
    from
      auth.users
  );

INSERT INTO public.categories (id, name, cover_photo_url) VALUES
  (1, 'Music', 'https://images.pexels.com/photos/995301/pexels-photo-995301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  (2, 'Comedy', 'https://images.pexels.com/photos/144429/pexels-photo-144429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  (3, 'Sports and Exercise', 'https://images.pexels.com/photos/2526878/pexels-photo-2526878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  (4, 'Talks', 'https://images.pexels.com/photos/3321791/pexels-photo-3321791.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  (5, 'Tech', 'https://images.pexels.com/photos/17260648/pexels-photo-17260648/free-photo-of-robotics-event-for-children.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  (6, 'Drama and Dance', 'https://images.pexels.com/photos/2736742/pexels-photo-2736742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  (7, 'Art and Design', 'https://images.pexels.com/photos/4219152/pexels-photo-4219152.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

INSERT INTO public.venues (university_id, location, name, max_capacity) VALUES
-- University of Exeter
  (1, ST_SetSRID(ST_MakePoint(-3.5341, 50.7362), 4326), 'Alumni Auditorium', 400),
  (1, ST_SetSRID(ST_MakePoint(-3.5355, 50.7367), 4326), 'The Terrace', 300),
  (1, ST_SetSRID(ST_MakePoint(-3.5365, 50.7350), 4326), 'Devonshire House', 250),

-- Imperial College London
  (2, ST_SetSRID(ST_MakePoint(-0.1764, 51.4985), 4326), 'Royal School of Mines Lecture Theatre', 150),
  (2, ST_SetSRID(ST_MakePoint(-0.1752, 51.4989), 4326), 'Huxley Building Room 340', 100),
  (2, ST_SetSRID(ST_MakePoint(-0.1745, 51.4981), 4326), 'Beit Hall Conference Room', 120),

-- Loughborough University
  (3, ST_SetSRID(ST_MakePoint(-1.2292, 52.7670), 4326), 'Edward Herbert Building - EHB001', 180),
  (3, ST_SetSRID(ST_MakePoint(-1.2280, 52.7655), 4326), 'Pilkington Library Seminar Room', 60),
  (3, ST_SetSRID(ST_MakePoint(-1.2300, 52.7660), 4326), 'STEMLab Events Area', 200),

-- University of Oxford
  (4, ST_SetSRID(ST_MakePoint(-1.2543, 51.7540), 4326), 'Exam Schools East Room', 350),
  (4, ST_SetSRID(ST_MakePoint(-1.2560, 51.7549), 4326), 'Mathematical Institute Lecture Room L1', 250),
  (4, ST_SetSRID(ST_MakePoint(-1.2532, 51.7565), 4326), 'Keble College Hall', 180);

INSERT INTO public.venue_authorities (user_id, venue_id) VALUES
  -- University of Exeter venues
  ('00000000-0000-0000-0000-000000000006', 1),
  ('00000000-0000-0000-0000-000000000006', 2),
  ('00000000-0000-0000-0000-000000000006', 3),

  -- Imperial College venues
  ('00000000-0000-0000-0000-000000000007', 4),
  ('00000000-0000-0000-0000-000000000007', 5),
  ('00000000-0000-0000-0000-000000000007', 6),

  -- Loughborough venues
  ('00000000-0000-0000-0000-000000000008', 7),
  ('00000000-0000-0000-0000-000000000008', 8),
  ('00000000-0000-0000-0000-000000000008', 9),

  -- Oxford venues
  ('00000000-0000-0000-0000-000000000009', 10),
  ('00000000-0000-0000-0000-000000000009', 11),
  ('00000000-0000-0000-0000-000000000009', 12);

-- University of Exeter Events
INSERT INTO public.events (id, title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id)
VALUES
  (1, 'Exeter Battle of the Bands', 'Student bands compete for the crown.', '2025-06-10 18:00:00+00', '2025-06-10 21:00:00+00', 1, 500, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000006', true, true, 1),
  (2, 'Exeter Open Mic Comedy', 'A night of laughter at Lemon Grove.', '2025-06-12 19:00:00+00', '2025-06-12 22:00:00+00', 2, 300, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 2),
  (3, 'Exeter Fitness Bootcamp', 'Outdoor group workout at Streatham.', '2025-06-15 07:00:00+00', '2025-06-15 08:30:00+00', 3, 0, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000006', true, false, 3),
  (4, 'Exeter AI Talk', 'Panel with AI researchers.', '2025-06-20 17:00:00+00', '2025-06-20 19:00:00+00', 2, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000006', true, true, 5),
  (5, 'Exeter Art Showcase', 'Fine arts and digital works display.', '2025-06-21 13:00:00+00', '2025-06-21 17:00:00+00', 1, 200, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000006', true, true, 7),
  (6, 'Exeter Jazz Night', 'Live jazz in the Great Hall.', '2025-06-22 20:00:00+00', '2025-06-22 23:00:00+00', 1, 400, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 1),
  (7, 'Exeter Tech Workshop', 'Intro to web development.', '2025-06-23 15:00:00+00', '2025-06-23 18:00:00+00', 3, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000006', true, true, 5),
  (8, 'Exeter Drama Rehearsal', 'Open rehearsal session.', '2025-06-24 16:00:00+00', '2025-06-24 18:00:00+00', 1, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000006', true, false, 6),
  (9, 'Exeter Science Talks', 'Student-led presentations.', '2025-06-25 10:00:00+00', '2025-06-25 12:00:00+00', 3, 0, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 4),
  (10, 'Exeter Design Sprint', 'Creative collaboration challenge.', '2025-06-26 09:00:00+00', '2025-06-26 17:00:00+00', 2, 100, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000006', true, true, 7);

-- Imperial College London Events
INSERT INTO public.events (id, title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id)
VALUES
  (11, 'Imperial Coding Jam', 'Speed coding challenge for teams.', '2025-07-01 14:00:00+00', '2025-07-01 18:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000007', true, true, 5),
  (12, 'Imperial Music Showcase', 'Instrumental and vocal talent.', '2025-07-02 19:00:00+00', '2025-07-02 22:00:00+00', 5, 500, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', true, true, 1),
  (13, 'Imperial Laugh Lounge', 'Student comedy performances.', '2025-07-03 18:00:00+00', '2025-07-03 21:00:00+00', 5, 200, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000007', true, true, 2),
  (14, 'Imperial Gym Bash', 'Fitness and wellness event.', '2025-07-04 09:00:00+00', '2025-07-04 11:00:00+00', 7, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000007', true, false, 3),
  (15, 'Imperial Future Tech Talk', 'Emerging technologies and careers.', '2025-07-05 15:00:00+00', '2025-07-05 17:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000007', true, true, 5),
  (16, 'Imperial Drama Night', 'A night of short plays.', '2025-07-06 20:00:00+00', '2025-07-06 22:00:00+00', 5, 300, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000007', true, true, 6),
  (17, 'Imperial Creative Fest', 'Student creative fair.', '2025-07-07 11:00:00+00', '2025-07-07 15:00:00+00', 5, 100, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', true, true, 7),
  (18, 'Imperial Engineering Panel', 'Engineering leaders Q&A.', '2025-07-08 14:00:00+00', '2025-07-08 16:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000007', true, true, 4),
  (19, 'Imperial Startups Meetup', 'Founders present their projects.', '2025-07-09 10:00:00+00', '2025-07-09 12:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000007', true, true, 5),
  (20, 'Imperial Late Night Beats', 'Campus DJ night.', '2025-07-10 21:00:00+00', '2025-07-11 01:00:00+00', 5, 700, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000007', true, true, 1);

-- Existing inserts for universities, categories, and users omitted for brevity

-- Oxford Venues
INSERT INTO public.venues (university_id, location, name, max_capacity) VALUES
(4, ST_SetSRID(ST_MakePoint(-1.2540, 51.7548), 4326), 'Sheldonian Theatre', 800),
(4, ST_SetSRID(ST_MakePoint(-1.2560, 51.7590), 4326), 'Oxford Union', 500),
(4, ST_SetSRID(ST_MakePoint(-1.2625, 51.7542), 4326), 'Exam Schools', 600),
(4, ST_SetSRID(ST_MakePoint(-1.2553, 51.7520), 4326), 'Keble College Hall', 300),
(4, ST_SetSRID(ST_MakePoint(-1.2600, 51.7540), 4326), 'Oxford Playhouse', 400);

-- Loughborough Venues
INSERT INTO public.venues (university_id, location, name, max_capacity) VALUES
(3, ST_SetSRID(ST_MakePoint(-1.2287, 52.7654), 4326), 'Sir David Wallace Sports Hall', 1000),
(3, ST_SetSRID(ST_MakePoint(-1.2302, 52.7672), 4326), 'Cope Auditorium', 400),
(3, ST_SetSRID(ST_MakePoint(-1.2290, 52.7660), 4326), 'Edward Herbert Building', 350),
(3, ST_SetSRID(ST_MakePoint(-1.2255, 52.7680), 4326), 'Loughborough Students'' Union', 1200),
(3, ST_SetSRID(ST_MakePoint(-1.2278, 52.7651), 4326), 'James France Building', 250);

-- Oxford Venue Authorities
INSERT INTO public.venue_authorities (user_id, venue_id) VALUES
('00000000-0000-0000-0000-000000000009', 13),
('00000000-0000-0000-0000-000000000009', 14),
('00000000-0000-0000-0000-000000000009', 15),
('00000000-0000-0000-0000-000000000009', 16),
('00000000-0000-0000-0000-000000000009', 17);

-- Loughborough Venue Authorities
INSERT INTO public.venue_authorities (user_id, venue_id) VALUES
('00000000-0000-0000-0000-000000000008', 18),
('00000000-0000-0000-0000-000000000008', 19),
('00000000-0000-0000-0000-000000000008', 20),
('00000000-0000-0000-0000-000000000008', 21),
('00000000-0000-0000-0000-000000000008', 22);

-- Oxford Events
INSERT INTO public.events (id, title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id) VALUES
(21, 'Debate Night at the Union', 'A lively debate featuring leading thinkers.', '2025-06-10T18:00:00Z', '2025-06-10T20:00:00Z', 10, 500, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, true, 4),
(22, 'Classical Concert', 'Enjoy a night of classical music at the Sheldonian.', '2025-06-12T19:00:00Z', '2025-06-12T21:30:00Z', 13, 850, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 1),
(23, 'Art Exhibition', 'Student art showcase at the Exam Schools.', '2025-06-14T10:00:00Z', '2025-06-14T16:00:00Z', 14, 0, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, false, 7),
(24, 'Tech Talk: AI in Medicine', 'Exploring the future of AI in healthcare.', '2025-06-16T15:00:00Z', '2025-06-16T17:00:00Z', 15, 250, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 5),
(25, 'Student Theatre Showcase', 'Performances by Oxford Drama Society.', '2025-06-18T19:30:00Z', '2025-06-18T21:00:00Z', 16, 300, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 6),
(31, 'Oxford Stand-Up Night', 'An evening of student comedy at Keble College Hall.', '2025-06-20T19:00:00Z', '2025-06-20T21:00:00Z', 15, 200, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 2),
(32, 'Oxford Tech Expo', 'Tech society expo showcasing new projects.', '2025-06-22T12:00:00Z', '2025-06-22T17:00:00Z', 13, 0, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 5),
(33, 'Design Fair', 'Design students show off their final projects.', '2025-06-23T10:00:00Z', '2025-06-23T15:00:00Z', 17, 0, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 7),
(34, 'Public Lecture on Ethics', 'Guest speaker from the philosophy faculty.', '2025-06-24T17:00:00Z', '2025-06-24T18:30:00Z', 11, 0, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 4),
(35, 'Oxford Freshers'' Showcase', 'Music, drama, and more from first-years.', '2025-06-26T18:00:00Z', '2025-06-26T21:00:00Z', 16, 350, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 1);

-- Loughborough Events
INSERT INTO public.events (id, title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id) VALUES
(26, 'Varsity Sports Finals', 'Watch the best of university sports.', '2025-06-10T13:00:00Z', '2025-06-10T18:00:00Z', 17, 600, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000008', true, true, 3),
(27, 'Student Open Mic Night', 'Showcase your talent at the SU.', '2025-06-11T20:00:00Z', '2025-06-11T22:30:00Z', 8, 300, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000008', true, true, 2),
(28, 'TEDx Talks', 'Ideas worth spreading by Lboro students.', '2025-06-13T10:00:00Z', '2025-06-13T13:00:00Z', 19, 500, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000008', true, false, 4),
(29, 'Hackathon', '24h coding challenge in the EH building.', '2025-06-15T09:00:00Z', '2025-06-16T09:00:00Z', 18, 0, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000008', true, true, 5),
(30, 'Drama Night', 'An evening of student theatre.', '2025-06-17T19:00:00Z', '2025-06-17T21:30:00Z', 20, 200, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000008', true, true, 6),
(36, 'Lboro Laughs', 'Comedy society''s term-end standup show.', '2025-06-19T19:00:00Z', '2025-06-19T21:00:00Z', 19, 250, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000008', true, true, 2),
(37, 'Sports Science Panel', 'Talks from elite athletes and coaches.', '2025-06-20T14:00:00Z', '2025-06-20T16:00:00Z', 7, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000008', true, true, 4),
(38, 'Tech Demo Day', 'Final year projects from computing students.', '2025-06-22T10:00:00Z', '2025-06-22T14:00:00Z', 18, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000008', true, false, 5),
(39, 'Art & Design Market', 'Stalls from students selling prints, posters and more.', '2025-06-24T11:00:00Z', '2025-06-24T15:00:00Z', 22, 100, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000008', true, true, 7),
(40, 'Film Screening Night', 'End of year film society selection.', '2025-06-25T19:00:00Z', '2025-06-25T21:30:00Z', 9, 200, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000008', true, true, 6);

-- Exeter Bookings (Event IDs 1-10)
INSERT INTO public.bookings (user_id, event_id, payment_ref, date_booked, ics_url) VALUES
('00000000-0000-0000-0000-000000000001', 1, 'PAY001', '2025-05-10T10:00:00Z', '/ics/quiz_exeter_1.ics'),
('00000000-0000-0000-0000-000000000002', 1, 'PAY002', '2025-05-10T11:00:00Z', '/ics/quiz_exeter_2.ics'),
('00000000-0000-0000-0000-000000000003', 1, 'PAY003', '2025-05-10T12:00:00Z', '/ics/quiz_exeter_3.ics'),
('00000000-0000-0000-0000-000000000004', 1, 'PAY004', '2025-05-10T13:00:00Z', '/ics/quiz_exeter_4.ics'),
('00000000-0000-0000-0000-000000000005', 1, 'PAY005', '2025-05-10T14:00:00Z', '/ics/quiz_exeter_5.ics'),

('00000000-0000-0000-0000-000000000001', 2, 'PAY006', '2025-05-12T17:00:00Z', '/ics/jazz_exeter_1.ics'),
('00000000-0000-0000-0000-000000000002', 2, 'PAY007', '2025-05-12T18:00:00Z', '/ics/jazz_exeter_2.ics'),
('00000000-0000-0000-0000-000000000003', 2, 'PAY008', '2025-05-12T19:00:00Z', '/ics/jazz_exeter_3.ics'),
('00000000-0000-0000-0000-000000000004', 2, 'PAY009', '2025-05-12T20:00:00Z', '/ics/jazz_exeter_4.ics'),
('00000000-0000-0000-0000-000000000005', 2, 'PAY010', '2025-05-12T21:00:00Z', '/ics/jazz_exeter_5.ics'),

('00000000-0000-0000-0000-000000000001', 3, 'PAY011', '2025-05-14T14:00:00Z', '/ics/science_exeter_1.ics'),
('00000000-0000-0000-0000-000000000002', 3, 'PAY012', '2025-05-14T15:00:00Z', '/ics/science_exeter_2.ics'),
('00000000-0000-0000-0000-000000000003', 3, 'PAY013', '2025-05-14T16:00:00Z', '/ics/science_exeter_3.ics'),
('00000000-0000-0000-0000-000000000004', 3, 'PAY014', '2025-05-14T17:00:00Z', '/ics/science_exeter_4.ics'),
('00000000-0000-0000-0000-000000000005', 3, 'PAY015', '2025-05-14T18:00:00Z', '/ics/science_exeter_5.ics'),

('00000000-0000-0000-0000-000000000001', 4, 'PAY016', '2025-05-16T11:00:00Z', '/ics/workshop_exeter_1.ics'),
('00000000-0000-0000-0000-000000000002', 4, 'PAY017', '2025-05-16T12:00:00Z', '/ics/workshop_exeter_2.ics'),
('00000000-0000-0000-0000-000000000003', 4, 'PAY018', '2025-05-16T13:00:00Z', '/ics/workshop_exeter_3.ics'),
('00000000-0000-0000-0000-000000000004', 4, 'PAY019', '2025-05-16T14:00:00Z', '/ics/workshop_exeter_4.ics'),
('00000000-0000-0000-0000-000000000005', 4, 'PAY020', '2025-05-16T15:00:00Z', '/ics/workshop_exeter_5.ics'),

('00000000-0000-0000-0000-000000000001', 5, 'PAY021', '2025-05-18T09:00:00Z', '/ics/poetry_exeter_1.ics'),
('00000000-0000-0000-0000-000000000002', 5, 'PAY022', '2025-05-18T10:00:00Z', '/ics/poetry_exeter_2.ics'),
('00000000-0000-0000-0000-000000000003', 5, 'PAY023', '2025-05-18T11:00:00Z', '/ics/poetry_exeter_3.ics'),
('00000000-0000-0000-0000-000000000004', 5, 'PAY024', '2025-05-18T12:00:00Z', '/ics/poetry_exeter_4.ics'),
('00000000-0000-0000-0000-000000000005', 5, 'PAY025', '2025-05-18T13:00:00Z', '/ics/poetry_exeter_5.ics');

-- Imperial Bookings (Event IDs 11-20)
INSERT INTO public.bookings (user_id, event_id, payment_ref, date_booked, ics_url) VALUES
('00000000-0000-0000-0000-000000000001', 11, 'PAY026', '2025-05-10T12:00:00Z', '/ics/tech_imperial_1.ics'),
('00000000-0000-0000-0000-000000000002', 11, 'PAY027', '2025-05-10T13:00:00Z', '/ics/tech_imperial_2.ics'),
('00000000-0000-0000-0000-000000000003', 11, 'PAY028', '2025-05-10T14:00:00Z', '/ics/tech_imperial_3.ics'),
('00000000-0000-0000-0000-000000000004', 11, 'PAY029', '2025-05-10T15:00:00Z', '/ics/tech_imperial_4.ics'),
('00000000-0000-0000-0000-000000000005', 11, 'PAY030', '2025-05-10T16:00:00Z', '/ics/tech_imperial_5.ics'),

('00000000-0000-0000-0000-000000000001', 12, 'PAY031', '2025-05-12T18:00:00Z', '/ics/music_imperial_1.ics'),
('00000000-0000-0000-0000-000000000002', 12, 'PAY032', '2025-05-12T19:00:00Z', '/ics/music_imperial_2.ics'),
('00000000-0000-0000-0000-000000000003', 12, 'PAY033', '2025-05-12T20:00:00Z', '/ics/music_imperial_3.ics'),
('00000000-0000-0000-0000-000000000004', 12, 'PAY034', '2025-05-12T21:00:00Z', '/ics/music_imperial_4.ics'),
('00000000-0000-0000-0000-000000000005', 12, 'PAY035', '2025-05-12T22:00:00Z', '/ics/music_imperial_5.ics'),

('00000000-0000-0000-0000-000000000001', 13, 'PAY036', '2025-05-14T16:00:00Z', '/ics/career_imperial_1.ics'),
('00000000-0000-0000-0000-000000000002', 13, 'PAY037', '2025-05-14T17:00:00Z', '/ics/career_imperial_2.ics'),
('00000000-0000-0000-0000-000000000003', 13, 'PAY038', '2025-05-14T18:00:00Z', '/ics/career_imperial_3.ics'),
('00000000-0000-0000-0000-000000000004', 13, 'PAY039', '2025-05-14T19:00:00Z', '/ics/career_imperial_4.ics'),
('00000000-0000-0000-0000-000000000005', 13, 'PAY040', '2025-05-14T20:00:00Z', '/ics/career_imperial_5.ics'),

('00000000-0000-0000-0000-000000000001', 14, 'PAY041', '2025-05-16T10:00:00Z', '/ics/expo_imperial_1.ics'),
('00000000-0000-0000-0000-000000000002', 14, 'PAY042', '2025-05-16T11:00:00Z', '/ics/expo_imperial_2.ics'),
('00000000-0000-0000-0000-000000000003', 14, 'PAY043', '2025-05-16T12:00:00Z', '/ics/expo_imperial_3.ics'),
('00000000-0000-0000-0000-000000000004', 14, 'PAY044', '2025-05-16T13:00:00Z', '/ics/expo_imperial_4.ics'),
('00000000-0000-0000-0000-000000000005', 14, 'PAY045', '2025-05-16T14:00:00Z', '/ics/expo_imperial_5.ics'),

('00000000-0000-0000-0000-000000000001', 15, 'PAY046', '2025-05-18T09:00:00Z', '/ics/design_imperial_1.ics'),
('00000000-0000-0000-0000-000000000002', 15, 'PAY047', '2025-05-18T10:00:00Z', '/ics/design_imperial_2.ics'),
('00000000-0000-0000-0000-000000000003', 15, 'PAY048', '2025-05-18T11:00:00Z', '/ics/design_imperial_3.ics'),
('00000000-0000-0000-0000-000000000004', 15, 'PAY049', '2025-05-18T12:00:00Z', '/ics/design_imperial_4.ics'),
('00000000-0000-0000-0000-000000000005', 15, 'PAY050', '2025-05-18T13:00:00Z', '/ics/design_imperial_5.ics');


-- Oxford Bookings
INSERT INTO public.bookings (user_id, event_id, payment_ref, date_booked, ics_url) VALUES
('00000000-0000-0000-0000-000000000001', 21, 'PAY001', '2025-06-10T16:00:00Z', '/ics/debate_oxford_1.ics'),
('00000000-0000-0000-0000-000000000002', 21, 'PAY002', '2025-06-10T17:00:00Z', '/ics/debate_oxford_2.ics'),
('00000000-0000-0000-0000-000000000003', 21, 'PAY003', '2025-06-10T18:00:00Z', '/ics/debate_oxford_3.ics'),
('00000000-0000-0000-0000-000000000004', 21, 'PAY004', '2025-06-10T19:00:00Z', '/ics/debate_oxford_4.ics'),
('00000000-0000-0000-0000-000000000005', 21, 'PAY005', '2025-06-10T20:00:00Z', '/ics/debate_oxford_5.ics'),

('00000000-0000-0000-0000-000000000001', 22, 'PAY006', '2025-06-12T18:00:00Z', '/ics/classical_oxford_1.ics'),
('00000000-0000-0000-0000-000000000002', 22, 'PAY007', '2025-06-12T19:00:00Z', '/ics/classical_oxford_2.ics'),
('00000000-0000-0000-0000-000000000003', 22, 'PAY008', '2025-06-12T20:00:00Z', '/ics/classical_oxford_3.ics'),
('00000000-0000-0000-0000-000000000004', 22, 'PAY009', '2025-06-12T21:00:00Z', '/ics/classical_oxford_4.ics'),
('00000000-0000-0000-0000-000000000005', 22, 'PAY010', '2025-06-12T22:00:00Z', '/ics/classical_oxford_5.ics'),

('00000000-0000-0000-0000-000000000001', 23, 'PAY011', '2025-06-14T09:00:00Z', '/ics/art_oxford_1.ics'),
('00000000-0000-0000-0000-000000000002', 23, 'PAY012', '2025-06-14T10:00:00Z', '/ics/art_oxford_2.ics'),
('00000000-0000-0000-0000-000000000003', 23, 'PAY013', '2025-06-14T11:00:00Z', '/ics/art_oxford_3.ics'),
('00000000-0000-0000-0000-000000000004', 23, 'PAY014', '2025-06-14T12:00:00Z', '/ics/art_oxford_4.ics'),
('00000000-0000-0000-0000-000000000005', 23, 'PAY015', '2025-06-14T13:00:00Z', '/ics/art_oxford_5.ics'),

('00000000-0000-0000-0000-000000000001', 24, 'PAY016', '2025-06-16T14:00:00Z', '/ics/ai_oxford_1.ics'),
('00000000-0000-0000-0000-000000000002', 24, 'PAY017', '2025-06-16T15:00:00Z', '/ics/ai_oxford_2.ics'),
('00000000-0000-0000-0000-000000000003', 24, 'PAY018', '2025-06-16T16:00:00Z', '/ics/ai_oxford_3.ics'),
('00000000-0000-0000-0000-000000000004', 24, 'PAY019', '2025-06-16T17:00:00Z', '/ics/ai_oxford_4.ics'),
('00000000-0000-0000-0000-000000000005', 24, 'PAY020', '2025-06-16T18:00:00Z', '/ics/ai_oxford_5.ics'),

('00000000-0000-0000-0000-000000000001', 25, 'PAY021', '2025-06-18T18:00:00Z', '/ics/theatre_oxford_1.ics'),
('00000000-0000-0000-0000-000000000002', 25, 'PAY022', '2025-06-18T19:00:00Z', '/ics/theatre_oxford_2.ics'),
('00000000-0000-0000-0000-000000000003', 25, 'PAY023', '2025-06-18T20:00:00Z', '/ics/theatre_oxford_3.ics'),
('00000000-0000-0000-0000-000000000004', 25, 'PAY024', '2025-06-18T21:00:00Z', '/ics/theatre_oxford_4.ics'),
('00000000-0000-0000-0000-000000000005', 25, 'PAY025', '2025-06-18T22:00:00Z', '/ics/theatre_oxford_5.ics');

-- Loughborough Bookings
INSERT INTO public.bookings (user_id, event_id, payment_ref, date_booked, ics_url) VALUES
('00000000-0000-0000-0000-000000000001', 26, 'PAY026', '2025-06-10T12:00:00Z', '/ics/sports_lboro_1.ics'),
('00000000-0000-0000-0000-000000000002', 26, 'PAY027', '2025-06-10T13:00:00Z', '/ics/sports_lboro_2.ics'),
('00000000-0000-0000-0000-000000000003', 26, 'PAY028', '2025-06-10T14:00:00Z', '/ics/sports_lboro_3.ics'),
('00000000-0000-0000-0000-000000000004', 26, 'PAY029', '2025-06-10T15:00:00Z', '/ics/sports_lboro_4.ics'),
('00000000-0000-0000-0000-000000000005', 26, 'PAY030', '2025-06-10T16:00:00Z', '/ics/sports_lboro_5.ics'),

('00000000-0000-0000-0000-000000000001', 27, 'PAY031', '2025-06-11T19:00:00Z', '/ics/openmic_lboro_1.ics'),
('00000000-0000-0000-0000-000000000002', 27, 'PAY032', '2025-06-11T20:00:00Z', '/ics/openmic_lboro_2.ics'),
('00000000-0000-0000-0000-000000000003', 27, 'PAY033', '2025-06-11T21:00:00Z', '/ics/openmic_lboro_3.ics'),
('00000000-0000-0000-0000-000000000004', 27, 'PAY034', '2025-06-11T22:00:00Z', '/ics/openmic_lboro_4.ics'),
('00000000-0000-0000-0000-000000000005', 27, 'PAY035', '2025-06-11T23:00:00Z', '/ics/openmic_lboro_5.ics'),

('00000000-0000-0000-0000-000000000001', 28, 'PAY036', '2025-06-13T09:00:00Z', '/ics/tedx_lboro_1.ics'),
('00000000-0000-0000-0000-000000000002', 28, 'PAY037', '2025-06-13T10:00:00Z', '/ics/tedx_lboro_2.ics'),
('00000000-0000-0000-0000-000000000003', 28, 'PAY038', '2025-06-13T11:00:00Z', '/ics/tedx_lboro_3.ics'),
('00000000-0000-0000-0000-000000000004', 28, 'PAY039', '2025-06-13T12:00:00Z', '/ics/tedx_lboro_4.ics'),
('00000000-0000-0000-0000-000000000005', 28, 'PAY040', '2025-06-13T13:00:00Z', '/ics/tedx_lboro_5.ics'),

('00000000-0000-0000-0000-000000000001', 29, 'PAY041', '2025-06-15T08:00:00Z', '/ics/hackathon_lboro_1.ics'),
('00000000-0000-0000-0000-000000000002', 29, 'PAY042', '2025-06-15T09:00:00Z', '/ics/hackathon_lboro_2.ics'),
('00000000-0000-0000-0000-000000000003', 29, 'PAY043', '2025-06-15T10:00:00Z', '/ics/hackathon_lboro_3.ics'),
('00000000-0000-0000-0000-000000000004', 29, 'PAY044', '2025-06-15T11:00:00Z', '/ics/hackathon_lboro_4.ics'),
('00000000-0000-0000-0000-000000000005', 29, 'PAY045', '2025-06-15T12:00:00Z', '/ics/hackathon_lboro_5.ics'),

('00000000-0000-0000-0000-000000000001', 30, 'PAY046', '2025-06-17T18:00:00Z', '/ics/drama_lboro_1.ics'),
('00000000-0000-0000-0000-000000000002', 30, 'PAY047', '2025-06-17T19:00:00Z', '/ics/drama_lboro_2.ics'),
('00000000-0000-0000-0000-000000000003', 30, 'PAY048', '2025-06-17T20:00:00Z', '/ics/drama_lboro_3.ics'),
('00000000-0000-0000-0000-000000000004', 30, 'PAY049', '2025-06-17T21:00:00Z', '/ics/drama_lboro_4.ics'),
('00000000-0000-0000-0000-000000000005', 30, 'PAY050', '2025-06-17T22:00:00Z', '/ics/drama_lboro_5.ics');
