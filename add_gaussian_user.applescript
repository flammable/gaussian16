display dialog "Please enter the account to give access to Gaussian." default answer ""
set username to text returned of result
try
	do shell script "/usr/sbin/dseditgroup -o edit -a 'SJU-VMAD\\" & username & "' -t user gaussian" with administrator privileges
	set question to display dialog "Successfully granted Gaussian access to " & username & "." buttons {"Quit"} default button 1
	set answer to button returned of question
	if answer is equal to "Quit" then
		return
	end if
on error
	set question to display dialog "Failed to grant Gaussian access to " & username & "." buttons {"Quit"} default button 1
	set answer to button returned of question
	if answer is equal to "Quit" then
		return
	end if
end try