/// Una Cabecera de SOAP para contener un token SAML firmado
Class IBSP.CONN.SAML.SOAPHeader Extends (%SerialObject, %SOAP.Header, %XML.Adaptor)
{

Parameter XMLNAME = "Security";

Parameter NAMESPACE = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";

/// the XML Raw content for this SOAP Header
Property content As %String(CONTENT = "MIXED", XMLPROJECTION = "content");

/// The XMLPREFIX parameter controls the prefix to be used for the XML namespace that 
/// is given by the NAMESPACE parameter.
Parameter XMLPREFIX As STRING = "wsse";

/// ELEMENTQUALIFIED controls the format of exported XML.  
/// The ELEMENTQUALIFIED specification should be based on the elementFormDefault attribute of the
/// schema that defines the type. 
/// To maintain compatibility, ELEMENTQUALIFIED will default to 1 (true) for literal format export
/// and will default to 0 (false) for encoded or encoded12 format export.  
/// These were the values always previously assumed for the elementFormDefault attribute.
/// NOTE:  Direct use of XMLExport method does not support the ELEMENTQUALIFIED.  The export must be
/// done using %XML.Writer or SOAP support.
Parameter ELEMENTQUALIFIED As BOOLEAN = 0;

Storage Default
{
<Data name="SOAPHeaderState">
<Value name="1">
<Value>Fault</Value>
</Value>
<Value name="2">
<Value>actor</Value>
</Value>
<Value name="3">
<Value>mustUnderstand</Value>
</Value>
<Value name="4">
<Value>%headerId</Value>
</Value>
<Value name="5">
<Value>XmlId</Value>
</Value>
<Value name="6">
<Value>HeaderBufferIndex</Value>
</Value>
<Value name="7">
<Value>rewriteTag</Value>
</Value>
<Value name="8">
<Value>rewriteFmt</Value>
</Value>
<Value name="9">
<Value>rewriteNamespaces</Value>
</Value>
<Value name="10">
<Value>rewriteMimeAttachments</Value>
</Value>
<Value name="11">
<Value>content</Value>
</Value>
</Data>
<State>SOAPHeaderState</State>
<StreamLocation>^IBSP.CONN.SAML.SOAPHeaderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
