Class IBSP.CONN.SAML.Msg.SAMLRes Extends Ens.Response
{

Property data As IBSP.CONN.SAML.SOAPHeader;

Storage Default
{
<Data name="SAMLResDefaultData">
<Subscript>"SAMLRes"</Subscript>
<Value name="1">
<Value>data</Value>
</Value>
</Data>
<DefaultData>SAMLResDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
