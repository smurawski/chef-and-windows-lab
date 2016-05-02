# List out the available, on-the-box resources

Get-DscResource

# Find the properties of the DSC Resource

Get-DscResource File | Select-Object -ExpandProperty Properties

# Or

Get-DscResource File -Syntax