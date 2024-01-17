package org.blacklist_tracker.backend.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class EntryReason implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(nullable=false)
    private BlacklistEntry blacklistEntry;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Setter(AccessLevel.NONE)
    private int number;

    @EqualsAndHashCode.Exclude
    private String reason;
}
