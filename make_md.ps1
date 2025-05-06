$TEMPLATE = "template.md"
$ENCODING = "UTF8"

$date = Get-Date -format yyyyMMddHHmmss

$created = Get-Date -format "yyyy-MM-dd HH:mm:ss"
$updated = Get-Date -format "yyyy-MM-dd HH:mm:ss"

$filepath = $date + ".md"
$file = Copy-Item $TEMPLATE $filepath -PassThru

(Get-Content $filepath -Encoding $ENCODING) | `
foreach { $_ -replace "{UID}", $date } | `
Set-Content $filepath -Encoding $ENCODING

(Get-Content $filepath -Encoding $ENCODING) | `
foreach { $_ -replace "{CREATED}", $created } | `
Set-Content $filepath -Encoding $ENCODING

(Get-Content $filepath -Encoding $ENCODING) | `
foreach { $_ -replace "{UPDATED}", $updated } | `
Set-Content $filepath -Encoding $ENCODING

return $file
