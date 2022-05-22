# Bash controol
## [index.html](./serverControler/index.html)
laten we starten bij de [index.html](./bashScrips/serverControler/index.html)  
### from
In de body beginen we met een form
```
<form action="serverControler.sh" method="get">
```
- in de `action="serverControler.sh"` staat welk script we gebruiken.  
- in de `method="get"` staat welke methoden we gebruiken.  
### label en input  
onder de opening van de form tag vinden we de labal en de input tags.  
```
<label for="Var1">Jail name</label>
<input type="text" name="Var1" id="Var1">
```  
- de labal tag is voor text toe te voegen aan en input velt
- de label tag staat de `for="Var1"` voor waar de label bij hoort  
- de taxt `Jail name` word gewoon als text geprint op de html pagina  
- de input is voor user input 
- de `type="text"` staat voor het tiepen van het input velt in dit geval staat dezen voor een text input
- de `name="Var1"` staat voor de naam die megegeven word voor het opslaan van de input van de input box.
- de `id="Var1"` staat voor de id die word me gegeven en kan gebruikt worden om te stylen.
###  input (submit)
onder de lasten in put tag staat een p tag met daar in nog een input tag
```
<p>
    <input type="submit" name="submit" value="maak een nieuwe jail" >
</p>
```
- de `<p>` tag is voor de butten te incapsulernen
- de `type="submit"` is voor het type submit aan te geven en zorgt er voor dat it een butten word 
- de `name="submit"` is voor de input een naam te geven
- de `value="maak een nieuwe jail"` is de text die wort weer gegeven in de butten
## [serverControler.sh](./serverControler/serverControler.sh)
### #!
```
#!/bin/bash
```
- de `#!` staat voor met welk programa linux dit script moet runen
- de `/bin/bash`staat er voor dat we bash  gebruiken 
### if
```
if [ "$REQUEST_METHOD" = "GET" ]; then
```
- de `if` statmet vergelijkt of wat tussen `[]` staat just is en `then` runed de onderstande code
- de  `$REQUEST_METHOD` is een syseem variablen die word door gegeven van Apache
- de `"GET"`  is de methode die in de `$REQUEST_METHOD` zou moten staan
### var1 en var1_Dec
```
Var1=$(echo "$QUERY_STRING" | sed -n 's/^.*var1=\([^&]*\).*$/\1/p')    # read value of "var1"
Var1_Dec=$(echo -e $(echo "$Var1" | sed 's/+/ /g;s/%\(..\)/\\x\1/g;'))    # html decode
```
- `Var1` black magic om de system variable `$QUERY_STRING` in te lezen zonder dat bash er code can uit gevoert kan worden
-  `Var1_Dec` black black magic
### [addJail.sh](./serverControler/addJail.sh) $Var1
```
addJail.sh $Var1
```
- `addJail.sh` is het script dat ge runed word
- `$Var1` is een variablen die word megegeven met het programa
## addJail.sh
### chmod +s
```
##run met chmod +s voor elevatet priveliges
```
- je moet eerst `chmod +s` runnen omdat `iocage` als root moet runnen en hierme kan dat
## iocage
```
iocage create -n $1 -r 11.2-RELEASE  dhcp="on" boot="on"
```
- `iocage` is een programa om jais te onderhouden
- `create` is voor een nieuwe jail te maken
- `-n` is voor de naam
- `$1` is de variablen die me word gegeven met het proragama
- `-r 11.2-RELEASE` is voor de versie van freebsd aan te geven die `iocage` moet gebruiken
- met `dhcp="on"` kan je zorgen dat alles van netwerken automaties word ingestelt via een andere DHCP server
- `boot="on"` is voor te zorgen dat de jail start @ boot
 