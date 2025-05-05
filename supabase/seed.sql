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

INSERT INTO public.categories (name, cover_photo_url) VALUES
  ('Music', 'https://images.pexels.com/photos/995301/pexels-photo-995301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ('Comedy', 'https://images.pexels.com/photos/144429/pexels-photo-144429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ('Sports and Exercise', 'https://images.pexels.com/photos/2526878/pexels-photo-2526878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ('Talks', 'https://images.pexels.com/photos/3321791/pexels-photo-3321791.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ('Tech', 'https://images.pexels.com/photos/17260648/pexels-photo-17260648/free-photo-of-robotics-event-for-children.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ('Drama and Dance', 'https://images.pexels.com/photos/2736742/pexels-photo-2736742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ('Art and Design', 'https://images.pexels.com/photos/4219152/pexels-photo-4219152.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

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
INSERT INTO public.events (title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id)
VALUES
  ('Exeter Battle of the Bands', 'Student bands compete for the crown.', '2025-06-10 18:00:00+00', '2025-06-10 21:00:00+00', 1, 500, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000006', true, true, 1),
  ('Exeter Open Mic Comedy', 'A night of laughter at Lemon Grove.', '2025-06-12 19:00:00+00', '2025-06-12 22:00:00+00', 2, 300, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 2),
  ('Exeter Fitness Bootcamp', 'Outdoor group workout at Streatham.', '2025-06-15 07:00:00+00', '2025-06-15 08:30:00+00', 3, 0, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000006', true, false, 3),
  ('Exeter AI Talk', 'Panel with AI researchers.', '2025-06-20 17:00:00+00', '2025-06-20 19:00:00+00', 2, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000006', true, true, 5),
  ('Exeter Art Showcase', 'Fine arts and digital works display.', '2025-06-21 13:00:00+00', '2025-06-21 17:00:00+00', 1, 200, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000006', true, true, 7),
  ('Exeter Jazz Night', 'Live jazz in the Great Hall.', '2025-06-22 20:00:00+00', '2025-06-22 23:00:00+00', 1, 400, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 1),
  ('Exeter Tech Workshop', 'Intro to web development.', '2025-06-23 15:00:00+00', '2025-06-23 18:00:00+00', 3, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000006', true, true, 5),
  ('Exeter Drama Rehearsal', 'Open rehearsal session.', '2025-06-24 16:00:00+00', '2025-06-24 18:00:00+00', 1, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000006', true, false, 6),
  ('Exeter Science Talks', 'Student-led presentations.', '2025-06-25 10:00:00+00', '2025-06-25 12:00:00+00', 3, 0, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000006', true, true, 4),
  ('Exeter Design Sprint', 'Creative collaboration challenge.', '2025-06-26 09:00:00+00', '2025-06-26 17:00:00+00', 2, 100, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000006', true, true, 7);

-- Imperial College London Events
INSERT INTO public.events (title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id)
VALUES
  ('Imperial Coding Jam', 'Speed coding challenge for teams.', '2025-07-01 14:00:00+00', '2025-07-01 18:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000007', true, true, 5),
  ('Imperial Music Showcase', 'Instrumental and vocal talent.', '2025-07-02 19:00:00+00', '2025-07-02 22:00:00+00', 5, 500, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', true, true, 1),
  ('Imperial Laugh Lounge', 'Student comedy performances.', '2025-07-03 18:00:00+00', '2025-07-03 21:00:00+00', 5, 200, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000007', true, true, 2),
  ('Imperial Gym Bash', 'Fitness and wellness event.', '2025-07-04 09:00:00+00', '2025-07-04 11:00:00+00', 7, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000007', true, false, 3),
  ('Imperial Future Tech Talk', 'Emerging technologies and careers.', '2025-07-05 15:00:00+00', '2025-07-05 17:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000007', true, true, 5),
  ('Imperial Drama Night', 'A night of short plays.', '2025-07-06 20:00:00+00', '2025-07-06 22:00:00+00', 5, 300, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000007', true, true, 6),
  ('Imperial Creative Fest', 'Student creative fair.', '2025-07-07 11:00:00+00', '2025-07-07 15:00:00+00', 5, 100, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', true, true, 7),
  ('Imperial Engineering Panel', 'Engineering leaders Q&A.', '2025-07-08 14:00:00+00', '2025-07-08 16:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000007', true, true, 4),
  ('Imperial Startups Meetup', 'Founders present their projects.', '2025-07-09 10:00:00+00', '2025-07-09 12:00:00+00', 6, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000007', true, true, 5),
  ('Imperial Late Night Beats', 'Campus DJ night.', '2025-07-10 21:00:00+00', '2025-07-11 01:00:00+00', 5, 700, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000007', true, true, 1);

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
INSERT INTO public.events (title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id) VALUES
('Debate Night at the Union', 'A lively debate featuring leading thinkers.', '2025-06-10T18:00:00Z', '2025-06-10T20:00:00Z', 10, 500, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, true, 4),
('Classical Concert', 'Enjoy a night of classical music at the Sheldonian.', '2025-06-12T19:00:00Z', '2025-06-12T21:30:00Z', 13, 850, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 1),
('Art Exhibition', 'Student art showcase at the Exam Schools.', '2025-06-14T10:00:00Z', '2025-06-14T16:00:00Z', 14, 0, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, false, 7),
('Tech Talk: AI in Medicine', 'Exploring the future of AI in healthcare.', '2025-06-16T15:00:00Z', '2025-06-16T17:00:00Z', 15, 250, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 5),
('Student Theatre Showcase', 'Performances by Oxford Drama Society.', '2025-06-18T19:30:00Z', '2025-06-18T21:00:00Z', 16, 300, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 6),
('Oxford Stand-Up Night', 'An evening of student comedy at Keble College Hall.', '2025-06-20T19:00:00Z', '2025-06-20T21:00:00Z', 15, 200, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', true, true, 2),
('Oxford Tech Expo', 'Tech society expo showcasing new projects.', '2025-06-22T12:00:00Z', '2025-06-22T17:00:00Z', 13, 0, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', true, true, 5),
('Design Fair', 'Design students show off their final projects.', '2025-06-23T10:00:00Z', '2025-06-23T15:00:00Z', 17, 0, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', true, false, 7),
('Public Lecture on Ethics', 'Guest speaker from the philosophy faculty.', '2025-06-24T17:00:00Z', '2025-06-24T18:30:00Z', 11, 0, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', true, true, 4),
('Oxford Freshers'' Showcase', 'Music, drama, and more from first-years.', '2025-06-26T18:00:00Z', '2025-06-26T21:00:00Z', 16, 350, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', true, true, 1);

-- Loughborough Events
INSERT INTO public.events (title, description, start_time, end_time, venue_id, ticket_price, host, creator, is_listed, is_public, category_id) VALUES
('Varsity Sports Finals', 'Watch the best of university sports.', '2025-06-10T13:00:00Z', '2025-06-10T18:00:00Z', 17, 600, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000008', true, true, 3),
('Student Open Mic Night', 'Showcase your talent at the SU.', '2025-06-11T20:00:00Z', '2025-06-11T22:30:00Z', 8, 300, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000008', true, true, 2),
('TEDx Talks', 'Ideas worth spreading by Lboro students.', '2025-06-13T10:00:00Z', '2025-06-13T13:00:00Z', 19, 500, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000008', true, false, 4),
('Hackathon', '24h coding challenge in the EH building.', '2025-06-15T09:00:00Z', '2025-06-16T09:00:00Z', 18, 0, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000008', true, true, 5),
('Drama Night', 'An evening of student theatre.', '2025-06-17T19:00:00Z', '2025-06-17T21:30:00Z', 20, 200, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000008', true, true, 6),
('Lboro Laughs', 'Comedy society''s term-end standup show.', '2025-06-19T19:00:00Z', '2025-06-19T21:00:00Z', 19, 250, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000008', true, true, 2),
('Sports Science Panel', 'Talks from elite athletes and coaches.', '2025-06-20T14:00:00Z', '2025-06-20T16:00:00Z', 7, 0, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000008', true, true, 4),
('Tech Demo Day', 'Final year projects from computing students.', '2025-06-22T10:00:00Z', '2025-06-22T14:00:00Z', 18, 0, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000008', true, false, 5),
('Art & Design Market', 'Stalls from students selling prints, posters and more.', '2025-06-24T11:00:00Z', '2025-06-24T15:00:00Z', 22, 100, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000008', true, true, 7),
('Film Screening Night', 'End of year film society selection.', '2025-06-25T19:00:00Z', '2025-06-25T21:30:00Z', 9, 200, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000008', true, true, 6);

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

INSERT INTO events (title, description, start_time, end_time, venue_id, ticket_price, cover_photo_url, host, creator, is_listed, is_public, category_id) VALUES

(
    'Public Talk: Quantum Computing Horizons',
    'Join Professor Davies for an insightful talk on the future potential and current challenges of quantum computing. Suitable for a general academic audience.',
    '2025-05-15 18:00:00+01:00', -- BST
    '2025-05-15 19:30:00+01:00',
    11, 0, 'https://picsum.photos/seed/quantum_ox/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 5
),
(
    'St John''s College Chapel Choir Evensong',
    'Join the renowned St John''s College Choir for a service of Choral Evensong, featuring works by Tallis and Byrd. Open to all.',
    '2025-05-22 17:30:00+01:00', -- BST
    '2025-05-22 18:30:00+01:00',
    10, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'Oxford Union Debate: AI Regulation',
    'A formal debate addressing the motion "This House believes urgent global regulation of AI is paramount". Featuring student speakers and guest experts. Union members only.',
    '2025-05-29 20:00:00+01:00', -- BST
    '2025-05-29 22:00:00+01:00',
    14, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 4
),
(
    'Tech Talk: Introduction to Machine Learning',
    'An introductory session covering the fundamentals of machine learning algorithms and their applications. Aimed at students from all disciplines.',
    '2025-06-05 14:00:00+01:00', -- BST
    '2025-06-05 15:30:00+01:00',
    11, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 5
),
(
    'Lunchtime Organ Recital',
    'Enjoy a selection of classical pieces performed on the historic Sheldonian Theatre organ by university organ scholar, Kenji Tanaka.',
    '2025-06-12 13:10:00+01:00', -- BST
    '2025-06-12 13:50:00+01:00',
    13, 800, 'https://picsum.photos/seed/organ_recital_alt/1000/300', '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'OUDS Presents: Rosencrantz and Guildenstern Are Dead',
    'The Oxford University Dramatic Society stages Tom Stoppard''s witty exploration of fate and free will at the Oxford Playhouse.',
    '2025-06-18 19:30:00+01:00', -- BST
    '2025-06-18 22:15:00+01:00',
    17, 1650, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 6
),
(
    'Ruskin School Final Year Show: Private View',
    'An exclusive first look at the degree show from graduating students of the Ruskin School of Art. Drinks reception included.',
    '2025-06-23 18:00:00+01:00', -- BST
    '2025-06-23 20:30:00+01:00',
    15, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 7
),
(
    'Inter-Collegiate Rowing Regatta Finals',
    'Watch the culmination of the college rowing season. Finals races held throughout the afternoon. Spectators welcome along the towpath.',
    '2025-06-28 13:00:00+01:00', -- BST
    '2025-06-28 17:00:00+01:00',
    15, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 3
),
(
    'Oxford Revue Stand-up Night',
    'An evening of hilarious stand-up comedy featuring members of the renowned Oxford Revue troupe.',
    '2025-07-01 20:00:00+01:00', -- BST
    '2025-07-01 22:00:00+01:00',
    17, 1000, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 2
),
(
    'Life Drawing Workshop (Untutored)',
    'Practice your drawing skills in a relaxed, untutored life drawing session. Basic materials provided, or bring your own.',
    '2025-07-03 14:00:00+01:00', -- BST
    '2025-07-03 16:00:00+01:00',
    10, 500, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 7
),
(
    'Chancellor''s Lecture: Geopolitics in the 21st Century',
    'A prestigious lecture delivered by a leading international figure on contemporary global politics. Admission free, booking required.',
    '2025-07-05 17:30:00+01:00', -- BST
    '2025-07-05 19:00:00+01:00',
    13, 0, 'https://picsum.photos/seed/chancellor_lecture/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 4
),
(
    'Jazz Night ft. University Big Band',
    'An evening of swinging tunes from the Oxford University Jazz Orchestra (OUJO) Big Band. Licensed bar available.',
    '2025-07-08 20:30:00+01:00', -- BST
    '2025-07-08 23:00:00+01:00',
    16, 750, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'Physics Dept Seminar: Dark Matter Detection',
    'Weekly departmental seminar featuring Dr. Eleanor Vance presenting recent results from the LUX-ZEPLIN experiment.',
    '2025-07-10 16:00:00+01:00', -- BST
    '2025-07-10 17:00:00+01:00',
    11, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 5
),
(
    'Contemporary Dance Showcase',
    'Experience innovative choreography and powerful performances from the Oxford University Contemporary Dance group.',
    '2025-07-12 19:30:00+01:00', -- BST
    '2025-07-12 21:00:00+01:00',
    12, 1200, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 6
),
(
    'University Fencing Championships',
    'Watch the Varsity fencing team compete in the annual University Championships. Foil, Epee, and Sabre categories.',
    '2025-07-15 10:00:00+01:00', -- BST
    '2025-07-15 17:00:00+01:00',
    15, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 3
),
(
    'Poetry Reading: New Voices',
    'An evening showcasing talented student poets from across the university. Open mic slots available.',
    '2025-07-17 19:00:00+01:00', -- BST
    '2025-07-17 20:30:00+01:00',
    10, 300, 'https://picsum.photos/seed/poetry_ox/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 4
),
(
    'Postgraduate Welcome Drinks',
    'An informal drinks reception for new postgraduate students starting Michaelmas term early.',
    '2025-07-19 18:00:00+01:00', -- BST
    '2025-07-19 20:00:00+01:00',
    16, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 4
),
(
    'Robotics Workshop: Build a Bot',
    'Hands-on workshop introducing basic robotics principles. Build and program a simple line-following robot. Materials included.',
    '2025-07-22 10:00:00+01:00', -- BST
    '2025-07-22 16:00:00+01:00',
    11, 2500, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 5
),
(
    'Outdoor Theatre: Twelfth Night',
    'Enjoy Shakespeare''s classic comedy performed outdoors in the college gardens (Meeting point: Keble College Hall). Bring a picnic!',
    '2025-07-24 18:30:00+01:00', -- BST
    '2025-07-24 21:00:00+01:00',
    12, 1500, 'https://picsum.photos/seed/twelfth_night_ox/1000/300', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 6
),
(
    'Oxford Philharmonic Orchestra Concert',
    'The renowned Oxford Philharmonic performs Beethoven Symphony No. 5 and Mozart Piano Concerto No. 21.',
    '2025-07-26 19:30:00+01:00', -- BST
    '2025-07-26 21:30:00+01:00',
    13, 3000, 'https://picsum.photos/seed/oxford_phil/1000/300', '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'Yoga in the Park (University Parks)',
    'Start your day with a refreshing outdoor yoga session suitable for all levels. Meet near Keble College entrance.',
    '2025-07-29 08:00:00+01:00', -- BST
    '2025-07-29 09:00:00+01:00',
    12, 500, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 3
),
(
    'Improv Comedy Night',
    'Watch skilled improvisers create hilarious scenes based on audience suggestions. Unpredictable fun guaranteed!',
    '2025-07-31 20:00:00+01:00', -- BST
    '2025-07-31 21:30:00+01:00',
    17, 800, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 2
),
(
    'History Faculty Seminar: The English Reformation',
    'Professor Catherine Armstrong discusses new perspectives on the social impact of the English Reformation.',
    '2025-08-02 14:00:00+01:00', -- BST
    '2025-08-02 15:30:00+01:00',
    10, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 4
),
(
    'Digital Photography Workshop',
    'Learn the basics of composition, lighting, and camera settings in this introductory digital photography workshop.',
    '2025-08-05 11:00:00+01:00', -- BST
    '2025-08-05 14:00:00+01:00',
    15, 1500, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 7
),
(
    'Astrophysics Public Lecture: Exoplanets',
    'Explore the fascinating world of planets beyond our solar system with Dr. Ben Carter. Suitable for all.',
    '2025-08-07 18:30:00+01:00', -- BST
    '2025-08-07 19:45:00+01:00',
    11, 0, 'https://picsum.photos/seed/exoplanets_ox/1000/300', '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 5
),
(
    'Oxford University Orchestra Summer Concert',
    'The premier student orchestra performs works by Sibelius and Dvorak in the magnificent Sheldonian Theatre.',
    '2025-08-09 19:30:00+01:00', -- BST
    '2025-08-09 21:45:00+01:00',
    13, 1800, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'OU Contemporary Dance Company Auditions',
    'Auditions for the Oxford University Contemporary Dance Company. Open to all university members with dance experience.',
    '2025-08-12 17:00:00+01:00', -- BST
    '2025-08-12 19:00:00+01:00',
    17, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 6
),
(
    '5-a-side Football Tournament (Grad vs Undergrad)',
    'Friendly inter-faculty 5-a-side football tournament. Sign up your team or come along to support.',
    '2025-08-14 14:00:00+01:00', -- BST
    '2025-08-14 18:00:00+01:00',
    15, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 3
),
(
    'Philosophy Society Guest Lecture',
    'Professor Simon Blackburn discusses "Truth, Lies, and Bullshit". Q&A session to follow.',
    '2025-08-16 17:00:00+01:00', -- BST
    '2025-08-16 18:30:00+01:00',
    10, 0, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 4
),
(
    'Screen Printing Taster Session',
    'Try your hand at screen printing! Learn the basics and print your own design onto a tote bag (provided).',
    '2025-08-19 13:00:00+01:00', -- BST
    '2025-08-19 15:00:00+01:00',
    16, 1000, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 7
),
(
    'BioTech Start-up Pitch Event',
    'Watch Oxford''s budding biotech entrepreneurs pitch their innovative ideas to a panel of investors and experts.',
    '2025-08-21 18:00:00+01:00', -- BST
    '2025-08-21 20:00:00+01:00',
    11, 500, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 5
),
(
    'Keble College Chapel Choir Performance',
    'An evening concert by the Keble College Chapel Choir, featuring sacred and secular works spanning five centuries.',
    '2025-08-23 19:00:00+01:00', -- BST
    '2025-08-23 20:30:00+01:00',
    12, 1000, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'Careers Service: CV Writing Workshop',
    'Learn how to craft an effective CV for academic or industry applications. Essential for finalists and postgraduates.',
    '2025-08-26 14:00:00+01:00', -- BST
    '2025-08-26 15:30:00+01:00',
    10, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 4
),
(
    'Film Screening: "Blade Runner" (Director''s Cut)',
    'University Film Society screening of the sci-fi classic. Introduction and post-film discussion.',
    '2025-08-28 19:30:00+01:00', -- BST
    '2025-08-28 22:00:00+01:00',
    17, 600, 'https://picsum.photos/seed/blade_runner_ox/1000/300', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 5
),
(
    'University Basketball Club Trials',
    'Trials for the Oxford University Men''s and Women''s Basketball teams. Open to all skilled players.',
    '2025-08-30 10:00:00+01:00', -- BST
    '2025-08-30 13:00:00+01:00',
    15, 0, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 3
),
(
    'Sheldonian Theatre Guided Tour',
    'Discover the history and architecture of Sir Christopher Wren''s masterpiece. Includes access to the cupola for panoramic views.',
    '2025-09-01 11:00:00+01:00', -- BST
    '2025-09-01 12:00:00+01:00',
    13, 500, 'https://picsum.photos/seed/sheldonian_tour/1000/300', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 4
),
(
    'Introduction to Ballroom Dancing Class',
    'Learn the basic steps of Waltz and Quickstep in this fun, introductory class. No partner needed.',
    '2025-09-03 19:00:00+01:00', -- BST
    '2025-09-03 20:30:00+01:00',
    16, 800, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 6
),
(
    'AI Ethics Discussion Panel',
    'Experts from philosophy, law, and computer science discuss the ethical challenges posed by advancing artificial intelligence.',
    '2025-09-05 17:00:00+01:00', -- BST
    '2025-09-05 18:30:00+01:00',
    14, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 5
),
(
    'Oxford Gargoyles A Cappella Concert',
    'Enjoy tight harmonies and smooth jazz sounds from Oxford''s famous all-male a cappella group.',
    '2025-09-07 20:00:00+01:00', -- BST
    '2025-09-07 21:30:00+01:00',
    12, 1200, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'Watercolour Painting Outdoors',
    'Capture the beauty of Oxford''s architecture in this outdoor watercolour painting session (weather permitting). Meet at Exam Schools.',
    '2025-09-10 10:30:00+01:00', -- BST
    '2025-09-10 13:00:00+01:00',
    15, 700, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 7
),
(
    'Stand-up Comedy Open Mic Night',
    'Try out your material or enjoy fresh comedic talent at this supportive open mic night.',
    '2025-09-12 19:30:00+01:00', -- BST
    '2025-09-12 21:30:00+01:00',
    10, 400, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 2
),
(
    'Mindfulness and Meditation Session',
    'A guided session to help reduce stress and improve focus. Suitable for beginners.',
    '2025-09-15 13:00:00+01:00', -- BST
    '2025-09-15 13:45:00+01:00',
    11, 0, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 3
),
(
    'Play Reading: "Waiting for Godot"',
    'Join the drama society for an informal reading of Samuel Beckett''s absurdist masterpiece. Participation encouraged.',
    '2025-09-17 18:00:00+01:00', -- BST
    '2025-09-17 20:00:00+01:00',
    17, 0, NULL, '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', FALSE, FALSE, 6
),
(
    'Climate Change Solutions: A Student Forum',
    'A student-led forum presenting and debating innovative solutions to the climate crisis. Open to all.',
    '2025-09-19 16:00:00+01:00', -- BST
    '2025-09-19 18:00:00+01:00',
    14, 0, 'https://picsum.photos/seed/climate_forum_ox/1000/300', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 4
),
(
    'Late Night Jazz Jam Session',
    'Bring your instrument or just come to listen at this informal late-night jazz jam session.',
    '2025-09-22 21:00:00+01:00', -- BST
    '2025-09-22 23:30:00+01:00',
    12, 300, NULL, '00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 1
),
(
    'Introduction to Coding (Python)',
    'Absolute beginners coding workshop focused on the Python language. No prior experience needed. Laptops required.',
    '2025-09-24 10:00:00+01:00', -- BST
    '2025-09-24 13:00:00+01:00',
    11, 500, NULL, '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 5
),
(
    'Sculpture Park Visit & Sketching',
    'Organised trip to a local sculpture park (transport included). Opportunity for sketching and appreciation. Meet at Exam Schools.',
    '2025-09-26 09:30:00+01:00', -- BST
    '2025-09-26 16:00:00+01:00',
    15, 2000, NULL, '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 7
),
(
    'Guest Comedy Night: Phil Wang (Preview)',
    'Catch acclaimed comedian Phil Wang previewing his new tour show at the Oxford Playhouse.',
    '2025-09-28 19:30:00+01:00', -- BST
    '2025-09-28 21:00:00+01:00',
    17, 1800, 'https://picsum.photos/seed/phil_wang_ox/1000/300', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000009', TRUE, TRUE, 2
),
(
    'Circuit Training Session',
    'High-intensity interval training session suitable for improving overall fitness. All levels welcome.',
    '2025-09-30 17:30:00+01:00', -- BST
    '2025-09-30 18:30:00+01:00',
    16, 400, NULL, '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000009', TRUE, FALSE, 3
);