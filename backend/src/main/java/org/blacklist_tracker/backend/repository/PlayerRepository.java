package org.blacklist_tracker.backend.repository;

import org.blacklist_tracker.backend.entity.Player;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PlayerRepository extends
        PagingAndSortingRepository<Player, String>, ListCrudRepository<Player, String> {
    Optional<Player> findPlayerByGuidOrPlayername(String guid, String playername);
}
