package com.yankang198.demo.data.datapasskey.entity;

public enum Transport {
    USB,
    NFC,
    BLE,
    INTERNAL,
    HYBRID;

    @Override
    public String toString() {
        return name().toLowerCase();
    }
}