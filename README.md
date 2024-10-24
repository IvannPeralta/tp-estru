### Instalar los compiladores

sudo apt update   
sudo apt install python3 python3-pip   
sudo apt install r-base   
sudo apt install ruby-full   
sudo apt install default-jdk   
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb   
sudo dpkg -i packages-microsoft-prod.deb   
sudo apt install dotnet-sdk-6.0  

### Para ejecutar los archivos Python   
python3 ProblemaX_Python.py

### Para ejecutar los archivos R   
Rscript ProblemaX_R.r

### Para ejecutar los archivos Ruby   
ruby ProblemaX_Ruby.rb

### Para ejecutar los archivos C#   
dentro de la carpeta ProblemaX-CSharp   
dotnet run   

### Para ejecutar los archivos Java   
javac ProblemaX_Java.java   
java ProblemaX_Java   
