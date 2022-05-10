
create table if not exists user_types(
	type_id int primary key,
	user_role varchar(15),
	constraint user_role_key unique(user_role)
);

create table if not exists users(
	user_id int primary key,
	user_type int,
	first_name varchar(30),
	last_name varchar(30),
	gender varchar(10),
	birth_date date,
	email varchar(80),
	password varchar(125),
	image_id int,
	last_login date,
	active_status bool,
	constraint email_key unique(email),
	constraint fk_user_type foreign key (user_type) references user_types(type_id)
);

alter table users add constraint fk_user_image_id foreign key(image_id) references image(image_id);	

create table if not exists genre(
	genre_id int primary key,
	genre_name varchar(15),
	constraint genre_name_key unique (genre_name)
);

create table if not exists image(
	image_id int primary key,
	image_location varchar(250),
	image_desc varchar (100)
);

create table if not exists lyrics(
	lyrics_id int primary key,
	lyrics_description varchar(1000),
	creator_name varchar(50)
);

create table if not exists playlist(
	playlist_id int primary key,
	user_id int,
	playlist_name varchar(15),
	constraint fk_playlist_user_id foreign key (user_id) references users(user_id)
);

create table if not exists artist(
	artist_id int primary key,
	artist_name varchar(50),
	total_songs int,
	total_albums int,
	image_id int,
	constraint artist_name_key unique(artist_name),
	constraint fk_artist_image_id foreign key (image_id) references image(image_id)	
);

create table if not exists album(
	album_id int primary key,
	album_name varchar(20),
	release_date date,
	album_length float,
	total_tracks int,
	artist_id int,
	genre_id int,
	image_id int,
	download_pemr bool,
	constraint fk_album_genre_id foreign key (genre_id) references genre(genre_id),
	constraint fk_album_artist_id foreign key (artist_id) references artist(artist_id),
	constraint fk_album_image_id foreign key (image_id) references image(image_id)
);


create table if not exists songs(
	song_id int primary key,
	title varchar(20),
	lenth float,
	album_id int,
	genre_id int,
	lyrics_id int,
	playlist_id int,
	download_perm bool,
	constraint fk_song_genre_id foreign key (genre_id) references genre(genre_id),
	constraint fk_song_artist_id foreign key (album_id) references album(album_id),
	constraint fk_songs_lyrics_id foreign key (lyrics_id) references lyrics(lyrics_id),
	constraint fk_songs_playlist_id foreign key (playlist_id) references playlist(playlist_id)
);












