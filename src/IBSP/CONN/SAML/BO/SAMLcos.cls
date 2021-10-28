Class IBSP.CONN.SAML.BO.SAMLcos Extends (Ens.BusinessOperation, IBSP.CONN.SAML.BO.SAMLHelper)
{

Method OnMessage(pRequest As IBSP.CONN.SAML.Msg.SAMLReq, Output pResponse As IBSP.CONN.SAML.Msg.SAMLRes) As %Status
{
    set sc = $$$OK

    try {

        set pResponse = ##class(IBSP.CONN.SAML.Msg.SAMLRes).%New()
	    $$$ThrowOnError(..GetSAMLToken(pRequest.data.SAMLValidator, pRequest.data, .header))
        set:($isobject(header)) pResponse.data = header
    } catch ex {
        set sc = ex.AsStatus()
    }

    quit sc
}

}
