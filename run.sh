
docker run --name=simplesaml-idp \
-p 8080:80 \
-p 8443:443 \
-e SIMPLESAMLPHP_SP_ENTITY_ID=http://app.example.com \
-e SIMPLESAMLPHP_SP_ASSERTION_CONSUMER_SERVICE=http://localhost:3000/simplesaml/module.php/saml/sp/saml2-acs.php/test-sp \
-e SIMPLESAMLPHP_SP_SINGLE_LOGOUT_SERVICE=http://localhost:3000/simplesaml/module.php/saml/sp/saml2-logout.php/test-sp \
-e SIMPLESAMLPHP_TRUSTED_DOMAINS=localhost:3000,localhost:8080 \
-e SIMPLESAMLPHP_BASEURLPATH=http://localhost:8080/simplesaml/ \
-d chrisusick/test-saml

docker run --name=simplesaml-sp \
-p 3000:80 \
-e SIMPLESAMLPHP_SP_ENTITY_ID=http://app.example.com \
-e SIMPLESAMLPHP_IDP_METADATA_URL=http://localhost:8080/simplesaml/saml2/idp/metadata.php \
-e SIMPLESAMLPHP_IDP_SSO_URL=http://localhost:8080/simplesaml/saml2/idp/SSOService.php \
-e SIMPLESAMLPHP_IDP_SLO_URL=http://localhost:8080/simplesaml/saml2/idp/SingleLogoutService.php \
-e SIMPLESAMLPHP_IDP_CERT_FINGERPRINT=119b9e027959cdb7c662cfd075d9e2ef384e445f \
-e SIMPLESAMLPHP_TRUSTED_DOMAINS=localhost:3000,localhost:8080 \
-e SIMPLESAMLPHP_BASEURLPATH=http://localhost:3000/simplesaml/ \
-d chrisusick/test-saml