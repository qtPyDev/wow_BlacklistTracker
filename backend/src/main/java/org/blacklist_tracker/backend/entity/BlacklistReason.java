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
public class BlacklistReason extends AuditableEntity implements Serializable {
    @EmbeddedId
    BlacklistReasonId blacklistReasonId;

    @EqualsAndHashCode.Exclude
    private String reason;

    @ManyToOne(cascade = CascadeType.ALL)
    @MapsId("playerGuid")
    @EqualsAndHashCode.Exclude
    private BlacklistEntry blacklistEntry;

    @Embeddable
    @Getter
    @Setter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    @EqualsAndHashCode
    public static class BlacklistReasonId implements Serializable {
        private String playerGuid;

        @GeneratedValue(strategy = GenerationType.SEQUENCE)
        private int number;
    }
}
