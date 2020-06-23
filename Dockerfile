FROM adoptopenjdk:14-jre-hotspot

ENV osv_cli_version 1.3

RUN curl https://repo1.maven.org/maven2/org/openapitools/openapistylevalidator/openapi-style-validator-cli/${osv_cli_version}/openapi-style-validator-cli-${osv_cli_version}-all.jar -O \
    && ls -al \
    && pwd

ENTRYPOINT [ "java", "-jar", "openapi-style-validator-cli-1.3-all.jar" ]