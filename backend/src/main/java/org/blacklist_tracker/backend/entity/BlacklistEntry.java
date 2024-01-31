package org.blacklist_tracker.backend.entity;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class BlacklistEntry extends AuditableEntity implements Serializable {
    @Id
    private String playerGuid;

    @MapsId
    @OneToOne(cascade = CascadeType.ALL, optional = false, mappedBy = "blacklistEntry")
    private Player player;

    @OneToMany(mappedBy = "blacklistEntry", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    private List<BlacklistReason> blacklistReasons;
}
