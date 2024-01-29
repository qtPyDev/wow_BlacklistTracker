package org.blacklist_tracker.backend.service;

import lombok.RequiredArgsConstructor;
import org.blacklist_tracker.backend.entity.Player;
import org.blacklist_tracker.backend.repository.PlayerRepository;
import org.blacklist_tracker.backend.stubs.model.BlacklistEntryDto;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BlacklistService {
    private final PlayerRepository playerRepo;

    public BlacklistEntryDto addBlacklistEntry(BlacklistEntryDto blacklistEntryDto) {
        // check if player-entry already exists, else create in db
        playerRepo.findPlayerByGuidOrPlayername(
                blacklistEntryDto.getGuid(),
                blacklistEntryDto.getPlayername())
            .ifPresentOrElse(
                player -> System.out.println("player already in DB"),
                () -> playerRepo.save(
                    Player.builder()
                        .guid(blacklistEntryDto.getGuid())
                        .playername(blacklistEntryDto.getPlayername())
                        .realm(blacklistEntryDto.getRealm())
                        .faction(blacklistEntryDto.getFaction().getValue())
                        .build()
                )
            );

        return new BlacklistEntryDto();
    }
}
