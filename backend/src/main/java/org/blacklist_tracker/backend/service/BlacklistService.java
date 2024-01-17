package org.blacklist_tracker.backend.service;

import org.blacklist_tracker.backend.stubs.api.BlacklistApiDelegate;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.charset.StandardCharsets;

@Service
public class BlacklistService implements BlacklistApiDelegate {
    @Override
    public ResponseEntity<Resource> downloadLua() {
        InputStreamResource resource = new InputStreamResource(
                new ByteArrayInputStream(
                        "this string appears in the lua file".getBytes(
                                StandardCharsets.UTF_8)));

        return ResponseEntity.ok()
            .contentType(MediaType.parseMediaType("application/octet-stream"))
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=BadActorsData.lua")
            .body(resource);
    }
}
