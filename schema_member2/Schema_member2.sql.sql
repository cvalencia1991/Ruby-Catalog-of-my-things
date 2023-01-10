CREATE TABLE "Genre"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "items" JSON NOT NULL,
    PRIMARY KEY("id")
);


CREATE TABLE  "MusicAlbum"(
    "on_spotify" BOOLEAN NOT NULL,
	PRIMARY KEY("on_spotify")
);


ALTER TABLE "Item"
    ADD CONSTRAINT "iitem_archived_foreign"
        FOREIGN KEY("archived")
            REFERENCES "MusicAlbum"("on_spotify");
