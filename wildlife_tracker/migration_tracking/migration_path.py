from typing import Optional

class MigrationPath:
    def __init__ ( self,
                 path_id: int,
                 species: str,
                 start_location: Habitat,
                 destination: Habitat,) -> None:
     self.path_id = path_id
     self.species = species
     self.start_location = start_location
     self.destination = destination
     pass

    def get_migration_path_details(path_id) -> dict:
        pass

    def update_migration_path_details(path_id: int, **kwargs) -> None:
        pass