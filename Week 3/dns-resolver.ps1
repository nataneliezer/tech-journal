$subnet=$args[0]
$server=$args[1]
echo("Inputted subnet: " + $subnet)
echo("Selected DNS server:" + $server)
for (($i=0); $i -lt 256; $i++)
{
	Resolve-DnsName -DnsOnly  ($subnet+'.'+$i) -server $server -ErrorAction Ignore
}