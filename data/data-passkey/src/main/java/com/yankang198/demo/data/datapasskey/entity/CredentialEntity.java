package com.yankang198.demo.data.datapasskey.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "credentials")
public class CredentialEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity user;

    @Column(name = "credential_id", nullable = false, unique = true, length = 255)
    private String credentialId;

    @Column(name = "public_key", columnDefinition = "TEXT")
    private String publicKey;

    @Enumerated(EnumType.STRING)
    @Column(name = "attestation_type", nullable = false)
    private AttestationType attestationType;

    @Column(name = "aaguid", length = 36)
    private String aaguid = "00000000-0000-0000-0000-000000000000";

    @Column(name = "signature_count")
    private Integer signatureCount;

    @Column(name = "creation_date", nullable = false, updatable = false)
    private LocalDateTime creationDate;

    @Column(name = "last_used_date")
    private LocalDateTime lastUsedDate;

    @Column(name = "last_updated_date", nullable = false)
    private LocalDateTime lastUpdatedDate;

    @Column(name = "type", length = 25)
    private String type;

    @ElementCollection
    @Column(name = "transport")
    @Enumerated(EnumType.STRING) // Assuming transport uses ENUM in Java
    private Set<Transport> transports;

    @Column(name = "backup_eligible", nullable = false)
    private Boolean backupEligible = false;

    @Column(name = "backup_state", nullable = false)
    private Boolean backupState = false;
}
