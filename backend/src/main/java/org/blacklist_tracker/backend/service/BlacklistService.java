package org.blacklist_tracker.backend.service;

import org.blacklist_tracker.backend.stubs.api.BlacklistApiDelegate;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

@Service
public class BlacklistService implements BlacklistApiDelegate {
    @Override
    public ResponseEntity<Resource> downloadLua() {
        String file = null;
        InputStreamResource resource = null;
        try {
            resource = new InputStreamResource(new FileInputStream("/home/kaidobit/ws/wow_BlacklistTracker/backend/src/main/resources/BadActorsData.lua"));
        } catch (FileNotFoundException e) {
            System.out.println("Datei nicht gefunden.");
        }

        assert resource != null;
        return ResponseEntity.ok()
            .contentType(MediaType.parseMediaType("application/octet-stream"))
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=BadActorsData.lua")
            .body(resource);
    }
}
