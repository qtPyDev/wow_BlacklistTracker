package org.blacklist_tracker.backend.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.Set;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class BlacklistEntry implements Serializable {
    @Id
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(referencedColumnName = "guid")
    Player player;

    @OneToMany(mappedBy="blacklistEntry")
    @EqualsAndHashCode.Exclude
    Set<EntryReason> reasons;
}
