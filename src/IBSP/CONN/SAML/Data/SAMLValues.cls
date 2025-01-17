/// Valores de parametros para generar el token SAML
Class IBSP.CONN.SAML.Data.SAMLValues Extends (%SerialObject, %XML.Adaptor)
{

/// El nombre del Alias de Certificado X509 a usar para generar el token SAML
/// Referencia de un certificado previamente cargado en IRIS mediante el portal de gestión
/// Para convertir un PKCS12 en PEM: 
/// openssl pkcs12 -in mycert.p12 -out mycert.key.pem -nocerts -nodes
/// openssl pkcs12 -in mycert.p12 -out mycert.crt.pem -clcerts -nokeys
Property X509CertAlias As %String;

/// Puede ser cualquier valor, como por ejemplo "HospitalTestIssuer"
Property SAMLIssuer As %String;

/// Un TimeToLive o Tiempo de Validez para el token SAML generado
Property SAMLTimeToLive As %Integer [ InitialExpression = 600 ];

/// El Tipo de Validador SAML a usar , segun documento HC3_Validacions_Globals_SAML_1.7.pdf
/// Para cada servicio HC3, se requiere un validador distinto, que corresponde a una serie de Attributos Obligatorios
Property SAMLValidator As %String(VALUELIST = ",Generic,ConsultaETC,ServeisSocials,NotificacioImatge,Monitorizacio,Mau,AccessLMS,ConfirmacioRegistre,IHC3,VisorProfesional,ConsultaDadesLMS") [ InitialExpression = "ConsultaETC" ];

/// Lista de Atributos para la generación del token SAML.
/// Los atributos obligatorios varían según el Web Service del CatSalut a llamar
/// Property SAMLAttributes As list Of IBSP.CONN.SAML.Data.SAMLAttribute;
/// This is a (multi-line) json of Attribute:Value 
/// { "ResponsibleUser":"HCC0555WS", "Profile": "MD" }
Property SAMLAttributes As %String(MAXLEN = "");

/// URLs para incluir como Condition (en AudienceRestriction)
Property SAMLAudienceRestrictionURL As %String(MAXLEN="");

/// El Tipo de Token SAML Pedido, al cual corresponden una serie de atributos obligatorios
Storage Default
{
<Data name="SAMLValuesState">
<Value name="1">
<Value>X509CertAlias</Value>
</Value>
<Value name="2">
<Value>SAMLIssuer</Value>
</Value>
<Value name="3">
<Value>SAMLTimeToLive</Value>
</Value>
<Value name="4">
<Value>SAMLValidator</Value>
</Value>
<Value name="5">
<Value>SAMLAttributes</Value>
</Value>
</Data>
<Description>
<![CDATA[El Tipo de Token SAML Pedido, al cual corresponden una serie de atributos obligatorios]]></Description>
<State>SAMLValuesState</State>
<StreamLocation>^IBSP.CONN.SAML2A94.SAMLValuesS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
