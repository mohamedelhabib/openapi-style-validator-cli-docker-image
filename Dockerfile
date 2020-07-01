FROM adoptopenjdk:14-jre-hotspot as builder

RUN \
    apt-get update \
    && apt-get install -y git \
    && git clone https://github.com/OpenAPITools/openapi-style-validator.git \
    && cd openapi-style-validator \
    && ./gradlew assemble

FROM adoptopenjdk:14-jre-hotspot

COPY --from=builder /openapi-style-validator/cli/build/libs/openapi-style-validator-cli-*-all.jar /application/openapi-style-validator-cli-all.jar 

ENTRYPOINT [ "java", "-jar", "/application/openapi-style-validator-cli-all.jar" ]