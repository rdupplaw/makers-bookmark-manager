CREATE TABLE comments (id SERIAL PRIMARY KEY, text VARCHAR(240),
                                                   bookmark_id INTEGER REFERENCES bookmarks (id));