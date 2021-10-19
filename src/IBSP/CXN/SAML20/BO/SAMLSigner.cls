Include %soap

/// Business Operation que genera un token SAML desde ObjectScript y las librerias internas de IRIS
Class IBSP.CXN.SAML20.BO.SAMLSigner Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

/// This is a Default value for the X509 Certificate to use. It can be overridden in the input message
Property X509CertAlias As %String;

/// Name of the SAMLIssuer in the token. Can be an arbitrary value. This value gets overriden if specified in the Input Message
Property SAMLIssuer As %String;

/// A TimeToLive for the SAML token. This value gets overriden if specified in the Input Message
Property SAMLTimeToLive As %Integer [ InitialExpression = 600 ];

Parameter SETTINGS = "X509CertAlias:SAML20,SAMLIssuer:SAML20,SAMLTimeToLive:SAML20,ReplyCodeActions,RetryInterval,AlertRetryGracePeriod:Alerting,FailureTimeout,QueueCountAlert:Alerting,QueueWaitAlert:Alerting,SendSuperSession";

/// Validates that all the required attributes are specified
/// pValidator as %String(VALUELIST=",Generic,ConsultaETC,ServeisSocials,NotificacioImatge,Monitorizacio,Mau,AccessLMS,ConfirmacioRegistre,IHC3,VisorProfesional,ConsultaDadesLMS");
/// pAttributes is the list of provided attributes as an JSON Object
/// { "ResponsibleUser":"HCC0555WS", "Profile": "MD" }
Method ValidateAttributes(pValidator As %String, pAttributes As %DynamicObject) As %Status
{
	#DIM tSC as %Status=$$$OK
	#DIM errObj as %Exception.AbstractException
	try {
		///--- 
		set tRequired=""
		if (pValidator="Generic") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization")
			
		}elseif (pValidator="ConsultaETC") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization","CodeUp","GivenName","FirstFamilyName","DocumentType","DocumentNumber","Code")
		
		}elseif (pValidator="ServeisSocials") {
			
			//CodeUp, obligatori:Depen del AccessType EP: SI MUNI: NO
			//DescProviderOrganization: obligatori: Depen del AccessType, EP: No, MUNI: si
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization","AccessType")
	
		}elseif (pValidator="NotificacioImatge") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization","CodeUp")
			
		}elseif (pValidator="Monitorizacio") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization")
			
		}elseif (pValidator="Mau") {
			
			set tRequired=$lb("ResponsibleUser","Profile")
			
		}elseif (pValidator="AccessLMS") {
			
			set tRequired=$lb("ResponsibleUser","Profile")
			
		}elseif (pValidator="ConfirmacioRegistre") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization")
			
		}elseif (pValidator="IHC3") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization","CodeUp")
			
		}elseif (pValidator="VisorProfesional") {
			
			set tRequired=$lb("ResponsibleUser","Profile","Entity","ProviderOrganization","CodeUp")
			
		}elseif (pValidator="ConsultaDadesLMS"){
			
			set tRequired=$lb("ResponsibleUser","Profile","ProviderOrganization","GivenName","FirstFamilyName","DocumentNumber")
	
		}else {
			///Throw Error
			$$$ThrowStatus($$$ERROR($$$GeneralError,"IBSP.CXN.SAML20.BO.SAMLSigner:ValidateAttributes(): El valor para SAMLValidator '"_pValidator_"' es incorrecto"))
		}
		set tMissing=""
		for i=1:1:$listlength(tRequired) {
			set tI=$li(tRequired,i)
			if ('pAttributes.%IsDefined(tI)) {
				set tMissing=tMissing_$lb(tI)
			} 
		}
		if (tMissing'="") {
			///Throw Error
			$$$ThrowStatus($$$ERROR($$$GeneralError,"IBSP.CXN.SAML20.BO.SAMLSigner:ValidateAttributes():  El SAMLValidator '"_pValidator_"' requiere los siguientes Attributos SAML que faltan '"_$ListToString(tMissing,",") ))
		}
		//---
		
		
	}catch(errObj) {
		set tSC=errObj.AsStatus()
	}
	quit tSC
}

Method SignedAssertion(pRequest As IBSP.CXN.SAML20.Msg.SAMLReq, Output pResponse As Ens.StringResponse) As %Status
{
	#DIM tSC as %Status=$$$OK
	#DIM errObj as %Exception.AbstractException
	#dim tAssertion as %SAML.Assertion
	#DIM tSignature As %XML.Security.Signature 
	#DIM tCredentials As %SYS.X509Credentials
	#DIM tSignedStream as %Stream.TmpBinary
	try {
		set pResponse=##class(Ens.StringResponse).%New()
		//--- Validate that all Attributes are present
		set tAttributes={}.%FromJSON(pRequest.data.SAMLAttributes)
		$$$THROWONERROR(tSC,..ValidateAttributes(pRequest.data.SAMLValidator,tAttributes))
		//---
		//--- Override Missing values with Default Settings
		set tX509Alias=$select(pRequest.data.X509CertAlias="":..X509CertAlias,1:pRequest.data.X509CertAlias)
 		set tSAMLIssuer=$select(pRequest.data.SAMLIssuer="":..SAMLIssuer,1:pRequest.data.SAMLIssuer)
 		set tSAMLTimeToLive=$select(pRequest.data.SAMLTimeToLive="":..SAMLTimeToLive,1:pRequest.data.SAMLTimeToLive)
		
 		set tAssertion=##class(%SAML.Assertion).Create()
 		set tCredentials  = ##class(%SYS.X509Credentials).GetByAlias(tX509Alias)
		Set tSignature=##class(%XML.Security.Signature).CreateX509(tCredentials,$$$SOAPWSIncludeNone,$$$KeyInfoX509Certificate) 
		do tSignature.SetDigestMethod($$$SOAPWSsha1)		//GenCat Requirement
 		do tSignature.SetSignatureMethod($$$SOAPWSrsasha1)  //GenCat Requirement
		Set tAssertion.X509Credentials=tCredentials
		
		$$$THROWONERROR(tSC,..FillAssertion(.tAssertion,pRequest,tSAMLIssuer,tSAMLTimeToLive,tCredentials))
		 		
 		$$$THROWONERROR(tSC,..Sign(tAssertion,tSignature,.tSignedStream))
 		
 		do tSignedStream.Rewind()
 		set pResponse.StringValue=tSignedStream.Read(tSignedStream.Size)
		
	} Catch (errObj) {
		set tSC=errObj.AsStatus()
	}
	quit tSC
}

/// Fills the Assertion with the Values, Conditions and Attributes.
Method FillAssertion(ByRef tAssertion As %SAML.Assertion, pRequest As IBSP.CXN.SAML20.Msg.SAMLReq, pSAMLIssuer As %String, pSAMLTimeToLive As %Integer, pCredentials As %SYS.X509Credentials) As %Status
{
	#DIM tSC as %Status=$$$OK
 	#DIM errObj as %Exception.AbstractException

	#DIM diarySeconds,timeMinus,timeMax,datetime,date,date1,date2,time,time1,time2,milis,now,now1,now2
	#DIM conditions As %SAML.Conditions = ##class(%SAML.Conditions).%New()
	#DIM nameIdentifier as %SAML.NameID=##class(%SAML.NameID).%New()
	#DIM subject As %SAML.Subject= ##class(%SAML.Subject).%New()
	#DIM attStatement as %SAML.AttributeStatement
	#DIM samlAttribute as IBSP.CXN.SAML20.Data.SAMLAttribute

	
	set diarySeconds=86400,timeMinus=180,timeMax=$select(+pSAMLTimeToLive>300:+pSAMLTimeToLive,1:300)
	set datetime=$ztimestamp
	//if pRequest.data.SAMLTimeNow'="",pRequest.data.SAMLTimeNow'=$c(0) set datetime=$zdth(pRequest.data.SAMLTimeNow,3) b  
	set (date,date1,date2)=$piece(datetime,",",1)
	set (time,time1,time2)=$piece(datetime,",",2)
	set milis=$piece(datetime,",",3)
	set date1=date+((time-timeMinus)\diarySeconds)-(timeMinus>time),time1=((time-timeMinus)#diarySeconds)
	set date2=date+((time+timeMax)\diarySeconds),time2=((time+timeMax)#diarySeconds)		
	set now=$zdatetime(date_","_time,3)_$select(+milis>0:"."_milis,1:"")
	set now1=$zdatetime(date1_","_time1,3)_$select(+milis>0:"."_milis,1:"")
	set now2=$zdatetime(date2_","_time2,3)_$select(+milis>0:"."_milis,1:"")		

 	try {
	 	
		set tAssertion.IssueInstant=now
		//
		set tAssertion.Issuer=##class(%SAML.NameID).%New()
		set tAssertion.Issuer.NameID= pSAMLIssuer
		
		set conditions = ##class(%SAML.Conditions).%New()
		set conditions.NotBefore=now1
		set conditions.NotOnOrAfter=now2
		set tAssertion.Conditions=conditions
	
		do tAssertion.Statement.Clear()
	    
		set nameIdentifier =##class(%SAML.NameID).%New()
		set nameIdentifier.NameID=pCredentials.SubjectDN
		
		set subject.NameID=nameIdentifier
		set tAssertion.Subject=subject
		
		set attStatement=##class(%SAML.AttributeStatement).%New()
		
		#DIm tAttributes as %DynamicObject
		set tAttributes={}.%FromJSON(pRequest.data.SAMLAttributes)
		set tAtIt=tAttributes.%GetIterator()
		while (tAtIt.%GetNext(.tAttributeId,.tAttributeValue)) {
			do ..SAML20AddAttribute(.attStatement,tAttributeId,tAttributeValue)
		}
		
		do tAssertion.Statement.Insert(attStatement)
		//---
	 
 }catch (errObj) {
	 set tSC=errObj.AsStatus()
 }
 quit tSC
}

/// Adds the Reference and performs the actual Signing of the Stream 
Method Sign(pAssertion As %SAML.Assertion, pSignature As %XML.Security.Signature, Output pSignedStream As %Stream.TmpBinary) As %Status
{
	
 #DIM tSC as %Status=$$$OK
 #DIM errObj as %Exception.AbstractException
 #DIM tRef as %XML.Security.Signature
 #DIM tDoc as %XML.Document

 try {
	    Set tRef=##class(%XML.Security.Reference).Create(pAssertion.SAMLID,$$$SOAPWSEnvelopedSignature_","_$$$SOAPWSexcc14n,"s")
		Do pSignature.AddReference(tRef)
  		set pAssertion.Signature=pSignature
 			
  		set writer=##class(%XML.Writer).%New()           
  		set stream=##class(%Stream.TmpCharacter).%New()
  		
  		$$$THROWONERROR(tSC,writer.OutputToStream(stream))
  		$$$THROWONERROR(tSC,writer.AddSchemaNamespace("s"))  //PYD:Marvin+
  		$$$THROWONERROR(tSC,writer.RootObject(pAssertion))

		$$$THROWONERROR(tSC,##class(%XML.Document).GetDocumentFromStream(stream,.tDoc))
		///PYD+: AddIDs() needs to be called before Signing the Document. 
		///      Many Thanks to Miguel-Angel Fernandez Cros for this awesome fix!
		do tDoc.AddIDs()
		///PYD-
		$$$THROWONERROR(tSC,pAssertion.Signature.SignDocument(tDoc))

		set pSignedStream=##class(%Stream.TmpCharacter).%New()
		
		$$$THROWONERROR(tSC,writer.OutputToStream(pSignedStream))
		$$$THROWONERROR(tSC,writer.AddSchemaNamespace("s"))   //PYD:Marvin+
		$$$THROWONERROR(tSC,writer.RootObject(pAssertion))
		do pSignedStream.%Save()
 		
 }catch (errObj) {
	 set tSC=errObj.AsStatus()
 }
 quit tSC
}

/// Adds an Attrbute to the Attribute List
Method SAML20AddAttribute(ByRef attStatement As %SAML.AttributeStatement, AttName As %String, AttValue As %String)
{
	#dim attr As %SAML.Attribute=##class(%SAML.Attribute).%New()
	set attr.Name=AttName
	set avalue=##class(%SAML.AttributeValue).%New()
	do avalue.SetString(AttValue)
	do attr.AttributeValue.Insert(avalue)
	do attStatement.Attribute.Insert(attr)
	quit
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="IBSP.CXN.SAML20.Msg.SAMLReq"> 
		<Method>SignedAssertion</Method>
	</MapItem>
	
</MapItems>
}

}
