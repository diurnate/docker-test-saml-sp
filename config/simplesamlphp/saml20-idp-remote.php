<?php

$metadata[getenv('SIMPLESAMLPHP_IDP_METADATA_URL')] = array(
    'name' => array(
        'en' => 'Test IdP',
    ),
    'description' => 'Test IdP',
    'SingleSignOnService' => getenv('SIMPLESAMLPHP_IDP_SSO_URL'),
    'SingleLogoutService' => getenv('SIMPLESAMLPHP_IDP_SLO_URL'),
    'certFingerprint' => getenv('SIMPLESAMLPHP_IDP_CERT_FINGERPRINT'),
);