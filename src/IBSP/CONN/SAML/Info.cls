/// <h2>SAML-COS</h2>
/// 
/// <h3>SAML2.0 Token for Catalan HealthCare Authorities from InterSystems IRIS ObjectScript.</h3>
/// 
/// See README.md
/// 
/// <h4>Changelog:</h4>
/// <ul>
///  	<li>0.1.0   - Initial version</li>
/// 	<li>0.1.1   - Fixes error in SOAPHeader (MAXLEN size)</li>
/// 	<li>1.0.0   - Adds ZPM management</li>
/// 	<li>1.0.1   - Initial ZPM release</li>
/// 	<li>1.0.2   - In Sign method, force Schema-Instance alias to be xsi in Assertion to match SoapEnv alias definition</li>
///     <li>1.0.3   - Changed SAML Attributes code and documentNumber to lowercase</li>
/// 	<li>1.0.4   - Fixes bug when creating SAML ticket form publishing services</li>
///     <li>1.1.0   - Adds Info class for versioning</li>
/// </ul>
Class IBSP.CONN.SAML.Info
{
    Parameter VERSION = 1.1;
}