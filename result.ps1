function Extract-PDFImages($pdfpath, $imgfolder, $imgPrefix)
{
    if (!(Test-Path $imgfolder)) 
    {
        New-Item $imgfolder -ItemType Dir | Out-null
    }

    $root = "$imgFolder\$imgPrefix" #download the xpdf pdfimages.exe and direct the exe to the root
    & 'D:\Downloads\xpdf-tools-win-4.04\xpdf-tools-win-4.04\bin32\pdfimages.exe' "-j" "$pdfpath" "$root" 
}


Extract-PDFImages "D:\Desktop\Example.pdf" "D:\Desktop\images" "jpg" #converts PDF to images (JPG) Sends to dir where all images sit.


Get-ChildItem -path "D:\Desktop\images"  -Recurse -Filter *.jpg | #runs through each image and extracts text
Foreach-Object {

$filename = $_.FullName
$result = D:\Desktop\Get-TextfromImage.ps1 -path $filename
$result.Text | Out-File D:\Desktop\Sample.txt -Append #writes text into a file. appends through each file.

}

