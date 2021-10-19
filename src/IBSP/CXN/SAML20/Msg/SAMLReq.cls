/// Mensaje de Petición de Token SAML
Class IBSP.CXN.SAML20.Msg.SAMLReq Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "Ens.StringResponse";

Property data As IBSP.CXN.SAML20.Data.SAMLValues;

Storage Default
{
<Data name="SAMLReqDefaultData">
<Subscript>"SAMLReq"</Subscript>
<Value name="1">
<Value>data</Value>
</Value>
</Data>
<DefaultData>SAMLReqDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
