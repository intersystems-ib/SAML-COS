Class IBSP.CONN.SAML.Production.TestProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="IBSP.CONN.SAML.Production.TestProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="IBSP.CONN.SAML.BO.SAMLSigner" Category="SAML" ClassName="IBSP.CONN.SAML.BO.SAMLSigner" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="IBSP.CONN.SAML.BO.SAMLcos" Category="SAML" ClassName="IBSP.CONN.SAML.BO.SAMLcos" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="IBSP.CONN.SAML.BS.Test" Category="SAML" ClassName="IBSP.CONN.SAML.BS.Test" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
