/// RECORDMAP: Modified during compilation of RecordMap 'User.csvfhirmapper'
/// on 2022-05-22 at 13:46:03.786 [2022-05-22 13:46:03.786 UTC]
/// by user _SYSTEM
Class User.csvfhirmapper Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "User.csvfhirmapper.Record";

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd && (""=pLookAhead) {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(10), tRecLabel, .pLookAhead, $char(34))
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tCurrString = ""
	Set tSeps = $listbuild($char(44))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.provider = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.healthsystemname = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.hospitalownership = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.code = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.codetype = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.chargedescription = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.codeclass = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.planraw = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.mappedpayer = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.mappedpayerclass = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.rate = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.medicareproviderid = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.npi = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.long = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.lat = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.streetaddress = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.city = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.state = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.zipcode = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.county = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.medicarecbsa = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.acutecarefacility = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.hospitaloverallrating = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.hospitaltype = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.totalbeds = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.location = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.tqcompliancescore = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.cmsqualityrating = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.effectivenessofcarenationalcomparison = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.efficientuseofmedicalimagingnationalcomparison = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.mortalitynationalcomparison = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.patientexperiencenationalcomparison = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.readmissionnationalcomparison = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.safetyofcarenationalcomparison = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(44), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(44), .tTopPiece)
	If pGetTopFields {
		Set pObject.timelinessofcarenationalcomparison = tCurrString
	}
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Set tmpStream=##class(%Stream.TmpBinary).%New()
	Do tmpStream.Write($select(pHasTopFields: ..Escape(pObject.provider, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.healthsystemname, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.hospitalownership, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.code, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.codetype, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.chargedescription, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.codeclass, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.planraw, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.mappedpayer, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.mappedpayerclass, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.rate, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.medicareproviderid, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.npi, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.long, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.lat, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.streetaddress, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.city, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.state, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.zipcode, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.county, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.medicarecbsa, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.acutecarefacility, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.hospitaloverallrating, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.hospitaltype, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.totalbeds, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.location, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.tqcompliancescore, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.cmsqualityrating, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.effectivenessofcarenationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.efficientuseofmedicalimagingnationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.mortalitynationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.patientexperiencenationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.readmissionnationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.safetyofcarenationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Do tmpStream.Write($char(44) _ $select(pHasTopFields: ..Escape(pObject.timelinessofcarenationalcomparison, $lb($char(44)),"quote",$char(34)),1: ""))
	Set tStatus = tmpStream.Write($char(10))
	If $$$ISERR(tStatus) Quit tStatus
	Do pStream.CopyFrom(tmpStream,,0,.tStatus)
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("User.csvfhirmapper.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="User.csvfhirmapper" type="delimited" char_encoding="UTF-8" targetClassname="User.csvfhirmapper.Record" recordTerminator="\x0a" escaping="quote" escapeSequence="&quot;">
  <Separators>
    <Separator>,</Separator>
  </Separators>
  <Field name="provider" datatype="%String">
  </Field>
  <Field name="healthsystemname" datatype="%String">
  </Field>
  <Field name="hospitalownership" datatype="%String">
  </Field>
  <Field name="code" datatype="%String">
  </Field>
  <Field name="codetype" datatype="%String">
  </Field>
  <Field name="chargedescription" datatype="%String">
  </Field>
  <Field name="codeclass" datatype="%String">
  </Field>
  <Field name="planraw" datatype="%String">
  </Field>
  <Field name="mappedpayer" datatype="%String">
  </Field>
  <Field name="mappedpayerclass" datatype="%String">
  </Field>
  <Field name="rate" datatype="%String">
  </Field>
  <Field name="medicareproviderid" datatype="%String">
  </Field>
  <Field name="npi" datatype="%String">
  </Field>
  <Field name="long" datatype="%String">
  </Field>
  <Field name="lat" datatype="%String">
  </Field>
  <Field name="streetaddress" datatype="%String">
  </Field>
  <Field name="city" datatype="%String">
  </Field>
  <Field name="state" datatype="%String">
  </Field>
  <Field name="zipcode" datatype="%String">
  </Field>
  <Field name="county" datatype="%String">
  </Field>
  <Field name="medicarecbsa" datatype="%String">
  </Field>
  <Field name="acutecarefacility" datatype="%String">
  </Field>
  <Field name="hospitaloverallrating" datatype="%String">
  </Field>
  <Field name="hospitaltype" datatype="%String">
  </Field>
  <Field name="totalbeds" datatype="%String">
  </Field>
  <Field name="location" datatype="%String">
  </Field>
  <Field name="tqcompliancescore" datatype="%String">
  </Field>
  <Field name="cmsqualityrating" datatype="%String">
  </Field>
  <Field name="effectivenessofcarenationalcomparison" datatype="%String">
  </Field>
  <Field name="efficientuseofmedicalimagingnationalcomparison" datatype="%String">
  </Field>
  <Field name="mortalitynationalcomparison" datatype="%String">
  </Field>
  <Field name="patientexperiencenationalcomparison" datatype="%String">
  </Field>
  <Field name="readmissionnationalcomparison" datatype="%String">
  </Field>
  <Field name="safetyofcarenationalcomparison" datatype="%String">
  </Field>
  <Field name="timelinessofcarenationalcomparison" datatype="%String">
  </Field>
</Record>
}

}
