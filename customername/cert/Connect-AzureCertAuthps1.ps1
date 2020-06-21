#  https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-authenticate-service-principal-powershell
$ApplicationId = '<<<<< aplication id >>>>>'
$TenantId = '<<<<< terant id >>>>>'
$CNName = 'companyportalroot'
$SPDisplayName = 'companyportal'
$cnstr = 'CN=' + $CNName 

 $Thumbprint = (Get-ChildItem cert:\CurrentUser\My\ | Where-Object {$_.Subject -eq $cnstr }).Thumbprint
 $ConParam = @{
        ServicePrincipal = $true 
        CertificateThumbprint = $Thumbprint 
        ApplicationId = $ApplicationId 
        TenantId = $TenantId
 }
$context =  Connect-AzAccount @ConParam
$context.Context.Subscription.Name
#Set-AzContext -Context $context.Context