CREATE SCHEMA folders;

CREATE TABLE folders (
	id bigint generated by default as identity primary key,
	name		VARCHAR(50)	NOT NULL,
	icon		VARCHAR(40)	NOT NULL,
  position  INTEGER NOT NULL DEFAULT 0,
  user_id uuid  NOT NULL,
	icon_color		VARCHAR(25)		NOT NULL,
	created_at		TIMESTAMP	NOT NULL DEFAULT now(),
	updated_at		TIMESTAMP	NOT NULL DEFAULT now()
);

ALTER TABLE folders ENABLE ROW LEVEL SECURITY;

CREATE POLICY user_update_own_folders ON folders
    FOR ALL
    USING (auth.uid() = user_id);

CREATE SCHEMA bookmarks;

CREATE TABLE bookmarks (
	id bigint generated by default as identity primary key,
	url		TEXT	NOT NULL,
  user_id uuid  NOT NULL,
	folder_id		bigint,
	title	TEXT,
  favourite BOOLEAN NOT NULL DEFAULT false,
  description	TEXT,
  image	TEXT,
  sort_type	VARCHAR(20)	NOT NULL DEFAULT 'date_created',
  sort_ascending  BOOLEAN NOT NULL DEFAULT false,
  times_accessed  INTEGER,
	created_at		TIMESTAMP	NOT NULL DEFAULT now(),
	updated_at		TIMESTAMP	NOT NULL DEFAULT now(),
  last_accessed		TIMESTAMP,
	CONSTRAINT fk_folder
  FOREIGN KEY(folder_id) 
    REFERENCES folders(id)
    ON DELETE SET NULL
);

ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;

CREATE POLICY user_update_own_bookmarks ON bookmarks
    FOR ALL
    USING (auth.uid() = user_id);

CREATE extension http with schema public;

alter publication supabase_realtime add table bookmarks;
alter publication supabase_realtime add table folders;

CREATE OR REPLACE FUNCTION reorder (moved_id bigint, new_position int, old_position int, direction int)
	RETURNS void
	AS $$
	UPDATE
		folders
	SET
		position = position + direction
	WHERE
		CASE WHEN direction = - 1 THEN
			position <= new_position AND position > old_position
		ELSE
			position >= new_position AND position < old_position
		END;
UPDATE
	folders
SET
	position = new_position
WHERE
	id = moved_id;
$$
LANGUAGE sql
VOLATILE;