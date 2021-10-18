Import (General.Utils, General.Utils.Class, HC3.consultesV21.WL5G3N2)

Include StatusPT

Class HC3.PortV21 Extends (Ens.BusinessOperation, IBSP.CXN.SAML20.BO.SAMLHelper)
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Parameter INVOCATION = "Queue";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

/// This is the default message handler.  All request types not declared in the message map are delivered here
Method obteInformacioPacient(pReq As HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientBean, Output pResp As HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseBean) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim resultat as HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseResult
	#dim pacient as HC3.consultesV21.WL5G3N2.Pacient
	#dim administratives as HC3.consultesV21.WL5G3N2.dadesPacient
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("obteInformacioPacient",.pResp,pReq))
 		$$$TRACE("Resultat "_pResp.resultCode)
 		$$$TRACE("Pacients "_pResp.result.Count())
 		for ix=1:1:pResp.result.Count()
 		{
	 		set resultat=pResp.result.GetAt(ix)
	 		set pacient=resultat.pacient
	 		set administratives=pacient.dadesPacient
	 		$$$TRACE("resultat "_ix_" = "_administratives.nom_" "_administratives.primerCognom_" "_administratives.segonCognom)
 		}

	} catch (errObj) {
		$$$TRACE("Error consulta pacient BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseBean).%New()
		set pResp.resultCode=1
		set resultat = ##class(HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method obteInformacioPacientV2(pReq As HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientBeanV2, Output pResp As HC3.consultesV21.WL5G3N2.cercarInformeInformacioPacientResponseBeanV2) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim resultat as HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseResultV2
	#dim administratives as HC3.consultesV21.WL5G3N2.dadesPacientV2
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarInformeInformacioPacientResponseBeanV2).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("obteInformacioPacientV2",.pResp,pReq))
 		/*
 		$$$TRACE("Resultat "_pResp.resultCode)
 		$$$TRACE("resultats "_pResp.result.Count())
 		for ctResult=1:1:pResp.result.Count()
 		{
	 		#dim result As HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseResultV2 = pResp.result.GetAt(ctResult)
	 		if $isobject(result)
	 		{
				#dim pacient As HC3.consultesV21.WL5G3N2.PacientV2 = result.pacient
				$$$TRACE("pacient "_$isobject(pacient))
				set pcr=pacient.PCRCOVID19.tePCR
				$$$TRACE("PCR "_pcr)
	 		}
 		}
 		*/
	} catch (errObj) {
		$$$TRACE("Error consulta pacient BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarInformeInformacioPacientResponseBeanV2).%New()
		set pResp.resultCode=1
		set resultat = ##class(HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientResponseResultV2).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method obteInformacioPacientDadesAdministratives(pReq As HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesBean, Output pResp As HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesResponseBean) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim resultat as HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesResponseResult
	#dim pacient as HC3.consultesV21.WL5G3N2.pacientAdministratives
	#dim administratives as HC3.consultesV21.WL5G3N2.dadesPacientAdministratives
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("obteInformacioPacientDadesAdministratives",.pResp,pReq))
 		$$$TRACE("Resultat "_pResp.resultCode)
 		$$$TRACE("Pacients "_pResp.result.Count())
 		for ix=1:1:pResp.result.Count()
 		{
	 		set resultat=pResp.result.GetAt(ix)
	 		set pacient=resultat.pacientAdministratives
	 		set administratives=pacient.dadesPacientAdministratives
	 		$$$TRACE("resultat "_ix_" = "_administratives.nom_" "_administratives.primerCognom_" "_administratives.segonCognom)
 		}

	} catch (errObj) {
		$$$TRACE("Error consulta pacient administratives BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesResponseBean).%New()
		set pResp.resultCode=1
		set resultat = ##class(HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cridaCCCICIndex(pReq As HC3.consultesV21.WL5G3N2.cercaIndexCCCICBean, Output pResp As HC3.consultesV21.WL5G3N2.cercaIndexCCCICResponseBean) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim resultat as HC3.consultesV21.WL5G3N2.cercaIndexCCCICResponseResult
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCICResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarIndexCCCIC",.pResp,pReq))
	} catch (errObj) {
		$$$TRACE("Error consulta CCC index IC BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCICResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCICResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cridaCCCAPIndex(pReq As HC3.consultesV21.WL5G3N2.cercaIndexCCCAPBean, Output pResp As HC3.consultesV21.WL5G3N2.cercaIndexCCCAPResponseBean) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim resultat as HC3.consultesV21.WL5G3N2.cercaIndexCCCAPResponseResult
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCAPResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarIndexCCCAP",.pResp,pReq))
	} catch (errObj) {
		$$$TRACE("Error consulta CCC index AP BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCAPResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCAPResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cridaCCCICDetall(pReq As HC3.consultesV21.WL5G3N2.cercaDetallCCCICBean, Output pResp As HC3.consultesV21.WL5G3N2.cercaDetallCCCICResponseBean) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercaDetallCCCICResponseResult
	#dim llistaUP as HC3.consultesV21.WL5G3N2.llistaUPsIC
	#dim upo as HC3.consultesV21.WL5G3N2.upIC
	#dim request as HC3.consultesV21.WL5G3N2.cercaIndexCCCICBean
	#dim response as HC3.consultesV21.WL5G3N2.cercaIndexCCCICResponseBean
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercaDetallCCCICResponseBean).%New()
	try {
 		
 		if '$isobject(pReq.llistaUPsIC.upIC)
 		{
 			set request=##class(HC3.consultesV21.WL5G3N2.cercaIndexCCCICBean).%New()
 			set request.idMissatge=pReq.idMissatge
 			set request.cip=pReq.cip
	 		set request.idMissatge=1
	 		$$$THROWONERROR(tSC,..cridaCCCICIndex(request,.response))
	 		if $isobject(response)&&(response.resultCode="OK")
	 		{
		 		if $isobject(response.indexCCCICResponse)
		 		{
			 		if $isobject(response.indexCCCICResponse.llistaUPsIC.upIC)
			 		{
				 		set casos=0
				 		set llistaUP=##class(HC3.consultesV21.WL5G3N2.llistaUPsIC).%New()
				 		for uposel=1:1:response.indexCCCICResponse.llistaUPsIC.upIC.Count()
				 		{
				 			set upo=##class(HC3.consultesV21.WL5G3N2.upIC).%New()
				 			set upo.codi=response.indexCCCICResponse.llistaUPsIC.upIC.GetAt(uposel).codi
						 	$$$THROWONERROR(tSC,llistaUP.upIC.Insert(upo))
						 	set casos=casos+1

				 		}
				 		if casos set pReq.llistaUPsIC=llistaUP
			 		}		 		
		 		}
	 		}
 		}

		if $isobject(pReq.llistaUPsIC.upIC)
		{
	 		// SAML
			$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
			$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security")) 			
			// llamar cliente webservice
 			/*
 			set nomfitxer=pReq.cip_"_"_pReq.dataInici_"_"_pReq.dataFi
			#dim writer as %XML.Writer = ##class(%XML.Writer).%New()
 			set writer.Indent=1
 			$$$ThrowOnError(writer.OutputToFile("/home/csides/HC3_Consulta_"_nomfitxer_".XML"))
			$$$ThrowOnError(writer.RootObject(pReq))
			*/
	 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarDetallCCCIC",.pResp,pReq))
			/*
 			set writer.Indent=1
 			$$$ThrowOnError(writer.OutputToFile("/home/csides/HC3_Resposta_"_nomfitxer_".XML"))
			$$$ThrowOnError(writer.RootObject(pResp))
			*/
	 		if $isobject(pResp.detallCCCICResponse.ClinicalDocument.component.structuredBody.component)
	 		{
		 		if 'pResp.detallCCCICResponse.ClinicalDocument.component.structuredBody.component.Count()
		 		{
			 		$$$TRACE("Sense contingut estructurat")
		 		}
	 		}
		} else {
 			$$$TRACE("No ha trobat cap UP per cercar")
		}


	} catch errObj {
		$$$TRACE("Error consulta CCC IC Detall BO "_errObj.DisplayString())
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercaDetallCCCICResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercaDetallCCCICResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

	}
	
	quit $$$OK
}

Method cridaCCCAPDetall(pReq As HC3.consultesV21.WL5G3N2.cercaDetallCCCAPBean, Output pResp As HC3.consultesV21.WL5G3N2.cercaDetallCCCAPResponseBean) As %Status
{
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercaDetallCCCAPResponseResult
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercaDetallCCCAPResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarDetallCCCAP",.pResp,pReq))

	} catch (errObj) {
		$$$TRACE("Error consulta CCC AP Detall BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercaDetallCCCAPResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercaDetallCCCAPResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method retornarIdsDocsPacient(pReq As HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientBean, Output pResp As HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientResponseBean) As %Status
{
	
	// Aquesta funcio permet obtenir el Codi de publicació a partir del codi identificador del centre
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientResponseResult
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
 		if pReq.cip="" set pReq.cip="GIMA0620813000"
 		if pReq.codiCentre="" set pReq.codiCentre="E08002960"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("retornarIdsDocsPacient",.pResp,pReq))
 		$$$TRACE("Documents obtinguts "_pResp.result.Count())

	} catch (errObj) {
		$$$TRACE("Error retornar Ids Docs BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	$$$TRACE("Retorna amb "_pResp.resultCode)
	
	quit $$$OK
}

Method recuperarImatgeDigital(pReq As HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalBean, Output pResp As HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalResponseBean) As %Status
{
	
	// Aquesta funció permet obtenir les imatges a partir del codi de publicació HC3
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalResponseResult
	#dim documentB64 As %Stream.GlobalCharacter
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
 		if pReq.cip="" set pReq.cip="GIMA0620813000"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("recuperarImatgeDigital",.pResp,pReq))
 		$$$TRACE("Retorna amb "_pResp.resultCode)
 		if pResp.resultCode="OK"
 		{
	 		set directori="/interfaces/local/csides/Test/"
	 		for doc=1:1:pResp.result.Count()
	 		{
		 		set path=directori_"imatge.html"
		 		if ##class(%File).Exists(path)
		 		{
			 		for ix=1:1:99
			 		{
			 			set path=directori_"imatge"_$e("00",1,2-$l(ix))_ix_".html"
			 			if '##class(%File).Exists(path) quit
			 		}
		 		}
		 		set documentB64=##class(%Stream.GlobalCharacter).%New()
		 		$$$THROWONERROR(tSC,documentB64.Write(pResp.result.GetAt(doc).jnlp))
	 			$$$THROWONERROR(tSC,##class(General.Utils.Base64).desencriptaStreamToFile(documentB64,path))
	 		}		
 		}

	} catch (errObj) {
		$$$TRACE("Error recuperar Imatge BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cercarDocPacient(pReq As HC3.consultesV21.WL5G3N2.cercarDocPacientBean, Output pResp As HC3.consultesV21.WL5G3N2.cercarDocPacientResponseBean) As %Status
{
	
	// Aquesta funció permet obtenir el document pdf a partir del codi de publicació HC3
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercarDocPacientResponseResult
	#dim documentB64 As %Stream.GlobalCharacter
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarDocPacientResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
 		if pReq.cip="" set pReq.cip="GIMA0620813000"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarDocPacient",.pResp,pReq))
 		$$$TRACE("Retorna amb "_pResp.resultCode)
 		if pResp.resultCode="OK"
 		{
	 		set directori="/interfaces/local/csides/Test/"
	 		for doc=1:1:pResp.result.Count()
	 		{
		 		set path=directori_"document.pdf"
		 		if ##class(%File).Exists(path)
		 		{
			 		for ix=1:1:99
			 		{
			 			set path=directori_"document"_$e("00",1,2-$l(ix))_ix_".pdf"
			 			if '##class(%File).Exists(path) quit
			 		}
		 		}
		 		set documentB64=##class(%Stream.GlobalCharacter).%New()
		 		$$$THROWONERROR(tSC,documentB64.Write(pResp.result.GetAt(doc).documentB64))
	 			$$$THROWONERROR(tSC,##class(General.Utils.Base64).desencriptaStreamToFile(documentB64,path))
	 		}		
 		}

	} catch (errObj) {
		$$$TRACE("Error cerca Doc BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarDocPacientResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercarDocPacientResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cercarDocsPacient(pReq As HC3.consultesV21.WL5G3N2.cercarDocsPacientBean, Output pResp As HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientResponseBean) As %Status
{
	
	// Aquesta funció permet obtenir els codis de publicació HC3 a partir d'una sèrie de paràmetres de selecció
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseResult
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
 		if pReq.cip="" set pReq.cip="GIMA0620813000"
 		if pReq.tipusDocument="" set pReq.tipusDocument="1041000122103"
 		if pReq.dataIniciCreacio="" set pReq.dataIniciCreacio=20140101000000
 		set pReq.dataFiCreacio=$zd($h,8)_"000000"
 		set pReq.dataIniciPub=pReq.dataIniciCreacio
 		set pReq.dataFiPub=pReq.dataFiCreacio
 		if pReq.codiCentre="" set pReq.codiCentre="E08002960"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarDocsPacient",.pResp,pReq))
 		$$$TRACE("Documents obtinguts "_pResp.result.Count())

	} catch (errObj) {
		$$$TRACE("Error cercar Docs BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	$$$TRACE("Retorna amb "_pResp.resultCode)
	
	quit $$$OK
}

Method cercarDocsPacientV3(pReq As HC3.consultesV21.WL5G3N2.cercarDocsPacientBeanV3, Output pResp As HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseBeanV3) As %Status
{
	
	// Aquesta funció permet obtenir els codis de publicació HC3 a partir d'una sèrie de paràmetres de selecció
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseResultV3
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseBeanV3).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
 		if pReq.cip="" set pReq.cip="GIMA0620813000"
 		if pReq.tipusDocument="" set pReq.tipusDocument="LABE"
 		if pReq.dataIniciCreacio="" set pReq.dataIniciCreacio=20200101000000
 		set pReq.dataFiCreacio=$zd($h,8)_"000000"
 		set pReq.dataIniciPub=pReq.dataIniciCreacio
 		set pReq.dataFiPub=pReq.dataFiCreacio
 		;if pReq.codiCentre="" set pReq.codiCentre="E08026351"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarDocsPacientV3",.pResp,pReq))
	} catch (errObj) {
		$$$TRACE("Error cercar Docs BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseBeanV3).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseResultV3).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cercarLabePacient(pReq As HC3.consultesV21.WL5G3N2.cercarLabePacientBean, Output pResp As HC3.consultesV21.WL5G3N2.cercarLabePacientResponseBean) As %Status
{
	
	// Aquesta funció permet obtenir els codis de publicació HC3 a partir d'una sèrie de paràmetres de selecció
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseResult
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarLabePacientResponseBean).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
		if pReq.cip=""||(pReq.cpc="") $$$ThrowOnError($$$ERROR($$$GeneralError,"Falten dades obligatories com CIP o CPC"))
 		;if pReq.cip="" set pReq.cip="CASA1370507002"
 		;if pReq.cpc="" set pReq.cpc="42193903062197985723295744687121367040"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarLabePacient",.pResp,pReq))
	} catch (errObj) {
		$$$TRACE("Error cercar Docs BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarLabePacientResponseBean).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercarDocsPacientResponseResult).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

Method cercarImmunitzacionsV3(pReq As HC3.consultesV21.WL5G3N2.cercarImmunitzacionsBeanV3, Output pResp As HC3.consultesV21.WL5G3N2.cercarImmunitzacionsResponseBeanV3) As %Status
{
	
	#dim tSC as %Status=$$$OK
	#dim errObj as %Exception.AbstractException
	#dim tHeader as PTWIFIS.Utils.SoapHeader
	#dim resultat As HC3.consultesV21.WL5G3N2.cercarImmunitzacionsResponseResultV3
	
	set pResp=##class(HC3.consultesV21.WL5G3N2.cercarImmunitzacionsResponseBeanV3).%New()
	try {
 		// SAML
		$$$THROWONERROR(tSC,..obteTiquetSAML(.tHeader))
		$$$THROWONERROR(tSC,..Adapter.%Client.HeadersOut.SetAt(tHeader, "Security"))
 		
 		// llamar cliente webservice
 		if pReq.idMissatge="" set pReq.idMissatge=1
 		if pReq.cip="" set pReq.cip="GIMA0620813000"
 		$$$THROWONERROR(tSC,..Adapter.InvokeMethod("cercarImmunitzacionsV3",.pResp,pReq))
	} catch (errObj) {
		$$$TRACE("Error cercar ImmunitzacionsV3 BO")
		set tSC=errObj.AsStatus()
		set codierror=$system.Status.GetErrorCodes(tSC)
		set descerror=$system.Status.GetOneStatusText(tSC,1)
		set pResp=##class(HC3.consultesV21.WL5G3N2.cercarImmunitzacionsResponseBeanV3).%New()
		set pResp.resultCode=1
		set resultat=##class(HC3.consultesV21.WL5G3N2.cercarImmunitzacionsResponseResultV3).%New()
		set resultat.executionCode=codierror
		set resultat.executionDetails=descerror
		do pResp.result.Insert(resultat)

		$$$TRACE("Error "_descerror)
	}
	
	quit $$$OK
}

/// PYDSAMLCOS+: New Method to get SAML Ticket from ObjectScript
Method obteTiquetSAML(ByRef header As IBSP.CXN.SAML20.SOAPHeader) As %Status
{
	///Obtiene un Ticket SAML con los Attributos para ConsultaETC
	///no hay mensaje de entrada que contenga valores de Atributos SAML, por lo cual el segundo para esta vacio
	///los atributos SAML se rellenan ocn los valores fijos definidos en el portal de gestion
	quit ..GetSAMLToken("ConsultaETC","",.header)
	/*
{
ResponsibleUser":"HCC0128WS",
"Profile":"MD",
"ProviderOrganization":"H08002103",
"Entity":"0128",
"CodeUp":"00741",
"GivenName":"SOPORTE",
"FirstFamilyName":"SOPORTE",
"DocumentType":"01",
"DocumentNumber":"44982091W",
"Code":"108323233"
}
	*/
	
	/*
	#dim tSC as %Status = $$$OK
	#dim errObj as %Exception.AbstractException
	#dim request as IBSP.CXN.SAML20.Msg.SAMLReq = ##class(IBSP.CXN.SAML20.Msg.SAMLReq).%New()
	#dim response as Ens.StringResponse = ##class(Ens.StringResponse).%New()
	#dim tiquet as %String = ""
	try {
		///---We Should Receive the Params from Somewhere, from the incoming message or so..
		set request.data.X509CertAlias="CDA2021"
		do ..AddAtt(request,"ResponsibleUser","HCC0128WS")
		do ..AddAtt(request,"Profile","MD")
		do ..AddAtt(request,"ProviderOrganization","H08002103")
		do ..AddAtt(request,"Entity","0128")
		do ..AddAtt(request,"CodeUp","00741")
		do ..AddAtt(request,"GivenName","SOPORTE")
		do ..AddAtt(request,"FirstFamilyName","SOPORTE")
		do ..AddAtt(request,"DocumentType","01")
		do ..AddAtt(request,"DocumentNumber","44982091W")
		do ..AddAtt(request,"Code","108323233")
		///---
		
		set header=##class(IBSP.CXN.SAML20.SOAPHeader).%New()

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
	*/
}

/*
Method obteTiquetSAML(ByRef header As PTWIFIS.Utils.SoapHeader) As %Status
{
	#dim tSC as %Status = $$$OK
	#dim errObj as %Exception.AbstractException
	#dim request as Ens.StringRequest = ##class(Ens.StringRequest).%New()
	#dim response as Ens.StringResponse = ##class(Ens.StringResponse).%New()
	#dim tiquet as %String = ""
	
	set header=##class(PTWIFIS.Utils.SoapHeader).%New()
	try {
 		$$$THROWONERROR(tSC,..SendRequestSync("SAMLjava",request,.response,5))
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
*/
/// PYDSAMLCOS=
/// PYDSAMLCOS-
XData MessageMap
{
<MapItems>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientBean"> 
		<Method>obteInformacioPacient</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.CercarInformeInformacioPacientBeanV2"> 
		<Method>obteInformacioPacientV2</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercarPacientDadesAdministrativesBean"> 
		<Method>obteInformacioPacientDadesAdministratives</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercaIndexCCCICBean"> 
		<Method>cridaCCCICIndex</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercaIndexCCCAPBean"> 
		<Method>cridaCCCAPIndex</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercaDetallCCCICBean"> 
		<Method>cridaCCCICDetall</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercaDetallCCCAPBean"> 
		<Method>cridaCCCAPDetall</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.retornarIdsDocsPacientBean"> 
		<Method>retornarIdsDocsPacient</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercarDocPacientBean"> 
		<Method>cercarDocPacient</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercarDocsPacientBeanV3"> 
		<Method>cercarDocsPacientV3</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.recuperarImatgeDigitalBean"> 
		<Method>recuperarImatgeDigital</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercarLabePacientBean"> 
		<Method>cercarLabePacient</Method>
	</MapItem>
	<MapItem MessageType="HC3.consultesV21.WL5G3N2.cercarImmunitzacionsBeanV3"> 
		<Method>cercarImmunitzacionsV3</Method>
	</MapItem>
</MapItems>
}

}
