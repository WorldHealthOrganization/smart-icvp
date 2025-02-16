#!/bin/bash


for resource in output/*.json ; do

    resourceType=$(jq -re '.resourceType' $resource)
    resourceURL=$(jq -re '.url' $resource)
    resourceVersion=$(jq -re '.version' $resource)
    resourceID=$(jq -re '.id' $resource)
    if [[ (-n "$resourceType" ) && ( "$resourceType" != "null") \
          && (-n "$resourceID" ) && ( "$resourceID" != "null") ]]; then

	mkdir -p output/$resourceType

	echo "Copying output/$resourceType-$resourceID.<blah> to output/$resourceType/$resourceID.<blah>"
	cp output/$resourceType-$resourceID.json output/$resourceType/$resourceID.json
	cp output/$resourceType-$resourceID.xml output/$resourceType/$resourceID.xml
	cp output/$resourceType-$resourceID.ttl output/$resourceType/$resourceID.ttl
	landingPage="<!DOCTYPE html>
<html xml:lang='en' xmlns='http://www.w3.org/1999/xhtml' lang='en'>
<html>
 <head>
    <style class='anchorjs'></style><link href='../fhir.css' rel='stylesheet'>
    <link href='../assets/css/fa-all.css' rel='stylesheet' type='text/css'>
    <!-- Bootstrap core CSS -->
    <link href='../assets/css/bootstrap-fhir.css' rel='stylesheet'>

    <!-- Project extras -->
    <link href='../assets/css/project.css' rel='stylesheet'>
    <link href='../assets/css/pygments-manni.css' rel='stylesheet'>
    <link href='../assets/css/jquery-ui.css' rel='stylesheet'>
  	<link href='../assets/css/prism.css' rel='stylesheet'>
    <!-- Placeholder for child template CSS declarations -->
    <link href='../assets/css/who.css' rel='stylesheet'>
    <link href='../assets/css/lforms.min.css' rel='stylesheet'>
 </head>
 <body><div class='row'><div class='container'>
  <table class='colsi'>
    <tbody>
      <tr>
       <td colspan='4'>
         <i>Official URL</i>: <span class='copy-text'>$resourceURL<button title='' class='btn-copy' data-clipboard-text='$resourceURL' data-original-title='Click to copy URL'>
      </button></span></td>
      <td><i>Version</i>:
      <span class='copy-text'>$resourceVersion<button title='' class='btn-copy' data-clipboard-text='$resourceURL|$resourceVersion' data-original-title='Click to copy versioned URL'>
      </button></span></td>
    </tr>
    <tr>
      <td colspan='4'>
       <ul>
        <li><a href='../$resourceType-$resourceID.html'>Narrative Content</a></li>
        <li><a href='$resourceID.json'>JSON</a></li>
        <li><a href='$resourceID.xml'>XML</a></li>
        <li><a href='$resourceID.ttl'>TTL</a></li>
       </ul>
      </td>
      <td><i>Computable Name</i>: <span style='font-family: monospace;'>$resourceID</span></td>
     </tr>
    </tbody>
   </table>
 </div></div></body>
</html>
"
       echo $landingPage >  output/$resourceType/$resourceID
       echo $landingPage >  output/$resourceType/$resourceID.html
	
	
    fi
done
