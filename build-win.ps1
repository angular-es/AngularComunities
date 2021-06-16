$NG_intro = @"
                             ,,                             
                      ,,,,,,,,,,,,,,,,                      
               ,,,,,,,,,,,,,,,*,,,,,,,,,,,,,,               
        ,,,,,,,,,,,,,,,,,,,,,@@@,,,,,,,,,,,,,,,,,,,,,       
        ,,,,,,,,,,,,,,,,,,,,@@@@@,,,,,,,,,,,,,,,,,,,,       
         ,,,,,,,,,,,,,,,,,,@@@@@@@,,,,,,,,,,,,,,,,,,        
         ,,,,,,,,,,,,,,,,,@@@@@@@@@,,,,,,,,,,,,,,,,,        
         ,,,,,,,,,,,,,,,,@@@@#,@@@@@,,,,,,,,,,,,,,,,        
          ,,,,,,,,,,,,,,@@@@,,,,%@@@@,,,,,,,,,,,,,,         
          ,,,,,,,,,,,,,@@@@,,,,,,,@@@@,,,,,,,,,,,,,         
          ,,,,,,,,,,,,@@@@@@@@@@@@@@@@@,,,,,,,,,,,,         
          ,,,,,,,,,,@@@@@@@@@@@@@@@@@@@@*,,,,,,,,,,         
           ,,,,,,,,@@@@@,,,,,,,,,,,,,@@@@@,,,,,,,,          
           ,,,,,,,@@@@@,,,,,,,,,,,,,,,@@@@@,,,,,,,          
           ,,,,,,@@@@@,,,,,,,,,,,,,,,,,@@@@@,,,,,,          
            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,           
                 ,,,,,,,,,,,,,,,,,,,,,,,,,,,                
                     ,,,,,,,,,,,,,,,,,,,                    
                          ,,,,,,,,,                         
                              ,                                                                                         
                             _             
     /\                     | |            
    /  \   _ __   __ _ _   _| | __ _ _ __   
   / /\ \ | '_ \ / _`  | | | | |/ _`  | '__| 
  / ____ \| | | | (_| | |_| | | (_| | |    
 /_/    \_\_| |_|\__, |\__,_|_|\__,_|_|    
                  __/ |                     
                 |___/                      

"@

Write-Host $NG_intro
# Change the x with the lang of your project
# copy origin to temporary workspace
Set-Location origin
git clean -xdn
Set-Location ..
robocopy origin .tmp /e

# overrides files from ja directory
$FileExtensionToBeExcluded="**/*.en.* **/*.old"
robocopy aio-x/ .tmp/aio /e $FileExtensionToBeExcluded

# build angular.io
Set-Location .tmp

yarn install --frozen-lockfile --non-interactive

# build angular.io
Set-Location aio
yarn build

Set-Location ../../