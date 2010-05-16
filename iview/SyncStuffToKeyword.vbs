'
' Flickr does not read the Location and Event IPTC tags. Therefore, they need to be added to the Keywords IPTC tags manually.
' Additionally, add some EXIF information so that I can search upon it.
'

Option Explicit

Const kMsgBoxTitle = "iView MediaPro"

Main()

Sub Main()
	Dim app, Cat, mediaItem, i

	Set app = CreateObject("iView.Application")

	' get the active catalog
	Set Cat = app.ActiveCatalog

	' Make sure that at least one file is selected
	If (Cat.Selection.Count = 0) Then
		MsgBox "You need to select at least one media item in the active catalog in order to use this script.", vbCritical, kMsgBoxTitle
	Else
		For Each mediaItem In Cat.Selection
				mediaItem.Annotations.Keywords = mediaItem.Annotations.Keywords & ";" & mediaItem.Annotations.Location
				mediaItem.Annotations.Keywords = mediaItem.Annotations.Keywords & ";" & mediaItem.Annotations.Event
				mediaItem.Annotations.Keywords = mediaItem.Annotations.Keywords & ";" & mediaItem.DeviceInfo.Lens
		Next	
	End If
End Sub
