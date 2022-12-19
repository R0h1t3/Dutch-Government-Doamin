# Bug Bounty Scope - Dutch Government
By delivering knowledge and a perspective for action, the National Cyber Security Centre (NCSC) helps to collectively improve the Dutch society's digital resilience and, in doing so, realises a secure, open, and stable information society. So it is crucial that the NCSC's ICT systems remain secure. The NCSC works to ensure that its system has a high degree of security. It is possible, nonetheless, for one of these systems to be weak.<br>
<br>
<b>Source</b>: https://www.communicatierijk.nl/vakkennis/r/rijkswebsites/verplichte-richtlijnen/websiteregister-rijksoverheid<br>
<b>Inspiration</b>: https://gist.github.com/R0X4R/81e6c50c091a20b060afe5c259b58cfa<br>
I have made changes in the script for better performance and easier usage.

### Requirements
The automated script utilises a couple of application to extract all the unique domains from the database.
- go language - [Link](https://go.dev/doc/install)
- LibreOffice: <br>

  ```bash
  sudo apt install libreoffice
  ```
- anew - tomonomnom' tool - [Link](https://github.com/tomnomnom/anew)
- Give execution permissions to the downloaded script:<br>

  ```bash
  chmod +x script.sh
  sudo ./script.sh
  ````


Make sure that all of them run properly to successfully execute the file. It is preferred to run the script with <b>sudo</b> permissions.

