# Changelog

All notable changes to this project will be documented in this file.

## 2022-02-10
### Changed
* IBSP.CONN.SAML.SOAPHeader is now a subclass of %SOAP.Security.Header
*      The way to add a Security Header before sending has been consequently adapted: set ..Adapter.%Client.SecurityOut=tHeader
* IBSP.CONN.SAML.BO.SAMLSigner.cls Method Sign()now forces the XML namespace alias in Assertion be be "xsi". 
*      Solves an "invalid signature error" 
* IBSP.CONN.SAML.BO.SAMLSigner.cls:GetRequiredAttributes() changed "code" and "documentNumber" to correct case (first letter is lowercase)
## 2021-10-28
### Added
* IBSP.CONN.SAML.BO.SAMLcos.cls: BO to generate a SAML token from a Business Service / Process
* IBSP.CONN.SAML.BS.Test.cls: Dummy BS to be included in the Test Production
* IBSP.CONN.SAML.Msg.SAMLRes.cls: SAMLcos BO response object
* IBSP.CONN.SAML.Production.TestProduction.cls: Test production to have an initial production when you download the project
* IBSP.CONN.SAML.REST.Main.cls: API REST to use the test production
* CHANGELOG.md
* README.md

### Changed
* IBSP.CXN.SAML20 packaged moved to IBSP.CONN.SAML
* IBSP.CONN.SAML.Data.SAMLValues.class: Set "ConsultaETC" as default value for property SAMLValidator
* IBSP.CONN.SAML.SOAPHeader.cls: Make it extend %SerialObject so that it can be included in production messages
* IBSP.CONN.SAML.Installer.cls: Add the options to create a WebApplication and to install the module without ZPM
