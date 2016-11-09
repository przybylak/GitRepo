#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <dirent.h>

void direntInfo(char *name) {

	struct stat plik;
	char inf[10];

	if( lstat(name, &plik) == 0 ) {	
		// Typ pliku	
		if(S_ISDIR(plik.st_mode)) printf("d");
			else
		if(S_ISLNK(plik.st_mode)) printf("l");
			else
		if(S_ISFIFO(plik.st_mode)) printf("p");			
			else printf("-");
		// Uprawnienia
		if(plik.st_mode &S_IRUSR) printf("r"); else printf("-");
		if(plik.st_mode &S_IWUSR) printf("w"); else printf("-");
		if(plik.st_mode &S_IXUSR) printf("x"); else printf("-");
		if(plik.st_mode &S_IRGRP) printf("r"); else printf("-");
                if(plik.st_mode &S_IWGRP) printf("w"); else printf("-");
		if(plik.st_mode &S_IXGRP) printf("x"); else printf("-");
		if(plik.st_mode &S_IROTH) printf("r"); else printf("-");
                if(plik.st_mode &S_IWOTH) printf("w"); else printf("-");
		if(plik.st_mode &S_IXOTH) printf("x"); else printf("-");

		printf("\t%d %d %db\t%s\n", plik.st_uid, plik.st_gid, plik.st_size, name);

	} else {
		printf("--- Blad otwarcia pliku ---\n");
	};
};

int main(int argc, char *argv[]) {
	DIR *stream;
	struct dirent *temp;

	if( ( stream = opendir(argv[1]) ) != NULL ) {
		while( ( temp = readdir(stream) ) != NULL ) {
			direntInfo(temp->d_name);
		}
	} else {
		printf("Blad przy probie otwarcia pliku!\n");
		return -1;
	}

	return 0;
}
