Class User.FhirOperation Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

Parameter ADAPTER = "User.FhirAdapter";

Method Create(pRequest As User.FhirRequest, Output pResponse As Ens.Response) As %Status
{
   
   try {
      // Execute the call
      Set tempRequest = ##class(%DynamicObject).%New()
      Set tempRequest.resourceType = "Organization"  
      Set tempRequest.id = pRequest.id
      Set tempRequest.name = pRequest.name 
      Set tSC= ..Adapter.Post(.tHttpResponse,,tempRequest.%ToJSON())
      
      // Return the response
      If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }
      Quit:$$$ISERR(tSC)
      If $IsObject(tHttpResponse) {
         // Instantiate the response object
         set pResponse = ##class(Ens.Response).%New()
       }
   }catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="User.FhirRequest">
    <Method>Create</Method>
  </MapItem>
</MapItems>
}

}
