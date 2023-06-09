#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

void main() {
	pid_t child_pid;
	
	child_pid = fork();
	if(child_pid < 0)	exit(1);
	else if(child_pid>0)	sleep(60);
	else			exit(0);
	
}
