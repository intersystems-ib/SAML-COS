/// Clase de Ayuda para generación del token SAML20
/// Añadir esta clase como superclase a los BO que necesitan generar un token SAML
Class IBSP.CXN.SAML20.BO.SAMLHelper Extends Ens.Host [ Abstract ]
{

/// This is a Default value for the X509 Certificate to use. It can be overridden in the input message
Property X509CertAlias As %String;

/// Name of the SAMLIssuer in the token. Can be an arbitrary value. This value gets overriden if specified in the Input Message
Property SAMLIssuer As %String;

/// A TimeToLive for the SAML token. This value gets overriden if specified in the Input Message
Property SAMLTimeToLive As %Integer [ InitialExpression = 600 ];

/// SAML Attributes for the SAML Token.
/// This is a (multi-line) json of Attribute:Value 
/// { "ResponsibleUser":"HCC0555WS", "Profile": "MD" }
Property SAMLAttributes As %String(MAXLEN = "");

Parameter SETTINGS = "X509CertAlias:SAML20,SAMLIssuer:SAML20,SAMLTimeToLive:SAML20,SAMLAttributes:SAML20,ReplyCodeActions,RetryInterval,AlertRetryGracePeriod:Alerting,FailureTimeout,QueueCountAlert:Alerting,QueueWaitAlert:Alerting,SendSuperSession";

/// Metodo interno para añadir los attributos al token SAML
Method AddAtt(pRequest As IBSP.CXN.SAML20.Msg.SAMLReq, pKey As %String, pValue As %String) [ Internal ]
{
	set tAtt=##class(IBSP.CXN.SAML20.Data.SAMLAttribute).%New()
	set tAtt.AttributeId=pKey
	set tAtt.AttributeValue=pValue
	do pRequest.data.SAMLAttributes.Insert(tAtt)
}

/// API a invocar para genear un token SAML dentro de una Cabecera SOAP, para poder enviarlo como
/// SOAP Security Header como parte de una llamada a un Web Service.
Method GetSAMLToken(pValidator As %String, pSAMLParams As IBSP.CXN.SAML20.Data.SAMLValues, ByRef header As IBSP.CXN.SAML20.SOAPHeader) As %Status
{
	#dim tSC as %Status = $$$OK
	#dim errObj as %Exception.AbstractException
	#dim request as IBSP.CXN.SAML20.Msg.SAMLReq = ##class(IBSP.CXN.SAML20.Msg.SAMLReq).%New()
	
	#dim response as Ens.StringResponse = ##class(Ens.StringResponse).%New()
	#dim tiquet as %String = ""
	///---Initialize Request with Default Parameters and override with pSAMLParams 
	set:(pSAMLParams="") pSAMLParams=##class(IBSP.CXN.SAML20.Data.SAMLValues).%New()
	set tX509CertAlias=$select(pSAMLParams.X509CertAlias="":..X509CertAlias,1:pSAMLParams.X509CertAlias)
	set tSAMLIssuer=$select(pSAMLParams.SAMLIssuer="":..SAMLIssuer,1:pSAMLParams.SAMLIssuer)
	set tSAMLTimeToLive=$select(pSAMLParams.SAMLTimeToLive="":..SAMLTimeToLive,1:pSAMLParams.SAMLTimeToLive)
	
	//--Get Default SAML Attribute values from Portal if any
	$$$TRACE(..SAMLAttributes)
	set tDefaultAttObj=$Select(..SAMLAttributes="":{},1:{}.%FromJSON(..SAMLAttributes))
	//--Get Attributes that come from message if any
	$$$TRACE(pSAMLParams.SAMLAttributes)
	set tAttObj=$Select(pSAMLParams.SAMLAttributes="":{},1:{}.%FromJSON(pSAMLParams.SAMLAttributes))
	//--iterate over tAttObj (from  message) to override attributes from portal defaults
	set tFinalAttObj=tDefaultAttObj
	set tIt=tAttObj.%GetIterator()
	while (tIt.%GetNext(.tProp,.tVal)) {
		if tVal'="" { do tFinalAttObj.%Set(tProp,tVal) }
	}
	
	//--Build Request
	set request.data.SAMLAttributes=tFinalAttObj.%ToJSON()
	///Initialize Request With Correct Parameters
	set request.data.X509CertAlias=tX509CertAlias
	set request.data.SAMLIssuer=tSAMLIssuer
	set request.data.SAMLTimeToLive=tSAMLTimeToLive
	set request.data.SAMLValidator=pValidator
	
	set header=##class(IBSP.CXN.SAML20.SOAPHeader).%New()
	try {
 		$$$THROWONERROR(tSC,..SendRequestSync("IBSP.CXN.SAML20.BO.SAMLSigner",request,.response,5))
 		if $isobject(response)&&(response.StringValue'="")
 		{
	 		set tiquet = $replace(response.StringValue, "<?xml version=""1.0"" encoding=""UTF-8""?>", "")
			set header.content= tiquet
 		}
	} catch errObj {
		set tSC=errObj.AsStatus()
	}
	return tSC
}

/// This user callback method is called via initConfig() from %OnNew() or in the case of SOAP Services from OnPreSOAP()
Method OnInit() As %Status
{
	#DIM errObj as %Exception.AbstractException
	If ""=..SAMLAttributes { $$$LOGWARNING("No SAMLAttributes Defined") }
	try {
		set tt={}.%FromJSON(..SAMLAttributes)
	}catch errObj {
		$$$LOGWARNING("Error Parsing JSON for SAMLAttributes "_errObj.DisplayString())
	}	
	Quit $$$OK
}

}
