/// 
/// Installer for SAML-COS
/// 
/// See README.md for installation instructions
/// 
Class IBSP.CXN.SAML20.Installer
{

/// Create environment
/// Use this option when you need to automate the creation of an environment (e.g. a test namespace and databases)
Parameter CreateEnvironment = "no";

/// Namespace (used when CreateEnvironment)
Parameter Namespace = "SAML-COS";

/// Base application path (used when CreateEnvironment)
Parameter BasePath = "/opt/saml-cos/app";

/// Data db path (used when CreateEnvironment)
Parameter DataDBPath = "/opt/saml-cos/db/data";

/// Code db path (used when CreateEnvironment)
Parameter CodeDBPath = "/opt/saml-cos/db/code";

/// Manifest: Create Environment
XData CreateEnvironmentManifest
{
<Manifest>
	<Log Text="Creating namespace ${Namespace}" Level="0"/> 
	<Namespace Name="${Namespace}" Create="yes" Ensemble="1"> 
		<Configuration> 
			<Database Name="${Namespace}-DATA" Dir="${DataDBPath}" Create="yes" MountRequired="true" Resource="%DB_DEFAULT" PublicPermissions="RW" MountAtStartup="true"/> 
			<Database Name="${Namespace}-APP" Dir="${CodeDBPath}" Create="yes" MountRequired="true" Resource="%DB_DEFAULT" PublicPermissions="RW" MountAtStartup="true"/> 
		</Configuration>
	</Namespace>
</Manifest>
}

ClassMethod RunCreateEnvironmentManifest(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
   Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "CreateEnvironmentManifest")
}


/// Installer entry point.
/// Use this when you need to control all installation parameters.
/// 
/// You can pass parameters using vars:
/// - CreateEnvironment, Namespace, BasePath, DataDBPath, CodeDBPath 
ClassMethod RunWithParams(ByRef vars) As %Status
{
	set ret = $$$OK
	set previousNamespace = $namespace

    try { 
        do ..Log("START INSTALLER") 

		// set default values for installer variables
        for ivar="CreateEnvironment","Namespace","BasePath","DataDBPath","CodeDBPath" {
            if '$data(vars(ivar)) set vars(ivar)=$parameter($classname(), ivar)
        }
		
		// create environment
		if vars("CreateEnvironment") = "yes" {
			$$$ThrowOnError(..RunCreateEnvironmentManifest(.vars))
		}
		
        do ..Log("INSTALLER SUCCESS")

    } catch ex { 
        set sc = ex.AsStatus() 
        write $System.Status.GetErrorText(sc),! 
        do $SYSTEM.Process.Terminate($JOB,1) 
    }

	set $namespace = previousNamespace
    quit ret
}

/// Log a message
/// pText - Text message
/// pTimeStamp - Add a timestamp
/// pNewLine - Add a new line
ClassMethod Log(pText As %String, pTimeStamp As %Boolean = 1, pNewLine As %Boolean = 1)
{
	write $case(pTimeStamp,1:"["_$zdt($h,3)_"] ",:"")_pText_$case(pNewLine,1:$$$NL,:"")
}

}
