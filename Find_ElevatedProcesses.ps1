# "Test-ProcessElevated" function used below is from GitHub: https://gist.github.com/0xfeeddeadbeef/ce341bbca071099fd6952abab896aaac

$Username_ToCheck = "domain\username"

$ProcessList = Get-Process -IncludeUserName
$ProcessList_Elevation = foreach($Process in $ProcessList){
    try{
        $ElevationCheck = $Process | Test-ProcessElevated
        [pscustomobject]@{
            Process_Name      = $Process.ProcessName
            Process_Id        = $Process.id
            Process_UserName  = $Process.UserName
            Proccess_Elevated = $ElevationCheck
        }
    }
    catch{}
}
ForEach($CheckedProcess in $ProcessList_Elevation){
    if(($CheckedProcess.Process_UserName -eq $Username_ToCheck) -and ($CheckedProcess.Proccess_Elevated -eq $True)){
        $CheckedProcess
    }
}
