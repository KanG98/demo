package com.yankang198.demo.data.datapasskey.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "credential_transports")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CredentialTransport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "credential_id", nullable = false)
    private Integer credentialId;

    @Enumerated(EnumType.STRING)
    @Column(name = "transport", nullable = false)
    private Transport transport;
}