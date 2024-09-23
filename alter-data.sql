\c dogkennel;

ALTER TABLE IF EXISTS breed ADD breedtype varchar(100) NOT NULL;
ALTER TABLE IF EXISTS breed RENAME COLUMN breedtype TO breedtypes;
ALTER TABLE IF EXISTS breed ALTER COLUMN breedtypes TYPE varchar(50);
ALTER TABLE IF EXISTS breed ALTER COLUMN breedtypes DROP NOT NULL;
ALTER TABLE IF EXISTS breed DROP COLUMN breedTypes;

-- This operation not permit, because ON DELETE RESTRICT
ALTER TABLE IF EXISTS breed DROP COLUMN breedId;
