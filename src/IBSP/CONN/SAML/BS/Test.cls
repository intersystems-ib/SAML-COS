Class IBSP.CONN.SAML.BS.Test Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    set sc = $$$OK

    try {
        $$$TRACE(pInput)
        set pOutput = "Dummy response. The received CIP is " _ pInput
        // Generate the needed request object and call you production component (BP, BO, etc)
        //$$$ThrowOnError(..SendRequestSync("", pInput, .pOutput))
    } catch ex {
        set sc = ex.AsStatus()
    }
    
    quit sc
}

}
