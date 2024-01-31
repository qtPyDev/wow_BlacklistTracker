package org.blacklist_tracker.backend.entity;

import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Temporal;
import lombok.*;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.Date;

import static jakarta.persistence.TemporalType.TIMESTAMP;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
@Getter
@Setter
public abstract class AuditableEntity {
    @CreatedDate
    @Temporal(TIMESTAMP)
    @EqualsAndHashCode.Exclude
    protected Timestamp creationDate;

    @LastModifiedDate
    @Temporal(TIMESTAMP)
    @EqualsAndHashCode.Exclude
    protected Timestamp lastModifiedDate;
}

