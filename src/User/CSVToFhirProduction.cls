Class User.CSVToFhirProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="User.CSVToFhirProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="CsvToFhirProd" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">User.CsvToFhirProdRoutingRule</Setting>
  </Item>
  <Item Name="FileService" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">csvfhirmapper</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CsvToFhirProd</Setting>
    <Setting Target="Adapter" Name="FilePath">/opt/irisapp/csvdata/</Setting>
  </Item>
  <Item Name="FhirOperation" Category="" ClassName="User.FhirOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">52773</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/fhir/r4/Organization</Setting>
  </Item>
</Production>
}

}
