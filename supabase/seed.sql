INSERT INTO public.universities
  (slug, name, logo_url, crest_url)
VALUES
  ('exeter-uni', 'University of Exeter', '/public-assets/university-logos/exeter-logo.svg', '/public-assets/university-crests/exeter-crest.jpg'),
  ('imperial', 'Imperial College London', '/public-assets/university-logos/imperial-logo.svg', '/public-assets/university-crests/icl-crest.png'),
  ('lboro-uni', 'Loughborough University', '/public-assets/university-logos/lboro-logo.svg', '/public-assets/university-crests/lboro-crest.png'),
  ('oxford-uni', 'University of Oxford', '/public-assets/university-logos/oxford-logo.svg', '/public-assets/university-crests/oxford-crest.png');

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
    ) (
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
            JSONB_BUILD_OBJECT('university', ((ROW_NUMBER() OVER()) % 4) + 1, 'is_staff', ((ROW_NUMBER() OVER()) > 7)),
            current_timestamp,
            current_timestamp,
            '',
            '',
            '',
            ''
        FROM
            generate_series(1, 9)
    );

-- test user email identities
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
    ) (
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