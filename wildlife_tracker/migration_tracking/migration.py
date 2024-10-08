from typing import Any, Optional

from wildlife_tracker.migration_tracking.migration_path import MigrationPath

class Migration:
    def __init__(self,
                 migration_id: int, 
                 migration_path: MigrationPath,
                 start_date: str,
                 status: str = "Scheduled",
                 duration: Optional[int] = None,) -> None:
        self.migration_id = migration_id
        self.migration_path = migration_path
        self.duration = duration
        self.start_date = start_date
        self.status = status
    pass

    def get_migration_details(migration_id: int) -> dict[str, Any]:
        pass

    def get_migration_path_by_id(path_id: int) -> MigrationPath:
        pass

    def update_migration_details(migration_id: int, **kwargs: Any) -> None:
        pass