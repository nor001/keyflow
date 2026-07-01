
1.Navigate to the support site: https://support.fortinet.com/ -> Support -> Firmware Download.
2.Select Product = FortiClient -> Download -> Select corresponding version -> Download the FortiClientTools zip file. 
3.Extract FortiClientTools.
4.From the command prompt on the client computer, navigate to the SSLVPNcmdline folder.
For example: 'cd C:
\Users\Fortinet\Downloads\FortiClientTools_7.4.0.1658\SSLVPNcmdline\x64'.
5.Run 'FortiSSLVPNclient.exe'. A pop-up will appear. 
6.Enter Connection Name, Server Address, Username, Password, Client Certificate (If required).
Note: Enable 'Do not warn about server certificate validation failure' if a client certificate is being used.
7.Select 'Connect'.
Notes:
To connect from the command prompt only without getting the pop-up, all information must be specified as follows:

Syntax	Switch
-s	<connection settings name>
-h	<sslvpn server>[:<port>]
-u	<sslvpn username>[:<password>]
-c	<certificate subject>[:<issuer>]
-i	Ignore server certificate warning
-q	Quiet mode (no error message box)
-m	Minimize window on connection

connect	Start a connection
disconnect	Disconnect from the sesión

To connect	FortiSSLVPNclient.exe connect [options] [args]
To disconnect	FortiSSLVPNclient.exe disconnect [options] [args]

For example: 
FortiSSLVPNclient.exe connect -s MyCompanyName -h 192.168.10.1 -u guest:vpn123 i -m -q
Command Line Usage:
Usage: FortiSSLVPNclient.exe <subcommand> [options] [args]
e.g. FortiSSLVPNclient.exe connect -s MyCompanyName  i -m -q (No Certificate)
e.g. FortiSSLVPNclient.exe connect -s MyCompanyName -c FCT.net:earth-EARTH-CA -i -m -q (with Certificate)
