package org.blacklist_tracker.backend.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

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
    private Long guid;

    @EqualsAndHashCode.Exclude
    private String playername;

    @EqualsAndHashCode.Exclude
    private String servername;
}
