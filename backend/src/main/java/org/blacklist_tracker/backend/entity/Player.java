package org.blacklist_tracker.backend.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.io.Serializable;
import java.time.Instant;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Player extends AuditableEntity implements Serializable {
    @Id
    private String guid;

    @OneToOne(cascade = CascadeType.ALL, optional = false)
    @PrimaryKeyJoinColumn
    BlacklistEntry blacklistEntry;

    @EqualsAndHashCode.Exclude
    private String playername;

    @EqualsAndHashCode.Exclude
    private String realm;

    @EqualsAndHashCode.Exclude
    private String faction;
}
