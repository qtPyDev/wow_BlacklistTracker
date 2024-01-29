package org.blacklist_tracker.backend.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;
import org.blacklist_tracker.backend.stubs.model.BlacklistEntryDto;

import java.io.Serializable;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class Player implements Serializable {
    @Id
    private String guid;

    @EqualsAndHashCode.Exclude
    private String playername;

    @EqualsAndHashCode.Exclude
    private String realm;

    @EqualsAndHashCode.Exclude
    private String faction;
}
