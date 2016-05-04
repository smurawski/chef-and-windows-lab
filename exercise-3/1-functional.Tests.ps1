describe 'Server is a Webserver' {
  context 'Behavior' {
    it 'has a website listening on port 80' {
      get-website | where {
          $_.state -like 'Started' -and 
          $_.bindings.collection.bindinginformation -like '*:80:'
        } | 
        should not benullorempty
    }
    $webresponse = Invoke-WebRequest http://localhost -UseBasicParsing
    it 'returns 200' {
      $webresponse.statuscode -eq 200
    }
    it 'has a content lenght of 4798' {
      $webresponse.rawcontentlength -eq 4798
    }
  }
}