Class User.FhirAdapter Extends EnsLib.HTTP.OutboundAdapter
{

ClassMethod GetRequest() As %Net.HttpRequest
{
    set request = ##class(%Net.HttpRequest).%New()
    set request.ContentType  =  "application/fhir+json"
    Do request.SetHeader("Accept","*/*")
    quit request
}

Method Post(Output pHttpResponse As %Net.HttpResponse, pFormVarNames As %String, pData...) As %Status
{
     quit ..SendFormDataArray(.pHttpResponse, "POST", ..GetRequest(), .pFormVarNames, .pData)
}

}
