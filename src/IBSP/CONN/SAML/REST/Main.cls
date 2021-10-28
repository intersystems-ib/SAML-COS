Class IBSP.CONN.SAML.REST.Main Extends %CSP.REST
{

Parameter CONTENTTYPE = "application/json";

Parameter CHARSET = "UTF-8";

Parameter UseSession As Integer = 1;

Parameter CONVERTINPUTSTREAM = 1;

Parameter HandleCorsRequest = 1;

Parameter APIBS = "IBSP.CONN.SAML.BS.Test";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/test/:cip" Method="GET" Call="testGet"/>
<Route Url="/test" Method="POST" Call="testPost"/>
</Routes>
}

ClassMethod testGet(cip As %String) As %Status
{
    set sc = $$$OK

	try {

        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#APIBS, .businessService))
        $$$ThrowOnError(businessService.OnProcessInput(cip, .tResponse))

        set response = {}
        set response.message = tResponse

        do response.%ToJSON()
	} catch ex {
		set sc = ex.AsStatus()
	}

	quit sc
}

ClassMethod testPost() As %Status
{
    set sc = $$$OK

	try {

		set request = ##class(%DynamicObject).%FromJSON(%request.Content)

        $$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#APIBS, .businessService))
        $$$ThrowOnError(businessService.OnProcessInput(request.cip, .tResponse))

        set response = {}
        set response.message = tResponse

        do response.%ToJSON()
	} catch ex {
		set sc = ex.AsStatus()
	}

	quit sc
}

}
