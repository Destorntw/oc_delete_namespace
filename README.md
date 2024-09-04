# "Deleting a namespace that's stuck in Terminating state on in Openshift / K8s"


Option 1 - "semi automatic deletion"


If you wish to use the delete_namespace.sh please run the script as follows

create the script file 
chmod +x the file
*If this script was copied from a Windows machine / sent via email
please use the "dos2unix" command on the script.

*example*
*The script is called "del_ns.sh"*
"destorntw" namespace is stuck in terminating phase

You would run the script as follows.
*<"relative_path">del_ns.sh <"namespace name"> ~ ./home/scripts/del_ns.sh destorntw*


 #########


Option 2 - "fully automatic deletion"


If you wish to use the auto-del-term-ns.sh please run the script as follows

create the script file 
chmod +x the file
*If this script was copied from a Windows machine / sent via email
please use the "dos2unix" command on the script.


You would run the script as follows.
* ./home/scripts/auto-del-term-ns.sh *
 




