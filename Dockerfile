#
# SAML-COS sample environment
#

#ARG IMAGE=store/intersystems/irishealth-community:2020.1.0.215.0
#ARG IMAGE=store/intersystems/irishealth-community:2020.4.0.547.0
ARG IMAGE=store/intersystems/irishealth-community:2021.1.0.215.3
ARG IMAGE=intersystemsdc/irishealth-community:2021.1.0.215.3-zpm
FROM $IMAGE

USER root

# create directories for testing environment
RUN mkdir -p /opt/saml-cos/app /opt/saml-cos/db

# copy source code
WORKDIR /opt/saml-cos
COPY . app

# change ownership
RUN chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/saml-cos
USER ${ISC_PACKAGE_MGRUSER}

# download latest zpm version
#RUN wget https://pm.community.intersystems.com/packages/zpm/latest/installer -O /tmp/zpm.xml

# run iris.script
WORKDIR /opt/saml-cos/app
RUN iris start IRIS \
    && iris session IRIS < iris.script \
    && iris stop IRIS quietly